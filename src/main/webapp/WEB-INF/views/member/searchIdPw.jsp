<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>아이디 찾기</title>
	<link href="${conPath}/css/style.css" rel="stylesheet">
	<style>
		#wrap{
			width : 700px;
			margin : 0 auto;
			text-align : center;
		}
		#wrap table {
			width : 500px;
			margin : 50px auto;
		}
		
		#wrap table tr {
			height : 50px;
		}
		
		input:not(.btn) {
			width : 90%;
			border : none;
			border-bottom : 1px solid lightgray;
			border-radius: 15px;
			height : 90%;
			font-size : 1.2em;
			padding-left : 10px;
		}
		
		.btn {
			border : none;
			width : 100px;
			font-weight : bold;
			font-size : 1.1em;
			background-color : #03045E;
			color : white;
			
		}
	</style>
</head>
<body>
	<c:if test="${searchResult != null }">
		<script>
			alert('${searchResult}')
		</script>
	</c:if>
	<div id="wrap">
		<form action="${conPath }/member/searchIdPw.do" method="post">
			<table>
				<caption><h3>아이디 찾기</h3></caption>
				<col style="width : 200px;">
				<tr>
					<td><input type="text" name="mname" class="mname" value="${mname }" placeholder="NICKNAME"></td>
				</tr>
				<tr>
					<td>
						<input type="email" name="memail" class="memail" id="memail" value="${memail }" placeholder="EMAIL">
					</td>
				</tr>
			</table>
			<div>
				<input type="submit" value="찾기" class="btn">
				<input type="button" value="취소" class="btn" onclick="window.close()">
			</div>
		</form>
	</div>
</body>
</html>