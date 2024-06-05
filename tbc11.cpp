#include <iostream.h>
#include <conio.h>

int flag = 0;
extern int AVG(int i1, int i2);
void main(void) {
	char tl;
	L1:
		int so1, so2;
		clrscr();
		cout << "\nLIEN KET VOI NGON NGU BAC CAO(C++)";
		cout << "\n----------------------------------";
		cout << "\n\nBai 3: Trung binh cong hai so nguyen";
		cout << "\n* Module C++: ";
		cout << "\n - Nhan gia tri so thu 1 va so thu 2.";
		cout << "\n - Goi ham tinh trung binh cong do Assembly viet va hien ket qua.";
		cout << "\n* Module C++: Viet ham tinh trung binh cong.";
		cout << "\n\n----------------------------------";
		cout << "\nCach 2: Ham Assembly co hai doi (gia tri so1, so2 \nla tham so thuc - cat vao stack, con flag khai bao bien toan cuc).";
		cout << "\n\n---------- CHUONG TRINH ----------";
		cout << "\nHay vao so thu 1: "; cin >> so1;
		cout << "Hay vao so thu 2: "; cin >> so2;
		cout << "Trung binh cong hai so nguyen la: " << AVG(so1, so2) + 0.5 * flag;
		cout << "\n----------------------------------";
	cout << "\nCo tiep tuc chuong trinh khong(c/k)?";
	tl = getch();
	if (tl == 'c') {
		goto L1;
	}
}