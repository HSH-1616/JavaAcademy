package com.api.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class DateController {
	public static void main(String[] args) {
		// java에서 날짜 처리하기
		// java.util패키지의 Date, Calendar,GregorianCalendar클래스 이용
		// Date-> java.util.Data / java.sql.Date(DB연동날짜)
		// java 8버전
		// java.util.time패키지
		// LocalDate, LocalTime, LocalDateTime 클래스 추가
	
		// 오늘날짜 출력하기
		Date today = new Date();
		System.out.println(today);
		// long값을 대입해서 생성하기
		today = new Date(1654123142129L);
		System.out.println(today);
		int month = today.getMonth();
		System.out.println(month);
		// today.
	
		// Calendar클래스 이용하기
		// Calendar클래스는 추상클래스임
		// Calendar c=new Calendar(); 직접생성이 불가능함.
		Calendar c = Calendar.getInstance();
		System.out.println(c);
		//년월일을 출력하려면 각 데이터를 따로 가져와야함.
		//get(필드값)
		System.out.println("년 : "+c.get(Calendar.YEAR));
		System.out.println("월 : "+(c.get(Calendar.MONTH)+1));
		System.out.println("일 : "+c.get(Calendar.DATE));
		System.out.println("시 : "+c.get(Calendar.HOUR));
		System.out.println("분 : "+c.get(Calendar.MINUTE));
		System.out.println("초 : "+c.get(Calendar.SECOND));						
    		
		int year=c.get(Calendar.YEAR);
		month=c.get(Calendar.MONTH)+1;
		int date=c.get(Calendar.DATE);
		System.out.println(year+"년 "+month+"월 "+date+"일");
		
		//Calendar에 원하는 날짜 세팅하기
		//Calendar().set(항목,설정값)메소드를 이용
		Calendar birthDay=Calendar.getInstance();
		birthDay.set(Calendar.YEAR, 1998);
		birthDay.set(Calendar.MONTH, 8-1);
		birthDay.set(Calendar.DATE,3);
		year=birthDay.get(Calendar.YEAR);
		month=birthDay.get(Calendar.MONTH)+1;
		date=birthDay.get(Calendar.DATE);
		System.out.println(year+"."+month+"."+date);		
		
		//GregorianCalendar 클래스 이용
		GregorianCalendar gc=new GregorianCalendar();
		System.out.println(gc);
		//날짜값을 가져오려면 get메소드를 이용해야한다.
		System.out.println("년 : "+gc.get(Calendar.YEAR));
		gc.set(Calendar.YEAR, 1998);
		System.out.println("년 : "+gc.get(Calendar.YEAR));
		//생성과 동시에 날짜를 설정할 수 있음.
		gc=new GregorianCalendar(1998,8-1,16);
		System.out.println("년 : "+gc.get(Calendar.YEAR));
		System.out.println("월 : "+gc.get(Calendar.MONTH));
		System.out.println("일 : "+gc.get(Calendar.DATE));
		
		//Date클래스와 Calendar, GregorianCalendar호환
		Date dday=new Date(c.getTimeInMillis());
		System.out.println(dday);
		dday=new Date(gc.getTimeInMillis());
		System.out.println(dday);
		
		//날짜클래스를 원하는 패턴의 문자열로 변경해주는 클래스를 제공
		//SimpleDateFormat클래스
		//y : 년
		//M : 월
		//d : 일
		//E : 요일
		//h : 시간
		//m : 분
		//s : 초
		//SSS : 밀리세컨초
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy년 MM월 dd일 E hh:mm:ss");
		//매개변수로 Date클래스를 선언해놓음
		String dateStr=sdf.format(new Date(c.getTimeInMillis()));
		System.out.println(dateStr);
		dateStr=sdf.format(new Date(gc.getTimeInMillis()));
		System.out.println(dateStr);
		
		//Web에서는 날짜데이터가 문자열 처리
		//1997-12-21->Date로 변환하기
		String birthStr="1997-12-21";
		String[] birthArr=birthStr.split("-");
		GregorianCalendar inputDate=new GregorianCalendar(
				Integer.parseInt(birthArr[0]),
				Integer.parseInt(birthArr[1])-1,
				Integer.parseInt(birthArr[2]));
		
		dateStr=sdf.format(inputDate.getTime());		
		System.out.println(dateStr);
		
		//SimpleDateFormat 클래스가 제공하는 메소드 이용하기
		//parse()
		SimpleDateFormat convert
			=new SimpleDateFormat("yyyy-MM-dd");
		try {
			dday=convert.parse(birthStr);
		}catch(ParseException e){
			e.printStackTrace();			
		}
		System.out.println(dday);
			
		//java8버전부터 날짜처리하는 클래스를 추가함
		//java.time패키지에서 제공함.
		LocalDate ld=LocalDate.now();//현재날짜
		System.out.println(ld);
		//원하는 날짜를 세팅하기
		ld=LocalDate.of(1999, 4, 16);
		System.out.println(ld);
		//년, 월, 일 출력하기
		year=ld.getYear();
		month=ld.getMonthValue();
		date=ld.getDayOfMonth();
		System.out.println(year+"."+month+"."+date);
		
		//LocalTime : 시간에 대한 설정하는 클래스
		LocalTime lt=LocalTime.now();
		System.out.println(lt);
		//시간을 설정해서 출력하기
		lt=LocalTime.of(12,50,00);
		System.out.println(lt);
		//시간, 분, 초 따로 출력하기
		lt=LocalTime.now();
		System.out.println(lt.getHour());
		System.out.println(lt.getMinute());
		System.out.println(lt.getSecond());
		
		//LocalDateTime클래스 : 날짜와 시간을 모두 저장하는 클래스
		LocalDateTime ldt=LocalDateTime.now();
		System.out.println(ldt);
		ldt=LocalDateTime.of(2000,11,16,11,30);
		System.out.println(ldt);
		System.out.println(ldt.getYear());
		System.out.println(ldt.getMonthValue());
		System.out.println(ldt.getHour());
		
		
		//날짜사이 간격을 계산해주는 메소드 이용하기
		long result=ChronoUnit.DAYS.between(ldt, LocalDateTime.now());
		System.out.println("예린씨가 살아온 날 : "+result);
		result=ChronoUnit.MONTHS.between(ldt, LocalDateTime.now());
		System.out.println("에린씨가 살아온 개월수 : "+result);
		
		//DB연동해야함 java.sql.Date클래스를 이용함.
		
		//LocalDate -> Date
		Date temp=java.sql.Date.valueOf(LocalDate.now());
		System.out.println(temp);
		//LocalDateTime -> Date
		temp=java.sql.Timestamp.valueOf(ldt);
		System.out.println(temp);
		
		//Date -> LocalDate
		LocalDate ld2=new java.sql.Date(gc.getTimeInMillis()).toLocalDate();
		System.out.println(ld2);
		//Date -> LocalDateTime
		LocalDateTime ldt2= new java.sql.Timestamp(new Date().getTime()).toLocalDateTime();
	}
}
