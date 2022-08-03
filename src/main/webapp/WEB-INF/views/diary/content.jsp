<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		$(document).ready(function(){

		});
	</script>
</head>
<body>
	<div id="main_wrap">
		<table>
			<tr>
				<th>제목</th>
				<td>${diary.dtitle }</td>
			</tr>
			<c:if test="${not empty todoList }">
				<tr> 
					<th rowspan="${todoList.size()+1 }">투두리스트</th>
					<td>내용</td>
				</tr>
				<c:forEach var="todo" items="${todoList }">
					<tr>
						<td>${todo.tdcontent }</td>
						<td>${todo.tdcheck }</td>
					</tr>
				</c:forEach>
			</c:if>
			<tr>
				<th>내용</th>
				<td>${diary.dcontent }</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${diary.drdate }</td>
			</tr>
			<tr>
				<th>해당일</th>
				<td>${diary.ddate }</td>
			</tr>
		</table>
		<button onclick="location.href='myList.do'">목록</button>
		<button onclick="location.href='modify.do?dnum=${diary.dnum}'">수정</button>
		<button onclick="location.href='delete.do?dnum=${diary.dnum}'">삭제</button>
	</div>
</body>
</html>