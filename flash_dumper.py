#!/usr/bin/env python3
"""
EcoNet EN7512 SPI Flash Memory Dumper
=====================================
Connects to the software serial bridge (127.0.0.1:9999), intercepts or communicates
with the 'bldr>' bootloader, and dumps physical SPI NOR Flash (GD25Q128B) at 0xbc000000.
"""

import socket
import time
import sys
import os
import shutil

OUTPUT_DIRS = [
    r"C:\Users\ramakant\.gemini\antigravity\scratch\econet_en7512_dump",
    r"C:\Users\ramakant\Desktop\antigravity\econet_en7512_dump"
]

PARTITIONS = [
    {"name": "mtd0_bootloader", "addr": 0xbc000000, "size": 0x20000, "desc": "Bootloader (free bootbase v2.0.0)"},
    {"name": "mtd1_romfile",    "addr": 0xbc020000, "size": 0x10000, "desc": "NVRAM Active XML Configuration & Keys"},
    {"name": "mtd8_reservearea","addr": 0xbcf90000, "size": 0x70000, "desc": "Factory Calibration & Board Data"},
]

CHUNK_SIZE = 0x800  # 2048 bytes per dump command

def parse_dump_lines(text: str) -> bytes:
    """Parse raw ASCII hex output from 'dump <addr> <len>' into pure binary bytes."""
    data = bytearray()
    for line in text.splitlines():
        line = line.strip()
        if not line or '|' not in line:
            continue
        parts = line.split('|')[0].strip().split()
        if len(parts) >= 2:
            hex_part = ''.join(parts[1:]).replace('.', '').replace(' ', '')
            try:
                data.extend(bytes.fromhex(hex_part))
            except ValueError:
                pass
    return bytes(data)

def ensure_bootloader_prompt(s: socket.socket) -> bool:
    """Ensure we have an active 'bldr>' prompt; if not, wait for power-cycle."""
    print("[*] Checking bootloader prompt on COM11 (127.0.0.1:9999)...")
    s.settimeout(1.0)
    
    # Try sending \r to see if bldr> responds
    for _ in range(2):
        s.sendall(b"\r")
        time.sleep(0.3)
        try:
            buf = s.recv(1024)
            if b"bldr>" in buf:
                print("[+] Successfully connected to active 'bldr>' prompt!")
                return True
        except socket.timeout:
            pass

    print("[!] Board is currently in Linux mode.")
    print("[!] PLEASE POWER-CYCLE THE BOARD NOW (unplug power cable and plug back in).")
    print("[*] Listening for boot countdown to intercept into 'bldr>'...")

    buf = b""
    s.settimeout(0.1)
    while True:
        try:
            chunk = s.recv(512)
            if chunk:
                buf += chunk
                if any(k in buf.lower() for k in [b"bootbase", b"dramc", b"press any key", b"gd25q128b", b"xtal"]):
                    print("\n[+] BOOT COUNTDOWN DETECTED! Intercepting...")
                    for _ in range(12):
                        s.sendall(b" \r")
                        time.sleep(0.05)
                    break
        except socket.timeout:
            pass
        except KeyboardInterrupt:
            print("\nAborted.")
            return False

    time.sleep(0.5)
    for _ in range(15):
        s.sendall(b"\r")
        time.sleep(0.2)
        try:
            res = s.recv(1024)
            if b"bldr>" in res:
                print("[+] Successfully intercepted! At 'bldr>' prompt.")
                return True
        except socket.timeout:
            pass

    return False

def dump_range(s: socket.socket, start_addr: int, total_size: int, output_path: str):
    """Dump a specific flash memory region and save to disk."""
    print(f"\n[*] Starting dump: {os.path.basename(output_path)}")
    print(f"    Base Address: 0x{start_addr:08x} | Size: {total_size} bytes (0x{total_size:x})")
    
    bytes_dumped = 0
    all_data = bytearray()
    start_time = time.time()
    
    curr_addr = start_addr
    while bytes_dumped < total_size:
        rem = total_size - bytes_dumped
        req_len = min(CHUNK_SIZE, rem)
        
        cmd = f"dump {curr_addr:x} {req_len:x}\r"
        s.sendall(cmd.encode())
        
        chunk_buf = b""
        read_start = time.time()
        while time.time() - read_start < 4.0:
            try:
                c = s.recv(2048)
                if not c:
                    break
                chunk_buf += c
                if b"bldr>" in chunk_buf[-15:]:
                    break
            except socket.timeout:
                pass
        
        chunk_bytes = parse_dump_lines(chunk_buf.decode("latin-1", errors="replace"))
        if not chunk_bytes:
            print(f"\n[!] Warning: No data parsed for addr 0x{curr_addr:x}, retrying...")
            time.sleep(0.3)
            continue
            
        all_data.extend(chunk_bytes)
        bytes_dumped += len(chunk_bytes)
        curr_addr += len(chunk_bytes)
        
        pct = (bytes_dumped / total_size) * 100
        elapsed = time.time() - start_time
        speed = (bytes_dumped / 1024) / elapsed if elapsed > 0 else 0
        sys.stdout.write(f"\r    Progress: {bytes_dumped}/{total_size} bytes ({pct:5.1f}%) [{speed:.1f} KB/s]")
        sys.stdout.flush()

    print(f"\n[+] Completed! Writing to {output_path}...")
    with open(output_path, "wb") as f:
        f.write(all_data)

    # Sync to other output directories
    for d in OUTPUT_DIRS:
        dst = os.path.join(d, os.path.basename(output_path))
        if dst != output_path:
            shutil.copyfile(output_path, dst)
            print(f"    Synced -> {dst}")

def main():
    for d in OUTPUT_DIRS:
        os.makedirs(d, exist_ok=True)

    print("=" * 65)
    print(" EcoNet EN7512 SPI NOR Flash Extractor (GD25Q128B)")
    print("=" * 65)

    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(("127.0.0.1", 9999))
    
    if not ensure_bootloader_prompt(s):
        print("[-] Could not reach 'bldr>' prompt.")
        s.close()
        return

    # Drain any extra prompt bytes
    time.sleep(0.3)
    try:
        s.settimeout(0.3)
        while s.recv(1024): pass
    except: pass

    # Dump critical partitions
    primary_dir = OUTPUT_DIRS[0]
    for p in PARTITIONS:
        out_file = os.path.join(primary_dir, f"{p['name']}.bin")
        dump_range(s, p["addr"], p["size"], out_file)

    print("\n" + "=" * 65)
    print(" All primary flash partitions successfully dumped!")
    print("=" * 65)
    s.close()

if __name__ == "__main__":
    main()
