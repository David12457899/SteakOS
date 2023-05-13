keep_looping:
    jmp keep_looping

times 510-($ - $$) db 0 ; 510 - (current address - beginning address)
dw 0xAA55