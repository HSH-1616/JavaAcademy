<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2>서버에서 전송한 데이터 출력하기</h2>
	<h4>${snacks.get(0).type}${snacks.get(0).name}</h4>
	<h4>${snacks.get(1).type}${snacks.get(1).name}</h4>
	<h4>${snacks.get(2).type}${snacks.get(2).name}</h4>
	<h4>${snacks.get(3).type}${snacks.get(3).name}</h4>
	
	<h2>내장객체에 중복키값으로 저장된 데이터 가져오기</h2>
	<p>El에서 내장객체의 데이터를 가져올때 작은범위부터 큰범위로 탐색함/</p>
	<p>request -> session -> servletContext</p>
	<h3>${snack }</h3>
	<h3>중복된 키값이 있을때 특정 영역에서 데이터를 찾고싶으면 EL이 제공하는 내장객체를 이용한다</h3>
	<p>
		requestScope : request영역에서만 key검색 
		sessionScope : session영역에서만 key검색
		applicationScope : ServletContext영역에서만 key검색<br>		
	</p>
	<h4>${requestScope.snack }</h4>
	<h4>${sessionScope.snack }</h4>
	<h4>${applicationScope.snack }</h4>
	<h4>${requestScope.snacks.get(0).name}</h4>
	
	<h2>파라미터값 출력하기</h2>
	<p>별도의 EL객체를 이용해서 출력 -> param객체이용</p>
	<h3>${param.userId} ${param.password}</h3>
	<p>파라미터값이 다수값인 경우 paramValues를 이용한다.</p>
	<h3>${paramValues.hobby[0]}</h3>
	<h3>${paramValues.hobby[1]}</h3>
	<h3>${paramValues.hobby[2]}</h3>
	<h3>${paramValues.hobby}</h3>
</body>
</html>