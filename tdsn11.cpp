#include <iostream.h>
#include <conio.h>

extern int SUM(int i1, int far * i2);
extern int BIG(int i1, int far * i2);
void main(void) {
	char tl;
	L1:
		int n, a[100];
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
		cout << "\nCach 2: Ham Assembly co hai doi (n va dia chi a[0] la tham so thuc \ncua ham de vao stack";
		cout << "\n\n------------------ CHUONG TRINH -----------------";
		cout << "\nHay vao so luong thanh phan: "; cin >> n;
		for (int i = 0; i < n; i++) {
			cout << "a[" << i << "]="; cin >> a[i];
		}
		cout << "Tong cua day so nguyen la: " << SUM(n, a);
		cout << "\nSo lon nhat cua day so nguyen la: " << BIG(n, a);
		cout << "\n-----------------------------------";
	cout << "\nCo tiep tuc chuong trinh khong (c/k)?";
	tl = getch();
	if (tl == 'c') {
		goto L1;
	}
}
