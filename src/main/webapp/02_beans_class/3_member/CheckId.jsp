<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='temp.*'%>
<%@ page import='java.util.*'%>
<%@ page import="member.beans.*" %>
<% 
	String id = request.getParameter("userId");
	MemberDao dao = MemberDao.getInstance();
	boolean result=dao.isDuplicatedId(id);

%>

<%
String result1="NO";
if (dao.isDuplicatedId(id)){		
	result1 = "YES";
	
}		
out.print(result1);
%>
