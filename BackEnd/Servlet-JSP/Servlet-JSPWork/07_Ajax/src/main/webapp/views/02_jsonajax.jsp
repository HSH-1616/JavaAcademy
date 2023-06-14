<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>json으로 데이터 가져오기</title>
<script src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<body>
	<h2>json을 이용해서 데이터 통신하기</h2>
	<p>서버와 클라이언트가 데이터를 주고받을때 문자열을 js object표현 방식으로 처리하자</p>
	<ul>
		java에서 생성한 객체(Vo,Collection들...)를 자동으로 변환해주는 라이브러리를 사용함
		<li>jsonsimple.jar -> JSONObject,JSONArray클래스를 이용해서 처리</li>
		<li>gson.jar -> Gson클래스를 이용</li>
		<li>jackson.jar -> ObjectMapper클래스 이용 * Spring에서 기본사용</li>
	</ul>
	<button id="jsonBtn">jsonSimple</button>
	<button id="gsonBtn">gsonTest</button>
	<button id="jsonparse">test</button>
	<script>
	<%-- $("#jsonparse").click(e=>{
		fetch("<%=request.getContextPath()%>/gsontest.do",
				{method:"post",
				 body:("data":JSON.stringify({"userId":"bsyoo","password":"1234","age":19,
					 "userName":"유병승","gender":'M',"email":"teacherdev09@gmail.com"}))	
				})
				.then(response=>response.json())
				.then(data=>{
					console.log(data);		
				});
	}) --%>
	
	$("#gsonBtn").click(e=>{
		<%-- $.get("<%=request.getContextPath()%>/gsontest.do",
				data=>{
					console.log(data);
				})	 --%>
		$.post("<%=request.getContextPath()%>/gsontest.do",
				{data:JSON.stringify({
						userId:"bsyoo",
						password:"1234",
						userName:"유병승",
						gender:'M',
						age:19,
						email:"afe@adf.com",
						phone:"123",
						address:"경기도시흥시",
						enrollDate:"20230614"
				})},
				data=>{
					
				})
	});	
	
		$("#jsonBtn").click(e=>{
			<%-- $.get("<%=request.getContextPath()%>/basicJson.do",
					function(data){
					console.log(data);
					/* data.forEach(e=>{
						console.log(e);
					}) */					
			}); --%>
			$.ajax({
				url:"<%=request.getContextPath()%>/basicJson.do",
				dataType:"json",
				success:function(data){
					console.log(data);
				},error:function(r,m){
					console.log(r);
					console.log(m);
				}
			})
		});
	</script>

</body>
</html>







