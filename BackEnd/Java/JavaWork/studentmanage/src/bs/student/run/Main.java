package bs.student.run;

import bs.student.controller.StudentController;

public class Main {

	public static void main(String[] args) {
		//프로그램일 시작하는 클래스
		StudentController.getStudentController()
		.startProgram();
		
	}

}
