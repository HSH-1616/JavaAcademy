package com.bs.practice.student.view;

import com.bs.practice.student.controller.StudentController;

public class StudentMenu {

	public StudentMenu() {

		StudentController ssm = new StudentController();

		System.out.println("========= 학생 정보 출력 =========");
		for (int i = 0; i < 5; i++) {
			System.out.println(ssm.printStudent()[i].inform());
		}

		System.out.println("========= 학생 성적 출력 =========");
		System.out.println("학생 점수 합계 : " + ssm.avgScore()[0]);
		System.out.println("학생 점수 평균 : " + ssm.avgScore()[1]);

		System.out.println("========= 성적 결과 출력 =========");
		String result = "";

		for (int i = 0; i < 5; i++) {

			if (ssm.printStudent()[i].getScore() >= ssm.CUT_LINE) {
				System.out.println(ssm.printStudent()[i].getName() + "학생은 통과 입니다.");
			} else {
				System.out.println(ssm.printStudent()[i].getName() + "학생은 재시험 대상 입니다.");
			}

		}
	}

}
