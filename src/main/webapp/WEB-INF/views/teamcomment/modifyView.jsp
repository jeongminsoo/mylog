<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath}/css/style.css" rel="stylesheet">
</head>
<body>
	<form action="${conPath }/teamcomment/modify.do" method="post">
		<input type="hidden" name="mid" value="${member.mid }"> 
		<input type="hidden" name="tnum" value="${param.tnum }"> 
		<input type="hidden" name="tcnum" value="${teamcomment.tcnum }">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="tcpageNum" value="${param.tcpageNum }">
		<table>
			<tr>
				<td>
					<input type="text" name="mname" value="${member.mname }" readonly="readonly">
				</td>
				<td>
					<textarea rows="5" cols="5" name="tccontent">${teamcomment.tccontent }</textarea>
				</td>
				<td colspan="2">
					<input type="submit" value="저장" class="btn">
					<input type="reset" value="취소" class="btn" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>