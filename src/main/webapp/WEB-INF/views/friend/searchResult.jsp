<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<c:set var="oNum" value="${paging.orderNum }"/>
	<table>
		<caption>MY FOLLOW LIST</caption>
		<c:if test="${empty friends }">
			<tr>
				<td>검색결과가 없습니다</td>
			</tr>
		</c:if>
		<c:if test="${not empty friends }">
			<c:forEach items="${friends }" var="f">
				<tr>
					<td>${oNum }</td>
					<td>${f.mname }(${f.fid })</td>
					<td><button id="${f.fid }" class="unfal">unfollow</button></td>
				</tr>
				<c:set var="oNum" value="${oNum + 1 }"/>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>