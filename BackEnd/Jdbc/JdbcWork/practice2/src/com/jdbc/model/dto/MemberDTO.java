package com.jdbc.model.dto;

import java.sql.Date;
import java.util.Objects;

public class MemberDTO {
	private int idxNumber;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String email;
	private String address;
	private String phone;
	private Date enrollDate;
	    
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(int idxNumber, String memberId, String memberPwd, String memberName, String email, String address,
			String phone, Date enrollDate) {
		super();
		this.idxNumber = idxNumber;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.enrollDate = enrollDate;
	}

	public int getIdxNumber() {
		return idxNumber;
	}

	public void setIdxNumber(int idxNumber) {
		this.idxNumber = idxNumber;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "MemberDto [idxNumber=" + idxNumber + ", memberId=" + memberId + ", memberPwd=" + memberPwd
				+ ", memberName=" + memberName + ", email=" + email + ", address=" + address + ", phone=" + phone
				+ ", enrollDate=" + enrollDate + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(address, email, enrollDate, idxNumber, memberId, memberName, memberPwd, phone);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MemberDTO other = (MemberDTO) obj;
		return Objects.equals(address, other.address) && Objects.equals(email, other.email)
				&& Objects.equals(enrollDate, other.enrollDate) && idxNumber == other.idxNumber
				&& Objects.equals(memberId, other.memberId) && Objects.equals(memberName, other.memberName)
				&& Objects.equals(memberPwd, other.memberPwd) && Objects.equals(phone, other.phone);
	}
}
