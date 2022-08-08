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
	<script>
		function (){
			
		}
	</script>
</head>
<body>
	<form action="${conPath }/teamboard/modify.do" method="post">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="tnum" value="${teamboard.tnum }">
		<table>
			<caption>글 수정(${teamboard.tnum }번)</caption>
			<tr>
				<td><input type="text" name="ttitle" value="${teamboard.ttitle }"></td>
			</tr>
			<tr>
				<td>작성자 <input type="text" name="mid" value="${teamboard.mname }" readonly="readonly"></td>
			</tr>
			<tr>
				<td><textarea rows="5" cols="5" name="tcontent">${teamboard.tcontent }</textarea> </td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="저장" class="btn">
					<input type="reset" value="취소" class="btn" onclick="history.back()">
					<input type="button" value="목록" class="btn" onclick="location='${conPath}/teamboard/list.do?pageNum=${param.pageNum }'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>