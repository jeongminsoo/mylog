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
	<div>
		<div>
			<button onclick="location.href='${conPath }/calendar/dailyList.do?year=${year }&month=${month }&day=${day - 1 }'">◀</button>
			${year }년 ${month }월 ${day }일
			<button onclick="location.href='${conPath }/calendar/dailyList.do?year=${year }&month=${month }&day=${day + 1 }'">▶</button>
		</div>
		<div>
		<table>
			<tr>
			<td>
			<table>
				<c:if test="${empty diarys }">
					<tr>
						<td>등록된 일기가 없습니다</td>
					</tr>
				</c:if>
			
				
				<c:if test="${not empty diarys }">
					<c:forEach items="${diarys }" var="d">
						<tr>
							<td>
								${d.dtitle }	
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			</td>
			<td>
				<table>
					<caption>Todo 리스트</caption>
					<c:if test="${empty todos }">
						<tr>
							<td>
								등록된 Todo가 없습니다
							</td>
						</tr>
					</c:if>
					<c:if test="${not empty todos }">
					<c:forEach items="${todos }" var="todo">
						<tr>
							<td>${todo.tdcontent }</td>
						</tr>
					</c:forEach>
				</c:if>
				</table>
			</td>
			</tr>
			</table>
		</div>
	</div>
</body>
</html>