.MODEL large
.DATA
	EXTRN _n:word
.CODE
PUBLIC @GIAITHUA$qv
@GIAITHUA$qv PROC
	mov cx, _n 	; cx = n
	mov ax, 1 	; ax = 1
	cmp cx, 2 	; So sánh n <= 2 (tức n = 0 hoặc n = 1)
	jb L2 		; Nếu n < 0 thì nhaye đến L2 
	L1:
		mul cx 	; còn n >= 0 thì tiến hành vòng lặp tính n!
		loop L1
	L2:
		ret
@GIAITHUA$qv ENDP
END