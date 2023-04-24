<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"  src="/JSP/lib/jquery-3.6.4.js"></script>
<script type="text/javascript">
$(function(){

//★★비밀번호 체크
$('#frm').on('submit',function(e){
	if($('#password')!=$('#passcheck')){
		
		alert('비밀번호가 일치하지 않습니다.')
		e.preventDefault();
	}else{
		alert('비밀번호가 일치합니다')
		e.preventDefault();
	}
})
//end of 비밀번호 체크

//★★취소 버튼 clear
$('#clear').click(function(){
	$('#id').val('');
	$('#password').val('');
	$('#passcheck').val('');
	$('#name').val('');
	$('#tel').val('');
	$('#addr').val('');
})
//end of 취소 버튼



	
});
</script>
</head>
<body>
<form  id='frm' action="RegSave.jsp" method="get" >
<h1>회원가입서 작성하기</h1><br/>
<ol><li>
<label for="id">아이디</label>	 	 
<input id='id' name='id' type=text required><button id='check' type='button'>중복확인</button><br/>
</li>
<li>
<label for="password">비밀번호</label> 	 
<input id='password' name='password' type='password' required><br/>
</li>
<li>
<label for="passcheck">비밀번호확인</label>  
<input id='passcheck' name='passcheck' type='password' required><br/>
</li>
<li>
<label for="name">이름</label>	 		 
<input id='name' name='name' type=text><br/>
</li>
<li>
<label for="tel">전화번호</label>		 
<input id='tel' name='tel' type=text><br/>
</li>
<li>
<label for="addr">주소</label>			 
<input id='addr' name='addr' type=text><br/>
<button type="submit">회원가입</button><button type='button' id='clear'>취소</button>
</li>
</ol>
<hr/>
</form>
</body>
</html>