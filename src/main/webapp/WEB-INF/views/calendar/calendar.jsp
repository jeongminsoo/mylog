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
<link href="${conPath }/css/style.css" rel="stylesheet">
<style>
#main {
	width: 1200px;
	height: 700px;
	margin: 0 auto;
	border : 1px solid black;
	border-radius : 20px 20px 20px 20px;
}

#wrap {
	width : 1000px;
	height : 650px;
	margin: 29px auto;
	border : 1px solid black;
	border-radius : 20px 20px 20px 20px;
	text-align : center;
}

#wrap table {
	width : 850px;
	margin : 10px auto;
}

#wrap table th {
	border-bottom : 2px solid black;
}

#wrap table td {
	width: 120px;
	height: 80px;
	background-color : #fbfbfb;
	text-align : center;
	line-height : 0;
	pedding : 0;
	line-height : 0;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('select[name="year"], select[name="month"]').change(function() {
			$('form').submit();
		});
	});
</script>
</head>
<body>
	<div id="main">
		<div id="wrap">
			<h2>${year }년${month }월</h2>
			<form action="${conPath }/calendar.do">
				<select name="year">
					<c:forEach var="i" begin="${year-10 }" end="${year+10 }">
						<c:if test="${i eq year }">
							<option selected="selected">${i }</option>
						</c:if>
						<c:if test="${i != year }">
							<option>${i }</option>
						</c:if>
					</c:forEach>
				</select> 년 <select name="month">
					<c:forEach var="i" begin="1" end="12">
						<c:if test="${i eq month }">
							<option selected="selected">${i }</option>
						</c:if>
						<c:if test="${i != month }">
							<option>${i }</option>
						</c:if>
					</c:forEach>
				</select> 월
			</form>
			<table>
				<tr>
					<c:forEach var="t" items="${calPrint.title }">
						<th>${t }</th>
					</c:forEach>
				</tr>
				<c:forEach var="i" begin="0" end="5">
					<tr>
						<c:forEach var="j" begin="0" end="6">
							<c:if test="${empty calPrint.calDate[i][j] }">
								<td></td>
							</c:if>
							<c:if test="${not empty calPrint.calDate[i][j] }">
								<td
									onclick="location.href='${conPath}/calendar/dailyList.do?year=${year }&month=${month }&day=${calPrint.calDate[i][j] }'">
									<h3>${calPrint.calDate[i][j] }</h3>
								</td>
							</c:if>
						</c:forEach>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>