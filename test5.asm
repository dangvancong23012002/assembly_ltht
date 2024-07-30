INCLUDE LIB1.asm
.MODEL small 
.STACK 100h
.DATA
	m1 	db 13, 10, '	                    TIM N NHO NHAT'
		db 13, 10, '	--------------------------oOo--------------------------'
		db 13, 10, '	So n nho nhat de tong tu 1 den no lon hon 10000 la: $'
	m2 db 13, 10, '	Tong cac so tu 1 den $'
	m3 db ' la: '
	m4 db '$'
.CODE
PS:
		mov ax, @data
		mov ds, ax 
		
	L_CT0:
		CLRSCR
		mov cx, 1
		xor ax, ax 
		
	FIND_N:
		add ax, cx 
		cmp ax, 10000
		ja Xong 
		inc cx 
		jmp FIND_N
		
	Xong:
		HienString m1
		mov ax, cx 
		call HIEN_SO_N
		
	; Tính tổng từ 1 -> n	
		HienString m2 
		call HIEN_SO_N
		HienString m3
		
	SUM:
		add ax, cx 
		loop SUM
		
		HienString m4
		call HIEN_SO_N
		
		
	Exit:
		mov ah, 4ch
		int 21h
		
INCLUDE LIB2.asm 
END PS 