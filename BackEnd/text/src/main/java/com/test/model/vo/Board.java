package com.test.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class Board {
	public int no;
	public String title;
	public String writer;
	public String content;
	public Date boardDate;
}
