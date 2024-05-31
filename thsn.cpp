#include <iostream.h>
#include <conio.h>

int so1, so2;
void main() {
	char tl;
	L1:
		cout << "\nHay vao so thu 1: "; cin >> so1;
		cout << "\nHay vao so thu 2: "; cin >> so2;
		asm {
			mov ax, so1
			mov bx, so2 
			add ax, bx
			mov so1, ax 
		}
	cout << "\nTong hai so nguyen la: " << so1;
	cout << "\nCo tiep tuc (c/k)?";
	tl = getch();
	if (tl == 'c') {
		goto L1;
	}
}