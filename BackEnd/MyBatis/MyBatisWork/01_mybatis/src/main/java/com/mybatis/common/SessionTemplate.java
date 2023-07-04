package com.mybatis.common;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SessionTemplate {
	// mybatis가 제공하는 SqlSession객체를 생성해주는 공용메소드를 선언 -> static
	public static SqlSession getSession() {
		// SqlSession객체를 생성하는 방법
		
		// 1. SqlSessionFactoryBuilder클래스의 build() 메소드 이용
		// - SqlSessionFactoryBuilder생성
		// - build()메소드를 실행, build()메소드의 인수로 mybatis-config.xml파일을 전달

		// 2. SqlSessionFactory클래스를 가져올 수 있음
		// - openSession()메소드를 이용,
		// - 인수로 true,false설정 -> autoCommit에 대한 설정

		// 3. SqlSession클래스를 가져옴
		
		SqlSession session=null;
		String file="mybatis-config.xml";
		try(InputStream is=Resources.getResourceAsStream(file);) {						
			SqlSessionFactoryBuilder builder=new SqlSessionFactoryBuilder();
			SqlSessionFactory factory=builder.build(is);
			session=factory.openSession(false);
		}catch(IOException e){
			e.printStackTrace();
		}		
		return session;
	}
	
}
