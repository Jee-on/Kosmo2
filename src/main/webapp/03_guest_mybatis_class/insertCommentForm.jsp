<%@ page language="java" contentType="text/html; charset=utf-8"%>
 <%@ page import="mybatis.guest.model.Comment" %>   
 <%@ page import="mybatis.guest.service.CommentService" %>  

  <!-- 키에 해당하는 글번호를 넘겨받아 서비스의 메소드 호출  -->
 <% 


 %>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
<title>입력</title>
</head>
<body>

메세지를 남겨주세요.
<form name="frm" action="insertCommentSave.jsp" >
<table>
	<tr><td>글번호</td><td><input type="text" name="commentNo" size="3" /></td></tr>
	<tr><td>사용자</td><td><input type="text" name="userId" size="15" /></td></tr>
	<tr><td>메세지</td><td><textarea name="commentContent" rows="10" columns="40"></textarea></td></tr>
	<tr><td><input type="submit" value="입력"/></td></tr>
</table>
</form>
</body>
</html>