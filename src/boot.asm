ORG 0x7C00

helloWorld db "Hello World!", 0

push helloWorld
call print_str

jmp $

; includes
%include "./src/utils.asm"

; padding
times 510-($ - $$) db 0

; magic bytes
dw 0xAA55