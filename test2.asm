INCLUDE LIB1.asm
.MODEL small
.STACK 100h
.DATA
	so1 db 13, 10, '	       HIEU HAI SO'
		db 13, 10, '	-----------oOo-----------'
		db 13, 10, '	Nhap so 1: $'
	so2 db 13, 10, '	Nhap so 2: $'
	kq db 13, 10, '	Hieu hai so la: $'
	Am db 13, 10, '	-> Hieu hai so nho hon 0! $'
	Duong db 13, 10, '	-> Hieu hai so lon hon 0! $'
	Khong db 13, 10, '	-> Hieu hai so bang 0! $'
	buff 	dw 8
			dw ?
			dw 8 dup(?)
.CODE
PS:
		mov ax, @data
		mov ds, ax 
		
	L_CT0:
		CLRSCR
		HienString so1
		call VAO_SO_N
		mov bx, ax 
		HienString so2
		call VAO_SO_N
		sub bx, ax 
		cmp bx, 0
		jg Duong0
		jl Am0
		je Khong0
		
	Khong0:
		HienString kq
		mov ax, bx
		call HIEN_SO_N
		HienString Khong
		jmp Exit
	
	Duong0:
		HienString kq
		mov bx, ax 
		call HIEN_SO_N
		HienString Duong
		jmp Exit
	Am0:
		HienString kq
		mov ax, bx
		call HIEN_SO_N
		HienString Am
	
	Exit:
		mov ah, 4ch
		int 21h

INCLUDE LIB5.asm 		
END PS