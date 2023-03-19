package com.bs.practice.student.controller;

import com.bs.practice.student.model.vo.Student;

public class StudentController {

	Student sArr[] = new Student[5];
	public int CUT_LINE = 60;

	public StudentController() {
		sArr[0] = new Student("김길동", "자바", 100);
		sArr[1] = new Student("박길동", "디비", 50);
		sArr[2] = new Student("이길동", "화면", 85);
		sArr[3] = new Student("정길동", "서버", 60);
		sArr[4] = new Student("홍길동", "자바", 20);
	}

	public Student[] printStudent() {
		return sArr;
	}

	public int sumScore() {
		int total = 0;

		for (int i = 0; i < 5; i++) {
			total += sArr[i].getScore();
		}
		return total;
	}

	public double[] avgScore() {
		double avg[] = new double[2];
		
		avg[0]=sumScore();
		avg[1]=sumScore()/5;
		
		return avg;
	}
	
	
	
	

}
