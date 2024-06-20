.MODEL large
.DATA
	i dw ?
	EXTRN _n: word, _a: word 
.CODE
	PUBLIC @SAPXEP$qv
@SAPXEP$qv PROC
		; Vòng lặp sắp xếp dãy số theo chiều giảm dần
		mov ax, _n 
		mov i, ax ; i chỉ số vòng lặp ngoài
		dec i
		
	L1:
		mov cx, _n; cx = số lượng thành phần của mảng a 
		lea bx, _a ; bx trỏ đến offset của mảng a 
		dec cx 
		
	L2:
		mov ax, [bx] ; ax = a[i]
		mov dx, [bx + 2] ; dx = a[i + 1]
		cmp ax, dx ; So sánh a[i] với a[i++]
		jnl L3
		mov [bx], dx 
		mov [bx + 2], ax 
		
	L3:
		add bx, 2 
		loop L2
		dec i 
		jnz L1 
		
		ret
@SAPXEP$qv ENDP
	END
