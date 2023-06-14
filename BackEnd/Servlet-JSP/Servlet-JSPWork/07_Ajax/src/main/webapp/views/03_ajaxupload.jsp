<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax파일 업로드시키기</title>
<script src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<body>
	<h2>ajax를 이용해서 파일 업로드하기</h2>
	<input type="file" id="upfile" multiple>
	<button id="uploadBtn">업로드파일</button>
	<script>
		$("#uploadBtn").click(e=>{
			//js가 제공하는 FormData클래스를 이용.
			const form=new FormData();
			//append로 서버에 전송할 데이터를 넣을수 있음.
			//key:value형식으로 저장
			const fileInput=$("#upfile");
			console.log(fileInput);
			$.each(fileInput[0].files,(i,f)=>{
				form.append("upfile"+i,f);
			});
			form.append("name","유병승");
			$.ajax({
				url:"<%=request.getContextPath()%>/fileUpload",
				data:form,
				type:"post",
				processData:false,
				contentType:false,
				success:data=>{
					alert("업로드완료");
				},error:(r,m)=>{
					alert("업로드실패"+m);
				},complete:()=>{
					$("#upfile").val('');	
				}
			});
		});
	</script>
	
	<h2>업로드 이미지 미리보기 기능</h2>
	<img src="https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available_87543-11093.jpg?w=996"
	width="100" height="100" id="profile">
	<input type="file" style="display:none" id="profileInput" accept="image/*">
	<input type="file" id="upfiles" multiple accept="images/*">
	<div id="uploadpreview">
		
	</div>
	<script>
		$("#profile").click(e=>{
			$("#profileInput").click();
		});
		
		$("#profileInput").change(e=>{
			const reader=new FileReader();
			reader.onload=e=>{
				//e.target.result속성에 변경된 file이 나옴.
				$("#profile").attr("src",e.target.result);
			}
			reader.readAsDataURL(e.target.files[0]);
		});
		
		$("#upfiles").change(e=>{
			$("#uploadpreview").html('');
			const files=e.target.files;
			const reader=new FileReader();
			
			$.each(files,(i,f)=>{
				const reader=new FileReader();
				reader.onload=e=>{
					const img=$("<img>").attr({src:e.target.result,"width":"100","height":"100"})
					$("#uploadpreview").append(img);
				}
				reader.readAsDataURL(f);
			})
			
			/* reader.onload=e=>{
				$("#uploadpreview").append($("<img>").attr("src",e.target.result));
			} */
		
			
		})
		
	</script>
	<style>
		#profile{
			border-radius:100px;
			border:3px solid #afafaf;
		}
	</style>
	
</body>
</html>