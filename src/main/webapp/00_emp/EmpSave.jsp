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
   EmpDAO dao = EmpDAO.getInstance(); 
   dao.insert(vo); 
	//리다이렉팅

%>
