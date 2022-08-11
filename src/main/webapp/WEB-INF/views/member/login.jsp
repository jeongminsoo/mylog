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
			$('.search').click(function() {
				var searchIdPw = open('${conPath}/member/searchIdPwView.do', '',
									'width=800, height=500, left=800, top=300');
				if (!searchIdPw) {
					alert('팝업차단 설정이 되어있습니다. 차단 해제 이후 다시 시도하세요.');
				}
			});
		});
	</script>
	<style>
		#main {
			width : 1600px;
			height : 850px;
			margin : 0 auto;
			border : 1px solid black;
		}
		
		#wrap {
			width : 1000px;
			height : 600px;
			margin : 100px auto;
			border : 1px solid black;
			text-align : center;
		}
		#wrap table {
			width : 600px;
			margin : 0 auto;
			margin-top : 300px;
			text-align : center;
		}
		
		#wrap table td {
			height : 50px;
		}
		
		.search {
			cursor : pointer;
		}
		input:not(.btn) {
			width : 100%;
			height : 90%;
			border : none;
			border-bottom : 1px solid lightgray;
			border-radius : 10px;
			font-size : 1.2em;
		}
		
		.btn {
			width : 300px;
			height : 30px;
			font-size : 1.2em;
			border : none;
			border-radius : 10px;
			font-weight : bold;
			background-color : #03045E;
			color : white;
			cursor : pointer;
		}
	</style>
</head>
<body>
	<c:if test="${joinResult eq 0 }">
		<script>
			alert('회원가입 실패');
			history.back();
		</script>
	</c:if>
	<c:if test="${joinResult eq 1 }">
		<script>
			alert('회원가입 성공');
		</script>
	</c:if>
	<c:if test="${loginResult != null }">
		<script>
			alert('${loginResult}');
		</script>
	</c:if>
	<div id="main">
	<div id="wrap">
		<form action="${conPath }/member/login.do" method="post">
			<table>
				<tr>
					<td><input type="text" name="mid" value="${mid}" placeholder="ID"></td>
				</tr>
				<tr>
					<td><input type="password" name="mpw" value="${mpw}" placeholder="PASSWORD"></td>
				</tr>
				<tr>
					<td>
						<p><input type="submit" value="Login" class="btn"></p>
						<span class="search">아이디/비밀번호 찾기</span>
					</td>
				</tr>
			</table>
		</form>
	</div>
	</div>
</body>
</html>