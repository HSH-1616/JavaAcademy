package com.bs.practice.leap.controller;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;

public class LeapController {

	public boolean isLeapYear(int year) {

		if (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) {
			return true;
		}
		return false;
	}

	public long leapDate(Calendar c) {
		int y = c.get(Calendar.YEAR);
		int m = c.get(Calendar.MONTH);

		long count = 0;
		for (int i = 1; i < y; i++) {
			if (isLeapYear(i)) {
				count += 366;
			} else {
				count += 365;
			}
		}
		for (int i = 1; i < m; i++) {
			if (i == 1 || i == 3 || i == 5 || i == 7 || i == 8 || i == 10) {
				count += 31;
			} else if (i == 4 || i == 6 || i == 9 || i == 11) {
				count += 30;
			}

			if (isLeapYear(i) && i == 2) {
				count += 29;
			} else {
				count += 28;
			}
		}
		count += c.get(Calendar.DATE) - 1;
		return count;
	}

	public long easyLeapDate(Calendar c) {
		LocalDateTime ldt = LocalDateTime.of(0001, 01, 01, 01, 01);
		long count = ChronoUnit.DAYS.between(ldt, LocalDateTime.now());
		return count;
	}

}
