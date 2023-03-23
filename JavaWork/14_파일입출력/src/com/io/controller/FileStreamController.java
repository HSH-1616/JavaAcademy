package com.io.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class FileStreamController {

	public void fileSave() {
		// 애클리케이션에서 관리하는 데이터들 지정한 파일에 저장하는 기능
		// 1. OutputStreeam 클래스를 이용 -> FileOutputStream 클래스
		// FileOutputStream클래스 생성
		// 매개변수 있는 생성자를 이용
		// 1) new FileOutputStream(File f);
		// 2) new FileOutputStream(String filename);
		FileOutputStream fos = null;
		try {
			// FileOutputStream fos = new FileOutputStream(new File("test.txt"));
			// 만일 지정한파일 없으면 생성해서 연걸함.
			fos = new FileOutputStream("test");
			// 생성한 스트링을 이용해서 데이터 저장하기
			// write()메소드를 이용
			fos.write(65);
			fos.write(66);
			fos.write(10);
			fos.write(9);
			fos.write(8);
			fos.write(7);

			String name = "유병승";
			fos.write(name.getBytes());
			name = "banana";
			fos.write(name.getBytes());

			// 생성한 Stream을 반드시 닫아줘야한다.
			// close()
			fos.close();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (fos != null)
					fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	// 파일 데이터 불러오기
	public void fileOpen() {
		FileInputStream fis = null;
		try {
			// fis=new FileInputStream(new File("test.txt"));
			fis = new FileInputStream("test");

			// 연결된 파일에서 데이터를 읽어오기
			// read()메소드를 이용
			// 1byte씩 읽어옴 -> int로 반환해줌.
			// 파일의 내용을 끝까지 다 읽어오면 -1을 반환함.
			int value = 0;
			while ((value = fis.read()) != -1) {
//				value = fis.read();
				System.out.println((char) value);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (fis != null)
					fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
	}

	// 데이터를 문자열로 저장하기
	// Reader, Writer클래스 이용하기
	// FileReader, FileWriter클래스를 사용한다.

	public void strSave() {
		FileWriter out = null;

		try {
			// out=new FileWriter(new File("strdata"));
			out = new FileWriter("strdata");
			out.write("여러분 힘내세요 이제 곧 끝나요!! ");
			out.write("뻥이에요");
			out.write(19);

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null)
					out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public void loadStr() {
		FileReader fr = null;

		try {
			fr = new FileReader("strdata");
			// 읽어올때는 raed()메소드를 이용한다.
			int data = 0;
			StringBuffer sb = new StringBuffer();
			while ((data = fr.read()) != -1) {
//				System.out.println((char)data);
				sb.append((char) data);
			}
			System.out.println(sb);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (fr != null)
					fr.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		// 파일을 저장하고 읽는 메소드 구현하기 -> 문자열

		// 파일 저장 메소드 구현
		// 매개변수로 저장할 데이터와 파일명을 받는 메소드

		// 파일읽기 메소드 구현
		// 매개변수로 파일명을 입력받아 파일에 있는 데이터를 가져와 출력하는 메소드
	}

	public void saveMsg(String data,String fileName) {
		FileWriter fw=null;
		try {
			fw=new FileWriter(fileName,true);
			fw.write(data);
		}catch(IOException e) {
			e.printStackTrace();
		}finally {
			try {
				if(fw!=null) fw.close();
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	public void loadMsg(String fileName) {
		FileReader fr=null;
		try {
			fr=new FileReader(fileName);
			int data=0;
			StringBuffer sb= new StringBuffer();
			while((data=fr.read())!=-1) {
				sb.append((char)data);
			}
			System.out.println(sb);
		}catch(IOException e) {
			e.printStackTrace();
			
		}finally {
			try {
				if(fr!=null) fr.close();
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
	}
	
}
