package bs.student.run;

import bs.student.controller.StudentController;
import bs.student.dao.StudentDao;
import bs.student.view.MainView;
import bs.studnet.dto.Student;

public class Main {
	public static void main(String[] args) {
		// 프로그램을 시작하는 클래스
		
		new StudentController().startProgram();
	}
	
	
}
