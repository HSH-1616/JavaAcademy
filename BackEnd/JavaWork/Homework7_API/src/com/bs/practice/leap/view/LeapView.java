package com.bs.practice.leap.view;

import java.util.Calendar;

import com.bs.practice.leap.controller.LeapController;

public class LeapView {
	LeapController lc = new LeapController();

	public LeapView() {
		Calendar c= Calendar.getInstance();
		int year=c.get(Calendar.YEAR);
		System.out.println(year+"은 "+(lc.isLeapYear(year)?"윤년입니다.":"평년입니다."));
		System.out.println("총 날짜 수 : "+lc.leapDate(c));
		System.out.println("총 날짜 수 : "+lc.easyLeapDate(c));
	}
}
