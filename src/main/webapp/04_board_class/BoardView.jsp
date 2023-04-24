<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.service.*, board.model.*" %>
<%
	// 1. 해당 게시물의 게시글번호값을 얻어온다
	String aId = request.getParameter("ArticleId");

	// 2. Service에 getArticleById() 호출하여 그 게시글번호를 갖는 레코드를 검색한다.
	ViewArticleService service = ViewArticleService.getInstance();
	BoardRec rec = service.getArticleById(aId);
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 게시글 보기 </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#list').click(function(){
		location.href = "BoardList.jsp?";
	})
	
	$('#reply').click(function(){
		location.href = "BoardReplyForm.jsp?ArticleId=<%= aId %>";
	})
	
	$('#modify').click(function(){
		location.href = "BoardModifyForm.jsp?ArticleId=<%= aId %>"
	})
	
	$('#delete').click(function(){
		location.href = "BoardDeleteForm.jsp?ArticleId=<%= aId %>";
	})
});
</script>
</head>
<body>

	<h4> 게시판 글 보기 </h4><br/>
	<table border="1" bordercolor="red">
	<tr>
		<td> 제  목 : </td>
		<td><%= rec.getTitle() %></td>
	</tr>
	<tr>
		<td> 작성자 : </td>
		<td><%= rec.getWriterName() %></td>
	</tr>
	<tr>
		<td> 작성일자 : </td>
		<td><%= rec.getPostingDate() %></td>
	</tr>
	<tr>
		<td> 내  용 : </td>
		<td><%= rec.getContent() %></td>
	</tr>
	<tr>
		<td colspan="2">
			<button id='list' > 목록보기</button>
			<button id='reply' >답변하기</button>
			<button id='modify' >수정하기</button>
			<button id='delete' >삭제하기</button>
		</td>
	</tr>
	</table>


</body>
</html>