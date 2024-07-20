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
	m6 db 13, 10, '	Vi tri be nhat la: $'
	m7 db 13, 10, '	Day so duoc sap xep tang dan la: $'
	tieptuc db 13, 10, '	------------------------------------'
			db 13, 10, '	Co tiep tuc chuong trinh khong(c/k)? $'
	slpt dw ?
	i dw ?
	a dw 100 dup(?)
	min_value dw ?
	min_index dw ?
.CODE
	PUBLIC @MIN_ARR$qv
@MIN_ARR$qv PROC
		mov ax, @data 
		mov ds, ax 
		
	L_CT0:
		CLRSCR
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
		
	; Hiện giá trị nhỏ nhất
		mov ax, min_value ; Lấy giá trị min ra khỏi vòng lặp rồi hiện
		call HIEN_SO_N
		
	;-------------------------------------------------------------------------------------
	; Tìm vị trí nhỏ nhất 
		HienString m6
		lea bx, a 
		mov cx, slpt
		mov ax, [bx] ; Giá trị đầu là bé nhất 
		mov min_value, ax 
		mov min_index, 0
		dec cx 
		add bx, 2 
		mov dx, 1 ; vị trí 2 
		
	L_CT5:
		mov ax, [bx] ; ax = a[i++]
		cmp ax, min_value ; So sánh a[i++] với min_value
		jge L_CT6 ; Nếu >= thì nhảy 
		mov min_index, dx 
		
	L_CT6:
		add bx, 2 
		inc dx 
		loop L_CT5
		
	; Hiện vị trí nhỏ nhất 
		mov ax, min_index
		call HIEN_SO_N
	
	;-------------------------------------------------------------------------------------
	; Sắp xếp dãy số theo chiều tăng dần
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
		cmp dx, ax ; So sánh a[i++] với a[i]
		jge L_CT9 ; Nếu a[i++] >= a[i] thì nhảy, ngược lại thì đổi chéo giá trị ax, dx 
		mov [bx], dx ; dx = giá trị lớn 
		mov [bx + 2], ax ; ax = giá trị nhỏ
		
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
@MIN_ARR$qv ENDP
	END