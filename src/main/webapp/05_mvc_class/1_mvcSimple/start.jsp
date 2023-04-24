<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String projectName = "/JSP"; %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="<%= projectName %>/05_mvc_class/1_mvcSimple/simpleView.jsp"> 기존방식 </a>
<hr/>
<a href="<%= projectName %>/SimpleControl"> MVC 방식 </a>
<hr/>
<a href="<%= projectName %>/kosmo.do?type=first"> MVC 방식 </a>
<hr/>
<a href="<%= projectName %>/Shinhan.do"> MVC 방식 </a>
<hr/>
<a href="<%= projectName %>/SimpleMan"> MVC 방식 </a>

</body>
</html>

