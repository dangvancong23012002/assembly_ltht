.MODEL large
.DATA
	;i dw ?
	PUBLIC _min_index, min_value
	_min_index dw ?
	min_value dw ?
	EXTRN _n: word, _a: word	
.CODE
	PUBLIC @VTNN$qv
@VTNN$qv PROC

		lea bx, _a ; bx trỏ đến offset của mảng a 
		mov cx, _n ; cx = số lượng phần tử của mảng a 
		mov ax, [bx] ; Giả sử phần tử đầu tiên là nhỏ nhất 
		mov min_value, ax 
		mov _min_index, 0
		dec cx 
		add bx, 2 ; bx trỏ đến phần tử thứ 2
		mov dx, 1 ; dx là chỉ số phần tử tiếp theo 
		
	L1:
		mov ax, [bx] ; ax = a[i]
		cmp ax, min_value ; So sánh a[i] với a[i++]
		jge L2   
		mov _min_index, dx 
		
	L2:
		add bx, 2 
		inc dx 
		loop L1 
		
		ret
@VTNN$qv ENDP
	END
