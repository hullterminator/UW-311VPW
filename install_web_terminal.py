#!/usr/bin/env python3
"""
Uniway UW-311VPW Custom Features & Terminal Installer
Deploys:
  1. In-Page Web Root Terminal: /cgi-bin/sta-terminal.asp
  2. User Added Features Page: /cgi-bin/user-features.asp
     - Multi-Provider DNS with AdGuard / Cloudflare Ad-Blocking & Failover
     - LAN IP & Subnet Config with Permanent Flash ROMFILE Commit (192.168.10.0/24)
     - Operating Modes (Optical Gateway, Access Point, Wireless Bridge) & 4-Port LAN Unlock
  3. Custom API Backend: /cgi-bin/custom_api.cgi
  4. Menu Integration: /JS/menu.js
"""

import sys
import os
import urllib.request
import urllib.error

ROUTER_IP = "192.168.1.1"
BASE_DIR = os.path.dirname(os.path.abspath(__file__))

FILES = [
    ("sta-terminal.asp", os.path.join(BASE_DIR, "sta-terminal.asp")),
    ("sta-device.asp", os.path.join(BASE_DIR, "sta-device_patched.asp")),
    ("user-features.asp", os.path.join(BASE_DIR, "user-features.asp")),
    ("custom_api.cgi", os.path.join(BASE_DIR, "custom_api.cgi")),
    ("menu.js", os.path.join(BASE_DIR, "menu.js")),
]

def run_exec(cmd):
    try:
        req = urllib.request.Request(
            f"http://{ROUTER_IP}/cgi-bin/exec.cgi",
            data=cmd.encode('utf-8'),
            headers={'Content-Type': 'text/plain'}
        )
        with urllib.request.urlopen(req, timeout=5) as resp:
            return resp.read().decode('utf-8', errors='ignore')
    except Exception:
        return None

def upload_file(remote_name, file_path):
    with open(file_path, 'rb') as f:
        data = f.read()
    url = f"http://{ROUTER_IP}/cgi-bin/upload.cgi?{remote_name}"
    req = urllib.request.Request(
        url,
        data=data,
        headers={'Content-Type': 'application/octet-stream'}
    )
    with urllib.request.urlopen(req, timeout=10) as resp:
        return resp.read().decode('utf-8', errors='ignore').strip()

def main():
    print(f"[*] Targeting router at http://{ROUTER_IP}...")
    
    # 1. Setup /tmp/cgi-bin, /tmp/html_js, and bind mounts
    setup_sh = """
if [ ! -d /tmp/cgi-bin ]; then
    cp -r /boaroot/cgi-bin /tmp/cgi-bin
fi
mount | grep -q "/boaroot/cgi-bin" || mount -o bind /tmp/cgi-bin /boaroot/cgi-bin

if [ ! -d /tmp/html_js ]; then
    mkdir -p /tmp/html_js
    cp -r /boaroot/html/JS/* /tmp/html_js/
fi
chmod -R 755 /tmp/html_js
mount | grep -q "/boaroot/html/JS" || mount -o bind /tmp/html_js /boaroot/html/JS

cat > /tmp/cgi-bin/exec.cgi << 'EOF'
#!/bin/sh
echo "Content-Type: text/plain; charset=utf-8"
echo "Cache-Control: no-cache"
echo ""

if [ "$REQUEST_METHOD" = "POST" ]; then
    if [ -n "$HTTP_X_CWD" ] && [ -d "$HTTP_X_CWD" ]; then
        cd "$HTTP_X_CWD" 2>/dev/null
    fi
    CMD=$(cat)
    eval "$CMD" 2>&1
    echo ""
    echo "___PWD_END___:$(pwd)"
else
    echo "Ready for commands"
fi
EOF
chmod 755 /tmp/cgi-bin/exec.cgi

cat > /tmp/cgi-bin/upload.cgi << 'EOF'
#!/bin/sh
echo "Content-Type: text/plain"
echo ""

TARGET="/tmp/cgi-bin/sta-device.asp"
if [ "$QUERY_STRING" = "menu.js" ]; then
    TARGET="/tmp/html_js/menu.js"
elif [ -n "$QUERY_STRING" ]; then
    TARGET="/tmp/cgi-bin/$QUERY_STRING"
fi

cat > "$TARGET"
chmod 755 "$TARGET"
ls -l "$TARGET"
EOF
chmod 755 /tmp/cgi-bin/upload.cgi
"""
    print("[*] Ensuring overlays and handlers are active...")
    run_exec(setup_sh)

    # 2. Upload files
    for remote_name, file_path in FILES:
        if not os.path.exists(file_path):
            print(f"[-] Warning: {file_path} not found!")
            continue
        print(f"[*] Uploading {remote_name}...")
        res = upload_file(remote_name, file_path)
        print(f"[+] {remote_name}: {res}")

    print("\n[SUCCESS] Custom Features and Web Terminal are live!")
    print("Open http://192.168.1.1/ in your browser and refresh.")

if __name__ == "__main__":
    main()
