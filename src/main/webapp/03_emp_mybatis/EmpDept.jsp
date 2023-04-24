<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  -->
<%@ page import="emp.mybatis.*, java.util.*" %>
<%
	String pageNo = request.getParameter("pageNo");
	EmpRepo repo = new EmpRepo();
	HashMap<EmpVO> list = repo.selectEmpDept(); 
	int totalRec = repo.countEmp();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>사원정보</h2>
	<hr/>
	<!-- 출력 -->
<table border="1">
<tr><td>Empno</td><td>Ename</td><td>Job</td><td>Deptno</td></tr>
	<% for( HashMap empvo : list ) { %>
		<tr>
			<td><%= empvo.get("EMPNO") %></td>
			<td><%= empvo.get("ENAME") %></td>
			<td><%= empvo.get("JOB") %></td>
			<td><%= empvo.get("DNAME") %></td>
			<td><%= empvo.get("LOC") %></td>
		</tr>
	<% } %>
</table>
<%  for(int i=1 ; i<=totalRec; i++){ %>
	<a href="Emp.jsp?pageNo=<%= i %>">[ <%= i %> ]</a>
<%}%>

<hr/>
</body>
</html>