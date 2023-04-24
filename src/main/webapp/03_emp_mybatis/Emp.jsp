<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  -->
<%@ page import="emp.mybatis.*, java.util.*" %>
<%
	String pageNo = request.getParameter("pageNo");
	EmpRepo repo = new EmpRepo();
	List<EmpVO> list = repo.countEmpPage(pageNo);
	int totalRec = repo.countEmp();
	int pageNum=0;
	if(pageNo !=null) pageNum = Integer.parseInt(pageNo);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$('#before').click(function(){
		if(<%=pageNum%>>4){
		location.href="Emp.jsp?pageNo=<%= pageNum-3 %>"  }else if(<%=pageNum%>>1){
			location.href="Emp.jsp?pageNo=<%= pageNum-1 %>"  }
	})
<%-- 	 if(pageNum>4){%> <%= pageNum-3 %><% --%>
	$('#next').click(function(){
		if(<%=pageNum%><<%=totalRec%>-3){
		location.href="Emp.jsp?pageNo=<%= pageNum+3 %>" }else if(<%=pageNum%><<%=totalRec%>){
			location.href="Emp.jsp?pageNo=<%= pageNum+1 %>" }
	})
})
</script>
</head>
<body>

	<h2>사원정보</h2>
	<hr/>
	<!-- 출력 -->
<table border="1">
<tr><td>Empno</td><td>Ename</td><td>Job</td><td>Deptno</td></tr>
	<% for( EmpVO empvo : list ) { %>
		<tr>
			<td><%= empvo.getEmpno() %></td>
			<td><%= empvo.getEname() %></td>
			<td><%= empvo.getJob() %></td>
			<td><%= empvo.getDeptno() %></td>
		</tr>
	<% } %>
</table>
<button id="before" value='이전'>이전</button>
 <%  for(int i=pageNum-2 ; i<=pageNum+2; i++){ %>
 <% if(i>=1 && i<totalRec+1 ) {%> <a id='aa' href="Emp.jsp?pageNo=<%= i %>">[ <%= i %> ]</a> <% } %>
<%}%> 
<button id="next" value='다음'>다음</button>
<!-- <a id='aa' href="Emp.jsp?pageNo=1">[ 1 ]</a>
<a id='aa' href="Emp.jsp?pageNo=2">[ 2 ]</a>
<a id='aa' href="Emp.jsp?pageNo=3">[ 3 ]</a>
<a id='aa' href="Emp.jsp?pageNo=4">[ 4 ]</a>
<a id='aa' href="Emp.jsp?pageNo=5">[ 5 ]</a> -->

<hr/>
</body>
</html>