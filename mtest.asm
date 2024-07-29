INCLUDE LIB1.asm
.MODEL small
.STACK 100h
.DATA
	m5 	db 13, 10, '	          KIEM TRA GIUA KI'
		db 13, 10, '	-----------------oOo-----------------'
		db 13, 10, '	So luong so sau dau thap phan: $'
	m1 db 13, 10, '	Hay vao so bi chia: $'
	m2 db 13, 10, '	Hay vao so chia: $'
	m3 db 13, 10, '	Thuong: $'
	m4 db 13, 10, '	So chia phai lon hon 0! $'
	dautru db '-$'
	daucham db '.$'
	tieptuc db 13, 10, '	------------------------------------'
			db 13, 10, '	Co tiep tuc chuong trinh khong(c/k)? $'
	n dw ?
	buff 	db 8
			db ?
			db 8 dup(?)
.CODE
	PUBLIC @MID_TEST$qv
@MID_TEST$qv PROC
		mov ax, @data
		mov ds, ax 
		
	L_CT0:
		CLRSCR
		HienString m5 
		call VAO_SO_N
		mov n, ax 
		HienString m1
		call VAO_SO_N
		mov bx, ax
	ENTER_RET:
		HienString m2 
		call VAO_SO_N
		cmp ax, 0
		jl L_CT1
		jmp L_CT2
		
	L_CT1:
		HienString m4
		jmp ENTER_RET
		
	L_CT2:
		xchg ax, bx 
		HienString m3 
		and ax, ax 
		jns CHIA1
		HienString dautru
		neg ax 
		
	CHIA1:
		xor dx, dx
		div bx 
		call HIEN_SO_N
		and dx, dx 
		jz CONTINUE
		HienString daucham
		mov cx, n
		mov si, 10
		
	CHIA2:
		mov ax, dx 
		mul si 
		div bx 
		call HIEN_SO_N
		and dx, dx 
		jz CONTINUE
		loop CHIA2
		
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

INCLUDE LIB5.asm
@MID_TEST$qv ENDP
	END