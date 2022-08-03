<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<a href="${conPath }/member/memberList.do">회원목록</a>
    <a href="${conPath }/member/joinView.do">회원가입</a>
    <a href="${conPath }/member/loginView.do">로그인</a>
    <a href="${conPath }/calendar.do">캘린더</a>
   	<a href="${conPath }/review/list.do">감상문</a>
   	<a href="${conPath }/diary/myList.do">내 다이어리</a>
   	<a href="${conPath }/teamboard/list.do">팀 보드</a>
   	<a href="${conPath }/admin/loginView.do">관리자 로그인</a>
</body>
</html>