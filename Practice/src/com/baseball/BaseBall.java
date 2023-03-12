package com.baseball;

import java.util.Random;
import java.util.Scanner;
//dd
public class BaseBall {
	public static void main(String[] args) {
//		1. 야구게임
//		- 랜덤으로 세개의 수를 각 자리 수에 저장 * 정답값
//		- 사용자가 임의의 수 3개를 입력받음
//		- 정답값이랑 비교하여 
//		   사용자가 입력한 숫자가 정답과 자리수와 숫자가 일치하면 -> 스트라이크,
//		   사용자가 입력한 숫자가 정답과 일치하고 자리수가 맞지 않으면 -> 볼,
//		   사용자가 입력한 숫자가 일치한게 하나도 없으면 -> 파울으로 처리
//
//		- 정답을 맞출때까지 입력이 반복되야함.
//
//		예 ) ==== 야구게임시작 ==== 
//		     답 : 345
//		     입력 : 311 -> 1 스트라이크
//		     입력 : 354 -> 1스트라이크 2볼
//		     입력 : 344 -> 2스트라이크
//		     입력 : 534 -> 3볼
//		     입력 : 890 -> 파울
//		     입력 : 345 -> 3스크라이크 정답
//		     게임한판 더?  
//		- 정답을 맞추면 게임을 더 할지 확인후 계속진행은 위 로직 반복
//		  그만하면 프로그램종료
		Scanner sc = new Scanner(System.in);

		int answer[] = new int[3];
		int user[] = new int[3];
		int strike = 0;
		int ball = 0;
		int foul = 0;
		int foul1 = 0;
		char reGame = '0';
		boolean win = false;
		
		
		for (int i = 0; i < 3; i++) {
			answer[i] = (int) (Math.random() * 9 + 1);// 1~9까지 랜덤수를 answer에 저장
			for (int j = 0; j < i; j++) {
				if (answer[i] == answer[j]) {// answer[i]와 answer[j]가 같으면 i가 전배열로 이동해서 다시 저장
					i--;
					break;
				}
			}
		}
		System.out.print("==== 야구게임 시작 ====\n답 : ");
		for (int i = 0; i < 3; i++) {
			System.out.print(answer[i]);
		}

		while (win != true) {

			System.out.println();
			for (int i = 0; i < 3; i++) {
				System.out.print("입력 : ");
				user[i] = sc.nextInt();
				for (int j = 0; j < i; j++) {
					if (user[i] == user[j]) {
						System.out.println("중복입니다.");
						i--;
					}
				}
			}

			for (int i = 0; i < 3; i++) {
				for (int j = 0; j < 3; j++) {
					if (i == j && answer[i] == user[j]) {
						strike++;
					} else if (i != j && answer[i] == user[j]) {
						ball++;
					} else if (i == j && answer[i] != user[j]) {
						foul++;
						foul1 = foul - ball;
					}
				}
			}
			System.out.println("스트라이크 : " + strike + " 볼 : " + ball + " 파울 : " + foul1);
			if (strike == 3) {
				win = true;
				System.out.println("정답!\n");
				System.out.print("계속하시겠습니까?(Y/N)\n입력 : ");
				reGame = sc.next().charAt(0);
				System.out.println();
				if (reGame == 'Y') {
					win = false;

					for (int i = 0; i < 3; i++) {
						answer[i] = (int) (Math.random() * 9 + 1);// 1~9까지 랜덤수를 answer에 저장
						for (int j = 0; j < i; j++) {
							if (answer[i] == answer[j]) {// answer[i]와 answer[j]가 같으면 i가 전배열로 이동해서 다시 저장
								i--;
								break;
							}
						}
					}
					System.out.print("==== 야구게임 시작 ====\n답 : ");
					for (int i = 0; i < 3; i++) {
						System.out.print(answer[i]);
					}
				} else if (reGame == 'N') {
					System.out.println("종료합니다.");
				}
			}
			strike = 0;
			ball = 0;
			foul = 0;
			foul1 = 0;

		}
	}
}
