org 0x7C00                      
bits 16                         

; Clear screen
mov ah, 0
mov al, 3
int 0x10

mov ah, 0x13
mov bp, lab 
mov cx, 5
mov bh, 0
mov dl, 15 
mov dh, 0
mov bl, 11 
int 0x10

mov bp, name
mov cx, 12
mov dl, 20
mov dh, 5
mov bl, 79
int 0x10

mov bp, date
mov cx, 10
mov dl, 10
mov dh, 10
mov bl, 241
int 0x10 


date: db "17.11.2021", 0
name: db "Bitca Marius", 0
lab:  db "Lab 2", 0

times 510 - ($ - $$) db 0
db 0x55, 0xAA
