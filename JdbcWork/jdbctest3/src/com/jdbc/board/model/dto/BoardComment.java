package com.jdbc.board.model.dto;

import java.sql.Date;
import java.util.Objects;

public class BoardComment {
	private int commentNo;
	private String boardConent;
	private String commentWriter;
	private Date commentDate;
	
	public BoardComment() {
		// TODO Auto-generated constructor stub
	}

	public BoardComment(int commentNo, String boardConent, String commentWriter, Date commentDate) {
		super();
		this.commentNo = commentNo;
		this.boardConent = boardConent;
		this.commentWriter = commentWriter;
		this.commentDate = commentDate;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getBoardConent() {
		return boardConent;
	}

	public void setBoardConent(String boardConent) {
		this.boardConent = boardConent;
	}

	public String getCommentWriter() {
		return commentWriter;
	}

	public void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	@Override
	public String toString() {
		return "BoardComment [commentNo=" + commentNo + ", boardConent=" + boardConent + ", commentWriter="
				+ commentWriter + ", commentDate=" + commentDate + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(boardConent, commentDate, commentNo, commentWriter);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BoardComment other = (BoardComment) obj;
		return Objects.equals(boardConent, other.boardConent) && Objects.equals(commentDate, other.commentDate)
				&& commentNo == other.commentNo && Objects.equals(commentWriter, other.commentWriter);
	}
	
	
}
