<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<%@ page errorPage="02_NormalErrorPage.jsp" %>
<% 
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "scott";
	String pass = "tiger";
	
	// 1. 드라이버 로딩
	Class.forName(driver);
	
	// 2. 연결객체 얻어오기
	Connection con = DriverManager.getConnection(url, user, pass);
	
	// 3. SQL 문장
	String sql = "select * from emp";
	// 4. 전송객체 얻어오기
	PreparedStatement ps = con.prepareStatement(sql);
	
	// 5. 선택
	ResultSet rs = ps.executeQuery();
	
	// 6. 
	
	// 7. 닫기

%>


<!DOCTYPE html>
<html><head><title> 디비 테스트 </title>
</head>
<body>
 
<div align=center>
<table border='2' cellSpacing='3'>

  <tr class="title">
    <td>사번</td>
    <td>사원명</td>
    <td>업무</td>
    <td>관리자사번</td>
    <td>입사일</td></tr>

	<!-- (6) 결과출력 -->
	<% while(rs.next()){ %>
	  <tr>
		<td><%= rs.getInt("EMPNO") %></td>
		<td><%= rs.getString("Ename") %></td>
		<td><%= rs.getString("job") %></td>
		<td><%= rs.getInt("mgr") %></td>
		<td><%= rs.getDate("hiredate") %></td>
	  </tr>
	<% } // end of while 
	ps.close();
	con.close();%>

</table>
</div>
</body>
</html>
