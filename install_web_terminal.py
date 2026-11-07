#!/usr/bin/env python3
"""
Uniway UW-311VPW Dedicated Web Terminal Installer
Deploys a standalone full-page authentic Linux/Windows style terminal at:
  http://192.168.1.1/cgi-bin/terminal.cgi
And adds the button in the bottom-left orange box of the router web management dashboard:
  http://192.168.1.1/
"""

import sys
import os
import urllib.request
import urllib.error

ROUTER_IP = "192.168.1.1"
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
PATCH_FILE = os.path.join(BASE_DIR, "sta-device_patched.asp")
TERM_FILE = os.path.join(BASE_DIR, "terminal.asp")

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
    
    if not os.path.exists(PATCH_FILE) or not os.path.exists(TERM_FILE):
        print("[-] Error: Missing sta-device_patched.asp or terminal.asp")
        sys.exit(1)

    # 1. Setup /tmp/cgi-bin, bind mount, and CGI handlers
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
if [ -n "$QUERY_STRING" ]; then
    TARGET="/tmp/cgi-bin/$QUERY_STRING"
fi

cat > "$TARGET"
chmod 755 "$TARGET"
ls -l "$TARGET"
EOF
chmod 755 /tmp/cgi-bin/upload.cgi

cat > /tmp/cgi-bin/terminal.cgi << 'EOF'
#!/bin/sh
echo "Content-Type: text/html; charset=utf-8"
echo "Cache-Control: no-cache"
echo ""
cat /tmp/cgi-bin/terminal.html
EOF
chmod 755 /tmp/cgi-bin/terminal.cgi
"""
    print("[*] Configuring CGI overlay and backend handlers...")
    run_exec(setup_sh)

    # 2. Upload files
    print("[*] Uploading terminal UI...")
    res1 = upload_file("terminal.html", TERM_FILE)
    print(f"[+] terminal.html: {res1}")

    print("[*] Uploading patched sta-device.asp...")
    res2 = upload_file("sta-device.asp", PATCH_FILE)
    print(f"[+] sta-device.asp: {res2}")

    print("\n[SUCCESS] Dedicated Full-Page Terminal is live!")
    print("Direct Terminal URL:  http://192.168.1.1/cgi-bin/terminal.cgi")
    print("Router Web Dashboard: http://192.168.1.1/")

if __name__ == "__main__":
    main()
