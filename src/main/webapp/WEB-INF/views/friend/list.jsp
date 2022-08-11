<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/friendList.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			
			$('input[name="mname"]').keyup(function(){
				var mname = $('input[name="mname"]').val();
				$.ajax({
					url : '${conPath}/friend/search.do',
					data : 'mname=' + mname,
					type : 'get',
					dataType : 'html',
					success : function(data){
						$('#listResult').html(data);
					}
				});
			});
			
			
			$('.unfollow').click(function() {
				var id = $(this).attr('id');
				var answer = confirm('정말 해당 친구를 언팔로우하시겠습니까?');
				if (answer == true) {
					location.href='${conPath}/friend/unfollow.do?alcode=0&fid=' + id;
				} else {
					return false;
				}
			});
			
			$('.follow').click(function() {
				var id = $(this).attr('id');
				var answer = confirm('정말 해당 친구를 팔로우하시겠습니까?');
				if (answer == true) {
					location.href='${conPath}/friend/follow.do?alcode=1&fid=' + id;
				} else {
					return false;
				}
			});
		});
	</script>
</head>
<body>
	<c:if test="${followResult eq 1 }">
		<script>
			alert('팔로우 성공');
		</script>
	</c:if>
	<c:if test="${followResult eq 0 }">
		<script>
			alert('팔로우 실패');
		</script>
	</c:if>
	<c:if test="${unfollowResult eq 1 }">
		<script>
			alert('언팔로우 성공');
		</script>
	</c:if>
	<c:if test="${unfollowResult eq 0 }">
		<script>
			alert('언팔로우 실패');
		</script>
	</c:if>
	<div id="main">
		<div id="wrap">
		<div id="search_wrap">
			<a href="${conPath }/friend/findView.do">친구찾기</a>
		</div>
		<div id="sub_title">
			<div id="following">팔로잉</div>
			<div id="follower">팔로워</div>
		</div>
		<div id="myList">
		<form>
			<p>친구검색 <input type="text" name="mname" placeholder="닉네임을 입력하세요"></p>
		</form>
		<div id="listResult">
			<table>
				<c:if test="${empty friends }">
					<tr>
						<td>등록된 친구가 없습니다</td>
					</tr>
				</c:if>
				<c:if test="${not empty friends }">
					<c:forEach items="${friends }" var="friend">
						<tr>
							<td>${friend.mname }(${friend.fid })</td>
							<td>
								<button id="${friend.fid }" class="unfollow">unfollow</button>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
		</div>
		<div id="followMe">
			<table>
				<c:if test="${empty follows }">
					<tr>
						<td>검색결과가 없습니다</td>
					</tr>
				</c:if>
				<c:if test="${not empty follows }">
					<c:forEach items="${follows }" var="follow">
						<tr>
							<td>${follow.mname }(${follow.mid })</td>
							<td>
								<c:if test="${follow.existent eq 1 }">
									<button id="${follow.fid }" class="unfollow">unfollow</button>
								</c:if>
								<c:if test="${follow.existent eq 0 }">
									<button id="${follow.fid }" class="follow">follow</button>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
		</div>
	</div>
</body>
</html>