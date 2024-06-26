.MODEL small
.CODE
	PUBLIC @Exit$qv
@Exit$qv PROC
	mov ah, 4ch
	int 21h
	ret
@Exit$qv ENDP
	END