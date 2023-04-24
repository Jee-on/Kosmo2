<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.model.*,board.service.*" %>

<%
	// 0. 넘겨받는 데이타의 한글 처리
	request.setCharacterEncoding("utf-8");
	
	String aId= request.getParameter("ArticleId");
	String title = request.getParameter("title");
	String password = request.getParameter("password");
	String content = request.getParameter("content");
	
	int id = Integer.parseInt(aId);
	BoardRec rec = new BoardRec();
	rec.setArticleId(id);
	rec.setTitle(title);
	rec.setPassword(password);
	rec.setContent(content);
%>

<!-- 1. 이전 화면의 입력값을 넘겨받아 BoardRec 객체의 각 멤버변수로 지정 -->
	

<%
	
	// 2. Service에 update() 호출하여 레코드 수정
	ModifyArticleService service = ModifyArticleService.getInstance();
	int result = service.update(rec);
	System.out.print(result);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판글수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	if(<%= result %> != 0){
		location.href="BoardView.jsp?ArticleId="+<%= aId %>
	} else {
		alert('암호가 잘못되었습니다!!!!')
	}
})
</script>
</head>
<body>


<% 	
	
	// 게시글 수정이 성공적으로 되었다면 그 해당 게시글을 보여주는 페이지로 이동하고
    // 그렇지 않다면, "암호가 잘못 입력되었습니다"를 출력
%>

</body>
</html>