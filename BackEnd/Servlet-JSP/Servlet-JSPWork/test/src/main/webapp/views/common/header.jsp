<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/style1.css"rel="stylesheet" type="text/css">
	
	<script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
</head>
<body>
<div id="container">
	<header>
		<h1>HelloMVC</h1>
		<div class="login-container">
			<form id="loginFrm" method="post">
				<table>
					<tr>
						<td><input type="text" name="userId" id="userId"
							placeholder="아이디" value=></td>
					</tr>
					<tr>
						<td><input type="password" name="password" id="password"
							placeholder="패스워드"></td>
						<td><input type="submit" value="로그인"></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="saveId" id="saveId">
							<label for="saveId">아이디저장</label> <input type="button"
							value="회원가입"
							onclick="location.assign(`<%=request.getContextPath()%>/memberenroll.do`)">
						</td>
					</tr>
				</table>
			</form>

		</div>
		<nav>
			<ul class="main-nav">
				<li class="home"><a href="">Home</a></li>
				<li id="notice"><a href="">공지사항</a></li>
				<li id="board"><a href="">게시판</a></li>
			</ul>
		</nav>
	</header>
	</div>
</body>
</html>