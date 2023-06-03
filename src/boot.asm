ORG 0x7C00

helloWorld db "Hello World!", 0

mov dx, 0x1234
call print_hex

jmp $

; includes
%include "./src/print_hex.asm"

; padding
times 510-($ - $$) db 0

; magic bytes
dw 0xAA55