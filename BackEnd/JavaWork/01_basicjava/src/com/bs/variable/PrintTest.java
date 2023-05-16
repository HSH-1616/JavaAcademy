package com.bs.variable;

public class PrintTest {
	public static void main(String[] args) {
		//console창에 데이터 출력하기
		//개행없이 같은 라인에 출력하기
		System.out.print("안녕");
		System.out.print(" 점심은 맛있게 먹었나요");
		System.out.print(" 점심먹고 졸면안돼요!!!"+ "\n");
		
		//개행하여 출력하기
		System.out.println("안녕");
		System.out.println("점심은 맛있게 먹었나요");
		System.out.println("점심먹고 졸면안돼요!!!");
		
		int age=26;
		String name="허성현";
		System.out.print(age);
		System.out.print(name+ "\n");
		
		//정해진 양식대로 출력하기
		//System.out.printf()기능 이용
		System.out.printf("나의 이름은 %s이고, 나이는 %d이다", name,age);
		//문자패턴
		//%s : 문자열
		//%d : 정수
		//%f : 실수
		//%c : 문자
		System.out.println();//개행처리
		System.out.printf("이름 %5s 나이 %-3d 키 %.1f 성별 %c" , "허성현",26,173.3,'남');
		System.out.println();
		
		//문자열을 출력할때 escape문을 이용
		//개행처리, tab(일정간격 띄어쓰기), 역슬러쉬표시, "", '' 표시
		String msg="그는 말했다. \"하이\" ";
		System.out.println(msg);
		msg="나는 자바 수강생 입니다. \n나는 코딩을 \t좋아한다.";
		System.out.println(msg);
		String path="c:\\users\\gdj64\\";
		System.out.println(path);
		String html="<p onclick=\"alter('test');\">클릭해봐</p>";
		System.out.println(html);
		
//		tab       \t 정해진 공간만큼 띄어쓰기
//		new line \n 출력하고 다음라인으로 옮김
//		역슬래시   \\ 
//		작은 따옴표 \’  특수문자 사용시 백슬러시(\)를 넣고 특수문자를 넣어야 함
//		큰 따옴표  \”
//		유니코드   \ u 유니코드 표시할 때 사용
			
	}

}
