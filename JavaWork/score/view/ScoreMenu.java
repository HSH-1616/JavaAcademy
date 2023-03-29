package com.bs.practice.score.view;

import java.io.DataInputStream;
import java.io.EOFException;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;

import com.bs.practice.controller.ScoreController;

public class ScoreMenu {
	private Scanner sc = new Scanner(System.in);
	private ScoreController scr = new ScoreController();
	
	// 메인메뉴 출력
	public void mainMenu() {
		while(true) {
			System.out.println("1. 성적 저장");
			System.out.println("2. 성적 출력");
			System.out.println("9. 끝내기");
			System.out.print("입력 : ");
			int choice = sc.nextInt();
			
			switch(choice) {
				case 1 : saveScore(); break;
				case 2 : readScore(); break;
				case 9 : System.out.println("프로그램을 종료합니다."); return;
				default : System.out.println("====== 잘못 입력하셨습니다. 다시 입력해주세요. ======");
			}
		}
	}
	
	// 학생 점수 저장
	public void saveScore() {
		int num = 0;
		char choice = ' ';
		
		while(true) {
			System.out.println(++num + "번째 학생 정보 기록");
			System.out.print("이름 : ");
			String name = sc.next();
			System.out.print("국어 점수 : ");
			int kor = sc.nextInt();
			System.out.print("영어 점수 : ");
			int eng = sc.nextInt();
			System.out.print("수학 점수 : ");
			int math = sc.nextInt();
			
			int sum = kor + eng + math;
			double avg = sum / 3;
			
			scr.saveScore(name, kor, eng, math, sum, avg);
			
			System.out.print("그만입력하시려면 N 또는 n 입력, 계속 하시려면 아무 키나 눌러주세요 : ");
			choice = sc.next().charAt(0);
			
			if(choice == 'N' || choice == 'n') {
				return;
			}
		}
	}
	
	// 학생 점수 불러오기
	public void readScore() {
		int count = 0;
		int sumAll = 0;
		double avgAll = 0.0;
		
		
		System.out.println("이름\t국어\t영어\t수학\t총점\t평균");
		try(DataInputStream dis = scr.readScore();
			FileReader fr = new FileReader("./Score")) {
			int data = fr.read();
	
			while(data != -1) {
				String name = dis.readUTF();
				int kor = dis.readInt();
				int eng = dis.readInt();
				int math = dis.readInt();
				int sum = dis.readInt();
				double avg = dis.readDouble();
				
				sumAll += sum;
				avgAll += avg;
				
				count++;
				
				System.out.println(name + "\t" + kor + "\t" + eng + "\t" + math + "\t" + sum + "\t" + avg);
			}
		} catch(EOFException e) {
			System.out.println("읽은 횟수 : " + count + " 전체합계 : " + sumAll + " 전체평균 : " + avgAll);
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
}
