
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>
	<button onclick="location.href='${conPath}/review/write.do'">글쓰기</button>
	<table>
		<tr>
			<th>No</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>댓글개수</th>
		</tr>

		<c:forEach var="review" items="${reviewList }">
			<tr>
				<td>${review.rnum }</td>
				<td><a
					href="${conPath }/review/content.do?rnum=${review.rnum}&pageNum=${reviewPaging.currentPage}&repageNum=1">${review.rtitle }</a></td>
				<td>${review.mname }</td>
				<td>${review.rrdate }</td>
				<td>${review.cnt }</td>
			</tr>
		</c:forEach>
	</table>
	<div id="paging">
		<c:if test="${reviewPaging.startPage > reviewPaging.blockSize }">
					[<a href="">이전</a>]
				</c:if>
		<c:forEach var="i" begin="${reviewPaging.startPage }"
			end="${reviewPaging.endPage }">
			<c:if test="${reviewPaging.currentPage == i }">
						${i }
					</c:if>
			<c:if test="${reviewPaging.currentPage != i }">
				<a href="${conPath }/review/list.do?pageNum=${i}">${i }</a>
			</c:if>
		</c:forEach>
		<c:if test="${reviewPaging.endPage < reviewPaging.pageCnt }">
					[<a href="">다음</a>]
				</c:if>

	</div>

	<div id="search">
		<form action="${conPath }/review/list.do">
			<input type="text" name="hname"> 
			<input type="submit" value="검색">
		</form>
	</div>
</body>
</html>