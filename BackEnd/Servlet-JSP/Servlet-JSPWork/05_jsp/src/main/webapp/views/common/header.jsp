<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String headerData="header데이터 선언하기";
%>
<script src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
	header>nav>ul{
		display:flex;
		list-style:none;
		justify-content:space-between;		
	}
	li>a{
		font-size: 30px;
		font-weight: bolder;
		text-decoration: none;
		color:black;
	}
	section{
		height:500px;
		width:100%;
	}
</style> 

	<header>
		<h1>sample header</h1>
		<nav>
			<ul>
				<li><a href="<%=request.getContextPath()%>">메인화면</a></li>
				<li><a href="">공지사항</a></li>
				<li><a href="<%=request.getContextPath()%>/views/board.jsp">게시판</a></li>
				<li><a href="">자료실</a></li>
				<li>추가메뉴</li>				
			</ul>
		</nav>
	</header> 
