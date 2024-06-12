.MODEL large
.DATA
EXTRN _n: word, _a: word
.CODE
	PUBLIC @SUM_EVEN$qv
@SUM_EVEN$qv PROC
	mov cx, _n 				; cx = n
	mov ax, seg _a 			; ax = phần địa chỉ segment của a[0]
	mov es, ax 				; es = phần địa chỉ segment của a[0]
	mov bx, offset _a 		; bx = phần địa chỉ offset của a[0]
	xor ax, ax 				; ax = tổng và lúc đầu = 0
	
	; Tổng các thành phần chẵn của mảng
	L1:
		mov dx, es:[bx] 	; dx = a[i]
		shr dx, 1 			; Bit thấp nhất vào cờ Carry ( C = 1 -> a[i] là lẻ, C = 0 -> a[i] là chẵn)
		jc L2 				; Nếu gía trị a[i] là lẻ thì nhảy đến L2
		add ax, es:[bx] 	; còn giá trị a[i] là chẵn thì cộng tổng ở ax 
		
	L2:
		add bx, 2 			; bx trỏ đến thành phần tiếp theo của mảng 
		loop L1 
			
	ret
@SUM_EVEN$qv ENDP
	END