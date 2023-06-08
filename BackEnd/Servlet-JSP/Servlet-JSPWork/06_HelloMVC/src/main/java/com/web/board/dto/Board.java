package com.web.board.dto;

import java.sql.Date;

import com.web.notice.dto.Notice;

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
	private String boardWriter;
	private String boardContent;
	private String oriFimeName;
	private String reFileName;
	private Date boardDate;
	private int readCount;
}
