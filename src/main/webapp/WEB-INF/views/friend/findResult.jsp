<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	$(document).ready(function(){
		$('.follow').click(function() {
			var id = $(this).attr('id');
			var answer = confirm('정말 해당 친구를 팔로우하시겠습니까?');
			if (answer == true) {
				location.href='${conPath}/friend/follow.do?fid=' + id;
			} else {
				return false;
			}
		});
		$('.unfollow').click(function() {
			var id = $(this).attr('id');
			var answer = confirm('정말 해당 친구를 언팔로우하시겠습니까?');
			if (answer == true) {
				location.href='${conPath}/friend/unfollow.do?fid=' + id;
			} else {
				return false;
			}
		});
	});
	</script>
</head>
<body>
	<c:set var="oNum" value="${paging.orderNum }"/>
	<table>
		<caption>친구 찾기</caption>
		<c:if test="${empty members }">
			<tr>
				<td>검색결과가 없습니다</td>
			</tr>
		</c:if>
		<c:if test="${not empty members }">
			<c:forEach items="${members }" var="m">
				<tr>
					<td>${oNum }</td>
					<td>${m.mname }(${m.mid })</td>
					<td>
						<c:if test="${m.existent eq 0 }">
							<button id="${m.mid }" class="follow">follow</button>
						</c:if>
						<c:if test="${m.existent eq 1 }">
							<button id="${m.mid }" class="unfollow">unfollow</button>
						</c:if>
					</td>
				</tr>
				<c:set var="oNum" value="${oNum + 1 }"/>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>