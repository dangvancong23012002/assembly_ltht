#include <iostream.h>
#include <conio.h>

extern int AVG(int i1, int i2, int far * i3);
void main() {
	char tl;
	L1:
		int so1, so2, flag = 0;
		clrscr();
		cout << "\nLIEN KET VOI NGON NGU BAC CAO(C++)";
		cout << "\n----------------------------------";
		cout << "\n\nBai 3: Tinh trung binh cong hai so nguyen";
		cout << "\n* Module C++: ";
		cout << "\n - Nhan gia tri so thu 1 va 2.";
		cout << "\n - Goi ham tinh trung binh cong do Assembly viet va hien ket qua.";
		cout << "\n* Module Assembly: Viet ham tinh trung binh cong.";
		cout << "\n\n----------------------------------";
		cout << "\nCach 3: Ham Assembly co 3 doi (gia tri so1, so2, flag la tham so thuc - cat vao stack)";
		cout << "\n\n----------- CHUONG TRINH -------------";
		cout << "\nHay vao so 1: "; cin >> so1;
		cout << "Hay vao so 2: "; cin >> so2;
		cout << "Trung binh cong hai so nguyen la: " << AVG(so1, so2, &flag) + 0.5 * flag;
		cout << "\n--------------------------------------";
	cout << "\nCo tiep tuc chuong trinh(c/k)?";
	tl = getch();
	if (tl == 'c') {
		goto L1;
	}
}