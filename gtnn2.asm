.MODEL large
.DATA
	i dw ?
	EXTRN _n: word, _a: word 
	PUBLIC _min_value
	_min_value dw ?
.CODE
	PUBLIC @GTNN$qv
@GTNN$qv PROC
		lea bx, _a ; bx trỏ đến offset của mảng a 
		mov cx, _n ; cx = số lượng phần tử của mảng a 
		mov ax, [bx] ; Giả sử phần tử đầu tiên là nhỏ nhất 
		mov _min_value, ax 
		dec cx 
		add bx, 2 ; bx trỏ đến phần tử thứ 2
		
	L1:
		mov ax, [bx] ; ax = a[i]
		cmp ax, _min_value ; So sánh a[i] với a[i++]
		jge L2   
		mov _min_value, ax 
		
	L2:
		add bx, 2 
		loop L1
		
		ret
@GTNN$qv ENDP
	END
