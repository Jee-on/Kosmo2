<%@ page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ page import='temp.*' %>  
<%
	// 0. 한글처리
	request.setCharacterEncoding("utf-8");
	// 1. 화면의 입력값 얻어오기
	String user = request.getParameter("User");
	String pass = request.getParameter("Pass");
%>
    
<!DOCTYPE html>
<html>
<head>
<title> 로그인확인 </title>
</head>
<body>
<%

	// 실제로는 DB에서 가져와야하는 값
	EmpDAO dao = EmpDAO.getInstance();
	


			
	// user, password가 같을 때 로그인 성공, 그렇지 않으면 로그인 실패
	if( dao.checkLogin(user,pass) ){
		// #2. 세션에 "id"라는 이름에 변수 user 값을 저장
		session.setAttribute("id", user);
		// #1. 로그인 성공하면 바로 MainPage.jsp를 요청
		response.sendRedirect("MainPage.jsp");
	} else {

		// #1. 로그인에 실패하면 바로 LoginForm.jsp을 요청
		response.sendRedirect("LoginForm.jsp");
	}			
%>
	
</body>
</html>