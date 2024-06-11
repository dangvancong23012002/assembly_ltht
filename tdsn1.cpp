#include <iostream.h>
#include <conio.h>

int n, a[100];
extern int SUM();
extern int SUM_NEG();
void main(void) {
	char tl;
	L1:
		clrscr();
		cout << "\nLIEN KET VOI NGON NGU BAC CAO (C++)";
		cout << "\n-----------------------------------";
		cout << "\n\nBai 4: Tinh tong mot day so nguyen";
		cout << "\nPhan cong nhiem vu: ";
		cout << "\n* Ngon ngu C++: ";
		cout << "\n - Nhan so luong thanh phan n.";
		cout << "\n - Nhan cac so cua day so dua vao mot mang.";
		cout << "\n - Goi chuong trinh con tinh tong cac thanh phan cua mang so Assembly viet";
		cout << "\n - Hien ket qua len man hinh.";
		cout << "\n* Ngon ngu Assembly: ";
		cout << "\n - Chuong trinh con tinh tong cac thanh phan cua mang.";
		cout << "\n\n-----------------------------------";
		cout << "\n\n------------------ CHUONG TRINH -----------------";
		cout << "\nHay vao so luong thanh phan: "; cin >> n;
		for (int i = 0; i < n; i++) {
			cout << "a[" << i << "]=";
			cin >> a[i];
		}
		cout << "Tong day so nguyen la: " << SUM();
		cout << "\nTong cac thanh phan am cua day so nguyen la: " << SUM_NEG();
		cout << "\n-----------------------------------";
	cout << "\nCo tiep tuc chuong trinh (c/k) khong?";
	tl = getch();
	if (tl == 'c') {
		goto L1;
	}
}