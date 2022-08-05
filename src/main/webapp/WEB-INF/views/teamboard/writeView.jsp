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
	<link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
	<form action="${conPath }/teamboard/write.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="mid" value="${member.mid }">
		<table>
			<caption>팀모집 게시판 글쓰기</caption>
			<tr>
				<th>제목</th>
				<td><input type="text" name="ttitle" required="required"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="mname" value="${member.mname }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>본문</th>
				<td><textarea rows="5" cols="20" name="tcontent" required="required"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="글쓰기" class="btn">
					<input type="reset" value="초기화" class="btn">
					<input type="button" value="목록" onclick="location.href='${conPath}/teamboard/list.do'" class="btn">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>