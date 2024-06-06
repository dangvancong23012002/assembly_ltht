.MODEL small
.STACK 100h
.DATA
	m1 db 13, 10, 'Nhap chuoi bat ky: $'
	m2 db 13, 10, 'Hien thi chuoi vua nhap: $'
.CODE
PS:
	mov ax, @data ; Đưa phần đị chỉ segement vao vung nhớ
	mov ds, ax 
	
	; Hiện m1
	mov ah, 9 
	lea dx, m1 
	int 21h
	
	; Nhập từng ký tự
	xor ax, ax 
	xor cx, cx ; Làm sạch các thanh ghi
	xor sp, sp 
	xor bp, bp 
	mov bp, sp ; Địa chỉ bp sẽ là địa chỉ sp hiện tại
	
	Nhap:
		mov ah, 1 ; Nhập một ký tự assii được đẩy vào al 
		int 21h 
		cmp al, 0dh
		je Print
		push ax 
		inc cx 
		jmp Nhap
		
	Print:
		;pop dx
		sub bp, 2
		mov dx, [bp]
		mov ah, 2
		int 21h
		loop Print
		
	Exit:
		mov ah, 4ch
		int 21h
END PS