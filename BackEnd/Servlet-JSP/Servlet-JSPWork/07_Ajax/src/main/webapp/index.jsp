<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax통신 활용하기</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<p>ajax : 비동기식으로 서버와 통신을 하는 기술</p>
	<h2>javascript로 ajax통신 구현하기</h2>
	<p>
		javascript로 비동기통신을 구현하려면 js가 제공하는 객체를 이용 <br>
		XMLHttpRequest객체를 이용 <br>
		1. XMLHttpRequest 객체를 생성 <br>
		2. 필요한 속성에 대한 설정 <br>
			- 요청할 서버의 주소, 요청방식 등 <br>
			- 요청이 끝나고 실행할 함수를 설정(callback함수) <br>
		3. 요청보내기 함수 실행 -> send() <br>
	</p>
	<h3>js로 요청보내기</h3>
	<input id="data" type="text">
	<button id="jsSendBtn">js로 ajax통신</button>
	<button id="postBtn">js로 post방식보내기</button>
	<div id="result"></div>
	
	<script>
		const postBtn=document.getElementById("postBtn");
		postBtn.addEventListener("click",e=>{
			const request=new XMLHttpRequest();
			request.open("post","<%=request.getContextPath()%>/js/ajax.do")
			request.onreadystatechange=()=>{
				if(request.readyState==4){
					if(request.status==200){
						document.getElementById("result").innerHTML=request.responseText;
					}
				}
			}
			//post방식으로 요청을 보낼때는 헤더설정을 추가로 해줘야한다.
			//content-type속성값을 설정
			request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			//post방식으로 데이터를 전송할때는 send함수의 매개변수로 데이터를 전송함.
			const val=document.getElementById("data").value;
			request.send("param="+val+"&data=asdf");
			
			document.getElementById("result").innerHTML='<div class="spinner-border text-info"></div>';
		});
	
		const sendBtn=document.getElementById("jsSendBtn");
		sendBtn.addEventListener("click",e=>{
			const paramData=document.getElementById("data").value;
			//서버에 요청을 보내기
			const request=new XMLHttpRequest();
			console.log(request);
			//2. 필수요쳉에 대한 설정
			//open("요청할 방식(method)","요청할 주소");호출
			request.open("get","<%=request.getContextPath()%>/js/ajax.do?param="+paramData);
			//요청이 끝나고 응답이 왔을때 실행할 함수를 지정
			//onreadystatechange속성에 이벤트 함수를 등록
			//ajax통신에 대한 상태관리를 하게되는데 요청상태가 변경될때마다 함수를 등록
			//변경상태는 readyState속성에 저장-> 0~4의 값을 가짐
			//*4 : 응답이 완료된 상태
			//응답코드저장속성은 status임 -> 404(서비스주소를 찾을 수 없을때), 500(서버에러), 200(정상)
			request.onreadystatechange=()=>{
				console.log(request.readyState);
				console.log(request.status);
				if(request.readyState==4){
					let msg="";
					switch(request.status){
						case 200 : msg="정상적으로 통신을 완료함";break;  
						case 404 : msg="요청한 서비스가 없습니다.";break;
					}
					//서버가 보낸 데이터를 가져오기
					//서버가 응답한 데이터는 문자열로 가져옴.
					//responseText속성을 이용해서 데이터를 가져옴.
					console.log(request.responseText);
					document.getElementById("result").innerHTML=msg;
					document.getElementById("result").innerHTML+=request.responseText;
				}
			}
			
			//요청보내기!
			request.send();
		});
	
	</script>
</body>
</html>