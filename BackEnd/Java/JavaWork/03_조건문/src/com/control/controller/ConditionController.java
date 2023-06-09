package com.control.controller;
import java.util.Scanner;

public class ConditionController {

	public void ifTest() {
		// 기본 if문 활용하기
		// if(조건식(true || false)) { 조건식의 결과가 true일때 실행할 명령어}
		// if문의 {}안에 변수선언, 연산자, 메소드 호출, 조건문, 반복문을 사용할수 있다.
		if (100 > 10) {
			System.out.println("10은 100보다 크다");
		}

		System.out.println("if중괄호 밖에 있는 로직은???");

		// 특정수를 입력받아 200을 입력하면 200을 입력했군요! 출력하기
		Scanner sc = new Scanner(System.in);
		System.out.print("정수입력 : ");
		int num = sc.nextInt();

		if (num == 200) {
			System.out.println("200을 입력했군요!");
			int su = 100;// if 내부문끼리는 사용 가능
		}

		// 입력받은 정수가 100~200사이면 정상데이터를 입력했습니다 출력
		if (100 <= num && num <= 200) {
			System.out.println("정상데이터를 입력했습니다.");
		}

		// if문의 중괄호에서 선언된 변수활용하기
		// 1. if문 외부에 선언된 변수 활용 -> if문에서 활용이 가능, if 외부에서도 사용가능.
		// 2. if문 내부에 선언된 변수 활용 -> if문에서 활용이 가능, if 외부에서 활용이 불가능
		String outterData = "if문 외부선언 데이터";
		if (10 > 0) {
			String innerData = "if문 내부선언 데이터";
			System.out.println(outterData);
			System.out.println(innerData);
			outterData += " if문에서 추가한 내용";
			int su = 100;// if 내부문끼리는 사용 가능
			// 외부에 선언된 변수와 동일한 명칭을 사용할 수 없다.
			// int outterData=20;
		}
		// System.out.println(innerData);=if문 내부에 선언된 변수는 외부에서 활용 불가능
		System.out.println(outterData);

	}

	public void checkNumber() {
		// 입력받은 값이 5의 배수인지 확인하는 기능 구현
		// 입력값이 5의 배수이면 5의 배수입니다. 출력
		Scanner sc = new Scanner(System.in);
		System.out.print("정수입력 : ");
		int num = sc.nextInt();

		if (num % 5 == 0) {
			System.out.println("5의 배수입니다.");
		}

	}

	public void testName() {
		// 이름을 입력받고 본인이름과 같으면 코딩천재!! 문구를 출력하기
		Scanner sc = new Scanner(System.in);
		System.out.print("이름 : ");
		String name = sc.next();

		if (name.equals("허성현")) {
			System.out.println("코딩천재!!");
		}

	}

	public void loginCheck() {
		// 아이디와 패스워드를 입력받고 아이디가admin, 패스워드가 8888이면 로그인 성공출력
		Scanner sc = new Scanner(System.in);
		System.out.print("ID : ");
		String id = sc.next();
		System.out.print("PW : ");
		int pw = sc.nextInt();

		if (id.equals("admin") && pw == 8888) {
			System.out.println("로그인 성공");
		}

	}

	public void ifelseTest() {
		// if~else문 이용하기 * 삼항연산자처리와 비슷
		// 조건에 따라 반드시 한개 로직이 실행되는 구문을 작성할때
		// if절이나 else절에 있는 구문이 반드시 실행
		// 특정수를 입력받아 그 수가 양수인지 음수인지 확인해주는 로직
		Scanner sc = new Scanner(System.in);
		System.out.print("수입력 : ");
		int su = sc.nextInt();

		if (su > 0) {
			System.out.println("양수입니다.");
		} else {
			System.out.println("음수입니다.");
		}
		// else 구문은 단독으로 사용할수 없다.
		// if~else문은 한개 그룹이다.

	}

	public void oddeven() {
		// 수를 입력받고 그 수가 짝수인지 홀수인지 확인해주는 기능 만들어보기
		Scanner sc = new Scanner(System.in);
		System.out.print("정수입력 : ");
		int su = sc.nextInt();

		if (su % 2 == 0) {
			System.out.println("짝수");
		} else {
			System.out.println("홀수");
		}

	}

