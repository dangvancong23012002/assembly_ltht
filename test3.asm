INCLUDE LIB1.asm 
.MODEL small
.STACK 100h
.DATA
	m1 db 13, 10, 'Tong S = 1 + 2 + 3 + ... + 100 la: $'
.CODE
PS:
		mov ax, @data
		mov ds, ax 
		
	L_CT0:
		CLRSCR
		mov cx, 100
		mov ax, 100
		dec cx 
	Sum:
		add ax, cx 
		loop Sum
	
	; Hiện tổng
		HienString m1 
		call HIEN_SO_N
	
	Exit:
		mov ah, 4ch
		int 21h
INCLUDE LIB2.asm 
END