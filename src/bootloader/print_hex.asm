; Printing the content of dx (in hex)
print_hex:
    push bp
    mov bp, sp
    pusha

    ; Get the address of the end of the string
    mov bx, hex_str
    add bx, 5

    loop_each_digit:
        mov ax, dx
        and al, 0xF ; Get the Least Significant hex letter

        ; convert into ascii
        cmp al, 10
        jb is_digit        
        is_letter:
            add al, 55
            jmp change_str_pos

        is_digit:
            add al, 48
            jmp change_str_pos

        change_str_pos:
            mov [bx], al

        shr dx, 4 ; Divide by 16
        sub bx, 1

        cmp dx, 0
        ja loop_each_digit

    mov bx, hex_str
    call print

    call hex_str_cleanup

    popa
    mov sp, bp
    pop bp

    ret

hex_str_cleanup:
    pusha

    mov bx, hex_str
    mov al, '0'

    mov [bx + 2], al
    mov [bx + 3], al
    mov [bx + 4], al
    mov [bx + 5], al

    popa
    ret

hex_str:
    db "0x0000", 0