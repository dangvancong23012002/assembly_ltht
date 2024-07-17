INCLUDE lib1.asm 
.MODEL small
.STACK 100h
.DATA
	m1 	db 13, 10, '	    TIM GIA TRI NHO NHAT CUA MANG'
		db 13, 10, '	------------------------------------'
		db 13, 10, '	Hay vao so luong thanh phan: $'
	m2 db 13, '	a[$'
	m3 db ']=$'
	m4 db 13, '	Day so vua nhap la: $'
	space db ' $'
	m5 db 13, 10, '	So be nhat trong day so nguyen la: $'
	tieptuc db 13, 10, '	------------------------------------'
			db 13, 10, '	Co tiep tuc chuong trinh khong(c/k)? $'
	slpt dw ?
	i dw ?
	a dw 100 dup(?)
	min_value dw ?
.CODE
	PUBLIC @MIN_ARR$qv
@MIN_ARR$qv PROC
		mov ax, @data 
		mov ds, ax 
		
	L_CT0:
		clrscr
		HienString m1 
		call VAO_SO_N
		mov slpt, ax 
	
	; Vòng lặp nhận các số đưa vào mảng 
		mov cx, ax 
		lea bx, a 
		mov i, 0
	
	L_CT1:
		HienString m2
		mov ax, i 
		call HIEN_SO_N
		HienString m3 
		call VAO_SO_N
		mov [bx], ax 
		inc i 
		add bx, 2
		loop L_CT1
		
	; Vòng lặp đưa các số của mảng lên màn hình 
		HienString m4 
		mov cx, slpt
		lea bx, a 
		
	L_CT2:
		mov ax, [bx]
		call HIEN_SO_N
		HienString space
		add bx, 2 
		loop L_CT2
		
	; Tìm số bé nhất
		HienString m5
		lea bx, a 
		mov cx, slpt
		mov ax, [bx] ; Giả sử phần tử đầu tiên là nhỏ nhất 
		mov min_value, ax 
		dec cx
		add bx, 2 ; bx trỏ đến phần tử thứ 2
		
	L_CT3:
		mov ax, [bx] 
		cmp ax, min_value ; So sánh a[i] với a[i++]
		jge L_CT4
		mov min_value, ax 
		
	L_CT4:
		add bx, 2
		loop L_CT3
		
	; Hiện giá trị
		call HIEN_SO_N
		
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
	
INCLUDE lib2.asm 
@MIN_ARR$qv ENDP
	END