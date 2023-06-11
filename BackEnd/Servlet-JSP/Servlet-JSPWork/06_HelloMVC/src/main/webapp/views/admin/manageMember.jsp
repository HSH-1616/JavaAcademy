<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,java.io.*" %>    
<%
	List<Member> members=(List)request.getAttribute("members");	
	String type=request.getParameter("searchType");
	String keyword=request.getParameter("searchKeyword");
%>    
<%@ include file="/views/common/header.jsp"%>
<style type="text/css">
    section#memberList-container {text-align:center;}
    
    section#memberList-container table#tbl-member {width:100%; border:1px solid gray; border-collapse:collapse;}
    section#memberList-container table#tbl-member th, table#tbl-member td {border:1px solid gray; padding:10px; }
    #pageBar a,#pageBar span{
    	text-decoration:none;
    	font-size:24px;
    	margin-left:2%;
    	margin-right:2;
    	color:magenta;
    }
    #pageBar a:hover{
    	background-color:lime;
    }
    #pageBar span{
    	color:gray;
    }
    div#search-container {margin:0 0 10px 0; padding:3px; 
    background-color: rgba(0, 188, 212, 0.3);}
    div#search-userId{display:inline-block;}
    div#search-userName{display:none;}
    div#search-gender{display:none;}
    div#numPerpage-container{float:right;}
    form#numperPageFrm{display:inline;}
</style>
<section id="memberList-container">
      <h2>회원관리</h2>
         <div id="search-container">
        	검색타입 : 
        	<select id="searchType">
        		<option value="userId" <%=type!=null&&type.equals("userId")?"selected":"" %>>아이디</option>
        		<option value="userName" <%=type!=null&&type.equals("userName")?"selected":"" %>>회원이름</option>
        		<option value="gender" <%=type!=null&&type.equals("gender")?"selected":"" %>>성별</option>
        	</select>
        	<div id="search-userId">
        		<form action="<%=request.getContextPath()%>/admin/searchMember">
        			<input type="hidden" name="searchType" value="userId" >
        			<input type="text" name="searchKeyword" size="25" 
        			placeholder="검색할 아이디를 입력하세요" 
        			value="<%=type!=null&&type.equals("userId")?keyword:"" %>">
        			<button type="submit">검색</button>
        		</form>
        	</div>
        	<div id="search-userName">
        		<form action="<%=request.getContextPath()%>/admin/searchMember">
        			<input type="hidden" name="searchType" value="userName">
        			<input type="text" name="searchKeyword" size="25" 
        			placeholder="검색할 이름을 입력하세요"
        			value="<%=type!=null&&type.equals("userName")?keyword:"" %>">
        			<button type="submit">검색</button>
        		</form>
        	</div>
        	<div id="search-gender">
        		<form action="<%=request.getContextPath()%>/admin/searchMember">
        			<input type="hidden" name="searchType" value="gender">
        			<label><input type="radio" name="searchKeyword" value="M" 
        			<%=type!=null&&type.equals("gender")&&keyword!=null&&keyword.equals("M")?"checked":"" %>>남</label>
        			<label><input type="radio" name="searchKeyword" value="F" 
        			<%=type!=null&&type.equals("gender")&&keyword!=null&&keyword.equals("F")?"checked":"" %>>여</label>
        			<button type="submit">검색</button>
        		</form>
        	</div>
        </div>
        <div id="numPerpage-container">
        	페이지당 회원수 : 
        	<%-- <form id="numPerFrm" action="<%=request.getContextPath()%>/admin/memberList.do"> --%>
        		<select name="numPerpage" id="numPerpage">
        			<option value="10">10</option>
        			<option value="5" >5</option>
        			<option value="3" >3</option>
        		</select>
        	<!-- </form> -->
        </div>
      
      <table id="tbl-member">
          <thead>
              <tr>
                <th>아이디</th>
			    <th>이름</th>
			    <th>성별</th>
			    <th>나이</th>
			    <th>이메일</th>
			    <th>전화번호</th>
			    <th>주소</th>
			    <th>취미</th>
			    <th>가입날짜</th>
              </tr>
          </thead>
          <tbody>
          <%if(members.isEmpty()){ %>
          		<tr>
          			<td colspan="9">조회된 회원이 없습니다</td>
          		</tr>
          <%}else{
          		for(Member m : members){%>
          		<tr>
          			<td><%=m.getUserId() %></td>
          			<td><%=m.getUserName() %></td>
          			<td><%=m.getGender() %></td>
          			<td><%=m.getAge() %></td>
          			<td><%=m.getEmail() %></td>
          			<td><%=m.getPhone() %></td>
          			<td><%=m.getAddress() %></td>
          			<td><%=m.getHobby()!=null?String.join(",",m.getHobby()):"" %></td>
          			<td><%=m.getEnrollDate() %></td>
          		</tr>	
          	<%}
          	}%>
          </tbody>
      </table>
      <div id="pageBar">
      	<%=request.getAttribute("pageBar") %>
      </div>	
 </section>
 <script>
 	$("#searchType").change(e=>{
 		const type=$(e.target).val();
 		$(e.target).parent().find("div").css("display","none");
 		$("#search-"+type).css("display","inline-block");
 	});
 	$(()=>{
 		$("#searchType").change();
 		$("#numPerpage").change(e=>{
 			let url=location.href;
 			if(url.includes("?")){
	 			url=url.substring(0,url.indexOf("?")+1)
	 			+'searchType=<%=type%>'
	 			+'&searchKeyword=<%=keyword%>'
	 			+'&cPage=<%=request.getParameter("cPage")!=null
	 				?request.getParameter("cPage"):1%>'
	 			+'&numPerpage='+e.target.value;
 			}else{
 				url+='?';
 				url+='cPage=<%=request.getParameter("cPage")!=null
 				?request.getParameter("cPage"):1%>'
	 			+'&numPerpage='+e.target.value;
 			}
 			//console.log(url);
 			//url+='&numPerpage='+e.target.value;
 			location.assign(url);
 		});
 	})
 	
 </script>
<%@ include file="/views/common/footer.jsp"%>