<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath}/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<div id="content">
		<table>
			<caption>${content.tnum }번 상세보기</caption>
			<tr>
				<th>작성자</th>
				<td>${content.mid }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${content.ttitle }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${content.tcontent }</td>
			</tr>
			<tr>
				<th>파일</th>
				<c:if test="${content.tfilename eq null }">
					<td>파일 없음</td>
				</c:if>
				<c:if test="${content.tfilename != null }">
					<td>${content.tfilename }</td>
				</c:if>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${content.thit }</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${content.trdate }</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="목록" onclick="location.href='${conPath}/teamboard/teamboardList.do?pageNum=${pageNum }'" class="btn">
					<input type="button" value="답변" onclick="location.href='${conPath}/teamboard/teamboardReplyView.do?tnum=${content.tnum}&pageNum=${pageNum }'" class="btn">
					<input type="button" value="수정" onclick="location.href='${conPath}/teamboard/teamboardModifyView.do?tnum=${content.tnum}&pageNum=${pageNum }'" class="btn">
					<input type="button" value="삭제" onclick="location.href='${conPath}/teamboard/teamboardDelete.do?tnum=${content.tnum}&pageNum=${pageNum }'" class="btn">
				</td>
			</tr>
		</table>
	</div>
</body>
</html>