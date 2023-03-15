package bs.student.view;

import java.util.Scanner;

import bs.student.controller.StudentController;
import bs.studnet.dto.Student;

//사용자에게 보여주는 화면을 제공하는 역할을 하는 클래스
public class MainView {
//	private StudentController s=new StudentController();//양쪽에서 서로 호출하고 있어서 무한루프
	private static MainView mainview;
	public static MainView getMainView() {
		if(mainview==null) mainview=new MainView();
		return mainview;
	}
	private MainView() {}
	// 주 메뉴화면을 출력해주는 기능

	public void mainMenu() {
		Scanner sc = new Scanner(System.in);
		StudentController s=StudentController.getStudentController();
		while (true) {
			System.out.println("====== 학생관리 프로그램 ======");
			System.out.println("1. 학생 등록");
			System.out.println("2. 학생 수정(학년, 전공, 주소)");
			System.out.println("3. 학생 삭제");
			System.out.println("4. 전체 조회");
			System.out.println("5. 이름으로 조회");
			System.out.println("0. 프로그램 종료");
			System.out.print("메뉴 선택 : ");
			int menu = sc.nextInt();

			switch (menu) {
			case 1:
				s.insertStudent();
				break;
			case 2:
				s.updateStudent();
				break;
			case 3:
				System.out.println("학생 삭제 개발중....");
				break;
			case 4:
				s.searchAll();
				break;
			case 5:
				s.searchByName();
				break;
			case 0:
				System.out.println("프로그램을 종료합니다.");
				return;
			}
		}
	}

	public Student insertStudentView() {
		// 필요한 학생정보를 입력받는 화면을 출력해주는 기능
		Scanner sc = new Scanner(System.in);
		System.out.println("====== 학생등록 화면 ======");
		System.out.print("학생 이름 : ");
		String name = sc.nextLine();
//		System.out.print("학생 번호 : ");
//		String studentNo = sc.nextLine();
		System.out.print("학년 : ");
		int grade = sc.nextInt();
		sc.nextLine();
		System.out.print("전공 : ");
		String major = sc.nextLine();
		System.out.print("주소 : ");
		String address = sc.nextLine();
		System.out.print("성별(남/여) : ");
		char gender = sc.next().charAt(0);
		
		Student s=new Student(name,major,grade,address,gender);
		return s;				
	}	

	public void printMsg(String msg) {
		System.out.println("===== 시스템 메시지 =====");
		System.out.println(msg);
		System.out.println("=====================");		
	}
	
	public void printStudent(String infoStudent) {
		System.out.println("==== 저장된 학생정보 ====");
		System.out.println(infoStudent);
		System.out.println("====================");
	}
	
	//이름을 입력받고 반환해주는 메소드
	public String inputName() {
		
		Scanner sc=new Scanner(System.in);	
		System.out.println("====== 검색할 이름 =======");
		System.out.print("입력 : \n");
		return sc.nextLine();			
	}
	
	public Student updateStudentView() {
		Scanner sc=new Scanner(System.in);
		Student s=new Student();
		System.out.println("====== 학생 정보 수정 ======");
		System.out.print("수정할 학생 학번 : ");
		String studentNo=sc.nextLine();
		s.setStudentNo(studentNo);
		System.out.print("수정할 학생 학년 : ");
		int grade=sc.nextInt();	
		s.setGrade(grade);
		System.out.print("수정할 전공 : ");
		sc.nextLine();
		String major=sc.nextLine();
		s.setMajor(major);
		System.out.print("수정할 주소 : ");
		String address=sc.nextLine();		
		s.setAddress(address);
		return s;
	}
	
	
}
