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
<style>

</style>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
</script>
</head>
<body>
${ttablewrite }
	<div id="timetable">
	<h1>기록한 시간</h1>
	<div class="col-sm-6">
		
		<table class="table table-bordered">
			<thead>
				<tr>
					<th scope="col">시간</th>
					<th scope="col">10</th>
					<th scope="col">20</th>
					<th scope="col">30</th>
					<th scope="col">40</th>
					<th scope="col">50</th>
					<th scope="col">60</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="i" begin="5" end="24">
					<tr class="${i}">
						<th>${i }</th>
						<td class="${i}10"></td>
						<td class="${i}20"></td>
						<td class="${i}30"></td>
						<td class="${i}40"></td>
						<td class="${i}50"></td>
						<td class="${i}60"></td>
					</tr>

				</c:forEach>
				<c:forEach var="i" begin="1" end="4">
					<tr class="${i}">
						<th>${i }</th>
						<td class="${i}10"></td>
						<td class="${i}20"></td>
						<td class="${i}30"></td>
						<td class="${i}40"></td>
						<td class="${i}50"></td>
						<td class="${i}60"></td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
    </div>

	</div>
</body>
</html>