INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
	m1	db 13, 10, 'LAP TRINH TREN MOI TRUONG DOS'
		db 13, 10, '-----------------------------'
		db 13, 10, 13, 10, 'Cau 7: May tinh co cong joysticks(can dieu khien khong?'
		db 13, 10, 13, 10, '-----------------------------'
		db 13, 10, 13, 10, '-------------- CHUONG TRINH ---------------'
		db 13, 10, 'May tinh co cong joystick khong? $ '
	co db 'Co $'
	khong db 'Khong $'
	tieptuc db 13, 10, '-----------------------------'
			db 13, 10, 'Co tiep tuc chuong trinh khong(c/k)? $'
.CODE
	PUBLIC @JOYS$qv
@JOYS$qv PROC
		mov ax, @data
		mov ds, ax 
		
	L_CT0:
		CLRSCR
		HienString m1 
		int 11h
		and al, 00010000b; tách 
		jnz L1 ; Không bằng thì nhảy
		HienString khong
		jmp CONTINUE
	
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
@JOYS$qv ENDP
	END