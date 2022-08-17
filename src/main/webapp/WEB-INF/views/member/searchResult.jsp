<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath}/css/style.css" rel="stylesheet">
	<style>
		#wrap{
			width : 700px;
			margin : 0 auto;
			text-align : center;
			font-size : 1.2em;
		}
		#wrap table {
			width : 500px;
			margin : 50px; auto;
		}
		
		#wrap table tr {
			height : 50px;
		}
		#wrap table th {
			background-color : #DFF6FF;
		}
		input:not(button) {
			width : 90%;
			border : none;
			border-bottom : 1px solid lightgray;
			border-radius: 15px;
			height : 90%;
			font-size : 1.2em;
			padding-left : 10px;
		}
		
		button {
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
	<div id="wrap">
			<table>
				<col style="width : 200px;">
				<col style="width : 200px;">
				<tr>
					<th colspan="2">검색결과</th>
				</tr>
				<tr>
					<td>아이디</td>
					<td>${mid }</td>
				</tr>
			</table>
		<div>
			<p>
				입력하신 이메일로 비밀번호를 발송하였습니다.
			</p>
			<button onclick="window.close()">닫기</button>
		</div>
	</div>
</body>
</html>