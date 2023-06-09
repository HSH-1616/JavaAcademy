package com.bs.practice;

import java.util.Scanner;



public class LoopPractice {
	Scanner sc = new Scanner(System.in);

	public void menu() {
		System.out.print("실행 번호 : ");
		int menu = sc.nextInt();
		switch (menu) {
		case 1:
			practice1();
			break;
		case 2:
			practice2();
			break;
		case 3:
			practice3();
			break;
		case 4:
			practice4();
			break;
		case 5:
			practice5();
			break;
		case 6:
			practice6();
			break;
		case 7:
			practice7();
			break;
		case 8:
			practice8();
			break;
		case 9:
			practice9_10();
			break;
		case 10:
			practice11();
			break;
		case 11:
			practice12();
			break;
		case 12:
			practice13();
			break;
		case 14:
			practice14();
			break;
		}

	}

	public void practice1() {
		Scanner sc = new Scanner(System.in);
		System.out.print("1이상의 숫자를 입력하세요 : ");
		int num = sc.nextInt();
		for (int i = 1; i <= num; i++) {
			System.out.print(i + " ");
		}
		if (num < 1) {
			System.out.println("1이상의 숫자를 입력해주세요.");
		}

	}

	public void practice2() {
		Scanner sc = new Scanner(System.in);
		System.out.print("1이상의 숫자를 입력하세요 : ");
		int num = sc.nextInt();
		for (int i = 1; i <= num; i++) {
			System.out.print(i + " ");
		}

		while (num < 1) {
			System.out.println("1이상의 숫자를 입력해주세요.");
			System.out.print("1이상의 숫자를 입력하세요 : ");
			num = sc.nextInt();
			for (int i = 1; i <= num; i++) {
				System.out.print(i + " ");
			}
		}

	}

	public void practice3() {
		Scanner sc = new Scanner(System.in);
		System.out.print("1이상의 숫자를 입력하세요 : ");
		int num = sc.nextInt();
		for (int i = num; i >= 1; i--) {
			System.out.print(i + " ");

		}
	}

	public void practice4() {
		Scanner sc = new Scanner(System.in);
		System.out.print("1이상의 숫자를 입력하세요 : ");
		int num = sc.nextInt();
		for (int i = num; i >= 1; i--) {
			System.out.print(i + " ");
		}

		while (num < 1) {
			System.out.println("1이상의 숫자를 입력해 주세요.");
			System.out.print("1이상의 숫자를 입력하세요 : ");
			num = sc.nextInt();
			for (int i = num; i >= 1; i--) {
				System.out.print(i + " ");
			}
		}
	}

	public void practice5() {
		int i = 0;
		int total = 0;

		System.out.print("정수 하나를 입력하세요 : ");
		int num = sc.nextInt();

		for (i = 1; i <= num - 1; i++) {
			System.out.print(i + " + ");
			total += i;
		}

		System.out.println(i + " = " + (total + num));
	}

	public void practice6() {
		System.out.print("첫번째 숫자 : ");
		int num1 = sc.nextInt();
		System.out.print("두번째 숫자 : ");
		int num2 = sc.nextInt();

		if (num1 < num2 && num1 > 0 && num2 > 0) {
			for (int i = num1; i <= num2; i++) {
				System.out.print(i + " ");
			}
		} else if (num1 > num2 && num1 > 0 && num2 > 0) {
			for (int i = num2; i <= num1; i++) {
				System.out.print(i + " ");
			}
		} else if (num1 == num2) {
			System.out.println("서로 다른 숫자를 입력해주세요.");
		} else {
			System.out.println("1 이상의 숫자를 입력해주세요.");
		}
	}

	public void practice7() {
		System.out.print("첫번째 숫자 : ");
		int num1 = sc.nextInt();
		System.out.print("두번째 숫자 : ");
		int num2 = sc.nextInt();

		if (num1 < num2 && num1 > 0 && num2 > 0) {
			for (int i = num1; i <= num2; i++) {
				System.out.print(i + " ");
			}
		} else if (num1 > num2 && num1 > 0 && num2 > 0) {
			for (int i = num2; i <= num1; i++) {
				System.out.print(i + " ");
			}
		} else if (num1 == num2) {
			System.out.println("서로 다른 숫자를 입력해주세요.");
		}
		while (num1 < 1 || num2 < 2) {
			System.out.println("1 이상의 숫자를 입력해주세요.");
			System.out.print("첫번째 숫자 : ");
			num1 = sc.nextInt();
			System.out.print("두번째 숫자 : ");
			num2 = sc.nextInt();
			for (int i = num1; i <= num2; i++) {
				System.out.print(i + " ");
			}
		}
	}

	public void practice8() {
		System.out.print("숫자 : ");
		int num = sc.nextInt();
		System.out.println("==== " + num + "단 ====");
		for (int i = num; i == num;) {
			for (int j = 1; j <= 9; j++) {
				System.out.println(num + " * " + j + " = " + num * j);
			}
			break;
		}

	}

