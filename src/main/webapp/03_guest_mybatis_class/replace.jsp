<%@ page language="java" contentType="text/html; charset=utf-8"%>
 <%@ page import="mybatis.guest.model.Comment" %>   
 <%@ page import="mybatis.guest.service.CommentService" %>  

  <!-- 키에 해당하는 글번호를 넘겨받아 서비스의 메소드 호출  -->
 <% 
long commentNo = Integer.parseInt( request.getParameter("cId"));
Comment comment = CommentService.getInstance().selectCommentByPrimaryKey(commentNo);

 %>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
<title>입력</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#replace').click(function(){
<%-- 		<% CommentService.getInstance().callList(commentNo);  %> --%>
	})
})
</script>
</head>
<body>

메세지를 남겨주세요.
<form name="frm" action="replaceSave.jsp?" >
<table>
	<tr><td>글번호</td><td><input type="text" name="commentNo" size="3" value='<%=  comment.getCommentNo()%>')/></td></tr>
	<tr><td>사용자</td><td><input type="text" name="userId" size="15" value='<%=  comment.getUserId()%>'/></td></tr>
	<tr><td>메세지</td><td><textarea name="commentContent" rows="10" columns="40"><%=  comment.getCommentContent()%></textarea></td></tr>
	<tr><td><input id="replace" type="submit" value="수정"/></td></tr>
</table>
</form>
</body>
</html>