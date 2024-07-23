INCLUDE LIB1.asm 
.MODEl small
.STACK 100h
.DATA
	m1 	db 13, 10, '	      NHAP VA HIEN TEN CUA BAN'
		DB 13, 10, '	-----------------oOo----------------'
		db 13, 10, '	Hay nhap ten cua ban: $'
	m2 db 13, 10, '	Xin chao, $'
	m3 db 13, 10, 'Ten phai toi thieu hai tu! $'
	chuoi db 100 dup('$')
	tieptuc DB 13, 10, '	------------------------------------'
			db 13, 10, '	Co tiep tuc chuong trinh khong(c/k)? $'
.CODE
	PUBLIC @ENTER_NAME$qv
@ENTER_NAME$qv PROC
		mov ax, @data 
		mov ds, ax 
		
	L_CT0:
		CLRSCR
	; In xâu ký tự
		mov ah, 9
		lea dx, m1 
		int 21h
	; Nhập chuỗi ký tự (cho phép đánh sai và sửa)
		mov ah, 10 ; Hoặc 0ah
		lea dx, chuoi ; trỏ đến địa chỉ đầu str 
		int 21h
	; In xâu ký tự
		mov ah, 9
		lea dx, m2  
		int 21h
	; Đưa dx chỉ về phần tử thứ 2 của mảng là ký tự đầu tiên được nhập vào 
		lea dx, chuoi + 2
		int 21h
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
	ret
@ENTER_NAME$qv ENDP
	END