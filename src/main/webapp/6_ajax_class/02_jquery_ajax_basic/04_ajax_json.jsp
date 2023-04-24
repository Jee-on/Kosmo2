<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<script  type="text/javascript"  src="libs/jquery-1.9.1.min.js"> </script>
	<script>
	    $(function(){
	    	
	    	$.ajax({
	    		type : 'get',
	    		data : { cate:'IT', name : 'Java'},
	    		url : '04_server.jsp',
	    		dataType : 'text', // 원래는 'json' 이지만 json은 라이브러리가 필요함
	    		success  : function(resData){
	    			//alert(resData);
	    			//json 라이브러리로 받았다면 실제로 아래 코드는 필요없음(*편법)
	    			
	    			var obj = {};
	    			obj = eval("(" + resData + ")");
	    			$('#cate').val( obj.first );
	    			$('#name').val( obj.second );
	    		},
	    		error : function(){
	    			alert('error')
	    		}
	    	});
	    })
	</script>
</head>

<body>
서버로부터 넘겨받은 데이터<br/>
첫번째 데이터 : <input type="text" name="" id="cate"/><br/>
두번째 데이터 : <input type="text" name="" id="name"/><br/>
</body>
</html>


