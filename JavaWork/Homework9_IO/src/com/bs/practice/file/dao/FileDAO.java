package com.bs.practice.file.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class FileDAO {

	public boolean checkName(String file) {

		File file1 = new File(file);

		return file1.isFile();

	}

	public void fileSave(String file, String s) {
		File f = new File(file);
		FileWriter w = null;
		try {
			f.createNewFile();
			w = new FileWriter(file);
			w.write(s);

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (w != null) {
					w.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public StringBuilder fileOpen(String file) {
		FileReader fr = null;
		StringBuilder sb = new StringBuilder();
		try {
			fr = new FileReader(file);
			int content = 0;
			while ((content = fr.read()) != -1) {
				sb.append((char) content);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (fr != null) {
					fr.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return sb;
	}

	public void fileEdit(String file, String s) {
		FileWriter fw=null;
		try {
			fw=new FileWriter(file,true);
			fw.write(s);
		}catch(IOException e) {
			e.printStackTrace();
		}finally {
			try {
				if(fw!=null) {
					fw.close();
				}
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
	}

}
