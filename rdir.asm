INCLUDE lib1.asm 
.MODEL small 
.STACK 100h
.DATA
	m 	db 13, 10, '	     CHUC NANG XOA THU MUC RONG'
		db 13, 10, '	------------------------------------'
		db 13, 10, '	Hay vao thu muc can xoa: $'
	tieptuc db 13, 10, '	------------------------------------'
			db 13, 10, '	Co tiep tuc chuong trinh khong(c/k)? $'
.CODE
	PUBLIC @REM_DIR$qv
@REM_DIR$qv PROC
		mov ax, @data
		mov ds, ax 
		
	L_CT0:
		CLRSCR
		HienString m 
		
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
@REM_DIR$qv ENDP
	END