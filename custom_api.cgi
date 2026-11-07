#!/bin/sh
echo "Content-Type: application/json; charset=utf-8"
echo "Cache-Control: no-cache"
echo ""

# Helper to read POST body
read_post() {
    if [ "$REQUEST_METHOD" = "POST" ]; then
        cat
    fi
}

ACTION="$QUERY_STRING"
BODY=$(read_post)

get_param() {
    echo "$BODY" | awk -v key="$1" 'BEGIN{RS="&";FS="="} $1==key{sub(/[ \t\r\n]+$/, "", $2); print $2}'
}

case "$ACTION" in
    get_status)
        # Read DNS servers formatted with comma
        DNS_SERVERS=$(awk -F= '/^server=/ {if (s) s=s "," $2; else s=$2} END {print s}' /tmp/etc/dnsmasq.conf 2>/dev/null)
        HAS_FAILSAFE="false"
        if grep -q "all-servers" /tmp/etc/dnsmasq.conf 2>/dev/null; then
            HAS_FAILSAFE="true"
        fi
        
        # Read LAN IP config from tcapi
        LAN_IP=$(/userfs/bin/tcapi get Lan_Entry0 IP 2>/dev/null || echo "192.168.1.1")
        LAN_MASK=$(/userfs/bin/tcapi get Lan_Entry0 netmask 2>/dev/null || echo "255.255.255.0")
        DHCP_START=$(/userfs/bin/tcapi get Dhcpd_Common start 2>/dev/null || echo "192.168.1.2")
        DHCP_COUNT=$(/userfs/bin/tcapi get Dhcpd_Common pool_count 2>/dev/null || echo "252")
        
        # Read current mode from custom state file or default to optical_gateway
        CURRENT_MODE="optical_gateway"
        if [ -f /tmp/etc/current_mode.conf ]; then
            CURRENT_MODE=$(cat /tmp/etc/current_mode.conf)
        fi
        
        # Read port unlock status
        ALL_PORTS_UNLOCKED="true"
        for p in eth0.1 eth0.2 eth0.3 eth0.4; do
            if ! brctl show | grep -q "$p"; then
                ALL_PORTS_UNLOCKED="false"
                break
            fi
        done
        
        echo "{"
        echo "  \"status\": \"ok\","
        echo "  \"dns_servers\": \"$DNS_SERVERS\","
        echo "  \"failsafe_enabled\": $HAS_FAILSAFE,"
        echo "  \"lan_ip\": \"$LAN_IP\","
        echo "  \"lan_mask\": \"$LAN_MASK\","
        echo "  \"dhcp_start\": \"$DHCP_START\","
        echo "  \"dhcp_count\": \"$DHCP_COUNT\","
        echo "  \"current_mode\": \"$CURRENT_MODE\","
        echo "  \"all_ports_unlocked\": $ALL_PORTS_UNLOCKED"
        echo "}"
        ;;

    set_dns)
        PRIMARY=$(get_param "primary")
        SECONDARY=$(get_param "secondary")
        FAILSAFE=$(get_param "failsafe")
        PROVIDER=$(get_param "provider")
        
        if [ -z "$PRIMARY" ]; then
            PRIMARY="94.140.14.14" # Default AdGuard
        fi
        
        cat > /tmp/etc/dnsmasq.conf << EOF
no-resolv
server=$PRIMARY
EOF
        if [ -n "$SECONDARY" ] && [ "$SECONDARY" != "none" ]; then
            echo "server=$SECONDARY" >> /tmp/etc/dnsmasq.conf
        fi
        
        if [ "$FAILSAFE" = "1" ] || [ "$FAILSAFE" = "true" ]; then
            echo "all-servers" >> /tmp/etc/dnsmasq.conf
            # Add secondary backup server if not already present
            if [ "$PRIMARY" != "1.1.1.2" ] && [ "$SECONDARY" != "1.1.1.2" ]; then
                echo "server=1.1.1.2" >> /tmp/etc/dnsmasq.conf
            fi
        fi
        
        # Local ad-block domains
        cat >> /tmp/etc/dnsmasq.conf << EOF
