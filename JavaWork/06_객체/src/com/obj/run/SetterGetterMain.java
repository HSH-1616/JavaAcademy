package com.obj.run;

import com.obj.model.vo.Employee;

public class SetterGetterMain {

	public static void main(String[] args) {
		//Employee
		Employee e=new Employee("유병승","강사부",500,0.5);
//		System.out.println(e.infoEmp());
//		e.name="허성현";
//		System.out.println(e.name);
		
		//필드를 수정, 출력하기 위한 메소드를 선언한다.
		//수정 : setter()
		//출력 : getter()
		//setter/getter메소드는 public으로 선언하고 각 필드당 한개씩 선언
		//setter/getter는 명명규칙이 있다.
		//set필드명() / get필드명 -> camelcase를 준비
		//예) setName / getName
		//setter 메소드는 대입할 데이터가 필요하기 때문에 매개변수로 필드에 대입할 값을 받는다.
		//getter 메소드는 데이터를 출력하는것으로 반환형이 있다.
		
//		System.out.println(e.getName());
//		e.setName("허성현");
//		System.out.println(e.infoEmp());
//		System.out.println(e.getName());
		
		//Employee클래스에 empNo필드를 제외한 모든 필드에
		//setter getter메소드를 추가하고
		//기본생성자로 사원 5명을 생성하고 setter로 값을 대입 후 getter로 출력하기
		//유병승 강사부 500 0.5
		//홍길동 강사부 200 0.2
		//이순신 인사부 300 0.3
		//최주영 인턴  10  0
		//김중근 인턴  10  0.2
		e.setName("유병승");
		e.setDepartment("강사부");
		e.setSalary(500);
		e.setBonus(0.5);
		System.out.println(e.infoEmp());
		
		e.setName("홍길동");
		e.setDepartment("강사부");
		e.setSalary(200);
		e.setBonus(0.2);
		System.out.println(e.infoEmp());
		
		e.setName("이순신");
		e.setDepartment("인사부");
		e.setSalary(300);
		e.setBonus(0.3);
		System.out.println(e.infoEmp());
		
		e.setName("최주영");
		e.setDepartment("인턴");
		e.setSalary(10);
		e.setBonus(0);
		System.out.println(e.infoEmp());
		
		e.setName("김중근");
		e.setDepartment("인턴");
		e.setSalary(10);
		e.setBonus(0.2);
		System.out.println(e.infoEmp());
	}

}
