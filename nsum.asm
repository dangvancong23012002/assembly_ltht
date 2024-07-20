INCLUDE lib1.asm 
.MODEL small
.STACK 100h
.DATA
	m1	db 13, 10, '	       TONG AM DAY SO NGUYEN'
		db 13, 10, '	------------------------------------'
		db 13, 10, '	Hay vao so luong thanh phan: $'
	m2 db 13, '	a[$'
	m3	db ']=$'
	m4 db 13, '	Day so vua nhap la: $'
	space db ' $'
	m5 db 13, 10, '	Tong cac thanh phan am la: $'
	tieptuc db 13, 10, '	------------------------------------'
			db 13, 10, '	Co tiep tuc chuong trinh khong(c/k)? $'
	slpt dw ?
	i dw ?
	a dw 100 dup(?)
.CODE 
	PUBLIC @NEG_SUM_ARR$qv
@NEG_SUM_ARR$qv PROC
		mov ax, @data 
		mov ds, ax 
		
	L_CT0:
		clrscr
		HienString m1
		call VAO_SO_N
		mov slpt, ax 
	
	; Vòng lặp nhận các số đưa vào mảng 
		mov cx, ax ; cx = sltp 
		lea bx, a ; bx là con trỏ offset của a[0]
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
		
	; Vòng lặp tính tổng 
		HienString m5
		mov cx, slpt
		lea bx, a 
		xor ax, ax ; ax chứa tổng (lúc đầu = 0)
		
	; Tổng các thành phần âm của mảng 
	L_CT3:
		mov dx, [bx]
		and dx, dx ; Dừng cờ dấu (S = 1 thì dx chứa số âm, S = 0 thì dx chứa số âm)
		jns L_CT4 ; Nếu dương thì nhảy
		add ax, [bx] ; Ngược lại thì cộng tổng nằm ở ax 
		
	L_CT4:
		add bx, 2 ; bx trỏ đến thành phần tiếp theo của mảng 
		loop L_CT3
		
	; Hiện giá trị tổng 
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
@NEG_SUM_ARR$qv ENDP
	END