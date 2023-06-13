<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ include file="/views/common/header.jsp" %>
<section id="content">
	<h2 align="center" style="margin-top:200px">
		안녕하세요,MVC입니다.
	</h2>
	<button id="memberAll">전체회원조회</button>
	<input type="text" id="userId"><button>아이디조회</button>
	<div id="memberList"></div>
</section>
<%@ include file="/views/common/footer.jsp" %>		
