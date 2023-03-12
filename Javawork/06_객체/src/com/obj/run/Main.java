package com.obj.run;
import javax.swing.plaf.synth.SynthOptionPaneUI;

import com.obj.basiccontroller.BaseBallPlayer;
import com.obj.basiccontroller.BasicTestClass;
import com.obj.basiccontroller.FieldTestClass;
import com.obj.model.vo.Student;
//import com.obj.basiccontroller.DefaultTestClass;

public class Main {
	public static void main(String[] args) {
		//프로젝트 내부에 선언된 클래스는 반드시 생성해야지만 이용이 가능
		//클래스를 생성하는 방법
		//new 연산자를 이용해서 생성한다.
		//new 클래스명() <-- 기본클래스 생성하는 방법(default 생성)
		
		//클래스 선언부에 있는 접근제한자에 따라 생성해서 이용할 수 있는 범위가 달라진다.
		//BasicTestClass생성하기
		new BasicTestClass();
		//DefaultTestClass생성하기
//		new DefaultTestClass();
		
		//프로젝트내에 선언된 클래스명은 하나의 자료형으로 사용한다.
		//참조형 자료형(Reference type)
		//클래스를 지정하는 변수를 만들수도 있다.
		BasicTestClass btc;//클래스로 생성하는 객체를 저장하는 변수를 선언
		btc=new BasicTestClass();
		//btc.
		
		//클래스에 선언된 필드(멤버변수)이용하기
		//클래스에 선언된 필드를 이용하려면 클래스를 객체화(생성)해야한다.
		FieldTestClass ftc;
		ftc=new FieldTestClass();
		
		//필드(멤버변수)에 접근하기
		System.out.println(ftc.age);
		//필드에 값 대입하기
		ftc.age=26;
		System.out.println(ftc.age);
		//default접근제한자를 사용한 필드접근
		//System.out.println(ftc.name);
		//private 접근제한자를 사용한 필드접근
		//System.out.println(ftc.gender);
		
		//final 필드 접근하기
		System.out.println(ftc.HEIGHT);
		//final필드는 수정이 불가능하다.
		//ftc.HEIGHT=190.5;
		
		//베이스볼 플레이어 만들기
		//선수 3명을 만들기
		BaseBallPlayer p1,p2,p3;
		p1=new BaseBallPlayer();//선수 한명생성
		p1.name="박찬호";
		p1.age=49;
		p1.mainHand="오른손";
		p1.number=61;
		p1.position="p";
		p1.accuracy=70;
		p1.power=100;
		//p1 야구플레이어 -> 박찬호
		p2=new BaseBallPlayer();
		p2.name="이승엽";
		p2.age=46;
		p2.mainHand="왼손";
		p2.number=36;
		p2.position="1B";
		p2.accuracy=90;
		p2.power=100;
				
		//박찬호 정보출력하기
		System.out.println("이름 : "+p1.name+"\n나이 : "+p1.age+"\n주손 : "+p1.mainHand+"\n등번호 : "+p1.number+"\n포지션 : "
				+p1.position+"\n정확도 : "+p1.accuracy+"\n파워 : "+p1.power+"\n");
		System.out.println("이름 : "+p2.name+"\n나이 : "+p2.age+"\n주손 : "+p2.mainHand+"\n등번호 : "+p2.number+"\n포지션 : "
				+p1.position+"\n정확도 : "+p2.accuracy+"\n파워 : "+p2.power+"\n");
		
		p1.number=100;
		System.out.println("이름 : "+p1.name+"\n나이 : "+p1.age+"\n주손 : "+p1.mainHand+"\n등번호 : "+p1.number+"\n포지션 : "
				+p1.position+"\n정확도 : "+p1.accuracy+"\n파워 : "+p1.power+"\n");
		
		//학생정보를 저장하는 클래스를 선언하고 -> com.obj.model.vo.Student
		//이름, 나이 학년 반 키 주소 저장
		//모든 필드는 어디서든 접근할 수 있게 설정
		//아래 학생을 등록 후 출력하기
		//유병승 19 1 3 180.5 경기도 시흥시
		//홍길동 33 3 2 174.2 강원도 산골
		//이순신 54 3 3 167.3 전라남도
		//신사임당 45 2 1 152.3 강원도
		
		Student s1,s2,s3,s4;
		s1=new Student();
		s1.name="유병승";
		s1.age=19;
		s1.grade=1;
		s1.clas=3;
		s1.height=180.5;
		s1.adress="경기도 시흥시";
		
		s2=new Student();
		s2.name="홍길동";
		s2.age=33;
		s2.grade=3;
		s2.clas=2;
		s2.height=174.2;
		s2.adress="강원도 산골";
		
		s3=new Student();
		s3.name="이순신";
		s3.age=54;
		s3.grade=3;
		s3.clas=3;
		s3.height=167.3;
		s3.adress="전라남도";
		
		s4=new Student();
		s4.name="신사임당";
		s4.age=45;
		s4.grade=2;
		s4.clas=1;
		s4.height=152.3;
		s4.adress="강원도";
		
		System.out.println(s1.name+" "+s1.age+" "+s1.grade+" "+s1.clas+" "+s1.height+" "+s1.adress);
		System.out.println(s2.name+" "+s2.age+" "+s2.grade+" "+s2.clas+" "+s2.height+" "+s2.adress);
		System.out.println(s3.name+" "+s3.age+" "+s3.grade+" "+s3.clas+" "+s3.height+" "+s3.adress);
		System.out.println(s4.name+" "+s4.age+" "+s4.grade+" "+s4.clas+" "+s4.height+" "+s4.adress);
		
		//필드로 선언된 변수는 new연산자로 생성을 하면
		//기본값으로 초기화 된다. 초기부터 값을 대입하려면??? 필드에 대입연산자를 사용한다.
		//1. 필드에 대입연산자를 사용
		Student s5=new Student();
		System.out.println(s5.name+" "+s5.age+" "+s5.grade+" "+s5.clas+" "+s5.height+" "+s5.adress);		
		
		//final double height;
		//2. 초기화 블록을 이용해서 필드를 초기화 할 수 있다.
		//인스턴스 초기화블록 -> 클래스를 생성(객체화)할때마다 실행
		//static초기화블록 -> 최초 생성할때 한번만 실행!
		
	
	
	}

}
