.MODEL small
.STACK 100h
.DATA
    message db "Hello World! $"
.CODE
PS:
    mov ax, @data       ; Dua phan dia chi segment vao vung nho
    mov ds, ax          ; chua du lieu vao ds
    lea dx, message     ; Hien mot xau ket thuc bang $
    mov ah, 9
    int 21h
    Exit:
        mov ah, 4ch 	; Tro ve DOS
        int 21h
END PS