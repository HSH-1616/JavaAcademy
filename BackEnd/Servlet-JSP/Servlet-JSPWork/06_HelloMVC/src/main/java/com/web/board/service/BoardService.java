package com.web.board.service;

import static com.web.member.common.JDBCTemplate.close;
import static com.web.member.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.web.board.dao.BoardDao;
import com.web.board.dto.Board;

public class BoardService {
	private BoardDao dao=new BoardDao();
	
	public List<Board> selectBoard(int cPage, int numPerpage){
		Connection conn=getConnection();
		List<Board> list=dao.selectBoard(conn,cPage,numPerpage);
		close(conn);
		return list;
	}
}
