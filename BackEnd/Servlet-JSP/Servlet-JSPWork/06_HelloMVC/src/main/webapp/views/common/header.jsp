<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.web.member.dto.MemberDTO"%>
<%
MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
Cookie[] cookies = request.getCookies();
String saveId = null;
if (cookies != null) {
	for (Cookie c : cookies) {
		if (c.getName().equals("saveId")) {
	saveId = c.getValue();
	break;
		}
	}
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloMVC</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
</head>
<body>
	<div id="container">
		<header>
			<h1>HelloMVC</h1>
			<div class="login-container">
				<%
				if (loginMember == null) {
				%>
				<form id="loginFrm" action="<%=request.getContextPath()%>/login.do"
					method="post" onsubmit="return fn_validation();">
					<table>
						<tr>
							<td><input type="text" name="userId" id="userId"
								placeholder="아이디" value="<%=saveId != null ? saveId : ""%>">
							</td>
						</tr>
						<tr>
							<td><input type="password" name="password" id="password"
								placeholder="패스워드"></td>
							<td><input type="submit" value="로그인"></td>
						</tr>
						<tr>
							<td><input type="checkbox" name="saveId" id="saveId"
								<%=saveId != null ? "checked" : ""%>> <label for="saveId">아이디저장</label>
								<input type="button" value="회원가입"
								onclick="location.assign(`<%=request.getContextPath()%>/member/enrollMember.do`)">
							</td>
						</tr>
					</table>
				</form>
				<%
				} else {
				%>
				<table id="logged-in">
					<tr>
						<td colspan="2"><%=loginMember.getUserName()%>님, 환영합니다.</td>
					</tr>
					<tr>
						<td><input type="button" value="내 정보보기"
							onclick="location.assign('<%=request.getContextPath()%>/member/memberView.do?userId=<%=loginMember.getUserId() %>')">
							</td>
						<td><input type="button" value="로그아웃"
							onclick="location.replace('<%=request.getContextPath()%>/logout.do')">
						</td>
					</tr>
				</table>
				<%
				}
				%>
			</div>
			<nav>
				<ul class="main-nav">
					<li class="home"><a href="">Home</a></li>
					<li class="notice"><a href="">공지사항</a></li>
					<li class="board"><a href="">게시판</a></li>
				</ul>
			</nav>
		</header>
		<script>
			const fn_validation=()=>{
				const userId=$("#userId").val();
				if(userId.length<4){
					alert('아이디는 4글자이상 입니다.')					
					$("#userId").val("");
					$("#userId").focus();
					return false;
				}
		
				/* if($("#password").length<4){
					return false;
				} */
				
			}
		</script>