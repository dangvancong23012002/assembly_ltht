INCLUDE LIB1.asm 
.MODEL small
.STACK 100h
.DATA
	m1 	db 13, 10, '	      NHAP SO NGUYEN N'
		db 13, 10, '	-------------oOo------------'
		db 13, 10, '	Nhap so nguyen n (0 <= n <= 9): $'
	m2 db 13, 10, '	Nhap sai!!! $'
	m4 db 13, 10, '	Nhap dung!!! $'
	m3 db 13, 10, '	Nhap lai so nguyen n (0 <= n <= 9): $'
	buff 	db 8
			db ?
			db 8 dup(?)
.CODE
PS:
		mov ax, @data 
		mov ds, ax 
	
	L_CT0:
		CLRSCR
		HienString m1
	L_CT1:
		call VAO_SO_N
		cmp ax, 0
		jl NhapSai
		cmp ax, 9
		jg NhapSai
		HienString m4
		jmp Exit
		
	NhapSai:
		HienString m2
		HienString m3 
		jmp L_CT1
		
	Exit:
		mov ah, 4ch
		int 21h
INCLUDE LIB5.asm 
END PS 