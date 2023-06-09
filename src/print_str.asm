; Printing a string
; Pointer should be stored in bx
print_str:
    push bp
    mov bp, sp
    pusha

    mov ah, 0x0E
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

print_nl:
    push bp
    mov bp, sp
    pusha

    mov ah, 0x0e
    mov al, 0x0a ; newline char
    int 0x10
    mov al, 0x0d ; carriage return
    int 0x10

    popa
    mov sp, bp
    pop bp

    ret