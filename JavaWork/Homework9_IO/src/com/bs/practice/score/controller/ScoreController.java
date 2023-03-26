package com.bs.practice.score.controller;

import java.io.DataInputStream;
import java.io.FileNotFoundException;

import com.bs.practice.score.model.dao.ScoreDAO;

public class ScoreController {
	ScoreDAO sd=new ScoreDAO();
	
	public void saveScore(String name, int kor, int eng, int math, int sum, double avg) {
		sd.saveScore(name, kor, eng, math, sum, avg);	
	}
	
	public DataInputStream readScore() throws FileNotFoundException{		
		
		return sd.readScore();
	}

}
