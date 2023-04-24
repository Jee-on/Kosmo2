<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import='temp.*'%>
<%@ page import='java.util.*'%>
<% 
	EmpDAO dao = EmpDAO.getInstance();
	ArrayList<EmpVO> list = dao.selectAll(); 
	
	System.out.println();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EmpSelect.jsp</title>
</head>
<body>

	<h1>사원정보목록</h1>
	<table>
	<tr>
		<td>사번</td>
		<td>사원명</td>
		<td>부서번호</td>
		<td>업무</td>
		<td>월급</td>
	</tr>
			<%
		for (int i=0; i<list.size(); i+=5){
		%>
		<tr>
			<td><%= list.get(i) %></td>
			<td><%= list.get(i+1) %></td>
			<td><%= list.get(i+2) %></td>
			<td><%= list.get(i+3) %></td>
			<td><%= list.get(i+4) %></td>
		</tr>
		<% } %>
	</table>
	
</body>
</html>