INCLUDE LIB1.asm
.MODEL small
.STACK 100h
.DATA
	m1 	db 13, 10, '	CHUYEN CHUOI THANH HOA, THUONG'
		db 13, 10, '	-------------oOo--------------'
		db 13, 10, '	Nhap vao mot chuoi: $'
	m2 db 13, 10, '	Doi thanh chu thuong: $'
	m3 db 13, 10, '	Doi thanh chu hoa: $'
	s db 100 dup('$')
.CODE
	PUBLIC @CHAR_UPP_REG$qv
@CHAR_UPP_REG$qv PROC
		mov ax, @data 
		mov ds, ax 
		
	L_CT0:
		CLRSCR
		HienString m1
	; Nhập chuỗi s 
		mov ah, 0ah
		lea dx, s 
		int 21h
		
	; Gọi chương trình con in chuỗi thường
		HienString m2
		call PRINT_LOWER_S
		
	; Gọi chương trình con in chuỗi hoa 
		HienString m3
		call PRINT_UPPER_S
		
	Exit:
		mov ah, 4ch
		int 21h
		
; Thủ tục in chuỗi thường 
PRINT_LOWER_S PROC 
		lea si, s + 1
		xor cx, cx 
		mov cl, [si]
		inc si 
	L_LOWER_0:
		mov ah, 02h
		mov dl, [si]
		cmp dl, 'A'
		jb L_LOWER_1
		cmp dl, 'Z'
		ja L_LOWER_1
		add dl, 32
	L_LOWER_1:
		inc si 
		int 21h
		loop L_LOWER_0
	ret 
PRINT_LOWER_S ENDP 

; Thủ tục in chuỗi hoa 
PRINT_UPPER_S PROC 
		lea si, s + 1
		xor cx, cx 
		mov cl, [si]
		inc si 
	L_UPPER_0:
		mov ah, 02h
		mov dl, [si]
		cmp dl, 'a'
		jb L_UPPER_1
		cmp dl, 'z'
		ja L_UPPER_1
		sub dl, 32
	L_UPPER_1:
		inc si 
		int 21h
		loop L_UPPER_0
	ret 
PRINT_UPPER_S ENDP 

	ret
@CHAR_UPP_REG$qv ENDP
	END