	public void enrollMember() {
		// 미성년이면 회원가입이 불가능하고, 성년이면 회원가입 정보를 입력받는 기능구현
		// 회원정보 이름, 나이, 성별, 키를 입력받고 출력
		// 미성년인경우 회원가입이 불가능합니다. 출력
		Scanner sc = new Scanner(System.in);
		System.out.print("나이를 입력하세요 : ");
		int age = sc.nextInt();

		if (age >= 20) {
			System.out.println("회원정보를 입력해 주세요");
			System.out.print("이름 : ");
			String name = sc.next();
			System.out.print("성별(남/녀) : ");
			char gender = sc.next().charAt(0);
			System.out.print("키 : ");
			int height = sc.nextInt();
			System.out.println("입력한 회원정보" + "\n" + "이름 : " + name + "\n" + "나이 : " + age + "\n" + "성별 : " + gender + "자"
					+ "\n" + "키 : " + height);
		} else {
			System.out.println("회원가입이 불가능합니다.");
		}

	}

	public void ifelseifTest() {
		// if~else if~else if..... ~ [else]문 활용하기
		// 조건이 여러개일때 사용하는 조건문
		// if문과 한개 그룹으로 그룹으로 묶임.
		// 월을 입력받아 계절을 확인해주는 기능을 구현
		Scanner sc = new Scanner(System.in);
		System.out.print("계절을 확인할 달 : ");
		int month = sc.nextInt();
		// 1,2,12월이면 -> 겨울
		// 3~5월이면 -> 봄
		// 6~8월이면 -> 여름
		// 9~11월이면 -> 가을
		if (month == 1 || month == 2 || month == 12) {
			System.out.println("겨울");
		} else if (3 <= month && month <= 5) {
			System.out.println("봄");
		} else if (6 <= month && month <= 8) {
			System.out.println("여름");
		} else if (9 <= month && month <= 11) {
			System.out.println("가을");
		} else {
			System.out.println("없는 달을 입력했습니다. 1~12월까지 입력해주세요.");
		}

		// 성적등급 출력 프로그램 만들기
		// 점수를 입력받아 그 점수가 90점 이상이면 A
		// 90점 미만 80점 이상이면 B
		// 80점 미만 70점 이상이면 C
		// 70점 미만 60점 이상이면 D
		// 그외에는 F
		// 등급과 점수를 모두 출력하기
		// 00점은 0등급 입니다.
		System.out.print("점수 : ");
		int score = sc.nextInt();
		// 1
		if (score >= 90) {
			System.out.println(score + "점은" + " A등급 입니다.");
		} else if (score >= 80) {
			System.out.println(score + "점은" + " B등급 입니다.");
		} else if (score >= 70) {
			System.out.println(score + "점은" + " C등급 입니다.");
		} else if (score >= 60) {
			System.out.println(score + "점은" + " D등급 입니다.");
		} else {
			System.out.println(score + "점은" + " F등급 입니다.");

			// 2
			char result;
			if (score > 100) {
				result = 'X';
			} else if (score >= 90) {
				result = 'A';
			} else if (score >= 80) {
				result = 'B';
			} else if (score >= 70) {
				result = 'C';
			} else if (score >= 60) {
				result = 'D';
			} else {
				result = 'F';
			}
			if (result != 'X') {
				System.out.println(score + "점은 " + result + "등급 입니다.");
			} else {
				System.out.println("점수는 100~0사이에 값을 입력하세요");
			}

			// 메뉴선택 기능 구현하기
			// 술추천 기능
			// 1.맥주 -> 좋은맥주를 추천
			// 2.와인 -> 피노누아
			// 3.위스키 -> 발렌타인
			// 4.막걸리 -> 딸기 막걸리

			System.out.print(
					"====메뉴를 추천해드립니다.====" + "\n" + "1.맥주 " + "2.와인 " + "3.위스키 " + "4.막걸리" + "\n" + "번호를 입력해주세요. : ");
			int menu = sc.nextInt();

			if (menu == 1) {
				System.out.println("추천맥주 : 써머스비");
			} else if (menu == 2) {
				System.out.println("추천와인 : 피노누아");
			} else if (menu == 3) {
				System.out.println("추천위스키 : 발렌타인");
			} else if (menu == 4) {
				System.out.println("추천막걸리 : 딸기 막걸리");
			} else {
				System.out.println("잘못된 번호입니다. 다시 입력해주세요" + "\n" + "1.맥주 " + "2.와인" + "3.위스키" + "4.막걸리");
			}

		}

	}

