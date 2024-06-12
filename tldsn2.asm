.MODEL large
.DATA
EXTRN _n: word, _a: word 
.CODE
	PUBLIC @SUM_ODD$qv
@SUM_ODD$qv PROC
	mov cx, _n 				; cx = n
	mov ax, seg _a 			; ax = phần địa chỉ segment của a[0]
	mov es, ax 				; es = phần địa chỉ segment của a[0]
	mov bx, offset _a 		; bx = phần địa chỉ offset của a[0]
	xor ax, ax 				; ax = tổng và lúc đầu = 0
	
	; Tổng các thành phần lẻ của mảng
	L1:
		mov dx, es:[bx] 	; ax = a[i] 
		shr dx, 1 			; Bit thấp nhất vào cờ Carry (C = 1 -> a[i] là lẻ, C = 0 -> a[i] là chẵn)
		jnc L2 				; Còn nếu giá trị a[i] là chẵn thì cộng vào tổng nằm ở ax 
		add ax, es:[bx] 	; Còn giá trị a[i] là lẻ thì cộng vào tổng nằm ở ax 
	
	L2:
		add bx, 2 			; bx trỏ đến thành phần tiếp theo của mảng
		loop L1 
		
	ret 
@SUM_ODD$qv ENDP
	END