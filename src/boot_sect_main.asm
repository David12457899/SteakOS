ORG 0x7C00

main:
    mov bp, 0x8000 ; set the stack safely away from us
    mov sp, bp

    mov bx, 0x9000 ; es:bx = 0x0000:0x9000 = 0x09000
    mov dh, 2 ; read 2 sectors
    ; the bios sets 'dl' for our boot disk number
    ; if you have trouble, use the '-fda' flag: 'qemu -fda file.bin'
    call disk_load

    mov dx, [0x9000] ; retrieve the first loaded word, 0xfefe
    call print_hex

    call print_nl

    mov dx, [0x9000 + 512] ; first word from second loaded sector, 0xcece
    call print_hex


jmp $

my_str db "test", 0

; includes
%include "./src/print_str.asm"
%include "./src/print_hex.asm"
%include "./src/boot_sect_disk.asm"

; Padding and adding magic
times 510-($ - $$) db 0
dw 0xAA55

; Createing a few more sectors to test
times 256 dw 0xfefe ; sector 2 - 512 bytes
times 256 dw 0xcece ; sector 3 - 512 bytes