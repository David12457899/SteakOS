ORG 0x7C00

push helloWorld
call print_str

jmp $

print_str:
    push bp
    mov bp, sp
    pusha

    mov ah, 0x0E
    mov bx, [bp + 4]
    mov al, [bx]

    print_letter:
        int 0x10
        
        inc bx
        mov al, [bx]
        cmp al, 0

        jne print_letter

    popa
    mov sp, bp
    pop bp

    ret

helloWorld db "Hello World!", 0

; padding
times 510-($ - $$) db 0

; magic bytes
dw 0xAA55