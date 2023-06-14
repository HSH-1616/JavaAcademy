package com.web.member.model.vo;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Arrays;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Member {
	private String userId;
	private String password;
	private String userName;
	private int age;
	private char gender;
	private String email;
	private String phone;
	private String address;
	private String[] hobby;
	private Date enrollDate;
	
	
	@Override
	public String toString() {
		return userId+"$"+userName+"$"+age+"$"+gender+"$"
				+email+"$"+phone+"$"+address+"$"+Arrays.toString(hobby)
				+"$"+new SimpleDateFormat("yyyy-MM-dd").format(enrollDate);
	}
}









