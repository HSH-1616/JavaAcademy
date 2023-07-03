<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- <%@include file="/views/common/header.jsp" %> --%>
<!-- jsp액션태그 이용해서 헤더 불러오기 -->
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:include page="/views/common/header.jsp">
	<jsp:param name="title" value="메인화면" />
</jsp:include>

<section>
	<h3>본문내용을 출력하자</h3>
	<%-- <p>접속한 회원 : <%=userId %> </p> --%>
</section>
<%-- <jsp:forward page="/views/board.jsp"/> --%>
<h3>커스텀 액션 태그 -> JSTL 이용하기</h3>
<h4>EL표현식 활용하기</h4>
<p>java코드로 생성된 데이터를 페이지에 출력해주는 표현식</p>
<p><%--${ }-> --%> 공용객체(request,session,Application) 저장된 데이터를 불러와 출력함</p>
<h3>
	<a href="<%=request.getContextPath()%>/views/el/eltest.jsp">EL사용하기</a>
</h3>

</body>
</html>