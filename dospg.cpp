#include <iostream.h>
#include <conio.h>

extern COM();
extern CARD();
extern OMEM();
extern DMA();
extern kRAM();
extern JOYS();
extern FPU();
extern Exit();
void main(void) {
	char tl;
	int cn;
	clrscr();
	cout << "\n\tTRUONG DAI HOC MO HA NOI";
	cout << "\n\tKHOA CONG NGHE THONG TIN";
	cout << "\n\t-----------***----------";
	cout << "\n\n\tBAI THUC HANH MON LTHT";
	cout << "\n\n\tSinh vien thuc hien: ";
	cout << "\n\tDang Van Cong - 2010A02";
	cout << "\n\n\t-------------------------";
	cout << "\n\tCo tiep tuc chuong trinh khong(c/k)?";
	tl = getch();
	if (tl == 'c') {
		do {
			
		PS:
			clrscr();
			cout << "\n\t\tCAC BAI TAP";
			cout << "\n\t-------------------------";
			cout << "\n\t1. So luong cong COM va dia chi?";
			cout << "\n\t2. So luong cong LPT va dia chi?";
			cout << "\n\t3. Lieu may tinh co FPU khong?";
			cout << "\n\t4. So luong o mem?";
			cout << "\n\t5. May tinh co kRAM tren mainboad khong?";
			cout << "\n\t6. Lieu may tinh co cong may in noi tiep?";
			cout << "\n\t7. May tinh co cong joystick(can dieu khien) khong?";
			cout << "\n\t8. May tinh co DMA khong?";
			cout << "\n\t9. Loai card dieu khien man hinh.";
			cout << "\n\t99. Thoat chuong trinh.";
			cout << "\n\t-------------------------";
			cout << "\n\tLua chon cua ban: "; cin >> cn;
			switch(cn) {
				case 1: 
					COM();
					break;
				case 2:
					cout << "Chuong trinh duoc dich o mot file khac!!!";
					cout << "\n(Gioi han file dich la 9 file).";
					break;
				case 3:
					FPU();
					break;
				case 4:
					OMEM();
					break;
				case 5:
					kRAM();
					break;
				case 6:
					cout << "Chuong trinh duoc dich o mot file khac!!!";
					cout << "\n(Gioi han file dich la 9 file).";
					break;
				case 7:
					JOYS();
					break;
				case 8:
					DMA();
					break;
				case 9:
					CARD();
					break;
				case 99:
					Exit();
					break;
				default:
					cout << "\nLua chon khong dung!!!";
			}
		} while (cn != 0);
		cout << "\nCo thuc hien chuc nang khac (c/k)?";
		tl = getch();
		if (tl == 'c') {
			goto PS;
		}
	}
}