INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
	m1 	db 13, 10, 'LAP TRINH TREN MOI TRUONG DOS'
		db 13, 10, '-----------------------------'
		db 13, 10, 13, 10, 'Cau 8: May tinh dang dung co DMA khong?'
		db 13, 10, 13, 10, '-----------------------------'
		db 13, 10, 13, 10, '-------------- CHUONG TRINH ---------------'
		db 13, 10, 'May tinh ban dang dung co DMA khong? $'
	co db 'Co $'
	khong db 'Khong $'
	tieptuc db 13, 10, '-----------------------------'
			db 13, 10, 'Co tiep tuc chuong trinh khong(c/k)? $'
.CODE
	PUBLIC @DMA$qv
@DMA$qv PROC
		mov ax, @data 
		mov ds, ax 
		
	L_CT0:
		CLRSCR
		HienString m1 
		int 11h ; Nội dung byte có địa chỉ 0:411h -> ah 
		mov al, ah ; Al chứa nội dung byte 0:411h
		shr al, 1 ; Dịch các bit của AL sang phải 1 lần
		jc L1 ; Nếu CF = 1 (có DMA) thì nhảy đến L1
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
@DMA$qv ENDP
	END