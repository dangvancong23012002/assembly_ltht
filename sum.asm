INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
	m1 db 13, 10, '	Hay vao so luong thanh phan: $'
	tieptuc db 13, 10, '	Co tiep tuc chuong trinh khong(c/k)? $'
	slpt dw ?
	i dw ?
	a dw 100 dup(?)
.CODE
	PUBLIC @SUM_ARR$qv
@SUM_ARR$qv PROC
		mov ax, @data
		mov ds, ax 
		
	L_CT0:
		CLRSCR
		HienString m1
		call VAO_SO_N
		mov slpt, ax ; Cất giá trị số lượng thành phần vào biến sltp 
	
	CONTINUE:
		HienString tieptuc
		mov ah, 1
		int 21h
		cmp al, 'c'
		jne Exit
		jmp L_CT0

	Exit:
		mov ah, 4ch
		int 21h
	ret

INCLUDE lib2.asm 
@SUM_ARR$qv ENDP
	END 