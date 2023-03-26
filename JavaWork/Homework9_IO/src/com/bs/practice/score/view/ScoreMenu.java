package com.bs.practice.score.view;

import java.io.DataInputStream;
import java.io.EOFException;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Scanner;

import com.bs.practice.score.controller.ScoreController;

public class ScoreMenu {
	Scanner sc = new Scanner(System.in);
	ScoreController scr = new ScoreController();

	public void mainMenu() {
		int menuNum = 0;

		while (menuNum != 9) {
			System.out.println("1. 성적 저장\n2. 성적 출력\n9. 끝내기");
			System.out.print("메뉴 번호 : ");
			menuNum = sc.nextInt();

			switch (menuNum) {
			case 1:
				saveScore();
				break;
			case 2:
				readScore();
				break;

			case 9:
				System.out.println("프로그램을 종료합니다.");
			default:
				System.out.println("잘못 입력하셨습니다. 다시 입력해주세요.");
			}
		}
	}

	public void saveScore() {
		int num = 0;
		char yn = ' ';
		while (yn != 'N') {
			System.out.println(++num + "번째 학생 정보 기록");
			System.out.print("이름 : ");
			String name = sc.next();
			System.out.print("국어 점수 : ");
			int kor = sc.nextInt();
			System.out.print("영어 점수 : ");
			int eng = sc.nextInt();
			System.out.print("수학 점수 : ");
			int math = sc.nextInt();
			System.out.print("그만 입력하시려면 N 또는 n 입력, 계속 하시려면 아무 키나 입력하세요 : ");
			yn = sc.next().charAt(0);
			Character.toUpperCase(yn);
			int sum = (kor + eng + math);
			double avg = (kor + eng + math / 3);
			scr.saveScore(name, kor, eng, math, sum, avg);
		}
	}

	public void readScore() {
		DataInputStream dis = null;
		int count = 0;
		int sumAll = 0;
		double avgAll = 0.0;
		try {
			dis = scr.readScore();
			for (int i = 0; i < 5; i++) {
				System.out.println(dis.readUTF(dis));
				System.out.println(dis.readInt());
				System.out.println(dis.readInt());
				System.out.println(dis.readInt());
				System.out.println(dis.readInt());
				System.out.println(dis.readDouble());
				count++;
			}
		} catch (EOFException e) {
			System.out.println("읽은 횟수 " + count);
		} catch (FileNotFoundException e) {

		} catch (IOException e) {

		}
	}

}
