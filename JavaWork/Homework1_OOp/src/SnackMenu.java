import java.util.Scanner;

public class SnackMenu {
	SnackController Sc = new SnackController();
	Snack s = new Snack();

	public void menu() {
		Scanner sc = new Scanner(System.in);
		System.out.println("스낵류를 입력하세요.");
		System.out.print("종류 : ");
		String kind = sc.next();
		System.out.print("이름 : ");
		String name = sc.next();
		System.out.print("맛 : ");
		String flavor = sc.next();
		System.out.print("개수 : ");
		int numOf = sc.nextInt();
		System.out.print("가격 : ");
		int price = sc.nextInt();
		
		Snack s = new Snack("빵","케이크","블루베리",1,15000);
		System.out.println(s.information());
	
		System.out.println(Sc.saveData(kind, name, flavor, numOf, price));
		System.out.print("저장한 정보를 확인하시겠습니까?(y/n) : ");
		char info = sc.next().charAt(0);
		if (info == 'y')
			System.out.println(Sc.confirmData());

	}

	

}
