INCLUDE LIB1.asm
.MODEL small
.STACK 100h
.DATA
	m1 	db 13, 10, '	SO LON NHAT TRONG 2 SO'
		db 13, 10, '	---------oOo----------'
		db 13, 10, '	Nhap so 1: $'
	m2 db 13, 10, '	Nhap so 2: $'
	m3 db 13, 10, '	So lon nhat trong hai so la: $'
	buff    dw 8
			dw ?
			dw 8 dup(?)
.CODE
PS:
		mov ax, @data
		mov ds, ax 
		
	L_CT0:
		CLRSCR
		HienString m1 
		call VAO_SO_N
		mov bx, ax 
		HienString m2
		call VAO_SO_N
		cmp bx, ax 
		jg BXBig
	AXBig:
		mov dx, ax
		HienString m3 
		call HIEN_SO_N
		jmp Exit
	
	BXBig:
		mov dx, bx 
		mov ax, bx
		HienString m3
		call HIEN_SO_N
		
	Exit:
		mov ah, 4ch
		int 21h
	
INCLUDE LIB5.asm 
END PS 

