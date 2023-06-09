package com.operator.controller;
import java.util.Scanner;

//기능을 제공하는 클래스
public class OperatorController {
	
	//1. 단항연산자 알아보기
	public void singleOp() {
		//1.부정연산자 : boolean형의 값을 반전시키는 연산자
		//표현 : !변수명 또는 !기능(메소드)호출구문 또는 !비교연산
		System.out.println("===== 부정 연산자 활용하기 =====");
		boolean flag=true;
		System.out.println("flag : "+flag);
		System.out.println("!flag : "+!flag);
		System.out.println("!!flag : "+!!flag);
		
		//나이가 19살 이상이 아니지?
		int age=15;
		System.out.println(!(age>19));
		
		//기능을 호출했을때 부정하기
		//String의 값을 비교할때는 equals()를 이용해야함.
		//이름이 허성현이니?
		String name = "허성현";
		System.out.println(name.equals("허성현"));
		//문자열이 같지 않음을 비교할때 사용
		System.out.println(!name.equals("허성현"));
		
		//2. 증가, 감소 연산
		//표현 : ++변수, 변수++
		//      --변수, 변수--
		//특정 수를 셀때 사용
		//변수(정수)에 1을 더하고 다시 그 변수에 저장시키는 연산
		//++변수 == (변수=변수+1);
		int count=0;
		++count;//count=count+1;
		count=count+1;
		System.out.println(count);
		count++;
		count++;
		System.out.println(count);
		
		count=0;
		--count;//count=count-1;
		System.out.println(count);
		--count;
		count--;
		System.out.println(count);
		
		//++, -- 연산자의 위치에 따라 연산실행 순서가 변경
		//다른연산자와 같이 연산실행했을때 순서변경됨.
		//int testNum=++count+10;
		//전위연산 : 다른 연산자와 같이 있을때 먼저 증가,감소연산을 실행하고 나중에 다른 연산을 실행 
		int testNum=count+++10;
		//후위연산 : 다른 연산자와 같이 있을때 다른 연산을 먼저 실행하고 나중에 증가,감소연산을 실행
		System.out.println(testNum);
		System.out.println("count : "+count);
		
		testNum=0;
		count=0;
		//testNum=--count;
		testNum=count--; //대입연산 먼저 그다음 연산
		System.out.println(testNum);
		System.out.println(count);
		// 반복문을 사용할때 많이 사용
		//for(int i=0;i<10;i++) {}
		//특정로직의 실행횟수를 확일할때 많이 사용
		
		
	}//singleOp()

	public void calculatorOp( ) {
		//산술연산자 활용하기
		//+, -, *, /, &(나머지)
		int su=2;
		int su2=10;
		//더하기, 빼기
		System.out.println("+연산 : "+(su+su2));
		System.out.println("-연산 : "+(su-su2));
		//곱하기, 나누기
		System.out.println("*연산 : "+su*su2);
		System.out.println("/연산 : "+su/(double)su2);
		
		//산술연산결과를 계속 사용하려면? -> 결과를 변수에 저장하고 활용
		int result=su+su2;
		double result2=su/(double)su2;
		
		//나머지 연산
		//%연산 : 짝수,홀수구분 배수,약수등을 구할수있는 연산자
		System.out.println(su%2);
		System.out.println(su2%3);
		//입력받은 값이 짝수인지 홀수인지 판단하는 기능
		//특정수의 배수가 맞는지 판단하는 기능
		
		
	}
	
	public void calc() {
		//계산기 만들기
		//사용자에게 두수를 입력받고 입력받은 수의
		//더한결과, 뺀결과, 곱한결과, 나눈결과를 출력하는 기능을 구현
		//더한결과: OO
		//뺀결과: OO
		//곱한결과: OO
		//나눈결과: OO.OO
		Scanner sc=new Scanner(System.in);
		int a,b;
		System.out.print("입력할값1 : ");
		a=sc.nextInt();
				
		System.out.print("입력할값2 : ");
		b=sc.nextInt();

		System.out.println("입력한값 : " +a +"," +b);
		
		System.out.println("더한결과 : "+(a+b));
		System.out.println("뺸결과 : "+(a-b));
		System.out.println("곱한결과 : "+a*b);
		System.out.println("나눈결과 : "+a/(double)b);
		
	}
	
