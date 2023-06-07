package com.member.model;

import java.sql.Date;

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
	private String userPwd;
	private String userName;
	private int age;
	private char gender;
	private String email;
	private String phone;
	private String address;
	private String[] hobby;
	private Date enrollDate;
}	
