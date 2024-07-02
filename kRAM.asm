INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
	m1 	db 13, 10, 'LAP TRINH TREN MOI TRUONG DOS'
		db 13, 10, '-----------------------------'
		db 13, 10, 13, 10, 'Cau 5: So luong kRAM duoc them tren mainboad?'
		db 13, 10, 13, 10, '-----------------------------'
		db 13, 10, 13, 10, '-------------- CHUONG TRINH ---------------'
		db 13, 10, 'So luong kRam duoc them tren mainboad khong? $ '
	sl1 db 13, 10, 'So luong cong kRAM duoc them tren mainboard la: 16k$'
	sl2 db 13, 10, 'So luong cong kRAM duoc them tren mainboard la: 32k$'
	sl3 db 13, 10, 'So luong cong kRAM duoc them tren mainboard la: 64k$'
	dc db 13, 10, 'Dia chi: $'
	space db ' $'
	co db 'Co $'
	khong db 'Khong $'
	tieptuc db 13, 10, '-----------------------------'
			db 13, 10, 'Co tiep tuc chuong trinh khong(c/k)? $'
.CODE
	PUBLIC @kRAM$qv
@kRAM$qv PROC
		mov ax, @data
		mov ds, ax 
		
	L_CT0:
		CLRSCR
		HienString m1 
		int 11h
		and al, 00001100b; tách 2 bit về số lượng kRAM 
		shr al, 2 ; Bit thấp nhất sẽ rơi vào CF
		
		cmp al, 0
		je L1
		HienString co
		cmp al, 1
		je L2
		cmp al, 2
		je L3
		cmp al, 3
		je L4
	
	L1:
		HienString khong
		jmp CONTINUE
	L2:
		HienString sl1
		jmp CONTINUE
		
	L3:
		HienString sl2
		jmp CONTINUE
	L4:
		HienString sl3
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
INCLUDE lib2.asm
@kRAM$qv ENDP
	END