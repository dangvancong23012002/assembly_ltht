.MODEL large
.DATA
EXTRN _n: word, _a: word
.CODE
	PUBLIC @SUM$qv
@SUM$qv PROC
	mov cx, _n ; cx = n
	mov ax, seg _a ; ax = phần địa chỉ segment của a[0]
	mov es, ax ; es = phần địa chỉ segment của a[0]
	mov bx, offset _a ; bx = phần địa chỉ offset của a[0]
	xor ax, ax ; ax = tổng và lúc đầu = 0
	L1:
		add ax, es:[bx] ; ax = ax + a[i] (do es:[bx] trỏ đến)
		add bx, 2 ; bx trỏ đến thành phần tiếp theo của mảng a 
		loop L1 
		ret
@SUM$qv ENDP
	END