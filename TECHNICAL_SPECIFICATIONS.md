<!-- SANITIZED FOR PUBLIC RELEASE -->
> [!NOTE]
> **Sanitization Notice:** All personal identification details, MAC addresses, serial numbers, ISP PPPoE accounts, and private Wi-Fi passwords have been sanitized and replaced with clear `[DUMMY_*]` labels to enable safe public open-sourcing.

# Hardware & Firmware Technical Specifications

**Target Board:** EcoNet EN751221 xPON (GPON/EPON) Home Gateway  
**Architecture:** MIPS32 Release 2 (MIPS 34Kc) SMP  
**Flash Type:** SPI NOR Flash (16 MiB / 128 Mbit)  
**Extraction Method:** Serial Bootloader Memory Map via `bldr>` on `COM11`  

---

## 1. System Overview

| Parameter | Specification |
| :--- | :--- |
| **Main SoC** | EcoNet **EN751221** (TrendChip / MediaTek MIPS Architecture) |
| **CPU Core** | **MIPS 34Kc** Revision 00019558 |
| **Core Frequency** | **900.00 MHz** (High precision timer @ 199.968 MHz) |
| **Thread Contexts** | 4 TC (TC0, TC1, TC2, TC3), 2 VPEs, SMP Linux Kernel |
| **System RAM** | **64 MB DDR2** (`DRAMC V1.2.2`, DDR-800) |
| **SPI Flash Controller** | TC3162 SPI NOR Interface (Clock: 25 MHz) |
| **Flash Memory Chip** | GigaDevice **`GD25Q128B`** (16 MiB = 16,777,216 bytes) |
| **Flash Memory Base** | `0xbc000000` (mapped `0xbc000000` to `0xbd000000`) |
| **VoIP / SLIC Subsystem**| Microsemi **Le9641** Line Interface (SPI/ZSI bus) |
| **PCIe Host** | MT7512 PCIe Controller (1 Link Up) |
| **Wireless Module** | MediaTek / Ralink Wi-Fi Subsystem (`RTMPSetPhyMode`) |
| **Ethernet Port** | 100 Mbps Fast Ethernet (Default IP: `192.168.1.1/24`) |
| **Serial UART** | Physical `COM11` @ 115200 8-N-1 (`ttyS0`) |

---

## 2. Flash Memory Layout (9 MTD Partitions)

Extracted from kernel boot initialization and `mtd` bootloader command:

| Partition | Start Offset | End Offset | Size | File Name | Description |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **`mtd0`** | `0x00000000` | `0x00020000` | 128 KB | `mtd0_bootloader.bin` | Free Bootbase v2.0.0 (`bldr>`) |
| **`mtd1`** | `0x00020000` | `0x00030000` | 64 KB | `mtd1_romfile.bin` | NVRAM Active Configuration, Passwords & Keys |
| **`mtd2`** | `0x00030000` | `0x00189889` | ~1.37 MB | `mtd2_kernel.bin` | Primary Linux Kernel Image (LZMA) |
| **`mtd3`** | `0x00189889` | `0x007c9889` | ~6.25 MB | `mtd3_rootfs.bin` | Primary Root Filesystem (SquashFS) |
| **`mtd4`** | `0x00030000` | `0x007e0000` | 7.875 MB | `mtd4_tclinux.bin` | Full Primary Firmware Image |
| **`mtd5`** | `0x007e0000` | `0x00939889` | ~1.37 MB | `mtd5_kernel_slave.bin`| Dual-Boot Backup Kernel Image |
| **`mtd6`** | `0x00939889` | `0x00f79889` | ~6.25 MB | `mtd6_rootfs_slave.bin`| Dual-Boot Backup RootFS |
| **`mtd7`** | `0x007e0000` | `0x00f90000` | 7.875 MB | `mtd7_tclinux_slave.bin`| Full Backup Firmware Image |
| **`mtd8`** | `0x00f90000` | `0x01000000` | 448 KB | `mtd8_reservearea.bin` | Factory Calibration, MACs & VoIP Keys |

---

## 3. Web & Network Management

- **Local LAN IP:** `192.168.1.1`
- **Subnet Mask:** `255.255.255.0`
- **DHCP Client IP:** `192.168.1.2`
- **Web Server:** Boa/0.94.13 running on Ports 80 / 443
- **Web Interface:** `/cgi-bin/index2.asp` (China Telecom E8-C Platform)
- **Web Admin Accounts:**
  - `telecomadmin` / `nE7jA%5m` (Super Administrator)
  - `admin` / `admin` (Standard Administrator)
