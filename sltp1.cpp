#include <iostream.h>
#include <conio.h>

int n, a[100];
extern int SLTP();
void main() {
	char tl;
	L1:
		clrscr();
		cout << "\nLIEN KET VOI NGON NGU BAC CAO (c++)";
		cout << "\n-----------------------------------";
		cout << "\n\nBai tap: Viet chuong trinh tim so luong thanh phan cua day so \nnguyen co gia tri nam trong khoang [-100; 100]";
		cout << "\n* Module C++:";
		cout << "\n - Nhan so luong thanh phan.";
		cout << "\n - Nhan cac so cua day so nguyen va dua vao mot mang.";
		cout << "\n - Goi ham tim so luong thanh phan cua day so co gia tri nam \ntrong khoang [-100; 100] do Assembly viet.";
		cout << "\n - Hien ket qua.";
		cout << "\n* Module Assembly: ";
		cout << "\nViet ham tinh so luong thanh phan cua day so nguyen ";
		cout << "\nco gia tri nam trong khoang [-100; 100].";
		cout << "\n\n------------------------------------";
		cout << "\nCach 1: Ham Assembly khong co doi. Gia tri n (so luong thanh phan ";
		cout << "\ncua mang) va dia chi thanh phan dau tien cua mang trao doi giua hai module ";
		cout << "\thong qua khai bao bien toan cuc ";
		cout << "\n(khai bao PUBLIC va EXTERNAL).";
		cout << "\n\n----------- CHUUONG TRINH ----------";
		cout << "\nHay vao so luong thanh phan: "; cin >> n;
		for (int i = 0; i < n; i++) {
			cout << "a[" << i << "]=";
			cin >> a[i];
		}
		cout << "So luong thanh phan nam trong khoang [-100; 100] la: " << SLTP();
		cout << "\n-----------------------------------";
	cout << "\nCo tiep tuc chuong trinh khong (c/k)?";
	tl = getch();
	if (tl == 'c') {
		goto L1;
	}	
}