	public void switchTest() {
		//switch문 활용하기
		//정해진 값에 대해서 분기처리할때
		//메뉴기능을 구현할때 많이 사용, 정해진 값을 매칭할때 사용
		//switch문의 ()안에는 변수, 변수의 연산결과를 작성
		//*** int, String, char 자료형만 가능 ***

		Scanner sc = new Scanner(System.in);
		System.out.println("=== 점심메뉴 ===");
		System.out.println("1. 중국집");
		System.out.println("2. 윤쉐프");
		System.out.println("3. 삼계탕");
		System.out.println("4. 육개장");
		System.out.print("선택 : ");
		int choice = sc.nextInt();
		switch (choice) {
		case 1:
			String name = "허성현";
			System.out.println(name + "구내식당 중 가장 맛있어요!");
			break;
		case 2:
			System.out.println("BYC건물 쌍용중국집이 먹을만해요!");
			break;
		case 3:
			System.out.println("BYC건물 가산삼계탕이 먹을만해요!");
			break;
		case 4:
			System.out.println("이화수육개장이 먹을만 해요!");
			break;
		default:
			System.out.println("메뉴는 1~4번까지만 있습니다.");
		}

		System.out.println("몇 월 : ");
		int month = sc.nextInt();
		switch (month) {
		case 1:
		case 2:
		case 12:
			System.out.println("겨울이네요!");
			break;
		case 3:
		case 4:
		case 5:
			System.out.println("봄이네요!");
			break;
		case 6:
		case 7:
		case 8:
			System.out.println("여름이네요!");
			break;
		case 9:
		case 10:
		case 11:
			System.out.println("가을이네요!");
			break;
		}

		// char형 이용하기
		System.out.println("=== BS중국집 ===");
		System.out.println("가. 짜장면");
		System.out.println("나. 짬뽕");
		System.out.println("다. 탕수육");
		char ch = sc.next().charAt(0);
		switch (ch) {
		case '가':
			System.out.println("짜장면 선택");
			break;
		case '나':
			System.out.println("짬뽕 선택");
			break;
		case '다':
			System.out.println("탕수육 선택");
			break;
		}
		// String이용하기
		System.out.println("=== 문자열 이용하기 ===");
		System.out.print("당신의 취미는(운동, 노래, 영화감상) : ");
		String hobby = sc.next();
		switch (hobby) {
			case "운동":
			System.out.println("운동을하면 건강해져요!");break;
			case "노래":
			System.out.println("노래 잘하나요?");break;
		}
		
		//switch(choice>10) {}
		//double height=180.5;
		//switch(height) {}
		
		switch(hobby.charAt(0)) {
		    case '운' : break;
		}
		switch(choice%5) {
		    case 0 :
		    case 1 :
		    case 2 :
		    case 3 :
		    case 4 :
		}
			
	}
	
