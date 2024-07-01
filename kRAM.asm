INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
	m1 db 13, 10, 'So luong kRam duoc them tren mainboad khong? $ '
	sl1 db 13, 10, 'So luong cong kRAM duoc them tren mainboard la: 16k$'
	sl2 db 13, 10, 'So luong cong kRAM duoc them tren mainboard la: 32k$'
	sl3 db 13, 10, 'So luong cong kRAM duoc them tren mainboard la: 64k$'
	dc db 13, 10, 'Dia chi: $'
	space db ' $'
	co db 'Co $'
	khong db 'Khong $'
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
		jmp Exit
	L2:
		HienString sl1
		jmp Exit
		
	L3:
		HienString sl2
		jmp Exit
	L4:
		HienString sl3
		jmp Exit
	Exit:
		mov ah, 4ch
		int 21h
INCLUDE lib2.asm
@kRAM$qv ENDP
	END