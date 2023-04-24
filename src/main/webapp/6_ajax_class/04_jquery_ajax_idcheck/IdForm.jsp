<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 아이디 중복 검사 </title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
// 요즘 트렌드는 '중복확인' 버튼 클릭 입니다. 팝업 x
//$('#id_check').click(function(){
/* 	alert('id_check'); */

//극적인 효과를 위해 함 -> 나중에 하지 말자
$('.userinput').keyup( function(){
	$.ajax({
		url : 'IdCheck.jsp',
		data : { id : $('.userinput').val() },
		success : function(data){
			//alert(data);
			if (data.trim() == 'YES'){
				$('#idmessage').text('이미 사용중인 아이디 입니다.')
				$('#idmessage').show();
			} else {
				$('#idmessage').text('사용 가능한 아이디 입니다.')
				$('#idmessage').show();
			}
		},
		error : function(){
			alert('error')
		}
	})
});	
	
	
});

</script>

</head>
<body>

<input name="id" type="text" class="userinput" size="15" />
<button type="button" id="id_check">중복체크</button><br/><br/>
<div id="idmessage" style="display:none;"></div>

</body>
</html>