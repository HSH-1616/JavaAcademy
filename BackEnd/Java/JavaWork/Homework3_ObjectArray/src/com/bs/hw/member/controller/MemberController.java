package com.bs.hw.member.controller;

import com.bs.hw.member.model.vo.Member;

public class MemberController {
	public int SIZE = 10;
	private Member[] m = new Member[SIZE];

	public int existMemberNum() {
		int count = 0;

		for (int i = 0; i < m.length; i++) {
			if (m[i] != null) {
				count++;
			}
		}
		return count;
	}

	public boolean checkId(String inputId) {
		boolean flag = true;

		for (int i = 0; i < m.length; i++) {
			if (m[i] != null && m[i].getId().equals(inputId)) {
				flag = false;
			}

		}
		return flag;
	}

	public void insertMember(String id, String name, String password, String email, char gender, int age) {

		for (int i = 0; i < m.length; i++) {
			if (m[i] == null) {
				m[i] = new Member();
				m[i].setId(id);
				m[i].setName(name);
				m[i].setPassword(password);
				m[i].setEmail(email);
				m[i].setGender(gender);
				m[i].setAge(age);
				break;
			}
		}
	}

	public String searchId(String id) {
		String result = "";
		for (Member Id : m) {
			if (Id != null && Id.getId().equals(id)) { // 질문
				result = Id.inform();
				break;
			} else {
				result = "찾으신 결과가 업습니다.";
			}
		}
		return result;
	}

	public Member[] searchName(String name) {
		Member temp[] = new Member[SIZE];
		for (int i = 0; i < m.length; i++) {
			if (m[i] != null && m[i].getName().equals(name)) {
				temp[i] = m[i];
			}
		}
		return temp;
	}

	public Member[] searchEmail(String email) {
		Member temp[] = new Member[SIZE];
		for (int i = 0; i < m.length; i++) {
			if (m[i] != null && m[i].getEmail().equals(email)) {
				temp[i] = m[i];
			}
		}
		return temp;
	}

	public boolean updatePassword(String id, String password) {
		boolean flag = false;
		for (int i = 0; i < m.length; i++) {
			if (m[i] != null && m[i].getId().equals(id)) {
				m[i].setPassword(password);
				flag = true;
			}
		}
		return flag;
	}

	public boolean updateName(String id, String name) {
		boolean flag = false;
		for (int i = 0; i < m.length; i++) {
			if (m[i] != null && m[i].getId().equals(id)) {
				m[i].setName(name);
				flag = true;
			}
		}
		return flag;
	}

	public boolean updateEmail(String id, String email) {
		boolean flag = false;
		for (int i = 0; i < m.length; i++) {
			if (m[i] != null && m[i].getId().equals(id)) {
				m[i].setEmail(email);
				flag = true;
			}
		}
		return flag;
	}

	public boolean delete(String id) {
		boolean flag = false;
		for (int i = 0; i < m.length; i++) {
			if (m[i] != null && m[i].getId().equals(id)) {
				m[i] = null;
				flag = true;
			}
		}
		return flag;
	}

	public void delete() {
		for (int i = 0; i < m.length; i++) {
			m[i] = null;
		}
	}

	public Member[] printAll() {
		Member[] temp = new Member[SIZE];
		for (Member print : m) {
			if (m != null) {
				temp = m;
			}
		}
		return temp;
	}

}
