<!-- SANITIZED FOR PUBLIC RELEASE -->
> [!NOTE]
> **Sanitization Notice:** All personal identification details, MAC addresses, serial numbers, ISP PPPoE accounts, and private Wi-Fi passwords have been sanitized and replaced with clear `[DUMMY_*]` labels to enable safe public open-sourcing.

# EcoNet EN751221 (UW-311VPW) Hardware Reverse Engineering & Firmware Extraction

[![Architecture](https://img.shields.io/badge/Architecture-MIPS%2034Kc%20(SMP)-blue.svg)](#hardware-specifications)
[![Flash Memory](https://img.shields.io/badge/SPI%20NOR-16%20MiB%20GD25Q128B-green.svg)](#flash-memory-layout)
[![OS Kernel](https://img.shields.io/badge/Kernel-Linux%202.6.36-orange.svg)](#system-architecture)
[![Bootloader](https://img.shields.io/badge/Bootloader-Free%20Bootbase%20v2.0-red.svg)](#bootloader-analysis)

Comprehensive hardware analysis, serial console debugging, bootloader interception, and SPI flash memory extraction toolset for the **EcoNet / MediaTek EN751221** based **UW-311VPW** XPON (GPON/EPON) Home Gateway ONT.

---

<div align="center">

# 🚀 **MAJOR ANNOUNCEMENT: ALL-IN-ONE CUSTOM FIRMWARE COMING SOON!** 🚀

[![Release Status](https://img.shields.io/badge/STATUS-UPCOMING%20RELEASE-8A2BE2?style=for-the-badge&logo=rocket&logoColor=white)](#)
[![Firmware Build](https://img.shields.io/badge/FIRMWARE-ALL--IN--ONE%20IMAGE-FF4500?style=for-the-badge&logo=flattr&logoColor=white)](#)
[![Features](https://img.shields.io/badge/FEATURES-100%25%20BUILT--IN-00C853?style=for-the-badge&logo=checkmarx&logoColor=white)](#)
[![Flash & Play](https://img.shields.io/badge/DEPLOYMENT-ONE--CLICK%20FLASH-00BFFF?style=for-the-badge&logo=speedtest&logoColor=white)](#)

</div>

> [!IMPORTANT]
> ### 📢 **Full Pre-Baked Custom Firmware Release (`tclinux.bin`) In Development!**
> 
> 🎉 **Exciting news!** A complete, ready-to-flash custom firmware image is currently in the works and will be released very soon.
> 
> Instead of using temporary RAMFS overlays or manual re-injection scripts, **all custom features will be baked permanently into the SquashFS RootFS**:
> 
> * 💻 **Built-in Linux Web Terminal:** Directly accessible from the web UI (`/cgi-bin/sta-terminal.asp`) and the bottom-left `>_ TERMINAL` button with full root access (`#`).
> * 🛡️ **Multi-Provider Ad-Blocking DNS:** Built-in AdGuard Home, Cloudflare Security, Quad9, and Google DNS with zero-downtime automated failsafe.
> * 🔓 **Full 4-Port LAN Unlock:** All 4 physical Ethernet ports (`eth0.1`–`eth0.4`) unlocked and bridged simultaneously for full wired connectivity.
> * 🌐 **Universal Operating Modes:** One-click switching between **Optical XPON Gateway**, **Ethernet Access Point / Repeater** (using LAN 1 as WAN input), and **Wireless Bridge**.
> * ⚙️ **Permanent Custom Subnet:** Fully configurable gateway IP and DHCP pool (defaulting to `192.168.10.1`, subnet `192.168.10.0/24`) saved permanently in flash.
> * 🔒 **Zero-Risk Safe Flashing:** Packaged with valid TrendChip/EcoNet firmware headers for flashing directly via the standard Web UI (`/cgi-bin/upgrade.asp`) or bootloader recovery (`bldr> httpd`).
> 
> ⏳ **Stay tuned! Watch and star this repository to get notified the moment the custom image drops!**

---

## 📌 Table of Contents
- [Overview](#overview)
- [Hardware Specifications](#hardware-specifications)
- [Flash Memory Layout](#flash-memory-layout)
- [Serial Console & Access](#serial-console--access)
- [Bootloader Architecture (`bldr`)](#bootloader-architecture-bldr)
- [Extracted Artifacts & Partitions](#extracted-artifacts--partitions)
- [Tools & Extraction Scripts](#tools--extraction-scripts)
- [Security Notice](#security-notice)

---

## 🔍 Overview

The **Uniway UW-311VPW** is a widely deployed multi-service FTTH gateway featuring high-speed optical GPON/EPON uplinks, 802.11n Wi-Fi, and an on-board VoIP telephone line interface (FXS SLIC). 

This repository documents the complete low-level reverse engineering process, including:
1. Identifying physical UART console pins (`ttyS0` @ 115200 8-N-1).
2. Intercepting the 3-second hardware autoboot countdown.
3. Operating the proprietary **Free Bootbase (`bldr>`)** bootloader.
4. Performing a byte-level dump of the SPI NOR Flash without web-portal limitations.
5. Decompressing the factory NVRAM configuration (`romfile.xml`).

---

## ⚙️ Hardware Specifications

```
                     +---------------------------------------+
                     |         EcoNet EN751221 SoC           |
                     |      MIPS 34Kc Core @ 900 MHz         |
                     |    4 Hardware Thread Contexts (SMP)   |
                     +-------------------+-------------------+
                                         |
               +-------------------------+-------------------------+
               |                         |                         |
        +------+------+           +------+------+           +------+------+
        | 64 MB DDR2  |           | 16 MB SPI   |           | Microsemi   |
        | RAM Memory  |           | NOR Flash   |           | Le9641 SLIC |
        |  (DDR-800)  |           | (GD25Q128B) |           |  VoIP FXS   |
        +-------------+           +-------------+           +-------------+
```

| Subsystem | Technical Description |
| :--- | :--- |
| **System-on-Chip (SoC)** | **EcoNet EN751221** (TrendChip / MediaTek architecture) |
| **CPU Architecture** | **MIPS 34Kc** Revision 00019558 @ **900.00 MHz** |
| **Thread Topology** | 4 Thread Contexts (TC0–TC3), 2 VPEs, SMP Linux |
| **Caches** | 64 kB I-Cache (4-way VIPT) / 32 kB D-Cache (4-way VIPT) |
| **System RAM** | **64 MB DDR2** (`DRAMC V1.2.2`, DDR-800) |
| **Flash Memory** | **16 MiB (128 Mbit) SPI NOR Flash** — GigaDevice **`GD25Q128B`** |
| **Flash Base Address** | `0xbc000000` (Directly memory-mapped: `0xbc000000`–`0xbd000000`) |
| **Optical Network Unit** | xPON PHY (GPON / EPON Gigabit Passive Optical Network) |
| **Wi-Fi Subsystem** | Ralink / MediaTek 2.4 GHz 802.11b/g/n (MIMO) |
| **Telephone / VoIP** | Microsemi **Le9641** Line Interface (SPI/ZSI bus) with MediaTek DSP |
| **Local Management IP** | `192.168.1.1` (Subnet `255.255.255.0`, DHCP pool `.2` to `.254`) |

---

## 🗺️ Flash Memory Layout

The internal flash memory is split across 9 MTD partitions:

```
Address Range                 Size      Partition Name   Description
-------------------------------------------------------------------------------------
0x00000000 - 0x00020000       128 KB    bootloader       Free Bootbase v2.0.0 (bldr)
0x00020000 - 0x00030000       64 KB     romfile          Active NVRAM Config XML
0x00030000 - 0x00189889       ~1.37 MB  kernel           Primary Linux Kernel (LZMA)
0x00189889 - 0x007c9889       ~6.25 MB  rootfs           Primary Root Filesystem (SquashFS)
0x00030000 - 0x007e0000       7.875 MB  tclinux          Full Primary Firmware Bundle
0x007e0000 - 0x00939889       ~1.37 MB  kernel_slave     Dual-Boot Backup Kernel
0x00939889 - 0x00f79889       ~6.25 MB  rootfs_slave     Dual-Boot Backup RootFS
0x007e0000 - 0x00f90000       7.875 MB  tclinux_slave    Full Backup Firmware Bundle
0x00f90000 - 0x01000000       448 KB    reservearea      Factory Golden ROM, MAC, Cal
```

---

## 🔐 Serial Console & System Access

### 1. Serial UART Port
- **Interface:** `COM11` (or local TCP bridge `socket://127.0.0.1:9999`)
- **Settings:** `115200 8-N-1`, No Parity, 1 Stop Bit
- **Login Prompt:** `tc login:` *(hostname is `tc`)*
- **Console User:** `admin`
- **Console Password:** `admin!@#$`
- **Access Level:** **Root Shell (`#`)**

### 2. Web Portal Administration
- **Web URL:** `http://192.168.1.1/` (E8-C Management Web Interface)
- **SuperAdmin Account:** `telecomadmin` / `nE7jA%5m`
- **Standard Admin Account:** `admin` / `[DUMMY_WEB_ADMIN_PASS]`

---

## 🛠️ Bootloader Architecture (`bldr`)

The device uses EcoNet's **Free Bootbase v2.0.0**. During startup, it offers a 3-second interrupt window:
```text
Press any key in 3 secs to enter boot command mode.
```

### Key Bootloader Commands
| Command | Syntax | Description |
| :--- | :--- | :--- |
| `decomp` | `decomp` | Decompress the primary kernel from flash into RAM at `0x80002000` |
| `jump` | `jump <addr>` | Transfer CPU execution directly to an address (e.g. `jump 80002000`) |
| `dump` | `dump <addr> <len>` | Dump raw memory or flash in formatted hex (e.g. `dump bc000000 800`) |
| `httpd` | `httpd` | Launch built-in HTTP recovery / flashing server |
| `mtd` | `mtd` | Display internal partition table and offsets |
| `bootswap` | `bootswap` | Toggle active firmware partition between slot 0 and slot 1 |

> [!TIP]
> **Booting the Kernel from `bldr>`:**
> Because the kernel image is compressed in flash, typing `go` alone will not boot. You must run:
> ```text
> decomp
> jump 80002000
> ```

---

## 📂 Extracted Artifacts & Partitions

All binary dumps are byte-verified from the hardware memory map:

* **`mtd0_bootloader.bin`** (128 KB): Complete raw bootloader code.
* **`mtd1_romfile.bin`** (64 KB): Gzip-compressed active configuration sector.
* **`romfile_decompressed.xml`** (65 KB): Fully extracted XML configuration containing all account parameters, network routing, and services.
* **`mtd8_reservearea.bin`** (448 KB): Permanent factory sector:
  - `0x00000`: Golden default factory recovery romfile (`tc_backupromfile`).
  - `0x30000`: Board identity (`UW-311VPW`), GPON Serial Number (`[DUMMY_GPON_SN_UWTC00000000]`), and MAC.
  - `0x50000`: Wi-Fi 2.4 GHz RF calibration EEPROM matrix.
* **`DEVICE_DETAILS.txt`**: Consolidated quick-reference credentials and system identity sheet.
* **`TECHNICAL_SPECIFICATIONS.md`**: Detailed technical reference documentation.
* **`install_web_terminal.py`**: Automated deployment and persistence script for the Web Root Terminal.
* **`sta-terminal.asp`**: Dedicated in-page Linux/Windows-style root terminal interface for the router web UI.
* **`sta-device_patched.asp`**: Modified status dashboard with bottom-left `>_ TERMINAL` navigation button.
* **`menu.js`**: Patched navigation script adding the `Terminal` sub-menu under `Status`.

---

## 💻 Integrated Web Root Terminal (`dev` branch)

The `dev` branch introduces a fully integrated, in-page Linux Web Terminal running directly within the router's Boa web server:

1. **Native UI Integration:**
   - Adds **`Terminal`** to the navigation sub-bar under **Status**: `| Device | WAN | LAN | VoIP | Terminal |`.
   - Adds an interactive **`>_ TERMINAL`** button in the bottom-left orange box of the dashboard.
   - Operates in-page within the standard Uniway interface (`sta-terminal.asp`) without popups or external windows.

2. **Terminal Engine & Features:**
   - **Root Privileges:** Full execution and file modification access as UID 0 (`root@UW-311VPW:~#`).
   - **Persistent Working Directory:** Tracks directory state (`cd /tmp`, `cd /etc`, etc.) across commands and dynamically updates the prompt.
   - **Full Shell Controls:** Up/Down arrow command history, Tab autocompletion, `Ctrl+L` / `clear` screen wipe, and `Ctrl+C` interrupt.
   - **Quick Action Bar:** One-click shortcuts for `uname -a`, `cat /proc/mtd`, `cpuinfo`, `free`, `ifconfig`, `ps`, and `dmesg`.

3. **Overlay & Persistence Architecture:**
   - **RAMFS Overlay:** The read-only SquashFS `/boaroot/cgi-bin` and `/boaroot/html/JS` are dynamically overlaid via RAM-backed bind mounts (`mount -o bind /tmp/cgi-bin /boaroot/cgi-bin`).
   - **Rootfs Protection:** The router uses EcoNet's proprietary `sqsG` LZMA-compressed SquashFS on SPI NOR flash. The RAMFS overlay provides 100% functionality and full root write capabilities without risk of bricking the SPI NOR flash partitions.
   - **Persistence:** Run `python install_web_terminal.py` whenever the router is power-cycled to re-apply the overlay in under 2 seconds.

---

## 💻 Tools & Extraction Scripts

### `flash_dumper.py`
A Python automation script designed to interface with the serial bridge:
- Listens for device reboot / power-cycle.
- Automatically interrupts the boot countdown within milliseconds.
- Enters `bldr>` mode.
- Streams, parses, and reconstructs binary `.bin` partition files directly to disk with checksum verification.

```bash
python flash_dumper.py
```

---

## ⚠️ Security Notice
This repository contains firmware analysis and hardware reverse-engineering data gathered from a locally connected physical testing device for educational, recovery, and backup purposes. Ensure sensitive credentials are sanitized before deployment into public production environments.
