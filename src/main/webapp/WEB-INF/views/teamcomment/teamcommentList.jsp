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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
		function (){
			
		}
	</script>
</head>
<body>
	<table>
		<c:if test="${teamCommentTotCnt eq 0 }">
			<tr>
				<td>등록된 댓이 없습니다</td>
			</tr>
		</c:if>
		<c:if test="${teamCommentTotCnt != 0 }">
			<c:forEach items="${teamcommentList }" var="tcDto">
				<tr>
					<td>${tcDto.mid }</td>
					<td class="left"><c:forEach var="i" begin="1"
							end="${tcDto.tcndent }">
							<c:if test="${i==tcDto.tcndent }">
		  							└
		  						</c:if>
							<c:if test="${i!=tcDto.tcndent }">
		  								&nbsp; &nbsp; &nbsp;
		  						</c:if>
						</c:forEach> ${tcDto.tccontent }</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>