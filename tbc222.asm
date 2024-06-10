.MODEL large
.CODE
	PUBLIC @AVG$qiini
@AVG$qiini PROC
	push bp
	mov bp, sp
	mov ax, [bp + 6] 	; ax = so1
	mov bx, [bp + 8] 	; bx = so2
	add ax, bx 			; ax = ax + bx (ax = so1 + so2)
	sar ax, 1 			; ax = chia đôi làm tròn dưới
	jnc L1 				; Nếu tổng là chẵn (C = 0) thì nhảy đến L1 
	mov cx, 1 			; còn không thì biến cờ flag = 1
	les bx, [bp + 10] 	; es:[bx] trỏ đến vùng nhớ chứa biến cờ flag 
	mov es:[bx], cx 
	L1:
		pop bp 			; Hồi phục giá trị bp 
		ret
@AVG$qiini ENDP
	END