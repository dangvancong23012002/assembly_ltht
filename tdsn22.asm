.MODEL large
.CODE
	PUBLIC @SUM$qini
@SUM$qini PROC
		push bp
		mov bp, sp
		mov cx, [bp + 6] ; cx = n lấy từ stack
		les bx, [bp + 8] ; es:[bx] trỏ đến a[0]
		xor ax, ax ; ax = tổng và lúc đầu = 0
	
	L1:
		add ax, es:[bx] ; ax = ax + a[i] (do es:[bx] trỏ đến)
		add bx, 2; bx trỏ đến thành phần tiếp theo của mảng a 
		loop L1 
		pop bp ; Hồi phục giá trị bp 
		ret
@SUM$qini ENDP
	END