	public void compareOp(){
		//비교연산자 활용하기
		//동등비교
		//표현 : ==, !=
		//대소비교
		//표현 : >, <, <=, >=
		//비교연산의 결과는 true/false(boolean)로 반환됨.
		
		//1. 동등비교
		//숫자형 동등비교
		int num=13;
		int num2=19;
		int num3=13;
		
		//일치여부 확인
		System.out.println(num==num2);
		System.out.println(num==num3);
		
		//불일치여부 확인
		//!=연산자를 활용
		System.out.println("num!=num2 = "+(num!=num2));
		System.out.println("num!=num3 : "+(num!=num3));
		
		//실수형 비교하기
		double dnum=180.5;
		double dnum1=190.5;
		double dnum2=180.5;
		System.out.println(dnum==dnum1);
		System.out.println(dnum==dnum2);
		System.out.println(dnum!=dnum1);
		dnum=13;
		System.out.println(dnum==num);
		
		//문자 동등비교
		char ch='A';
		char ch1='a';
		char ch2='A';
		System.out.println("A==a : "+(ch==ch1));
		System.out.println("A==A : "+(ch==ch2));
		System.out.println("A!=a : "+(ch!=ch1));
		int chint=65;
		System.out.println(ch==chint);
		
		//문자열에 대한 동등비교
		//String(클래스) 동등비교할때 == 연산을 사용할 수 없다.
		//String이 제공하는 equals()기능을 이용해서 동등비교를 한다.
		String name="허성현";
		String name2="김철수";
		String name3="허성현";
		String name4=new String("김철수");
		System.out.println("name==name2 : "+(name==name2));
		System.out.println("name==name3 : "+(name==name3));
		System.out.println("name2==name4 : "+(name2==name4));
		
//		Scanner sc=new Scanner(System.in);
//		System.out.print("이름 : ");
//		String inputName=sc.nextLine();
//		//System.out.println(inputName=="허성현");
//		System.out.println(inputName.equals("허성현"));
//		System.out.println("허성현".equals(inputName));
//		//불일치비교
//		System.out.println(!"허성현".equals(inputName));
	
		//대소비교하기
		//숫자값만 가능
		//<,>,<=,>=
		num=200;
		num2=300;
		num3=200;
		System.out.println(num<num2);
		System.out.println(num>num3);
		System.out.println(num>=num3);
		
		//문자타입은 대소비교가 가능할까?
		char ch4='Z';
		char ch5='E';
		System.out.println("Z>E : "+(ch4>ch5));
		//대문자, 소문자를 확인할 수 있음
		System.out.println("A<a : "+('A'<'a'));
		
		//문자열도 대소비교 가능한가?
		String str="30";
		String str2="40";
		//System.out.println(str<str2); //불가능하다				
	}
	//public void testStr()기능을 구현
	//사용자에게 ID를 입력받고 ID가 admin이면 true를 출력하는 기능
	
	//public void check()기능을 구현
	//사용자에게 나이를 입력받고 성년이면 true를 출력하는 기능
	
	public void testStr() {
		Scanner sc=new Scanner(System.in);
		String userId;
		System.out.print("ID : ");
		userId=sc.nextLine();
		System.out.println(userId.equals("admin"));		
	}
	
	public void check() {
		Scanner sc=new Scanner(System.in);
		int testAge;
		System.out.print("나이를 입력하세요 : ");
		testAge=sc.nextInt();
		System.out.println(testAge>=20);
	}
	