	public void practice9_10() {
		System.out.print("숫자 : ");
		int num = sc.nextInt();

		if (num <= 9 && num > 0) {
			System.out.println("==== " + num + "단 ====");
			for (int i = num; i == num;) {
				for (int j = 1; j <= 9; j++) {
					System.out.println(num + " * " + j + " = " + num * j);
				}
				break;
			}
		} else if (num > 9) {
			while (num > 9) {
				System.out.println("9이하의 숫자만 입력해주세요.");
				System.out.print("숫자 : ");
				num = sc.nextInt();

				if (num <= 9 && num > 0) {
					System.out.println("==== " + num + "단 ====");
					for (int i = num; i == num;) {
						for (int j = 1; j <= 9; j++) {
							System.out.println(num + " * " + j + " = " + num * j);
						}
						break;
					}
				} else if (num < 0) {
					while (num < 0) {
						System.out.println("0이상의 숫자만 입력해주세요.");
						System.out.print("숫자 : ");
						num = sc.nextInt();

						if (num <= 9 && num > 0) {
							System.out.println("==== " + num + "단 ====");
							for (int i = num; i == num;) {
								for (int j = 1; j <= 9; j++) {
									System.out.println(num + " * " + j + " = " + num * j);
								}
								break;
							}
						}
					}
				}
			}
		}

	}

	public void practice11() {
		int num = 0;
		System.out.print("시작 숫자 : ");
		num = sc.nextInt();
		System.out.print("공차 : ");
		int gong = sc.nextInt();

		for (int i = num; i < num * 9; i = i + gong) {
			System.out.print(i + " ");
		}
	}

	public void practice12() {
		String y = "";

		while (!y.equals("exit")) {
			System.out.print("연산자(+. -, *, /, %) : ");
			y = sc.next();

			if (!y.equals("exit")) {
				System.out.print("정수 1 : ");
				int num1 = sc.nextInt();
				System.out.print("정수 2 : ");
				int num2 = sc.nextInt();
				switch (y) {
				case "+":
					System.out.println(num1 + " + " + num2 + " = " + (num1 + num2));
					break;
				case "-":
					System.out.println(num1 + " - " + num2 + " = " + (num1 - num2));
					break;
				case "*":
					System.out.println(num1 + " * " + num2 + " = " + (num1 * num2));
					break;
				case "/":
					if (num2 != 0) {
						System.out.println(num1 + " / " + num2 + " = " + (double) (num1 / num2));
						break;
					} else if (num2 == 0) {
						System.out.println("0으로 나눌수 없습니다. 다시 입력해주세요.");
						break;
					}
				case "%":
					System.out.println(num1 + " % " + num2 + " = " + (num1 % num2));
					break;

				default:
					System.out.println("없는 연산자입니다. 다시 입력해주세요.");
					break;
				}

			} else if (y.equals("exit")) {
				System.out.println("프로그램을 종료합니다.");
			}

		}

	}

	public void practice13() {
		System.out.print("정수 입력 :");
		int num = sc.nextInt();

		for (int i = 1; i <= num; i++) {
			for (int j = 1; j < i + 1; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
	}

	public void practice14() {
		System.out.print("정수 입력 : ");
		int num = sc.nextInt();

		for (int i = 1; i <= num; i++) {
			for (int j = num; j > i - 1; j--) {
				System.out.print("*");
			}
			System.out.println();
		}
	}

	public void practice15() {

		int count = 0;
		System.out.print("숫자 : ");
		int num = sc.nextInt();

		for (int i = 1; i <= num; i++) {

			for (int j = 1; j <= num; j++) {
				int z = num % i;

				if (i != j && z == 0) {
					count++;
				}
			}
		}
		if (count / (num - 1) == 2) {
			System.out.println("소수입니다.");
		} else if (count / (num - 1) > 2) {
			System.out.println("소수가 아닙니다.");
		} else if (num > 2) {
			System.out.println("잘못 입력하셨습니다.");
		}
	}

	public void practice16() {
		int count = 0;

		System.out.print("숫자 : ");
		int num = sc.nextInt();

		while (num < 2) {
			System.out.println("잘못 입력하셨습니다.");
			System.out.print("숫자 : ");
			num = sc.nextInt();
		}
		for (int i = 2; i <= num; i++) {
			if (num % i == 0) {
				count++;
			}
		}
		if (count == 1) {
			System.out.println("소수입니다.");
		} else if (count > 1) {
			System.out.println("소수가 아닙니다.");
		}
	}

	public void practice17() {
		int count = 0;
		String result = "";

		System.out.print("숫자 : ");
		int num = sc.nextInt();
		while (num < 2) {
			System.out.println("잘못 입력하셨습니다.");
			System.out.print("숫자 : ");
			num = sc.nextInt();
		}
		if (num > 2) {
			for (int i = 2; i <= num; i++) {
				int j = i;

				if (i == 2 || i == 3) {
					result += i + " ";
					count++;
				}
				if (i % 2 != 0 && i % 3 != 0) {
					result += i + " ";
				}

				if (i % 2 != 0 && i % 3 != 0 && i % j == 0) {
					count++;
				}
			}
		}
		System.out.println(result + "\n2부터 " + num + "까지 소수의 개수는 " + count + "개 입니다.");
	}

	public void practice18() {
		int count=0;
		String result="";
		
		System.out.print("자연수 하나를 입력하세요 : ");
		int num=sc.nextInt();
		
		for(int i=1;i<=num;i++) {
			if(i%2==0||i%3==0) {
				result+=i+" ";
			}	
			if(i%2==0&&i%3==0) {
				count++;
			}
		}
		System.out.println(result+"\n"+"count : "+count);
	}
	
	public void practice19() {
		System.out.print("정수 입력 : ");
		int num=sc.nextInt();
		
		for(int i=0;i<num;i++) {
			for(int j=0;j<i+1;j++) {
				System.out.print("*");
			}
			System.out.println();
		}
	}
}

