<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="temp.EmpVO" %>
<%@ page import="temp.EmpDAO" %>

<%
	// 1. 사용자 입력값 받아오기
	// 콘솔출력으로 확인

  String empno = request.getParameter("empno");
  String ename = request.getParameter("ename");
  String deptno= request.getParameter("deptno");
  String job= request.getParameter("job");
  String sal= request.getParameter("sal");

  
  // 2. 사용자 입력값들을 VO 멤버변수로 지정
   EmpVO vo = new EmpVO();   
   vo.setEmpno(Integer.parseInt(empno));
   vo.setEname(ename);
   vo.setDeptno(Integer.parseInt(deptno));
   vo.setJob(job);
   vo.setSal(Integer.parseInt(sal)); 
   
   // 3. DAO에 함수 호출
   EmpDAO dao = new EmpDAO();
   dao.insert(vo); 
  
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 사원등록 </title>
<script type="text/javascript">

</script>
</head>
<body>
	
	 성공적으로 입력되었지 DB에서 확인합니다.
</body>
</html>