.MODEL small
.STACK 100h
.DATA
	m1 db 13, 10, 'Nhap so 1: $'
	m2 db 13, 10, 'Nhap so 2: $'
	m3 db 13, 10, 'So lon nhat la (chuyen ax vao dx): $'
	m4 db 13, 10, 'So lon nhat la (chuyen bx vao dx): $'
.CODE
PS:
	mov ax, @data
	mov ds, ax 
	lea dx, m1
	mov ah, 9
	int 21h
	
	cmp ax, bx 
	jg AXBig
	mov dx, bx
	
	
	
	jmp Exit
	
	AXBig:
		mov dx, ax 
		;pop dx 
		; mov ah, 2
		; int 21h
	Exit:
	mov ah, 4ch
	int 21h
END PS 

HienString MACRO xau
	push ax dx ; Bảo vệ các thanh ghi
	lea dx, xau ; Chức năng hiện một xâu (kết thúc bằng 
	mov ah, 9 ; dấu '$' lên màn hình tại vị trí con
	int 10h 
	pop dx ax ; Hồi phục các thanh ghi 
ENDM

