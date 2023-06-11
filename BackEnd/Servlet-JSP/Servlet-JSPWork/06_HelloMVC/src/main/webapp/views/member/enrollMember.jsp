<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<section id="enroll-container">
	<h2>회원 가입 정보 입력</h2>
	<form action="<%=request.getContextPath() %>/member/enrollMemberEnd.do" method="post" 
	>
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" placeholder="4글자이상" name="userId"
					id="userId_">
					<input type="button" onclick="fn_duplicateId();" value="중복확인">					
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><input type="password" name="password" id="password_"><br>
				</td>
			</tr>
			<tr>
				<th>패스워드확인</th>
				<td><input type="password" id="password_2"><br></td>
			</tr>
			<tr>
				<th></th>
				<td></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="userName" id="userName"><br>
				</td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type="number" name="age" id="age"><br>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" placeholder="abc@xyz.com" name="email"
					id="email"><br></td>
			</tr>
			<tr>
				<th>휴대폰</th>
				<td><input type="tel" placeholder="(-없이)01012345678"
					name="phone" id="phone" maxlength="11" required><br></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" placeholder="" name="address"
					id="address"><br></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="gender" id="gender0" value="M"> <label
					for="gender0">남</label> 
					<input type="radio" name="gender" value="F"
					id="gender1"> <label for="gender1">여</label>
				</td>
			</tr>
			<tr>
				<th>취미</th>
				<td><input type="checkbox" name="hobby" id="hobby0" value="운동"><label
					for="hobby0">운동</label> 
					<input type="checkbox" name="hobby" value="등산"
					id="hobby1"><label for="hobby1">등산</label> 
					<input
					type="checkbox" name="hobby" id="hobby2" value="독서"><label
					for="hobby2">독서</label><br /> 
					<input type="checkbox" name="hobby" value="게임"
					id="hobby3"><label for="hobby3">게임</label> 
					<input
					type="checkbox" name="hobby" id="hobby4" value="여행"><label
					for="hobby4">여행</label><br /></td>
			</tr>
		</table>
		<input type="submit" value="가입" 
		onclick="return fn_validate2();"> 
		<input type="reset"
			value="취소">
	</form>
</section>
<script>
	function fn_validate2(){
		const userId=$("#userId_").val();
		if(userId.length<4){
			alert("아이디는 4글자 이상으로 작성하세요!!");
			$("#userId_").focus();
			return false;
		}
	}
	$("#password_2").keyup(e=>{
		const password=$("#password_").val();
		const passwordCheck=$(e.target).val();
		let color,msg;
		if(password==passwordCheck){
			color="green";msg="비밀번호가 일치합니다.";
		}else{
			color="red";msg="비밀번호가 일치하지 않습니다.";
		}
		const td=$(e.target).parents("tr").next().find("td").html("");
		
		$("<p>").css("color",color).text(msg).appendTo(td);
	});
	const fn_duplicateId=()=>{
		const userId=$("#userId_").val();
		if(userId.length>=4){
			open("<%=request.getContextPath()%>/member/idDuplicate.do?userId="+userId,
				"_blank","width=300, height=200");
		}else{
			alert('아이디는 4글자이상 입력하세요!');	
		}
	}
</script>
<%@ include file="/views/common/footer.jsp" %>