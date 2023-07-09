package com.bs.model.vo;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Board {
	private int boardNo;
	private String boardTitle;
	//private String boardWriter;
	private Member boardWriter;
	private String boardContent;
	private Date boardDate;
	private int boardReadCount;
	
	private List<BoardComment> comments;
	
}
