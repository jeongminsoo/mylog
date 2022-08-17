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

.write table {
	font-size : 1.2em;
}
.write table caption {
	text-align : left;
}
.write table th {
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

.btn {
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
		<form action="${conPath }/qna/reply.do" method="post">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<input type="hidden" name="aid" value="${admin.aid }">
			<input type="hidden" name="mid" value="${qna.mid }">
			<input type="hidden" name="qgroup" value="${qna.qgroup }">
			<input type="hidden" name="qstep" value="${qna.qstep }">
			<input type="hidden" name="qindent" value="${qna.qindent }">
			<div class="write">
				<table>
					<caption><h2>Q&A 답글작성</h2></caption>
					<col style="width : 200px;">
					<col style="width : 600px;">
					<tr>
						<th>제목</th>
						<td><input type="text" name="qtitle" class="qtitle" value="RE:${qna.qtitle }"></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><input type="text" name="qwriter" class="qwriter"
							value="관리자" readonly="readonly"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td  style="height : 200px; padding : 10px;"><textarea name="qcontent" class="qcontent" rows="15" cols="10"></textarea></td>
					</tr>
				</table>
			</div>
			<div class="btn_wrap">
				<input type="submit" value="등록" class="btn">
				<input type="reset" value="초기화" class="btn">
				<input type="button" value="목록" class="btn" onclick="location.href='${conPath}/qna/list.laf?pageNum=${param.pageNum }'">
			</div>
		</form>
		</div>
	</div>
</body>
</html>