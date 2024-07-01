INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
	m1 db 13, 10, 'May tinh co cong FPU khong? $ '
	co db 'Co $'
	khong db 'Khong $'
.CODE
	PUBLIC @FPU$qv
@FPU$qv PROC
		mov ax, @data
		mov ds, ax 
	L_CT0:
		CLRSCR
		HienString m1 
		int 11h
		and al, 00000010b; tách 2 bit về số lượng kRAM 
		jnz L1 ; Không bằng thì nhảy
		HienString khong
		jmp Exit
	
	L1:
		HienString co
	
	Exit:
		mov ah, 4ch
		int 21h
@FPU$qv ENDP
	END