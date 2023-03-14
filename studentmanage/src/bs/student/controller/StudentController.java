package bs.student.controller;

import bs.student.dao.StudentDao;
import bs.student.view.MainView;
import bs.studnet.dto.Student;

public class StudentController {
	
	private StudentDao dao=new StudentDao();
	
	//프로그램을 시작하는 기능	
	public void startProgram() {
		new MainView().mainMenu();		
	}
	
	public void insertStudent() {
		//학생을 등록하는 서비스
		//1. 사용자로부터 저장할 학생에 대한 정보를 입력받는다.
		Student s=new MainView().insertStudentView();
		//2. studentDao에 받은 학생을 저장하기
		//boolean result=new StudentDao().insertStudent(s);
		boolean result=dao.insertStudent(s);
		//3. 입력한 결과에 따라 사용자한테 메세지를 출력
		String msg=result?"학생등록 성공 :)":"학생등록 실패 :(";
		new MainView().printMsg(msg);		
	}
	
	public void searchAll() {
		//전체 학생을 조회하는 서비스
		//1. StudentDao에 저장된 학생정보를 가져오기
		//   s1,s2,s3,s4에 저장된 정보를 가져오는 것
		String infoStudent=dao.infoStudentAll();
		//2. 가져온 정보를 화면에 출력해준다.
		String data;
		if(infoStudent.equals("")) {
			data="저장된 학생이 없습니다";
		}else {
			data=infoStudent;		
		}
		new MainView().printStudent(data);
		//new MainView().printStudent(infoStudent.equals("")?"저장된 학생이 없습니다.":infoStudent);
	}
	

}
