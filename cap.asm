INCLUDE LIB1.asm 
.MODEL small
.STACK 100h
.DATA
	m1 	db 13, 10, '	CHUYEN KY TU THUONG SANG HOA'
		DB 13, 10, '	-------------oOo------------'
		db 13, 10, '	Nhap vao mot ky tu thuong: $'
	m2 db 13, 10, '	Chuyen sang ky tu hoa la: '
	char db ?, '$'
.CODE
	PUBLIC @CAPITAL_LETTERS$qv
@CAPITAL_LETTERS$qv PROC
		mov ax, @data 
		mov ds, ax 
		
	L_CT0:
		CLRSCR
		HienString m1 
	; Nhập vào 1 ký tự thường và đổi thành ký tự hoa 
		mov ah, 1
		int 21h
		sub al, 20h ; Đổi thành ký tự hoa (Tương tự với đổi hòa thành thường ta dùng lệnh add)
		mov char, al 
	; Hiện lên chữ hoa 
		HienString m2 
		
	Exit:
		mov ah, 4ch
		int 21h
	ret
@CAPITAL_LETTERS$qv ENDP
	END