address=/doubleclick.net/0.0.0.0
address=/adservice.google.com/0.0.0.0
address=/pagead2.googlesyndication.com/0.0.0.0
address=/adnxs.com/0.0.0.0
cache-size=1000
EOF
        
        # Restart dnsmasq
        killall -9 dnsmasq 2>/dev/null
        sleep 1
        /userfs/bin/dnsmasq &
        
        echo "{"
        echo "  \"status\": \"ok\","
        echo "  \"message\": \"DNS configuration applied successfully.\","
        echo "  \"provider\": \"$PROVIDER\","
        echo "  \"primary\": \"$PRIMARY\","
        echo "  \"secondary\": \"$SECONDARY\","
        echo "  \"failsafe\": \"$FAILSAFE\""
        echo "}"
        ;;

    set_lan)
        NEW_IP=$(get_param "ip")
        NEW_MASK=$(get_param "mask")
        DHCP_START=$(get_param "start")
        DHCP_COUNT=$(get_param "count")
        PERMANENT=$(get_param "permanent")
        
        if [ -z "$NEW_IP" ]; then
            NEW_IP="192.168.10.1"
        fi
        if [ -z "$NEW_MASK" ]; then
            NEW_MASK="255.255.255.0"
        fi
        if [ -z "$DHCP_START" ]; then
            # Default: x.x.x.2
            PREFIX=$(echo "$NEW_IP" | awk -F. '{print $1 "." $2 "." $3}')
            DHCP_START="$PREFIX.2"
        fi
        if [ -z "$DHCP_COUNT" ]; then
            DHCP_COUNT="250"
        fi
        
        # Apply to tcapi
        /userfs/bin/tcapi set Lan_Entry0 IP "$NEW_IP"
        /userfs/bin/tcapi set Lan_Entry0 netmask "$NEW_MASK"
        /userfs/bin/tcapi set Dhcpd_Common router "$NEW_IP"
        /userfs/bin/tcapi set Dhcpd_Common start "$DHCP_START"
        /userfs/bin/tcapi set Dhcpd_Common pool_count "$DHCP_COUNT"
        /userfs/bin/tcapi commit Lan_Entry0
        /userfs/bin/tcapi commit Dhcpd_Common
        
        # If permanent requested, save to mtd1 romfile
        IS_SAVED="false"
        if [ "$PERMANENT" = "1" ] || [ "$PERMANENT" = "true" ]; then
            /userfs/bin/tcapi save 2>/dev/null || /userfs/bin/tcapi commit System_Entry 2>/dev/null
            IS_SAVED="true"
        fi
        
        # Apply live to bridge interface
        /sbin/ifconfig br0 "$NEW_IP" netmask "$NEW_MASK"
        
        echo "{"
        echo "  \"status\": \"ok\","
        echo "  \"message\": \"LAN IP and DHCP pool updated.\","
        echo "  \"new_ip\": \"$NEW_IP\","
        echo "  \"netmask\": \"$NEW_MASK\","
        echo "  \"dhcp_start\": \"$DHCP_START\","
        echo "  \"permanent\": $IS_SAVED"
        echo "}"
        ;;

    set_mode)
        MODE=$(get_param "mode")
        UNLOCK=$(get_param "unlock")
        
        if [ -z "$MODE" ]; then
            MODE="optical_gateway"
        fi
        
        echo "$MODE" > /tmp/etc/current_mode.conf
        
        # Unlock all 4 ports into br0
        for p in eth0.1 eth0.2 eth0.3 eth0.4; do
            brctl addif br0 $p 2>/dev/null
            /sbin/ifconfig $p up 2>/dev/null
        done
        
        # Clear port isolation filters in ebtables
        ebtables -F PORTS_LIMIT 2>/dev/null
        ebtables -F PORTS_LIMIT_OUT 2>/dev/null
        
        if [ "$MODE" = "access_point" ]; then
            # Access Point mode:
            # LAN 1 (eth0.1) is the WAN / Uplink from upstream router
            # All ports and Wi-Fi bridged together to upstream router
            killall -9 udhcpd 2>/dev/null
            echo "Access Point mode configured."
        elif [ "$MODE" = "wireless_bridge" ]; then
            # Wireless Bridge mode:
            # Wi-Fi connects to upstream, bridges to LAN ports
            echo "Wireless Bridge mode configured."
        else
            # Default XPON Optical Gateway mode
            /userfs/bin/tcapi commit Dhcpd_Common 2>/dev/null
            echo "XPON Optical Gateway mode configured."
        fi
        
        echo "{"
        echo "  \"status\": \"ok\","
        echo "  \"mode\": \"$MODE\","
        echo "  \"ports_unlocked\": true,"
        echo "  \"message\": \"Operating mode and 4-port unlock applied successfully.\""
        echo "}"
        ;;

    *)
        echo "{\"status\": \"error\", \"message\": \"Unknown action. Valid actions: get_status, set_dns, set_lan, set_mode\"}"
        ;;
esac
