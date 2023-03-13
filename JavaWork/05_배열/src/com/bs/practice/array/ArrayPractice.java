package com.bs.practice.array;

import java.util.Arrays;
import java.util.Scanner;

public class ArrayPractice {
	Scanner sc = new Scanner(System.in);

	public void practice1() {

		int arr[] = new int[10];

		for (int i = 0; i < arr.length; i++) {
			arr[i] = i + 1;
		}
		for (int i = 0; i < arr.length; i++) {
			System.out.print(arr[i] + " ");
		}
		System.out.println();
	}

	public void practice2() {

		int arr[] = new int[10];

		for (int i = 0; i < arr.length; i++) {
			arr[i] = i + 1;
		}
		for (int i = arr.length - 1; i >= 0; i--) {
			System.out.print(arr[i] + " ");
		}
		System.out.println();
	}

	public void practice3() {

		System.out.print("양의 정수 : ");
		int num = sc.nextInt();

		int arr[] = new int[num];

		for (int i = 0; i < arr.length; i++) {
			arr[i] = i + 1;
		}

		for (int i = 0; i < arr.length; i++) {
			System.out.print(arr[i] + " ");
		}
	}

	public void practice4() {

		String fruit[] = { "사과", "귤", "포도", "복숭아", "참외" };
		System.out.println(fruit[1]);
	}

	public void practice5() {
		int count = 0;
		String chNum = "";

		System.out.print("문자열 : ");
		String str = sc.nextLine();
		System.out.print("문자 : ");
		char ch = sc.next().charAt(0);

		for (int i = 0; i < str.length(); i++) {
			String msg[] = { "str.charAt(i)" };
			if (str.charAt(i) == ch) {
				chNum += i + " ";
				count++;
			}
		}

		System.out.println(str + "에 " + ch + "가 존재하는 위치(인덱스) : " + chNum);
		System.out.println(ch + " 개수 : " + count);
	}

	public void practice6() {
		int num = 0;
		while (num > 7 || num < 1) {
			String day[] = { "월", "화", "수", "목", "금", "토", "일" };
			System.out.print("1 ~ 7 사이 숫자 입력 : ");
			num = sc.nextInt();
			if (num > 0 && num < 8) {
				System.out.println(day[num - 1]);
			} else if (num > 7 || num < 1) {
				System.out.println("잘못 입력하셨습니다.");
			}
		}
	}

	public void practice7() {
		int total = 0;
		System.out.print("정수 : ");
		int num = sc.nextInt();

		int arr[] = new int[num];
		for (int i = 0; i < num; i++) {
			System.out.print("배열 " + i + "번째 인덱스에 넣을 값 : ");
			int num1 = sc.nextInt();
			arr[i] = num1;
			total += num1;
		}
		for (int i = 0; i < num; i++) {
			System.out.print(arr[i] + " ");
		}
		System.out.println();
		System.out.println("총합 : " + total);
	}

	public void practice8() {
		int num = 0;

		while (num < 3 || num % 2 != 1) {
			System.out.print("정수 : ");
			num = sc.nextInt();
			if (num > 3 && num % 2 == 0) {
				System.out.println("홀수를 입력하세요.");
			}
			if (num < 3) {
				System.out.println("3이상의 수를 입력하세요.");
			}
		}
		int arr[] = new int[num];

		for (int i = 0; i < num / 2 + 0.5; i++) {
			arr[i] = i + 1;
			System.out.print(arr[i] + ", ");
		}
		for (int i = num - 1; i > num / 2 + 1.5; i--) {
			arr[i] = i - num / 2;
			System.out.print(arr[i] + ", ");
		}
		System.out.println(arr[0]);

	}

	public void practice9() {
		boolean good = false;
		String chicken[] = { "후라이드", "양념", "간장", "파닭", "한방", "마늘" };
		System.out.print("치킨 이름을 입력하세요 : ");
		String name = sc.next();
		for (int i = 0; i < chicken.length; i++) {
			if (chicken[i].equals(name)) {
				good = true;
			}
		}
		if (good == true) {
			System.out.println(name + "치킨 배달 가능");
		} else {
			System.out.println(name + "치킨은 없는 메뉴입니다.");
		}
	}

