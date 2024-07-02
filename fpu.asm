INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
	m1 	db 13, 10, 'LAP TRINH TREN MOI TRUONG DOS'
		db 13, 10, '-----------------------------'
		db 13, 10, 13, 10, 'Cau 3: Lieu may tinh co cong FPU (CPU) khong?'
		db 13, 10, 13, 10, '-----------------------------'
		db 13, 10, 13, 10, '-------------- CHUONG TRINH ---------------'
		db 13, 10, 'May tinh co cong FPU khong? $ '
	co db 'Co $'
	khong db 'Khong $'
	tieptuc db 13, 10, '-----------------------------'
			db 13, 10, 'Co tiep tuc chuong trinh khong(c/k)? $'
.CODE
	PUBLIC @FPU$qv
@FPU$qv PROC
		mov ax, @data
		mov ds, ax
		
	L_CT0:
		CLRSCR
		HienString m1 
		int 11h
		and al, 00000010b; tách 2 bit về số lượng FPU 
		jnz L1 ; Không bằng thì nhảy
		HienString khong
		jmp Exit
	
	L1:
		HienString co
		
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
@FPU$qv ENDP
	END