INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
	m1 	db 13, 10, 'LAP TRINH TREN MOI TRUONG DOS'
		db 13, 10, '-----------------------------'
		db 13, 10, 13, 10, 'Bai tap: So luong o mem'
		db 13, 10, 13, 10, '-----------------------------'
		db 13, 10, 13, 10, '-------------- CHUONG TRINH ---------------'
		db 13, 10, 'May tinh cua ban co o mem khong? $'
	co db 13, 10, 'May tinh co o mem $'
	khong db 13, 10, 'May tinh khong co o mem $'
	soLuong db 13, 10, 'So luong o mem la: $'
	tieptuc db 13, 10, '-----------------------------'
			db 13, 10, 'Co tiep tuc chuong trinh khong(c/k)? $'
.CODE
	PUBLIC @OMEM$qv
@OMEM$qv PROC
		mov ax, @data 
		mov ds, ax 
	
	L_CT0:
		CLRSCR
		HienString m1
		int 11h ; [411h] -> AL và [0:411h] -> AH 
		shr al, 1 ; bit thấp nhất sẽ rơi vào CF 
		jc L1  ; Nhảy nếu CF = 1
		HienString khong
		jmp CONTINUE
		
	L1:
		HienString co 
		HienString soLuong 
		shr al, 5
		add al, 30h ; Hiển thị được al là mã ASCII
		mov ah, 0eh ; Hiển thị một ký tự ra ngoài màn hình
		int 10h
		
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
	
@OMEM$qv ENDP
	END