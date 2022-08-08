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
		<caption>나를 FOLLOW한 친구</caption>
		<c:if test="${empty follows }">
			<tr>
				<td>검색결과가 없습니다</td>
			</tr>
		</c:if>
		<c:if test="${not empty follows }">
			<c:forEach items="${follows }" var="f">
				<tr>
					<td>${oNum }</td>
					<td>${f.mname }(${f.mid })</td>
					<td>
						<c:if test="${f.existent eq 0 }">
							<button id="${f.mid }" class="follow">follow</button>
						</c:if>
						<c:if test="${f.existent eq 1 }">
							<button id="${f.mid }" class="unfollow">unfollow</button>
						</c:if>
					</td>
				</tr>
				<c:set var="oNum" value="${oNum + 1 }"/>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>