#include <iostream.h>
#include <conio.h>

int n, a[100];
extern int SLTP();
void main() {
	char tl;
	L1:
		clrscr();
		cout << "\nHay vao so luong thanh phan: "; cin >> n;
		for (int i = 0; i < n; i++) {
			cout << "\na[" << i << "]=";
			cin >> a[i];
		}
		cout << "\nSo luong thanh phan nam trong khoang [-100; 100] la: " << SLTP();
	cout << "\nCo tiep tuc chuong trinh khong (c/k)?";
	tl = getch();
	if (tl == 'c') {
		goto L1;
	}	
}