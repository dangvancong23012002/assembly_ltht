INCLUDE LIB1.asm
.MODEL small
.STACK 100h
.DATA
	m1 	db 13, 10, '	   DO DAI MOT CHUOI NHAP'
		db 13, 10, '	------------oOo------------'
		db 13, 10, '	Nhap vao mot chuoi: $'
	m2 db 13, 10, '	Tong chieu dai cua chuoi la: $'
	s db 100 dup('$')
.CODE
	PUBLIC @LENGTH_STRING$qv
@LENGTH_STRING$qv PROC
		mov ax, @data 
		mov ds, ax 
		
	L_CT0:
		CLRSCR
		HienString m1 
	
	; Nhập vào một chuỗi
		mov ah, 0ah
		lea dx, s 
		int 21h 
		
		HienString m2
	; Tính chiều dài chuỗi
		xor ax, ax 
		mov al, s + 1 ; Chuyển chiều dài chuỗi vào ax 
		mov cx, 0 ; Khởi tạo biến đếm 
		mov bx, 10
	
	L_CT1:
		mov dx, 0
		div bx 
		push dx 
		inc cx 
		cmp ax, 0
		jnz L_CT1
	
	; Xuất chiều dài chuỗi 
		mov ah, 2
	L_CT2:
		pop dx 
		or dl, '0' ; Chuyển chữ số -> số 
		int 21h
		loop L_CT2
		
	Exit:
		mov ah, 4ch
		int 21h
	ret
INCLUDE LIB2.asm 
@LENGTH_STRING$qv ENDP
	END