	public void bunsikMenu() {
		//분식집 주문 프로그램 만들기
	    //떡볶이 (3000), 순대(2500), 튀김(3000), 김밥(3500), 라면(3500)
		//선택하면 주문한 메뉴 이름과 금액을 출력하는 기능
		//떡볶이 고르셨습니다... 3000원 입니다.
		//없는 것을 고르면 잘못 고르셨습니다. 숫자로 입력하세요
		Scanner sc=new Scanner(System.in);
		System.out.print("==== 분식집 메뉴 ===="+"\n"+"1.떡볶이 "+"2.순대 "+"3.튀김 "+"4.김밥 "+"5. 라면"+"\n"+"=== 메뉴를 번호로 선택해 주세요. ==="+"\n"+"메뉴선택 : ");
			int menu =sc.nextInt();
			switch(menu) {
				case 1 : System.out.println("떡볶이 고르셨습니다... 3000원 입니다.");break;
				case 2 : System.out.println("순대 고르셨습니다... 2500원 입니다.");break;
				case 3 : System.out.println("튀김 고르셨습니다... 3000원 입니다.");break;
				case 4 : System.out.println("김밥 고르셨습니다... 3500원 입니다.");break;
				case 5 : System.out.println("라면 고르셨습니다... 3500원 입니다.");break;
				default : System.out.println("잘못 고르셨습니다. 숫자로 입력하세요");
			}
			String food = "";
			int price=0;
			switch(menu) {
				case 1 : food="떡볶이";price=3000;break;
				case 2 : food="순대";price=2500;break;
				case 3 : food="튀김";price=3000;break;
				case 4 : food="김밥";price=3500;break;
				case 5 : food="라면";price=3500;break;
				default :food="없음";break;
			}
			System.out.println(food.equals("없음")?"선택된 메뉴가 없습니다.":"당신이 선택한 메뉴는 "+food+" 이고 결제한 금액은 "+price+"원 입니다.");
				
	}
	
//	public void studentMenu() {
//		System.out.println("==== 학생관리 프로그램 =====");
//		System.out.println("1. 학생 등록");
//		System.out.println("2. 학생 전체 조회");
//		System.out.println("3. 학생 이름으로 조회");
//		System.out.println("4. 학생 반으로 조회");
//		System.out.println("5. 학생 수정");
//		System.out.println("6. 학생 삭제");
//		System.out.println("0. 프로그램 종료");
//		System.out.println("메뉴선택 : ");
//		int cho=sc.nextInt();
//		switch(cho)
//			case 1 : new StudentManage().insertStudent();break;
//			case 2 : new StudentManage().searchAllStudent();break;
//			case 3 : new StudentManage().searchByNamaeStudent();break;
//			case 4 : new StudentManage().insertStudent();break;
//	}
	
	public void innerifTest() {
		//if문 내부에 if문을 사용할 수 있다.
		//성인인 사람만 주문을 할 수 있는 기능
		Scanner sc =new Scanner(System.in);
		System.out.print("당신의 나이는 : ");
		int age=sc.nextInt();
		if(age>19) {
			System.out.println("=== 메뉴 ===");
			System.out.println("1. 맥주");
			System.out.println("2. 와인");
			int cho=sc.nextInt();
			if(cho==1) {
				
			}else if(cho==2) {
				if(10>=10) {
					
				}
			}
			
		}else {
			
		}
		
	}
	
	public void ex_text() {
		//성인만 가입할수있는 회원가입 -> 미성년이면 회원가입 불가 합니다.
		//성인이면 내국인, 외국인 구분하고
		//내국인이면 회원가입으로 바로 이동 -> 이름, 주소를 저장 출력
		//외국인이면 외국인 등록번호여부를 확인하고 (있다,없다)
		//있으면 회원가입으로 이동 -> 이름, 주소를 저장 출력
		//없으면 회원가입이 불가능합니다. 출력
		//선택을 잘못한 경우 -> 잘못 누르셨습니다. 출력 후 종료
		Scanner sc=new Scanner(System.in);
		System.out.print("나이 : ");
		int age=sc.nextInt();
		if(age>19) {
			System.out.print("외국인 여부(Y/N) : ");
			char foreign=sc.next().charAt(0);
			if(foreign=='N') {
			System.out.println("==== 회원가입 ====");
			System.out.print("이름 : ");
			String name=sc.next();
			System.out.print("주소 : ");
			sc.nextLine();
			String adress=sc.nextLine();
			System.out.println("==== 회원가입 완료 ===="+"\n"+"이름 : "+name+" 주소 : "+adress);
			}else if(foreign=='Y') {
				System.out.print("외국인 등록번호 유무(Y/N) : ");
				char foreignNum=sc.next().charAt(0);
				if(foreignNum=='Y') {
					System.out.println("==== 회원가입 ====");
					System.out.print("이름 : ");
					String name=sc.next();
					System.out.print("주소 : ");
					sc.nextLine();
					String adress=sc.nextLine();
					System.out.println("==== 회원가입 완료 ===="+"\n"+"이름 : "+name+" 주소 : "+adress);
				}else if(foreignNum=='N'){
					System.out.println("회원가입이 불가능 합니다.");
				}else {
					System.out.println("잘못 누르셨습니다.");
				}	
			}else {
				System.out.println("잘못 누르셨습니다.");
			}						
		}else {
			System.out.println("회원가입이 불가능 합니다.");
		}
	}
	
	public void ex_text_switch() {
		
		
	}

	
}
