<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			$('input[name="mname"]').keyup(function(){
				var mname = $('input[name="mname"]').val();
				$.ajax({
					url : '${conPath}/member/find.do',
					data : 'mname=' + mname,
					type : 'get',
					dataType : 'html',
					success : function(data){
						$('#findResult').html(data);
					}
				});
			});
		});
	</script>
	<style>
		#main {
	width: 1600px;
	height: 850px;
	margin: 60px 35px;
	background-image: url(../img/main_wraper.png);
	position: absolute;
}

#wrap {
	width: 1200px;
	height: 700px;
	margin: 50px auto;
	border: 1px solid black;
	border-radius: 15px;
	text-align: center;
	position: relative;
}
#wrap input {
	width : 300px;
	height : 50px;
	font-size : 1.2em;
}
#wrap table {
	width : 600px;
	margin : 0 auto;
	font-size: 1.2em;
}
	</style>
</head>
<body>
	<div id="main">
		<div id="wrap">
		<form>
			<input type="text" name="mname" placeholder="닉네임 또는 아이디를 입력하세요">
		</form>
		<div id="findResult"></div>
		</div>
	</div>
</body>
</html>