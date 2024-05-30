INCLUDE lib1.asm
.MODEL small 				; Mô hình bộ nhớ cho chương trình dạng small
.STACK 100h 				; Dành một vùng nhớ 256 byte cho ngăn xếp
.DATA 						; Dành một vùng nhớ để cấp phát cho biến (Chỉ có khi chương trình có khai báo biến)
	m1 	db 13, 10, '-------- CAC BAI TAP NGON NGU ASSEMBLY THUAN TUY --------'
		db 13, 10, 13, 10, 'Bai 1:'
		db 13, 10, 'a luy thua n (voi a la so nguyen va n la so nguyen duong)'
		db 13, 10, 13, 10, '-------------------------***-----------------------------'
		db 13, 10, 13, 10, 'Hay vao a: $'
	m2 db 13, 10, 'Hay vao n: $'
	crtf db 13, 10, '$'
	m3 db ' luy thua $'
	m4 db ' la: $'
	m5 db 13, 10, 'Co tiep tuc (c/k)? $'
.CODE
PS:
	mov ax, @data 			; Đưa phần địa chỉ segment vùng nhớ dành cho dữ liệu
	mov ds, ax 				; vào ds (chỉ có khi có .DATA, có khai báo biến
	clrscr
	HienString m1 
	call VAO_SO_N 			; Nhận giá trị a 
	mov bx, ax 				; bx = a
	HienString m2
	call VAO_SO_N 			; Nhận giá trị n 
	mov cx, ax 				; cx = n 
	HienString crtf 		; Quay đầu dòng và xuống hàng
	mov ax, bx 				; ax = a 
	call HIEN_SO_N 			; Hiện giá trị a lên màn hình
	HienString m3 			; Hiện hai chữ 'luy thua'
	mov ax, cx 				; ax = n 
	call HIEN_SO_N 			; Hiện giá trị n lên màn hình 
	HienString m4 			; Hiện chữ 'la '
	mov ax, 1 				; Gán ax = 1
	and cx, cx 				; Liệu giá trị n (cx = n) có bằng 0?
	jz HIEN 				; Nếu bằng 0 thì nhảy đến nhãn HIEN 
	LAP: 					; Còn không thì thực hiện vòng lặp tính a lũy thừa n 
		mul bx 				; ax = ax * bx
		loop LAP
	HIEN:
		call HIEN_SO_N 		; Hiện giá trị a luy thua n (giá trị có trong ax )
	CONTINUE:
		HienString m5 		; Hiện dòng nhắc
		mov ah, 1 			; Chờ nhận một ký tự từ bàn phím
		int 21h 
		cmp al, 'c' 		; Ký tự vừa nhận có phải là 'c'
		jne Exit 			; Nếu không phải thì nhảy đến nhã Exit 
		jmp PS 				; Còn không thì quay về đầu (bắt đầu lại chương trình)
	Exit:
		mov ah, 4ch 		; Về DOS
		int 21h
INCLUDE lib2.asm 
END PS