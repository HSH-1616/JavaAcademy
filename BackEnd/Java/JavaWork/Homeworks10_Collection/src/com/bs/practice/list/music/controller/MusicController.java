package com.bs.practice.list.music.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.bs.practice.list.music.model.compare.AscTitle;
import com.bs.practice.list.music.model.vo.Music;

public class MusicController {

	private ArrayList<Music> list = new ArrayList();

	public int addList(Music music) {

		list.add(music);

		return 1;
	}

	public int addAtZero(Music music) {

		list.add(0, music);
		return 1;
	}

	public List printAll() {
		return list;
	}

	public Music searchMusic(String title) {
		Music m = new Music();
		m = null;
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getTitle().equals(title)) {
				m = list.get(i);
			}
		}

		return m;

	}

	public Music removeMusic(String title) {
		Music m = new Music();
		Music m1 = new Music();
		
		m=null;
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getTitle().equals(title)) {
				m = list.get(i);			
				list.remove(i);
			}
		}
		
		if (m == null) {
			System.out.println("삭제할 곡이 없습니다.");
		} else {				
			System.out.println(m+"을 삭제 했습니다.");
		}

		return m;
	}

	public Music setMusic(String title, Music music) {

		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getTitle().equals(title)) {
				list.set(i, music);
				music = list.get(i);
			}
		}
		return music;
	}

	public int ascTitle() {
		list.sort(new AscTitle());
		return 1;
	}

	public int descSinger() {
		Collections.sort(list);
		return 1;
	}

}
