INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
	m1 	db 13, 10, '	      TONG DUONG DAY SO NGUYEN'
		db 13, 10, '	------------------------------------'
		db 13, 10, '	Hay vao so luong thanh phan: $'
	m2 db 13, '	a[$'
	m3 db ']=$'
	m4 db 13, '	Day so vua nhap la: $'
	space db ' $'
	m5 db 13, 10, '	Tong cac thanh phan duong cua mang la: $'
	tieptuc db 13, 10, '	------------------------------------'
			db 13, 10, '	Co tiep tuc chuong trinh khong(c/k)? $'
	slpt dw ?
	i dw ?
	a dw 100 dup(?)
.CODE
	PUBLIC @POS_SUM_ARR@qv
@POS_SUM_ARR@qv PROC
		mov ax, @data 
		mov ds, ax 
		
	L_CT0:
		CLRSCR
		HienString m1
		call VAO_SO_N
		mov slpt, ax 
		
	; Vòng lặp đưa các số vào mảng 
		mov cx, ax 
		lea	bx, a ; bx là con trỏ offset của a[0]
		mov i, 0
		
	L_CT1:
		HienString m2
		mov ax, i 
		call HIEN_SO_N
		HienString m3
		call VAO_SO_N
		mov [bx], ax ; Đưa giá trị a[i] vào mảng a do bx trỏ đến 
		inc i 
		add bx, 2
		loop L_CT1
		
	; Vòng lặp đưa các số của mảng ra màn hình 
		HienString m4
		mov cx, slpt
		lea bx, a 
	
	L_CT2:
		mov ax, [bx] ; ax = a[i]
		call HIEN_SO_N 
		HienString space
		add bx, 2 
		loop L_CT2
		
	; Vòng lặp tính tổng 
		HienString m5
		mov cx, slpt
		lea bx, a 
		xor ax, ax 
		
	; Tổng các thành phần dương của mảng 
	L_CT3:
		mov dx, [bx] 
		and dx, dx ; Dựng cờ dấu (S = 1 thì dx chứa số âm, S = 0 thì dx chứa số dương)
		js L_CT4
		add ax, [bx] ; Dương thì cộng
		
	L_CT4:
		add bx, 2 
		loop L_CT3
		
	; Hiện tổng 
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
@POS_SUM_ARR@qv ENDP
	END