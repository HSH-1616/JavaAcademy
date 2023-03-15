package bs.student.dao;

import bs.studnet.dto.Student;

public class StudentDao {
	
	private static StudentDao dao;
	public static StudentDao getStudentDao() {
		if(dao==null) dao=new StudentDao();
		return dao;
	}
	private Student s1;
	private Student s2;
	private Student s3;
	private Student s4;
	private Student s5;
	private Student s6;
	
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
		}else if(s5==null) {
			s5=s;
		}else if(s6==null) {
			s6=s;
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
		if(s5!=null) {
			totalStudent+=s5.infoStudent()+"\n";
		}
		if(s6!=null) {
			totalStudent+=s6.infoStudent()+"\n";
		}
		return totalStudent;
	}
	
	public String searchByName(String name) {
		String result="";
		if(s1!=null&&s1.getName().equals(name)) {
			result+=s1.infoStudent()+"\n";						
		}
		if(s2!=null&&s2.getName().equals(name)) {
			result+=s2.infoStudent()+"\n";
		}
		if(s3!=null&&s3.getName().equals(name)) {
			result+=s3.infoStudent()+"\n";
		}
		if(s4!=null&&s4.getName().equals(name)) {
			result+=s4.infoStudent()+"\n";
		}
		if(s5!=null&&s3.getName().equals(name)) {
			result+=s3.infoStudent()+"\n";
		}
		if(s6!=null&&s4.getName().equals(name)) {
			result+=s4.infoStudent()+"\n";
		}
		return result;
	}
	
	public boolean updateStudent(Student s) {
		if(s1!=null&&s1.getStudentNo().equals(s.getStudentNo())) {
			s1.setGrade(s.getGrade());
			s1.setMajor(s.getMajor());
			s1.setAddress(s.getAddress());
		}else if(s2!=null&&s2.getStudentNo().equals(s.getStudentNo())) {
			s2.setGrade(s.getGrade());
			s2.setMajor(s.getMajor());
			s2.setAddress(s.getAddress());
		}else if(s3!=null&&s3.getStudentNo().equals(s.getStudentNo())) {
			s3.setGrade(s.getGrade());
			s3.setMajor(s.getMajor());
			s3.setAddress(s.getAddress());
		}else if(s4!=null&&s4.getStudentNo().equals(s.getStudentNo())) {
			s4.setGrade(s.getGrade());
			s4.setMajor(s.getMajor());
			s4.setAddress(s.getAddress());
		}
		else if(s5!=null&&s5.getStudentNo().equals(s.getStudentNo())) {
			s3.setGrade(s.getGrade());
			s3.setMajor(s.getMajor());
			s3.setAddress(s.getAddress());
		}else if(s5!=null&&s6.getStudentNo().equals(s.getStudentNo())) {
			s4.setGrade(s.getGrade());
			s4.setMajor(s.getMajor());
			s4.setAddress(s.getAddress());
		}
		else {
			return false;
		}
		return true;
	}

}
