<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script  type="text/javascript"  src="libs/jquery-1.9.1.min.js"> </script>
<script type="text/javascript">
$(function(){
		var param = { cate:'book', name:'kim'}; //자바스크립트에선 객체, 통신에서는 json (데이터 주고받을떄)
		
 		$.ajax({
			type 	: 'get',
			data	: param,
			url 	: '01_server.jsp',
			success : parseData,   //함수 연결을 해야함 호출XXXX  소괄호 없어야함
			error 	: function(){
				alert('Error!!')
			}
		}); 
		
/* 		$.get('01_server.jsp', param, parseData);  축약형...보기 불편해서 많이 쓰이지 않음*/
		function parseData(strText){
			
			// alert( strText );
			
			var aryData = strText.split("|");
						
			for(var i=0;i<aryData.length;i++){
				var param  = aryData[i].split("=");				
				if( param[0].trim() == 'cate'){  // 공백제거를 하지 않으면 처음에 공백에 들어와서 cate를 찾지 못함
					 document.getElementById("cate").value = param[1];
				}
				
				if( param[0].trim() == 'name'){
					document.getElementById("name").value = param[1];
				}
			
			}
			
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


