package package3.model.vo;

public class Dog extends Animal {
	
	public String PLACE="애견카페";
	private int weight;
	
	public Dog() {
	}
	
	public Dog(String name, String kinds, int weight) {
		super(name,kinds);
		this.weight=weight;
	}
	
	public void setWeight(int weight) {
		this.weight=weight;
	}
	
	public int getWeight() {
		return weight;
	}
	
	@Override
	public void speak() {
		System.out.println(toString()+" 몸무게는 "+weight+"kg 입니다.");
	}

}
