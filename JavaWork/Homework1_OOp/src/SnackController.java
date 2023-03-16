
public class SnackController {
	
	Snack s=new Snack();
	
	public SnackController() {
		
	}
	
	public String saveData(String kind,String name,String flavor,int numOf,int price) {
		s.setKind(kind);
		s.setName(name);
		s.setFlavor(flavor);
		s.setNumOf(numOf);
		s.setPrice(price);
		return "저장이 완료되었습니다";
	}
	
	public String confirmData() {
		String msg=s.getKind()+"("+s.getName()+" - "+s.getFlavor()+") "+s.getNumOf()+"개 "+s.getPrice()+"원";
		return msg;
	}

}
