<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="regtemp.RegVO" %>
<%@ page import="regtemp.RegDAO" %>

<%
// 1. 사용자 입력값 받아오기
// 콘솔출력으로 확인

String id = request.getParameter("id");
String password = request.getParameter("password");
String name = request.getParameter("name");
String tel = request.getParameter("tel");
String addr = request.getParameter("addr");

// 2. 사용자 입력값들을 VO 멤버변수로 지정

RegVO vo = new RegVO();
vo.setId(id);
vo.setPassword(password);
vo.setName(name);
vo.setTel(Integer.parseInt(tel));
vo.setAddr(addr);


// 3. DAO에 함수 호출
RegDAO dao = RegDAO.getInstance();
dao.insert(vo);

//리다이렉팅

%>
