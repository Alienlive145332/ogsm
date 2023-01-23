mov bx, buffer
mov ah, 0x0e
jmp write

buffer:
    dw "Hallo Welt", 0

write:
    mov al, [bx]
    int 0x10
    inc bx
    cmp bx, 0
    je end
    jmp write

end:
    jmp $

times 510-($-$$) db 0
db 0x55, 0xaa