	public void logic() {
		//논리연산하기
		//논리연산 : 2개이상의 진위형을 연결할때 사용하는 연산
		// && : and(그리고) 두개의 진위형이 모두 true일때 true반환
		// || : or(또는) 두개의 진위형 중 한개가 true일때 true반환
		//id가 admin이고 password가 1234면 true 아니면 false
		String id="admin";
		String password="1111";
		System.out.println(id.equals("admin")&&password.equals("1234"));
	
		//입력받은 나이가 19살이상이고 경기도에 살면 true출력 아니면false출력
		Scanner sc=new Scanner(System.in);
		System.out.print("나이 : ");
		int age=sc.nextInt();
		sc.nextLine();
		System.out.print("주소(광역시,도) : ");
		String address=sc.nextLine();
		System.out.println(age>=19&&address.equals("경기도"));
		
		// or 연산
		//입력받은 주소가 경기도나 서울일 경우 true반환
		System.out.println(address.equals("서울")||address.equals("경기도"));
		
		//논리연산을 이용해서 숫자의 범위를 확인할 수 있음.
		System.out.println(10<=age&&age<=20);
		
		//입력받은 나이가 20대면 true 아니면 false 출력
		System.out.println(20<=age&&age<30);
		
		//문자한개를 입력받고 입력한 문자가 대문자면 true아니면 false출력
		System.out.print("문자를 입력하세요 : ");
		char alphabet=sc.nextLine().charAt(0);
		System.out.println(65<=alphabet&&alphabet<=90);
		
		//입력받은 나이가 20대이면서 입력받은 성별이 여자인 사람
		System.out.print("나이 : ");
		age=sc.nextInt();
		System.out.print("성별(M/F) : ");
		char gender=sc.next().charAt(0);
		System.out.println((20<=age&&age<30)&&(gender=='F'));
		
		//입력받은 문자가 알파벳이면 true 아니면 false
		System.out.println((65<=alphabet&&alphabet<=90)
				||(97<=alphabet&&alphabet<=122));
		
		//사는곳이 서울 또는 인천이면서 30대인 사람 구하기
		boolean flag=(address.equals("서울")||address.equals("인천"))
				&&30<=age&&age<=39; //괄호 없으면 연산자 우선순위에 의해 결과가 바뀜
		System.out.println("결과 : "+flag);
		
		System.out.println((address.equals("서울")||address.equals("인천"))
				&&(30<=age&&age<=39));
	}
	
    public void complexOp() {
    	//복합대입연산자
    	//+=, -=, *=, /=,
    	//a+=10 == a=a+10;
    	//a-=10 == a=a-10;
    	//a*=10 == a=a*10;
    	
    	//값을 누적시키거나 차감시킬때 사용
    	int total=300000;
    	total-=1000;
    	System.out.println(total);
    	total+=10000;
    	System.out.println(total);
    	
    	Scanner sc=new Scanner(System.in);
    	System.out.print("현재 용돈 : ");
    	total=sc.nextInt();
    	System.out.print("금액 : ");
    	total+=sc.nextInt();
    	System.out.println("현재 잔액 : "+total);
    	System.out.print("금액 : ");
    	total+=sc.nextInt();
    	System.out.println("현재 잔액 : "+total);
    	System.out.print("금액 : ");
    	total+=sc.nextInt();
    	System.out.println("현재 잔액 : "+total);
    	System.out.print("금액 : ");
    	total+=sc.nextInt();
    	System.out.println("현재 잔액 : "+total);
    	
    	//문자열에 대한 누적을 할 수 있을까?
    	String msg=""; //공값을 대입할때
    	msg+="안녕";
    	msg+="하이";
    	msg+="왓썹?";
    	msg+="곰방와";
    	System.out.println(msg);
    	
    	
    }
	//수학, 영어, 국어, 코딩점수를 입력받고
    //합계와 평균을 출력하는 기능 구현하기
    //*변수는 1개만 사용해서 구현할것
    public void calcGrade() {
        Scanner sc=new Scanner(System.in);
    	int score=0;
    	System.out.print("수학 점수 : ");
    	score+=sc.nextInt();
    	System.out.print("영어 점수 : ");
    	score+=sc.nextInt();
    	System.out.print("국어 점수 : ");
    	score+=sc.nextInt();
    	System.out.print("코딩 점수 : ");
    	score+=sc.nextInt();
    	System.out.println("점수 합계 : "+score);
    	System.out.println("점수 평균 : "+(double)score/4);
    }
	
    //사용자에게 메세지를 4개 입력받고 입력받은 메세지를 한번에 출력하는 기능 만들기
    public void inputMsg() {
    	Scanner sc=new Scanner(System.in);
    	String msg="";
    	System.out.print("메세지를 입력하세요 : ");
    	msg+=sc.nextLine()+"\n";
    	System.out.print("메세지를 입력하세요 : ");
    	msg+=sc.nextLine()+"\n";
    	System.out.print("메세지를 입력하세요 : ");
    	msg+=sc.nextLine()+"\n";
    	System.out.print("메세지를 입력하세요 : ");
    	msg+=sc.nextLine()+"\n";
    	System.out.println("입력한 내용 : "+"\n"+msg);
    	
    	//웹페이지를 구성해서 응답할때 사용
    	String html="<html>";
    	html+="<head>";
    	html+="<title>첫번째 페이지</title>";
    	html+="</head>";
    	html+="<body>";
    	html+="<h2>내가 만든 첫 페이지</h2>";
    	html+="</body>";
    	html+="</html>";
    }
    
