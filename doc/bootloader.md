# Bootloader

This is a documentation of the boot process.

# Flow

- BIOS loads the MBR from Sector 0 of a disk, the boot sector.
    - Valides that an MBR is present first.
- BIOS loads the rest of the OS from the disk by calling an interrupt.

# The Boot Sector

- Last 2 bytes are set to the magic number 0xaa55.
- Loaded into memory address of 0x7c00

# Definitions

* Sector - Part of a disk, traditionally 512 bytes. 
* MBR - Master Boot Record