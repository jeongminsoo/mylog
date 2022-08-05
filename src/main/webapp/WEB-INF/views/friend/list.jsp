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
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			var mid = '${member.mid}';
			$.ajax({
				url : '${conPath}/friend/list.do',
				data : 'mid=' + mid,
				type : 'get',
				dataType : 'html',
				success : function(data){
					$('#listResult').html(data);
				}
			});
			
			$.ajax({
				url : '${conPath}/friend/myFollow.do',
				data : 'mid=' + mid,
				type : 'get',
				dataType : 'html',
				success : function(data){
					$('#myFollow').html(data);
				}
			});
			
			$('input[name="mname"]').keyup(function(){
				var mname = $('input[name="mname"]').val();
				$.ajax({
					url : '${conPath}/friend/search.do',
					data : 'mname=' + mname + '&mid=' + mid,
					type : 'get',
					dataType : 'html',
					success : function(data){
						$('#listResult').html(data);
					}
				});
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
	<div>
		<a href="${conPath }/friend/findView.do">친구찾기</a>
		<form>
			<p>친구검색 <input type="text" name="mname" id="searchNname" placeholder="닉네임을 입력하세요"></p>
		</form>
		<div id="listResult"></div>
		<div id="myFollow"></div>
	</div>
</body>
</html>