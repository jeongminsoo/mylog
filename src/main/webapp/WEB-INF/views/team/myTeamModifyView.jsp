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
	<script>
		function drawalTeamMember(tno, tmno){
			location.href = '${conPath}/teammember/drawalTeamMember.do?tno='+tno+'&tmno='+tmno;
		}
	</script>
</head>
<body>
	<div class="content">
	<form action="${conPath }/team/myTeamModify.do" method="post">
		<input type="hidden" name="tno" value="${teamDetail.tno }">
		<table>
			<tr>
				<td>
					<input type="text" name="tname" value="${teamDetail.tname }" required="required">
				</td>
			</tr>
			<tr>
				<td>
					<label for="${teamDetail.mid }">팀장</label>
					<select name="mid">
						<c:forEach var="list" items="${teamMemberList }">
							<option value="${list.mid }" 
								<c:if test ="${teamDetail.mid eq list.mid }">selected="selected"</c:if>>${list.mname }(${list.mid })
							</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td><input type="text" name="tgoal" value="${teamDetail.tgoal }"></td>
			</tr>
			<tr>
				<td>
					<table>
						<caption>그룹원 리스트</caption>
						<c:forEach items="${teamMemberList }" var="list">
							<tr>
				  				<td>${list.mname }(${list.mid })</td>
				  				<c:if test="${teamDetail.mid ne list.mid }">
					  				<td><button onclick="drawalTeamMember(${teamDetail.tno}, ${list.tmno })">그룹탈퇴처리</button></td>
				  				</c:if>
							</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="그룹수정">
					<input type="button" value="그룹삭제" onclick="location.href='${conPath}/team/teamDelete.do?tno=${teamDetail.tno }'">
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>