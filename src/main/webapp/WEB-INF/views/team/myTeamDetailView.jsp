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
	table td {
		width: 50px;
		height: 50px;
	}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			$('select[name="year"], select[name="month"]').change(function(){
				$('form').submit();
			});
		});
		function myTeamModify(tno){
			location.href = '${conPath}/team/myTeamModifyView.do?tno='+tno;
		}
	
	</script>
</head>
<body>
	<c:if test="${myTeamModifyResult  eq 1}">
		<script>
			alert('그룹 디테일 수정 성공');
		</script>
	</c:if>
	<c:if test="${myTeamModifyResult  eq 0}">
		<script>
			alert('그룹 디테일 수정 실패');
			history.back();
		</script>
	</c:if>

	<!-- 그룹디테일(헤더, 수정하러가기) -->
	<div>
		<table style="width: 250px; border: 1px solid black;"
			<c:if test="${member.mid eq teamDetail.mid }">
				onclick="myTeamModify(${teamDetail.tno})"
			</c:if>>
			<tr>
				<td><h2>${teamDetail.tname }</h2></td>
				<td>(${teamDetail.mname } | ${teamMemberTotCnt })</td>
			</tr>
			<tr>
				<td colspan="2">목표 : ${teamDetail.tgoal }</td>
			</tr>
		</table>
	</div>

	<!-- 그룹가입 신청자 list -->
	<c:if test="${member.mid eq teamDetail.mid }">
		<div>
			<a href="${conPath }/teammember/teamApplyList.do?tno=${teamDetail.tno }">그룹가입 신청자 list</a>
		</div>
	</c:if>

	<!-- 달력 -->
	<h2>${year }년${month }월</h2>
	<b>
		<form action="${conPath }/team/myTeamDetailView.do">
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
	</b>
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
							onclick="location.href='${conPath}/team/myTeamDetailView.do?year=${year }&month=${month }&day=${calPrint.calDate[i][j] }'">
							<h3>${calPrint.calDate[i][j] }</h3>
						</td>
					</c:if>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>

	<!-- teamTodoList -->
</body>
</html>