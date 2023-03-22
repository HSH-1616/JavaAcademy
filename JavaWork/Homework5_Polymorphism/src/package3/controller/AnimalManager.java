package package3.controller;

import package3.model.vo.Animal;
import package3.model.vo.Cat;
import package3.model.vo.Dog;

public class AnimalManager {
	public static void main(String[] args) {
		
		Animal[] a=new Animal[5];
		a[0]=new Dog("바둑이","강아지",3);
		a[1]=new Cat("냥냥이","고양이","우리집","하얀색");
		a[2]=new Dog("포메라이언","강아지",5);
		a[3]=new Cat("네로","고양이","길거리","검은색");
		a[4]=new Dog("댕댕이","강아지",4);
		
		for(int i=0;i<a.length;i++) {
			a[i].speak();
		}
	}
}
