INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
	co db 13, 10, 'May tinh co o mem $'
	khong db 13, 10, 'May tinh khong co o mem $'
	soLuong db 13, 10, 'So luong o mem la: $'
.CODE
PS:
		mov ax, @data 
		mov ds, ax 
		CLRSCR
		int 11h ; [411h] -> AL và [0:411h] -> AH 
		shr al, 1 ; bit thấp nhất sẽ rơi vào CF 
		jc L1  ; Nhảy nếu CF = 1
		HienString khong
		jmp Exit 
		
	L1:
		HienString co 
		HienString soLuong 
		shr al, 5
		add al, 30h ; Hiển thị được al là mã ASCII
		mov ah, 0eh ; Hiển thị một ký tự ra ngoài màn hình
		int 10h
		
	Exit:
		mov ah, 4ch
		int 21h
	
END PS 