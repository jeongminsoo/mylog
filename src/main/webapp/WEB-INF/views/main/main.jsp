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

		});
	</script>
</head>
<body>
	<h1>메인입니다</h1>
	<a href="${conPath }/member/memberList.do">회원목록</a>
	<a href="${conPath }/member/joinView.do">회원가입</a>
	<a href="${conPath }/member/loginView.do">로그인</a>
	<a href="${conPath }/calendar.do">캘린더</a>
</body>
</html>