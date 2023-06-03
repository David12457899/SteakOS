; Printing a string
; Assuming that the string pointer was pushed before
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