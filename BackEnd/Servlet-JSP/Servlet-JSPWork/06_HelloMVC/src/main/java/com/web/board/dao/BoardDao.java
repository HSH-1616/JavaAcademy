package com.web.board.dao;

import static com.web.member.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.web.board.dto.Board;
import com.web.notice.dao.NoticeDao;
import com.web.notice.dto.Notice;

public class BoardDao {

	private Properties sql = new Properties();

	public BoardDao(){
		String path=NoticeDao.class.getResource("/sql/board/boardsql.properties").getPath();
		
		try {
			sql.load(new FileReader(path));
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	public List<Board> selectBoard(Connection conn, int cPage, int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Board> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectBoard"));
			pstmt.setInt(1,(cPage-1)*numPerpage+1);
			pstmt.setInt(2,cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(getBoard(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	private Board getBoard(ResultSet rs) throws SQLException{
		return Board.builder()
				.boardNo(rs.getInt("board_no"))
				.boardTitle(rs.getString("board_title"))
				.boardWriter(rs.getString("board_writer"))
				.boardContent(rs.getString("board_content"))
				.oriFimeName(rs.getString("board_original_filename"))
				.reFileName(rs.getString("board_renamed_filename"))
				.boardDate(rs.getDate("board_date"))
				.readCount(rs.getInt("board_readcount"))
				.build();
	}
}
