package bs.student.dao;

import bs.studnet.dto.Student;

public class StudentDao {
	
	private Student s1;
	private Student s2;
	private Student s3;
	private Student s4;
	
	public StudentDao() {}
	
	//학생을 저장소에 저장하는 기능
	public boolean insertStudent(Student s) {
		//boolean result=true;
		if(s1==null) {
			//s1은 비었다.
			s1=s;
		}else if(s2==null) {
			s2=s;
		}else if(s3==null) {
			s3=s;
		}else if(s4==null) {
			s4=s;
		}else {
			//입력실패
			//result=false;
			return false;
		}
		return true;
	}

	//학생전체정보를 제공해주는 기능
	public String infoStudentAll() {
		//s1, s2, s3, s4에 저장된 학생정보 종합
		//1. 각 s들에 저장이 되어있는지 -> sn!=null
		
		String totalStudent="";
		
		if(s1!=null) {			
			totalStudent+=s1.infoStudent()+"\n";
		}
		if(s2!=null) {
			totalStudent+=s2.infoStudent()+"\n";
		}
		if(s3!=null) {
			totalStudent+=s3.infoStudent()+"\n";
		}
		if(s4!=null) {
			totalStudent+=s4.infoStudent()+"\n";
		}
		return totalStudent;
	}
}
