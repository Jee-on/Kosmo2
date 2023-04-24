<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> JSTL 기초 문법 </title>
</head>
<body>


<!-- 변수선언 -->
<c:set var='gender' value='male' />

<c:if test="${ gender eq 'male'}"> 당신은 남정네 </c:if>
<c:if test="${ gender eq 'female'}"> 당신은 여인네 </c:if>

<c:set var='age' value='10'/>
<!-- 10살 미만 어린이, 10살부터 20살 미만 청소년, 그 외 성인 -->

<c:choose>
	<c:when test="${age lt 10 }">어린이</c:when>
	<c:when test="${age ge 10 and age lt 20 }">청소년</c:when>
	<c:otherwise>성인</c:otherwise>
</c:choose>

<c:set var='sum' value='0'></c:set>
<hr/>
<c:forEach var='i' begin='1' end='100'>
	<c:set var='sum' value='${ sum+i}' />
</c:forEach>
1~100 까지 합 : ${sum}

<!--  1~100까지 중에서 짝수의 합과 홀수의 합 출력 -->

<c:forEach var='i' begin='1' end='100'>
	<c:choose>
		<c:when test="${(i%2) eq 0}"><c:set var='sumeven' value='${ sumeven+i}' /></c:when>
		<c:when test="${(i%2) ne 0}"><c:set var='sumodd' value='${ sumodd+i}' /></c:when>
	</c:choose>
</c:forEach>
<hr/>
1~100 까지 짝수 합 : ${sumeven}
<hr/>
1~100 까지 홀수 합 : ${sumodd}

</body>
</html>