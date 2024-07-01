INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
	m1 db 13, 10, 'May tinh ban dang dung co DMA khong? $'
	co db 'Co $'
	khong db 'Khong $'
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
		jmp Exit
	
	L1:
		HienString co
		
	Exit:
		mov ah, 4ch
		int 21h
@DMA$qv ENDP
	END