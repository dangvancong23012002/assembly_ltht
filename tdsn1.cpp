#include <iostream.h>
#include <conio.h>

int n, a[100];
extern int SUM();
void main(void) {
	clrscr();
	cout << "\nHay vao so luong thanh phan: "; cin >> n;
	for (int i = 0; i < n; i++) {
		cout << "\na[" << i << "]=";
		cin >> a[i];
	}
	cout << "\nTong day so nguyen la: " << SUM();
	getch();
}