    public void thirdOp() {
    	//삼항연산자에 대해 알아보자.
    	//조건식(true,false)나오는 연산, 기능(메소드)
    	//"?"조건식,기능이 true일때 실행할 로직, ":"조건식,기능이 false일때 실행할 로직
    	
    	//값이 180보다 크면 키가 크다 출력 아니면 키가 작다 출력
    	double height=170.5;
    	String msg=height>=180?"키가 크다":"키가 작다";
    	System.out.println(msg);
    	
    	//점수를 입력받아 점수가 60점 이상이면 합격을 출력, 아니면 불합격 출력
    	Scanner sc=new Scanner(System.in);
    	System.out.print("점수 : ");
    	int score=sc.nextInt();
    	System.out.println("결과 : "+(score>=60?"합격":"불합격"));
    	
    	//아이디와 패스워드를 입력받고
    	//아이디가 admin이고 패스워드가 1234면 로그인 성공 출력 아니면 로그인 실패 출력
    	
    	System.out.print("ID : ");
    	String id =sc.next();
    	System.out.print("PW : ");
    	String pw =sc.next();
    	System.out.println(id.equals("admin")&&pw.equals("1234")?"로그인 성공":"로그인 실패");
    	
    	//String tag="<input type='checkbox' name='hobby'"+(id.equals("admin")?"checked":"")+">";
    	
    	//나이와 성별을 입력받아 나이가 성년이고 남자면 멋진남자
    	//나이가 성년이고 여자면 예쁜여자
    	//나이가 미성년이면 공부하세요
    	System.out.print("나이 : ");
        int age=sc.nextInt();
        System.out.print("성별(M/F) : ");
        char gender=sc.next().charAt(0);
        String result;
        result=age>19?gender=='M'?"멋진남자":"예쁜여자":"공부하세요";
        System.out.println("결과 : "+result);
    }
    
    public void bitOperator() {
    	//비트연산자
    	//저장소에있는 비트끼리 연산을 하는것
    	//A & B : 두개 모두 1일때 1값을 출력 아니면 모두 0
    	//A | B : 두개 중 한개가 1일때 1값을 출력 두값 모두 0일때 0을 출력
    	//A ^ B (XOR) : 두비트가 다른값을 가질때 1 출력 같은 값일때 0을 출력
    	//~A : 부속 *값을 반전 1->0, 0->1로 변경
    	
    	int a=10,b=22;
    	String basic="";
    	for(int i=0;i<32;i++) {
    		basic+=0;
    	}
    	String bit=basic+Integer.toBinaryString(a);
    	bit=bit.substring(bit.length()-32);
    	System.out.println(bit+" -> a비트값");
    	bit=basic+Integer.toBinaryString(b);
    	bit=bit.substring(bit.length()-32);
    	System.out.println(bit+" -> b비트값");
    	bit=basic+Integer.toBinaryString(a&b);
    	bit=bit.substring(bit.length()-32);
    	System.out.println(bit+" -> a&b비트값");
    	bit=basic+Integer.toBinaryString(a|b);
    	bit=bit.substring(bit.length()-32);
    	System.out.println(bit+" -> a|b비트값");
    	bit=basic+Integer.toBinaryString(a^b);
    	bit=bit.substring(bit.length()-32);
    	System.out.println(bit+" -> a^b비트값");
    	bit=basic+Integer.toBinaryString(~a);
    	bit=bit.substring(bit.length()-32);
    	System.out.println(bit+" -> ~a비트값");
    	bit=basic+Integer.toBinaryString(a<<1);
    	bit=bit.substring(bit.length()-32);
    	System.out.println(bit+" -> a<<1비트값");
    	bit=basic+Integer.toBinaryString(a>>1);
    	bit=bit.substring(bit.length()-32);
    	System.out.println(bit+" -> a>>1비트값");
    	bit=basic+Integer.toBinaryString(a>>>2);
    	bit=bit.substring(bit.length()-32);
    	System.out.println(bit+" -> a>>>2비트값");

    	
    }
    
}
