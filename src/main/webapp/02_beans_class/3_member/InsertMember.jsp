<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="member.beans.*" %>


<!-- 하나씩 천천히 도전합시다 -->
<jsp:useBean id="m" class="member.beans.Member">
	<jsp:setProperty name='m' property="*"/>
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 회원가입 확인  </title>
</head>
<body>
	아이디 : <%= m.getId() %> <br>
	패스워드 : <%= m.getPassword() %><br>
	이름 : <%= m.getName() %><br>
	전화 : <%= m.getTel() %><br>
	주소 : <%= m.getAddr() %><br>
	<%
// 1. 사용자 입력값 받아오기
// 콘솔출력으로 확인

// 2. 사용자 입력값들을 VO 멤버변수로 지정

Member vo = new Member();
vo.setId(m.getId());
vo.setPassword(m.getPassword());
vo.setName(m.getName());
vo.setTel(m.getTel());
vo.setAddr(m.getAddr());


// 3. DAO에 함수 호출
MemberDao dao = MemberDao.getInstance();
dao.insertMember(vo);

//리다이렉팅

%>
	
	
</body>
</html>