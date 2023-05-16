package bs.student.dto;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Objects;

public class Student implements Serializable {
	
	private static final long serialVersionUID = 8961184291262977827L;
	
	private static int count;
	private String name;
	private String studentNo;
	private String major;
	private int grade;
	private String address;
	private char gender;

	{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		studentNo = sdf.format(System.currentTimeMillis()) + "_" + (++count);
	}

	public Student() {
	}

	public Student(String name, // String studentNo,
			String major, int grade, String address, char gender) {
		this.name = name;
		// this.studentNo=studentNo;
		this.major = major;
		this.address = address;
		this.grade = grade;
		this.gender = gender;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStudentNo() {
		return this.studentNo;
	}

	public void setStudentNo(String studentNo) {
		this.studentNo = studentNo;
	}

	public String getMajor() {
		return this.major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public int getGrade() {
		return this.grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public char getGender() {
		return this.gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public String infoStudent() {
		return this.studentNo + " " + this.name + " " + this.major + " " + this.grade + " " + this.address + " "
				+ this.gender;
	}

	@Override
	public boolean equals(Object s) {
		if (this == s)
			return true;
		if (s instanceof Student) {
			Student target = (Student) s;
			if (this.name.equals(target.name) && this.grade == target.grade && this.gender == target.gender
					&& this.address.equals(target.address) && this.major.equals(target.major))
				;
			return true;
		}

		return false;
	}

	@Override
	public int hashCode() {
		return Objects.hash(name, grade, gender, address, major);
	}
	
	@Override
	public String toString() {
		return infoStudent();
	}

}
