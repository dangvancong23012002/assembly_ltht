.MODEL large
.CODE
	PUBLIC @SLTP$qini
@SLTP$qini PROC
	push bp
	mov bp, sp
	mov cx, [bp + 6] 		; Giá trị n đưa vào cx 
	les bx, [bp + 8] 		; es:[bx] trỏ đến a[0]
	xor ax, ax 				; Số lượng (lúc đâu = 0)
	L2:
		mov dx, es:[bx] 	; dx = a[i]
		cmp dx, -100 		; So sánh với -100
		jl L3 				; a[i] < -100 thì nhảy đến L3 
		cmp dx, 100 		; So sánh a[i] với 100 
		jg L3 				; a[i] > 100 thì nhảy đến L3 
		inc ax 				; Tăng số lượng thành phần 
	L3:
		add bx, 2 			; Trỏ đến thành phần tiếp theo
		loop L2 
		pop bp
		ret
@SLTP$qini ENDP
	END