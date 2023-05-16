package bs.student.controller;

import bs.student.common.StudentFilter;
import bs.student.dao.StudentDao2;
import bs.student.dto.Student;
import bs.student.view.MainView;

public class StudentController {
	//싱글톤패턴으로 객체 생성하기
	private static StudentController controller;

	private StudentController() {}
	
	public static StudentController getStudentController() {
		if(controller==null) controller=new StudentController();
		return controller;
	}
	
	
	//private StudentDao dao=new StudentDao();
	private MainView view=MainView.getMainView();
	//private static MainView mainview=new MainView();
	
	//프로그램을 시작하는 기능
	public void startProgram() {
		StudentDao2.getStudentDao().loadStudent();
		MainView.getMainView().mainMenu();
	}
	
	public void insertStudent() {
		//학생을 등록하는 서비스
		//1. 사용자로부터 저장할 학생에 대한 정보를 입력받는다.
		Student s=view.insertStudentView();
		//2. studentdao에 받은 학생을 저장하기
		//boolean result=new StudentDao().insertStudent(s);
		boolean result=
				StudentDao2.getStudentDao().insertStudent(s);
		//3. 입력한 결과에 따라 사용자에게 메세지를 출력
		String msg=result?"학생등록 성공 :)":"학생등록 실패 :(";
		view.printMsg(msg);
	}
	
	public void searchAll() {
		//전체 학생을 조회하는 서비스
		//1. StudentDao에 저장된 학생정보를 가져오기
		//   s1,s2,s3,s4에 저장된 정보를 가져오는것
		Student[] infoStudent=
				StudentDao2.getStudentDao().infoStudentAll();
		//2. 가져온 정보를 화면에 출력해준다.
//		String data;
//		if(infoStudent.equals("")) {
//			data="저장된 학생이 없습니다";
//		}else {
//			data=infoStudent;
//		}
		//view.printStudent(data);
		view.printStudent(infoStudent);
		//new MainView().printStudent
		//(infoStudent.equals("")?"저장된 학생이 없습니다":infoStudent);
	}
	
	public void searchByName() {
		//사용자가 입력한 이름을 기준으로 학생을 조회하는 서비스
		//1. 사용자가 이름을 입력할 수 있게 화면을 출력해줌
		String n=view.inputName();
		//2. 사용자가 입력한 이름을 가져와 저장소에 있는 데이터와 비교할 결과를 가져옴
		String r=StudentDao2.getStudentDao().searchByName(n);
		//3. 결과를 사용자에게 출력해줌.
		view.printStudent(r);
	}
	
	
	public void updateStudent() {
		//지정한 학생의 학년, 전공, 주소를 변경하는 서비스
		searchAll();
		//1. 사용자에게 수정할 학생, 수정할 학년, 수정할 전공, 수정할 주소를 입력받음
		Student s=view.updateStudentView();
		//2. 저장되 학생 중 수정할 학생을 찾아 s에 저장된 데이터로 수정
		boolean result=
				StudentDao2.getStudentDao().updateStudent(s);
		view.printMsg(result?s.getStudentNo()+" 학생수정완료 :)"
							:s.getStudentNo()+" 학생수정실패 :( ");
	}
	
	public void searchStudent() {
		int type=view.selectType();
		Object data=null;
		StudentFilter filter=null;
		switch(type) {
			//이름
			case 1 : data=view.inputData("이름");filter=(s,d)-> s.getName().contains((String)d);break;
			//전공
			case 2 : data=view.inputData("전공");filter=(s,d)-> s.getMajor().contains((String)d);break;
			//학년
			case 3 : data=view.inputData("학년");filter=(s,d)-> s.getGrade()==(int)d;break;
		}
		Student[] result=StudentDao2.getStudentDao().searchStudent(
				data,filter);
		
		view.printStudent(result);
	}
	
	public void saveStudent() {
	boolean result=StudentDao2.getStudentDao().saveStudent();
	view.printMsg(result?"저장완료하였습니다.":"저장실패하였습니다.");
	
	}
	
	public void loadStudent() {
		boolean result=StudentDao2.getStudentDao().loadStudent();
		view.printMsg(result?"불러오기 성공":"불러오기 싫패");
	}
	
	
}
