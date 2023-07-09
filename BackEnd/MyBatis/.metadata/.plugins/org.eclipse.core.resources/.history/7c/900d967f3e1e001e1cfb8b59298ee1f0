package com.bs.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString(exclude= {"boardCommentWriter"})
public class BoardComment {
	private int boardCommentNo;	
	private String boardCommentContent;
	private int level;
	private int boardRef;
	private Date boardCommentDate;
	
	private Member boardCommentWriter;
	
}
