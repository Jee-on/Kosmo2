<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<script  type="text/javascript"  src="libs/jquery-1.9.1.min.js"> </script>
<script type="text/javascript">
$(function(){
	var param = { cate : 'it', name: 'java'};
	
	$.ajax({
		type : 'get',
		data : param, //변수선언 안하고 바로 값 넣어도 됨
		url : '03_server.jsp',
		dataType  : 'xml', //xml로 받는다고 타입 설정 해주기 
		success : parseData
	});
	function parseData(xmlInfo){
		$('#cate').val( $(xmlInfo).find('first').text() ); // $()로 xmlInfo 객체화해서 find 함수 쓸수 있게 만듦
		$('#name').val( $(xmlInfo).find('second').text() );
	}
})
</script>
</head>

<body>
서버로부터 넘겨받은 데이터<br/>
첫번째 데이터 : <input type="text" name="" id="cate"/><br/>
두번째 데이터 : <input type="text" name="" id="name"/><br/>
</body>
</html>


