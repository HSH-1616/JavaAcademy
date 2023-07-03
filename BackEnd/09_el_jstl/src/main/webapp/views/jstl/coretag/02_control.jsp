<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.el.model.vo.Snack"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제어문 활용하기</title>
</head>
<body>
	<h2>JSTL의 제어문태그 활용하기</h2>
	<p>조건문(if, choose), 반복문(forEach)</p>
	<h3>c:if태그 이용하기</h3>
	<p>자바에서 if문을 사용한것과 동일하다.</p>
	<p>
		c:if<br> test : 조건식 => true, false EL표현식으로 작성 var : 조건식에 결과를 저장하는
		변수
	</p>
	<c:set var="su" value="10" />
	<c:set var="su2" value="20" />
	<c:if test="${su<su2 }">
		<p>
			<c:out value="${su }" />
			는
			<c:out value="${su2 }" />
			보다 작다
		</p>
		<c:if test="${su<15 }">
			<p>우와 재미있다.</p>
		</c:if>
	</c:if>

	<%
	List<String> names = List.of("유병승", "조장흠", "김찬은", "허성현", "홍승우");
	request.setAttribute("names", names);
	%>

	<c:if test="${not empty names}">
		<p>이름이 저장되어 있습니다.</p>
	</c:if>

	<c:if test="${empty names}">
		<p>이름이 저장되지 않았습니다.</p>
	</c:if>

	<c:if test="${empty names}" var="result">

	</c:if>
	<p>${result }</p>

	<h3>c:choose태그 이용하기</h3>
	<p>java에서 switch문을 사용하는 것과 비슷, if ~ else if ~ else</p>
	<c:choose>
		<c:when test="${su>10}">
			<p>10보다 크다</p>
		</c:when>
		<c:when test="${su>5}">
			<p>5보다 크다</p>
		</c:when>
		<c:otherwise>
			<p>그냥 수다</p>
		</c:otherwise>
	</c:choose>

	<h3>반복문 활용하기</h3>
	<p>c:forEach태그를 이용</p>

	<p>
		1. 기본 반복문 활용 : i를 순차적으로 출력하는 방법 <br> 2. 리스트, 배열에 저장된 데이터를
		출력(foreach) <br>
	</p>

	<ul>
		c:forEach태그
		<li>begin : 시작번호</li>
		<li>end : 끝번호</li>
		<li>step : 간격</li>
		<li>var : 변경되는 값을 저장하는 변수</li>
		<li>items : 배열, 리스트</li>
		<li>varStatus : 반복문의 정보를 가지고 있는 객체(index, 반복횟수, 시작, 끝 정보제공)</li>
	</ul>

	<h4>기본반복문 실행</h4>
	<p>1~10까지 출력하기</p>
	<div>
		<c:forEach begin="1" end="10" step="1" var="i">
			<p>
				<c:out value="${i }" />
			</p>
		</c:forEach>
		<c:forEach begin="1" end="6" step="1" var="i">
			<h ${i}>하하하 깝죽대지마라</h${i}>
		</c:forEach>
	</div>
	<h2>리스트, 배열에 저장된 데이터 반복하기</h2>
	<div>${names }</div>
	<ul>
		<!-- for(String name:names){} -->
		<c:forEach var="name" items="${names }" varStatus="vs">
			<li>${vs.first}${vs.last}${vs.index} ${vs.count} ${name}</li>
		</c:forEach>
	</ul>
	<%
	List<Snack> snack = List.of(Snack.builder().type("초콜렛").name("투유").price(1200).weight(80).build(),
			Snack.builder().type("젤리").name("마이구미").price(1300).weight(60).build(),
			Snack.builder().type("아이스크림").name("뽕따").price(1500).weight(120).build(),
			Snack.builder().type("캔디").name("이클립스").price(2500).weight(30).build(),
			Snack.builder().type("과자").name("맛동산").price(2400).weight(100).build());
	request.setAttribute("snacks", snack);
	%>

	<div>
		<h3>과자보유현황</h3>
		<table>
			<tr>
				<th>종류</th>
				<th>이름</th>
				<th>가격</th>
				<th>무게</th>
				<th>재고</th>
			</tr>
			<c:if test="${empty snacks }">
				<tr>
					<td colspan="5">검색된 과자가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty snacks }">
				<c:forEach var="s" items="${snacks }" varStatus="vs">
					<tr
						style="background-color:${vs.first||vs.last?'magenta':'lightgray'}">
						<td><c:out value="${s.type }" /></td>
						<td><c:out value="${s.name }" /></td>
						<td><c:out value="${s.price }" /></td>
						<td><c:out value="${s.weight }" /></td>
						<td><c:out value="0" /></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>

	<h4>c:forTokens태그</h4>
	<ul>
		<li>var : 분할된 값이 저장되는 변수</li>
		<li>item : 분할할 대상이 되는 문자열</li>
		<li>delims : 기준이 되는 기호</li>
	</ul>
	<c:forTokens var="h" items="운동,여행,코딩,게임" delims=",">
		<p>${h}</p>
	</c:forTokens>
	<h4>그외 코어태그 활용하기</h4>
	<h4>c:import태그</h4>
	<p>다른페이지를 불러와 내용을 변수에 저장하는 태그</p>
	<c:import url="/views/common/header.jsp" var="header1">
		<c:param name="title" value="import" />
	</c:import>

	<div>${header1}</div>

	<h4>c:catch태그</h4>
	<%
	String name = null;
	%>
	<c:catch var="e">
		<%=name.length()%>
	</c:catch>
	<c:out value="${e }"/>
	
</body>
</html>