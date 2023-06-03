; Printing the content of dx (in hex)
print_hex:
    push bp
    mov bp, sp
    pusha

    ; declare the string
    hex_str db "0x0000", 0

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
            add al, 65
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

    push hex_str
    call print_str

    popa
    mov sp, bp
    pop bp

    ret

%include "./src/print_str.asm"