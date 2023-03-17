package bs.student.dao;

import bs.student.dto.Student;

public class StudentDao2 {
	
	private static StudentDao2 dao;
	
	private Student[] students=new Student[10];
	
	private StudentDao2() {}
	
	public static StudentDao2 getStudentDao() {
		if(dao==null) dao=new StudentDao2();
		return dao;
	}
	
	public boolean insertStudent(Student s) {
//		boolean result=false;
		for(int i=0;i<students.length;i++) {
			if(students[i]==null) {
				students[i]=s;
				return true;
//				result=true;
//				break;
			}
		}
		return false;
//		return result;
	}
	
	public Student[] infoStudentAll() {
//		String info="";
		Student[] searchStudent;
		int searchdata=0;
 		for(Student s : students) {
			if(s!=null) searchdata++;
		}
 		searchStudent=new Student[searchdata];
 		int index=0;
 		for(Student s : students) {
 			if(s!=null) searchStudent[index++]=s;
 		}
		return searchStudent;
	}
	
	public String searchByName(String name) {
		String result="";
		for(Student s : students) {
			if(s!=null&&s.getName().equals(name)) {
				result+=s.infoStudent()+"\n";
			}
		}
		return result;
	}
	
	public boolean updateStudent(Student s) {
		for(Student saveStudent : students) {
			if(saveStudent!=null
					&&saveStudent.getStudentNo().equals(s.getStudentNo())) {
				saveStudent.setGrade(s.getGrade());
				saveStudent.setAddress(s.getAddress());
				saveStudent.setMajor(s.getMajor());
				return true;
			}
		}
		return false;
	}

}