	public void practice10() {
		char arr[] = new char[14];
		char arr1[] = arr;

		System.out.print("주민등록번호(-포함) : ");
		String ssn = sc.next();
		for (int i = 0; i < arr1.length; i++) {
			arr1[i] = ssn.charAt(i);
		}

		for (int i = 0; i < 8; i++) {
			System.out.print(arr1[i]);
		}
		for (int i = 9; i < arr1.length; i++) {
			System.out.print('*');
		}
	}

	public void practice11() {
		int arr[] = new int[10];

		for (int i = 0; i < arr.length; i++) {
			int r = (int) (Math.random() * 10) + 1;
			arr[i] = r;
		}
		for (int i = 0; i < arr.length; i++) {
			System.out.print(arr[i] + " ");
		}
	}

	public void practice12() {
		int arr[] = new int[10];

		for (int i = 0; i < arr.length; i++) {
			int rand = (int) (Math.random() * 10) + 1;
			arr[i] += rand;
			System.out.print(arr[i] + " ");
		}

		int max = arr[0];
		int min = arr[0];

		for (int i = 0; i < arr.length; i++) {
			if (arr[i] > max) {
				max = arr[i];
			}
			if (arr[i] < min) {
				min = arr[i];
			}
		}
		System.out.println();
		System.out.println("최대값 : " + max);
		System.out.println("최소값 : " + min);
	}

	public void practice13() {
		int arr[] = new int[10];
		for (int i = 0; i < arr.length; i++) {
			arr[i] = ((int) (Math.random() * 10) + 1);
			for (int j = 0; j < i; j++) {
				if (arr[i] == arr[j]) {
					i--;
				}
			}
		}
		for (int i = 0; i < arr.length; i++) {
			System.out.print(arr[i] + " ");
		}
	}

	public void practice14() {
		int arr[] = new int[45];
		for (int i = 0; i < arr.length; i++) {
			arr[i] = ((int) (Math.random() * 45) + 1);
			for (int j = 0; j < i; j++) {
				if (arr[i] == arr[j]) {
					i--;
				}
			}
		}
		Arrays.sort(arr, 0, 5);
		for (int i = 0; i < 6; i++) {
			System.out.print(arr[i] + " ");
		}
	}

	public void practice15() {
		int count = 0;
		int num = 0;

		System.out.print("문자열 : ");
		String msg = sc.next();
		char[] arr = new char[msg.length()];
		System.out.print("문자열에 있는 문자 : ");

		for (int i = 0; i < msg.length(); i++) {
			arr[i] = msg.charAt(i);
			for (int j = 0; j < i; j++) {
				if (arr[i] == arr[j]) {
					count++;
					num = i;
				}
			}
			if (i == 0) {
				System.out.print(arr[i]);
			}
			if (i != num) {
				System.out.print(", " + arr[i]);
			}
		}
		System.out.println("\n문자 개수 : " + (msg.length() - count));
	}

	public void practice16() {
		boolean flag = true;
		int su = 0;
		System.out.print("배열의 크기를 입력하세요 : ");
		int num = sc.nextInt();
		su += num;
		String[] arr = new String[su];

		for (int i = 0; i < su; i++) {
			System.out.print(i + 1 + "번째 문자열 : ");
			arr[i] = sc.next();
		}
		while (flag != false) {			
			System.out.print("더 값을 입력하시겠습니까?(Y/N) : ");
			char con = sc.next().charAt(0);

			if (con == 'Y') {
				flag = true;
				System.out.print("더 입력하고 싶은 개수 : ");
				num = sc.nextInt();
				for (int i = 0; i < num; i++) {
					System.out.print(num + i + "번째 문자열 : ");
					arr[i] = sc.next();
				}
			} else if (con == 'N') {
				System.out.print("[");
				for (int i = 0; i < su; i++) {
					if (i < su - 1) {
						System.out.print(arr[i] + ", ");
					}
				}
				System.out.println(arr[su - 1] + "]");
				flag = false;
			} else {
				System.out.println("잘못 입력 하셨습니다.");
				System.out.print("더 입력하고 싶은 개수 : ");
				num = sc.nextInt();
				su += num;
				for (int i = 0; i < num; i++) {
					System.out.print(su + i + "번째 문자열 : ");
					arr[i] = sc.next();
				}
			}

		}

	}
}
