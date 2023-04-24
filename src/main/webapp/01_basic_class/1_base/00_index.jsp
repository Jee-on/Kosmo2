<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %><!-- 페이지 셋팅 -->
<%! String name= "홍길동"; %>  <!-- 선언부, 잘안씀 -->
<% String msg = "짝꿍님 화이팅"; %> <!-- 자바코딩 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>00_index.jsp</title>
</head>
<body>
	<%= name %>님, 안녕하세요 <hr/>
	<%= msg %>
	
	<!-- HTML 주석 , 사용자한테 까지가서 브라우저에서 빠짐--> 
	<% //자바영역, 자바주석 써야함, 클래스로 변환될때 빠짐 %>
	<% /* 자바 주석 */ %>
	<%-- JSP 주석, 가장 먼저 빠짐 --%> 
	
	
</body>
</html>