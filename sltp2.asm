.MODEL large
.DATA
EXTRN _n: word, _a: word
.CODE
	PUBLIC @SLTP$qv
@SLTP$qv PROC
	mov cx, _n 			; Giá trị biến n được đưa vào cx 
	mov ax, seg _a 		; Phần địa chỉ segment của a[0]
	mov es, ax 			; es chứa phần địa chỉ segment của a[0]
	mov bx, offset _a 	; bx chứa phần địa chỉ offset của a[0]
	xor ax, ax 			; Số lượng thành phần [-100; 100] (lúc đầu = 0)
	L2:
		mov dx, es:[bx] ; dx = a[i]
		cmp dx, -100 	; so sánh a[i] với -100
		jl L3 			; a[i] < 100 thì nhảy đến L3 
		cmp DX, 100 	; còn >= -100 thì so sánh với 100
		jg L3 			; Nếu a[i] > 100 thì nhảy đến L3 
		inc ax 			; Tăng số lượng lên 1
	L3:
		add bx, 2 		; bx trỏ đến thành phần tiếp theo của dãy số
		loop L2 
		ret
@SLTP$qv ENDP
	END