<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="${conPath }/css/main/header.css" rel="stylesheet">
</head>
<body>
	<div id="header">
	    <c:if test="${not empty member }">
	    	<a href="${conPath }/calendar.do">CALENDAR</a>
		    <a href="${conPath }/diary/diaryList.do">DIARY LIST</a>
	    	<a href="${conPath }/timetable/view.do">DAILY</a>
	    	<a href="${conPath }/review/list.do">REVIEW</a>
	    	<a href="${conPath }/account/list.do">ACCOUNT</a>
		   	<a href="${conPath}/teammember/myteamList.do">GROUP</a>
	    	<a href="${conPath }/teamboard/list.do">GROUP BOARD</a>
	    	<a href="${conPath }/friend/list.do">FRIEND</a>
		    <a href="${conPath }/member/modifyView.do">MY PAGE</a>
		   	<a href="${conPath }/notice/list.do">NOTICE</a>
		   	<a href="${conPath }/qna/list.do">Q&A</a>
	    </c:if>
	    <c:if test="${empty member && empty admin}">
	    	<a href="${conPath }/member/loginView.do">LOGIN</a>
	    	<a href="${conPath }/member/joinView.do">JOIN US</a>
	   		<a href="${conPath }/admin/loginView.do">ADMIN LOGIN</a>
	    </c:if>
	    <c:if test="${not empty admin }">
			<a href="${conPath }/member/memberList.do">MEMBER LIST</a>
			<a href="${conPath }/admin/logout.do">LOGOUT</a>
	    </c:if>
	</div>
</body>
</html>