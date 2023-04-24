<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String user= null;
	//# 1."id"로 저장된 세션값을 얻어온다.
	Object obj = session.getAttribute("id");
	//# 2. 값이 null이라면 LoginForm.jsp로 페이지 이동
	if(obj==null){
		response.sendRedirect("LoginForm.jsp");
	}else if(obj!=null){
		user  = (String)obj;
	}
	//# 3. null이 아니라면 String 형변환하여 변수에 지정
	
	
%>
    
<!DOCTYPE html>
<html>
<head>
<title> 우리 페이지 </title>
</head>
<body>

	<h2> 이 페이지는 로그인을 하셔야만 볼 수 있는 페이지 입니다 </h2><br/><br/><br/>
	<%= user  %>님, 로그인 중입니다.

</body>
</html>