<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.web.board.dto.Board"%>
<%
List<Board> boards = (List) request.getAttribute("boards");
%>
<%@ include file="/views/common/header.jsp"%>
<style>
section#board-container {
	width: 600px;
	margin: 0 auto;
	text-align: center;
}

section#board-container h2 {
	margin: 10px 0;
}

table#tbl-board {
	width: 100%;
	margin: 0 auto;
	border: 1px solid black;
	border-collapse: collapse;
	clear: both;
}

table#tbl-board th, table#tbl-board td {
	border: 1px solid;
	padding: 5px 0;
	text-align: center;
}
/*글쓰기버튼*/
input#btn-add {
	float: right;
	margin: 0 0 15px;
}
/*페이지바*/
div#pageBar {
	margin-top: 10px;
	text-align: center;
	background-color: rgba(0, 188, 212, 0.3);
}

div#pageBar span.cPage {
	color: #0066ff;
}
</style>
<section id="board-container">
	<h2>게시판</h2>
	<table id="tbl-board">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>첨부파일</th>
			<th>조회수</th>
		</tr>
		<%
		if (boards.isEmpty()) {
		%>
		<tr>
			<td colspan="5">조회된 공지사항이 없습니다.</td>
		<tr>
			<%
			} else {
			for (Board b : boards) {
			%>
		
		<tr>
			<td><%=b.getBoardNo()%></td>
			<td><%=b.getBoardTitle()%></td>
			<td><%=b.getBoardWriter()%></td>
			<td><%=b.getBoardDate()%></td>
			<td>
				<%
				if (b.getOriFimeName() != null) {
				%> <img
				src="<%=request.getContextPath()%>/images/file.png" width="20">
				<%
				}
				%>
			</td>
			<td><%=b.getReadCount()%></td>
		</tr>
		<%
		}
		}
		%>
	</table>
	<div id="pageBar">
		<%=request.getAttribute("pageBar")%>
	</div>

</section>
<%@ include file="/views/common/footer.jsp"%>
