INCLUDE lib1.asm 
.MODEL small
.STACK 100h
.DATA
	m1 	db 13, 10, '	   TIM GIA TRI LON NHAT CUA MANG'
		db 13, 10, '	------------------------------------'
		db 13, 10, '	Hay vao so luong thanh phan: $'
	m2 db 13, '	a[$'
	m3 db ']=$'
	m4 db 13, '	Day so vua nhap la: $'
	space db ' $'
	m5 db 13, 10, '	So lon nhat trong day so nguyen la: $'
	m6 db 13, 10, '	Vi tri lon nhat la: $'
	m7 db 13, 10, '	Day so duoc sap xep giam dan la: $'
	tieptuc db 13, 10, '	------------------------------------'
			db 13, 10, '	Co tiep tuc chuong trinh khong(c/k)? $'
	slpt dw ?
	i dw ?
	a dw 100 dup(?)
	max_value dw ?
	max_index dw ?
.CODE
	PUBLIC @MAX_ARR$qv
@MAX_ARR$qv PROC
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
		
	;-------------------------------------------------------------------------------------
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
	
	;-------------------------------------------------------------------------------------
	; Tìm số lớn nhất
		HienString m5
		lea bx, a 
		mov cx, slpt
		mov ax, [bx] ; Giả sử phần tử đầu tiên là lớn nhất 
		mov max_value, ax 
		dec cx
		add bx, 2 ; bx trỏ đến phần tử thứ 2
		
	L_CT3:
		mov ax, [bx] 
		cmp max_value, ax ; So sánh max với a[i++]
		jge L_CT4
		mov max_value, ax 
		
	L_CT4:
		add bx, 2
		loop L_CT3
		
	; Hiện giá trị lớn nhất 
		mov ax, max_value ; Lấy giá trị max ra khỏi vòng lặp rồi hiện
		call HIEN_SO_N
		
	;-------------------------------------------------------------------------------------
	; Tìm vị trí lớn nhất 
		HienString m6
		lea bx, a 
		mov cx, slpt
		mov ax, [bx]
		mov max_value, ax 
		mov max_index, 0
		dec cx
		add bx, 2 
		mov dx, 1 
		
	L_CT5:
		mov ax, [bx]
		cmp max_value, ax ; So sánh max_value với a[i++]
		jge L_CT6 ; Nếu max >= a[i++] thì nhảy
		mov max_index, dx ; Ngược lại thì gán vị trí max vào dx
		
	L_CT6:
		add bx, 2
		inc dx 
		loop L_CT5
		
	; Hiện vị trí lớn nhất 
		mov ax, max_index
		call HIEN_SO_N
		
	;-------------------------------------------------------------------------------------	
	; Sắp xếp dãy số theo chiều giảm dần
		mov ax, slpt
		mov i, ax 
		dec i 
		
	L_CT7:
		mov cx, slpt
		lea bx, a ; bx trỏ đến offset của mảng a 
		dec cx 
		
	L_CT8:
		mov ax, [bx]
		mov dx, [bx + 2] ; dx = a[i + 1]
		cmp ax, dx ; So sánh a[i] với a[i++]
		jge L_CT9 ; Nếu a[i] >= a[i++] thì nhảy, ngược lại thì đổi chéo giá trị ax, dx 
		mov [bx], dx ; dx = giá trị nhỏ 
		mov [bx + 2], ax ; ax = giá trị lớn
		
	L_CT9:
		add bx, 2 
		loop L_CT8
		dec i 
		jnz L_CT7 ; Nhảy để thay đổi các vị trí sắp xếp
		
	; Vòng lặp đưa các số sắp xếp ra màn hình
		HienString m7
		mov cx, slpt
		lea bx, a 
		
	L_CT10:
		mov ax, [bx]
		call HIEN_SO_N
		HienString space
		add bx, 2
		loop L_CT10
		
	;-------------------------------------------------------------------------------------
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
@MAX_ARR$qv ENDP
	END