<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	//한글처리 post방식일때 값이 깨지기 때문에.. (값 읽어오기전에 request 전에 해줘야함)
	request.setCharacterEncoding("utf-8");
	
	// 이전 화면에서 사용자 입력값을 받기
	String user = request.getParameter("User");
	String pass = request.getParameter("Pass");
	//JDBC
	
%> 
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 폼의 입력값 처리 </title>
</head>
<body>
	<h2>폼의 입력값 넘겨받아 처리</h2>
	입력한 아이디 :  <%= user %><br/>
	입력한 패스워드 : <%= pass %>
</body>
</html>