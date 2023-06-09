package com.obj.run;

import com.obj.basiccontroller.MyMethod;
import com.obj.model.vo.Employee;

public class SetterGetterMain {

	public static void main(String[] args) {
		//Employee
//		Employee e=new Employee("유병승","강사부",500,0.5);
//		System.out.println(e.infoEmp());
//		e.name="최주영";
//		System.out.println(e.name);
		// 필드를 수정, 출력하기 위한 메소드를 선언한다.!
		//수정 : setter()
		//출력 : getter()
		//setter/getter메소드는 public으로 선언하고 
		//각 필드당 한개씩 선언
		//setter/getter는 명명규칙이 있음
		//set필드명 / get필드명 -> camelcase를 준비
		//예) setName / getName
		//setter메소드는 대입할 데이터가 필요하기 때문에 메개변수로 필드에 대입할 값을 받는다.
		//getter메소드는 데이터를 출력하는것으로 반환형이 있다.
//		System.out.println(e.getName());
//		System.out.println(e.infoEmp());
//		System.out.println(e.getName());
		//Employee클래스에 empNo필드를 제외한 모든 필드에 
		//setter getter메소드르 추가하고
		//기본생성자로 사원 5명을 생성하고 setter로 값을 대입 후 getter출력하기
		//유병승 강사부 500 0.5
		//홍길동 강사부 200 0.2
		//이순신 인사부 300 0.3
		//최주영 인턴  10 0
		//김중근 인턴  10 0.2
		
		MyMethod mmt=new MyMethod();
		Employee bs=new Employee();
		mmt.makeEmployee(bs, "유병승", "강사부", 500, 0.5);
//		bs.setName("유병승");
//		bs.setDepartment("강사부");
//		bs.setSalary(500);
//		bs.setBonus(0.5);
		
		Employee gildong=new Employee();
		mmt.makeEmployee(gildong, "홍길동", "강사부", 200, 0.2);
//		gildong.setName("홍길동");
//		gildong.setDepartment("강사부");
//		gildong.setSalary(200);
//		gildong.setBonus(0.2);
		
		Employee soonsin=new Employee();
		mmt.makeEmployee(soonsin, "이순신", "강사부", 300, 0.3);
//		soonsin.setName("이순신");
//		soonsin.setDepartment("인사부");
//		soonsin.setSalary(300);
//		soonsin.setBonus(0.3);
		
		Employee choi;
		choi=mmt.makeEmployee2("최주영", "인턴", 10, 0);
//		choi.setName("최주영");
//		choi.setDepartment("인턴");
//		choi.setSalary(10);
//		choi.setBonus(0);
		
		Employee kim;
		kim=mmt.makeEmployee2("김중근", "인턴", 10, 0.2);
//		kim.setName("김중근");
//		kim.setDepartment("인턴");
//		kim.setSalary(10);
//		kim.setBonus(0.2);
		
		System.out.println(bs.getEmpNo()+" "+bs.getName()+" "+bs.getDepartment()+" "+
		bs.getSalary()+" "+bs.getBonus());
		
		System.out.println(gildong.getEmpNo()+" "+gildong.getName()+" "+gildong.getDepartment()+" "+
				gildong.getSalary()+" "+gildong.getBonus());
		
		System.out.println(soonsin.infoEmp());
		System.out.println(choi.infoEmp());
		System.out.println(kim.infoEmp());
		
	}

}
