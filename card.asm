INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
	m1 	db 13, 10, 'LAP TRINH TREN MOI TRUONG DOS'
		db 13, 10, '-----------------------------'
		db 13, 10, 13, 10, 'Cau 9: Loai card dieu khien man hinh?'
		db 13, 10, 13, 10, '-----------------------------'
		db 13, 10, 13, 10, '-------------- CHUONG TRINH ---------------'
		db 13, 10, 'Loai card dieu khien man hinh ma may tinh co la: $'
	color db 'Color $'
	momo db 'Mono $'
	tieptuc db 13, 10, '-----------------------------'
			db 13, 10, 'Co tiep tuc chuong trinh khong(c/k)? $'
.CODE
	PUBLIC @CARD$qv
@CARD$qv PROC
		mov ax, @data
		mov ds, ax 
	L_CT0:
		CLRSCR
		HienString m1 
		int 11h  ; [0:411h] -> AL
		and al, 00110000b ; Tách 2 bit có thông tin liên quan đến loại card điều khiển màn hình 
		cmp al, 00110000b ; Liệu có phải card màn hình là Mono 
		jne L1
		HienString momo
		jmp CONTINUE
		
	L1:
		HienString color
		
	CONTINUE:
		HienString tieptuc
		mov ah, 1
		int 21h
		cmp al, 'c'
		jnc Exit
		jmp L_CT0
	
	Exit:
		mov ah, 4ch
		int 21h
		ret
		
@CARD$qv ENDP
	END