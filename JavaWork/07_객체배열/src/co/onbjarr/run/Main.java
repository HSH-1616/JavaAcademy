package co.onbjarr.run;

import com.objarr.controller.Animal;
import com.objarr.controller.Fruit;
import com.objarr.controller.Person;

public class Main {

	public static void main(String[] args) {
		// 객체 배열 이용하기
		// 객체 배열 생성하기
		// Animal a,a1,a2,a3;
		Animal[] animals;// 객체배열변수를 선언
		animals = new Animal[4];// 배열 저장공간을 생성해서 대입
		animals[0] = new Animal();
		animals[1] = new Animal("고양이", "베리", 3, 6, '여');

		// 배열에 저장된 객체데이터 활용하기
		// 0번 인덱스에 저장된 동물의 이름 가져오기
		System.out.println(animals[0]);
		String name = animals[0].getName();
		System.out.println(name);
		animals[0].setName("햄찌");
		System.out.println(animals[0].getName());
		System.out.println(animals[1].getName());

		// Animal을 3개 저장할 수 있는 저장소를 만들고
		// 원숭이 몽키 3살 9kg 남자
		// 돼지 꿀꿀이 1살 30kg 여자
		// 토끼 깡총이 2살 2kg 여자

		Animal[] animals1 = new Animal[3];
		animals1[0] = new Animal();
		animals1[0].setType("원숭이");
		animals1[0].setName("몽키");
		animals1[0].setAge(3);
		animals1[0].setWeight(9);
		animals1[0].setGender('남');

		animals1[1] = new Animal();
		animals1[1].setType("돼지");
		animals1[1].setName("꿀꿀이");
		animals1[1].setAge(1);
		animals1[1].setWeight(30);
		animals1[1].setGender('여');

		animals1[2] = new Animal();
		animals1[2].setType("토끼");
		animals1[2].setName("깡총이");
		animals1[2].setAge(2);
		animals1[2].setWeight(2);
		animals1[2].setGender('여');

//		System.out.print(animals1[0].getType()+" "+animals1[0].getName()+" "+animals1[0].getAge()+" "+animals1[0].getWeight()+" "+animals1[0].getGender()+"\n");
//		System.out.println(animals1[1].infoAnimal());
//		System.out.println(animals1[2].infoAnimal());

		for (int i = 0; i < animals1.length; i++) {
			System.out.println(animals1[i].infoAnimal());
		}
		// com.objarr.controller.Person만들기
		// 이름, 나이, 주소, 전화번호
		// Person을 5명 저장할수 있는 공간을 확보하고 사용자가 입력한 값으로 Person을 생성 및 저장소에 저장후
		// 저장된 사용자 모두를 출력하기
		// -> 생성자는 기본 생성자만 생성
		// * getter와 setter이용할 것

//		Scanner sc = new Scanner(System.in);
//
//		Person[] ps = new Person[5];
//		for (int i = 0; i < ps.length; i++) {
//			ps[i] = new Person();
//			System.out.print("이름 : ");
//			ps[i].setName(sc.next());
//			System.out.print("나이 : ");
//			ps[i].setAge(sc.nextInt());
//			System.out.println("주소 : ");
//			ps[i].setAdress(sc.next());
//			sc.nextLine();
//			System.out.println("전화번호 : ");
//			ps[i].setPhoneNum(sc.next());
//		}
//
//		for (Person p : ps) {
//			System.out.println(p.getName() + " " + p.getAge() + " " + p.getAddress() + " " + p.getPhoneNum());
//		}

		// 객체 배열 선언과 동시에 초기화 하기
		Person[] ps2 = { new Person("유병승", 19, "경기도 시흥시", "010"), 
						new Person("유병승", 20, "경기도 시흥시", "010"),
						new Person("유병승", 21, "경기도 시흥시", "010"), 
						new Person("유병승", 22, "경기도 시흥시", "010"),
						new Person("유병승", 25, "경기도 시흥시", "010") 
						};
		//다수의 데이터를 저장하고 활용할때 객체배열
		//저장된 사람중 25살인 사람 조회하기
		for(Person p :ps2) {
			if(p.getAge()==25) {
			System.out.println(p.getName()+" "+p.getAge());
			}
		}
		
		//과일을 저장할수 있는 클래스를 만들고
		//이름 ,무게, 색상, 가격
		//과일을 5개 저장할 수 있는 저장소를 만들자
		//과일 본인이 좋아하는 과일로 초기화하기
		//1. 초기화한 과일들 전체 출력하기
		//2. 입력된 과일중 무게가 3kg이상인 과일 출력하기
		//3. 가격이 3000 이상인 과일 출력하기
		//사과 5 빨강 10000
		//바나나 3 노랑 8000
		//딸기 1.5 빨강 2500
		//키위 2 초록 2800
		//샤인머스켓 1.3 초록 40000
		
		Fruit[] f= {new Fruit("사과",5,"빨강",10000),
				new Fruit("바나나",3,"노랑",8000),
				new Fruit("딸기",1.5,"빨강",2500),
				new Fruit("키위",2,"초록",2800),
				new Fruit("샤인머스켓",1.3,"초록",40000)
				};
		for(Fruit f2 : f) {
			if(f2.getWeight()>=3) {
				System.out.println(f2.getName()+" "+f2.getWeight()+" "+f2.getColor()+" "+f2.getPrice());
			}
		}
		
		for(Fruit f2 : f) {
			if(f2.getPrice()>=3000) {
				System.out.println(f2.getName()+" "+f2.getWeight()+" "+f2.getColor()+" "+f2.getPrice());
			}
		}
		
				
	}

}
