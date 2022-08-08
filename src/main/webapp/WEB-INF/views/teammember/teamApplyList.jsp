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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<c:if test="${permitApplyTeamResult  eq 1}">
		<script>
			alert('그룹원 수락 성공');
		</script>
	</c:if>
	<c:if test="${permitApplyTeamResult  eq 0}">
		<script>
			alert('그룹원 수락 실패');
			history.back();
		</script>
	</c:if>
	<c:if test="${deleteApplyTeamResult  eq 1}">
		<script>
			alert('그룹원 거절 성공');
		</script>
	</c:if>
	<c:if test="${deleteApplyTeamResult  eq 0}">
		<script>
			alert('그룹원 거절 실패');
			history.back();
		</script>
	</c:if>
	<table>
		<caption>${teamDetail.tname } 그룹 신청자 list</caption>
		<c:if test="${empty teamApplyList }">
			<tr>
				<td>등록된 신청자가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty teamApplyList }">
			<c:forEach items="${teamApplyList }" var="list">
				<tr>
	  				<td>${list.mname }(${list.mid })</td>
	  				<td>
	  					<button onclick="location.href='${conPath}/teammember/permitApplyTeam.do?tmno=${list.tmno }&tno=${list.tno }'">수락</button>
	  					<button onclick="location.href='${conPath}/teammember/deleteApplyTeam_TL.do?mid=${list.mid }&tno=${list.tno }'">거절</button>
	  				</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>