INCLUDE LIB1.asm 
.MODEL small
.STACK 100h
.DATA
	m1 	db 13, 10, '	            TUOI CUA BAN'
		db 13, 10, '	----------------oOo-----------------'
		db 13, 10, '	Nhap nam sinh cua ban: $'
	m2 db 13, '	Tuoi cua ban la: $'
	m3 db 13, '	Nam sinh duoc nho hon 0! $'
	m4 db 13, '	Nam sinh khong duoc lon hon 2024! $'
	tieptuc db 13, 10, '	------------------------------------'
			db 13, 10, '	Co tiep tuc chuong trinh khong(c/k)? $'
	birth_year dw ?
.CODE
	PUBLIC @GET_AGE$qv
@GET_AGE$qv PROC
		mov ax, @data 
		mov ds, ax 
		
	L_CT0:
		CLRSCR
		HienString m1 
		call VAO_SO_N
		cmp ax, 0
		jl L_CT1 ; Nhảy có dấu (dấu âm - nhỏ hơn 0)
		cmp ax, 2024 
		ja L_CT2
		mov birth_year, ax 
		xor ax, ax 
		mov ah, 2ah
		int 21h 
		mov ax, cx 
		sub ax, birth_year
		HienString m2
		call HIEN_SO_N
		jmp CONTINUE
		
	L_CT1:
		HienString m3
		jmp CONTINUE
	
	L_CT2:
		HienString m4
		jmp CONTINUE
		
		
	CONTINUE:
		HienString tieptuc
		mov ah, 1
		int 21h
		cmp al, 'c'
		jne Exit
		jmp L_CT0
		
	Exit:
		mov ah, 4ch
		int 21h
	ret 
	
INCLUDE LIB2.asm 
@GET_AGE$qv ENDP
	END