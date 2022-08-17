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
			
		});
	</script>
	<style>
		a {
		text-decoration : none;
		color : black;
	}
	li {
		list-style: none;
		font-size : 1.2em;
		font-weight : bold;
		margin : 20px 0;
	}
		#main_wrap {
	width: 1600px;
	height: 850px;
	margin: 60px 35px;
	background-image : url(../img/main_wraper.png);
	position : absolute;
}

#wrap {
	width: 1000px;
	height: 600px;
	margin : 50px 0 0 150px;
	border: 1px solid white;
	text-align: center;
	position : relative;
}

#wrap table {
	font-size : 1.2em;
}
#wrap table caption {
	text-align : left;
}
#wrap table th {
	background-color : #DFF6FF;
}

#sub_nav {
	position : absolute;
	top : 100px;
	right : 300px;
}

input:not(.btn) {
	width : 90%;
	height : 90%;
}
.qcontent {
	width : 95%;
	resize: none;
}

.btn_wrap button {
	width: 80px;
	border: none;
	height: 30px;
	border-radius: 10px;
	background-color: #03045E;
	color: white;
	margin-left: 5px;
	font-weight : bold;
	font-size : 1em;
}
.btn_wrap {
	text-align : left;
	width : 500px;
	margin : 20px 0 0 0;
}
	</style>
</head>
<body>
	<div id="main_wrap">
		<div id="wrap">
			<table>
				<caption><h2>My Q&A</h2></caption>
				<col style="width : 200px;">
				<col style="width : 600px;">
				<tr>
					<th>Title</th>
					<td>${qna.qtitle }</td>
				</tr>
				<tr>
					<th>Writer</th>
					<td>
						${qna.qwriter }
					</td>
				</tr>
				<tr>
					<th>Content</th>
					<td style="height : 200px;"><pre>${qna.qcontent }</pre></td>
				</tr>
			</table>
			<div class="btn_wrap">
				<c:if test="${member != null && member.mid eq qna.mid }">
					<button onclick="location.href='${conPath}/qna/updateView.do?qno=${qna.qno }&pageNum=${param.pageNum}'">수정</button>
					<button onclick="location.href='${conPath}/qna/delete.do?qno=${qna.qno }&pageNum=${param.pageNum}'">삭제</button>
				</c:if>
				<c:if test="${admin != null }">
					<button onclick="location.href='${conPath}/qna/replyView.do?qno=${qna.qno }&pageNum=${param.pageNum}'">답글작성</button>
				</c:if>
				<button onclick="location.href='${conPath}/qna/myList.do?pageNum=${param.pageNum}'">목록</button>
			</div>
			</div>
	</div>
</body>
</html>