<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
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
	String sql = "INSERT INTO emp(empno, ename, sal) values(SEQ_TEMP_NO.nextval, '홍길국', 20000)";
	// 4. 전송객체 얻어오기
	PreparedStatement ps = con.prepareStatement(sql);
	
	// 5. 선택
	ps.executeUpdate();
	
	// 6. 
	
	// 7. 닫기
	ps.close();
	con.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>



</body>
</html>