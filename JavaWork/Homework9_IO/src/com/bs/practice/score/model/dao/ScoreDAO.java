package com.bs.practice.score.model.dao;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class ScoreDAO {

	public void saveScore(String name, int kor, int eng, int math, int sum, double avg) {

		try (FileOutputStream fos = new FileOutputStream("StudentScore");
				DataOutputStream dos = new DataOutputStream(fos);) {

			dos.writeUTF(name);
			dos.writeInt(kor);
			dos.writeInt(eng);
			dos.writeInt(math);
			dos.writeInt(sum);
			dos.writeDouble(avg);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public DataInputStream readScore() throws FileNotFoundException {
		FileInputStream fis = new FileInputStream("StudentScore");
		DataInputStream dis = new DataInputStream(fis);
		try {
			String name = dis.readUTF();
			int kor = dis.readInt();
			int eng = dis.readInt();
			int math = dis.readInt();
			int sum = dis.readInt();
			double avg = dis.readDouble();

		} catch (IOException e) {
			e.printStackTrace();
		}

		return dis;

	}

}
