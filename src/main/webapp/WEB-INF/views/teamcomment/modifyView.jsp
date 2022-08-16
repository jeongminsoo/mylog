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
				<td style="width:60px; padding:3px; text-align: center;">${member.mname }</td>
				<td>
					<input style="border-bottom:1px solid black; width:150px; padding:3px; text-align: center;" 
						type="text" name="tccontent" required="required">
				</td>
				<td>
					<input style="width:52px;"
						type="submit" value="[저장]" class="btn">
				</td>
				<td>
					<input style="width:37px;"
						type="reset" value="[취소]" class="btn" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>