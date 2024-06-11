.MODEL large
.DATA
EXTRN _n: word, _a: word 
.CODE
PUBLIC @SUM_NEG$qv
@SUM_NEG$qv PROC
	mov cx, _n 				; cx = n
	mov ax, seg _a 			; ax = phần địa chỉ segment của a[0]
	mov es, ax 				; es = phần địa chỉ segment của a[0]
	mov bx, offset _a 		; bx = phần địa chỉ offset của a[0]
	xor ax, ax 				; ax = tổng và lúc đầu = 0
	; Tổng các thành phần âm của mảng 
	L1:
		mov dx, es:[bx] 	; dx = a[i]
		and dx, dx 			; Dựng cờ dấu (S = 1 thì dx chứa số âm, S = 0 thì dx chứa số âm)
		jns L2 				; Nếu giá trị a[i] dương thì nhảy đến L2 
		add ax, es:[bx] 	; còn giá trị a[i] âm thì cộng vào tổng nằm ở ax 
	L2:
		add bx, 2 			; bx trỏ đến thành phần tiếp theo của mảng 
		loop L1
		ret 
@SUM_NEG$qv ENDP
	END