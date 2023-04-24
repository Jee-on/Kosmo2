<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>고객관리 프로그램</title>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	/* function list() {
		$.ajax({
			type : 'post',
			url : 'DataSelect.jsp',
			dataType : 'xml',
			success : selectResult
		});
		function selectResult(data){
			//console.log(data)
			var person = $(data).find('person');
			$('#tbd').empty();
			person.each(function (){  //요소를 하나하나 처리해줄때
				var name =$(this).find('name').text();
				var age =$(this).find('age').text();
				var tel =$(this).find('tel').text();
				var addr =$(this).find('addr').text();
				
				$('#tbd').append('<tr>' + '<td>' + name +'</td>' + '<td>' + age +'</td>' + '<td>' + tel +'</td>' + '<td>' + addr +'</td>' +'</tr>')
			})
		}
		} */
		// 입력 버튼
		$('#btnInsert').click(function() {
			//alert('#btnInsert')
			
			var param = {
				name : $('#name').val(),
				age : $('#age').val(),
				tel : $('#tel').val(),
				addr : $('#addr').val()
			}
			//console.log(param)		
		$.ajax({
			type : 'post',
			data : param,
			url : 'DataInput.jsp',
			success : function(result){
				if(result.trim() == '1'){
					alert('입력성공!!')
				}else{
					alert('11')
				}
			},
			error : function(){
				alert('입력실패!!')
			}
		});
			

		
})
		
		// 가져오기 버튼
		$('#btnSelect').click(
				function list(){
					$.ajax({
						type : 'post',
						url : 'DataSelect.jsp',
						dataType : 'xml',
						success : selectResult
					});
					function selectResult(data){
						//console.log(data)
						var person = $(data).find('person');
						$('#tbd').empty();
						person.each(function (){  //요소를 하나하나 처리해줄때
							var name =$(this).find('name').text();
							var age =$(this).find('age').text();
							var tel =$(this).find('tel').text();
							var addr =$(this).find('addr').text();
							
							$('#tbd').append('<tr>' + '<td>' + name +'</td>' + '<td>' + age +'</td>' + '<td>' + tel +'</td>' + '<td>' + addr +'</td>' +'</tr>')
						})
					}
					})
	})

	
</script>

</head>


<!-- <body> -->
<body>

	<h2>고객정보 입력</h2>

	<form name="inForm" method="post">
		<table border=1>
			<tr>
				<td width="80" align="center">Name</td>
				<td width="50" align="center">Age</td>
				<td width="100" align="center">Tel</td>
				<td width="250" align="center">Addr</td>
			</tr>
			<tr>
				<td align="center"><input type="text" size="8" name="name"
					id="name"></td>
				<td align="center"><input type="text" size="4" name="age"
					id="age"></td>
				<td align="center"><input type="text" size="12" name="tel"
					id="tel"></td>
				<td align="center"><input type="text" size="30" name="addr"
					id="addr"></td>
			</tr>
			<tr>
				<td colspan="4" align="center"><input type="button"
					id='btnInsert' value="입력"></td>
			</tr>
		</table>

		<br>
		<hr>

		<h2>고객정보 목록보기</h2>
		<table border='0' width="510">
			<tr>
				<td align="right"><input type="button" id='btnSelect'
					value="가져오기"></td>
			</tr>
		</table>
		<table border=1 id="listTable">
			<tr>
				<td width="80" align="center">Name</td>
				<td width="50" align="center">Age</td>
				<td width="100" align="center">Tel</td>
				<td width="250" align="center">Addr</td>
			</tr>
			<tbody id='tbd'></tbody>
		</table>
		<div id="myDiv"></div>

	</form>
</body>
</html>