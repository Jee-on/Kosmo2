<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	// 1. 이전 화면의 값들 얻어오기
	//한글처리 post방식일때 값이 깨지기 때문에.. (값 읽어오기전에 request 전에 해줘야함)
	request.setCharacterEncoding("utf-8");
	
	// 이전 화면에서 사용자 입력값을 받기
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String occupation = request.getParameter("occupation");
	String [] hobby = request.getParameterValues("hobby");

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
// 2. 얻어온 값들 출력
 -->
 

	이름 :  <%= name %><br/>
	성별 : <%= gender %> <br/>
	직업 :  <%= occupation %><br/>
	취미 : <% for(int i=0; hobby!=null && i<hobby.length; i++){ %>
	<%= hobby[i] %>
	<%} %>
</body>
</html>



