# Bootloader

This is a documentation of the boot process.

# Flow

- BIOS loads the MBR from Sector 0 of a disk, the boot sector.
    - Valides that an MBR is present first.

# The Boot Sector

- Last 2 bytes are set to the magic number 0xaa55.

# Definitions

* Sector - Part of a disk, traditionally 512 bytes. 
* MBR - Master Boot Record