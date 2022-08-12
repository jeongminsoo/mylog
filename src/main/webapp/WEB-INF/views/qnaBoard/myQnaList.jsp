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

#qnaList table {
	border-collapse: collapse;
	font-size : 1.2em;
}
#qnaList table caption {
	text-align : left;
}
#qnaList table th {
	background-color : #DFF6FF;
}

#qnaList table .title {
	padding-left : 10px;
	text-align : left;
}

#qnaList table .bottom {
	background-color : #DFF6FF;
}

#qnaList table tr {
	height : 50px;
}

.paging {
	margin : 30px 0 0 30px; 
	font-size : 1.2em;
}

#sub_nav {
	position : absolute;
	top : 100px;
	right : 300px;
}
	</style>
</head>
<body>
	<div id="main_wrap">
		<div id="wrap">
			<div id="qnaList">
			<table>
				<caption><h2>My Q&A List</h2></caption>
					<col style="width : 100px;">
					<col style="width : 470px;">
					<col style="width : 210px;">
					<col style="width : 210px;">
					<col style="width : 100px;">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
				<c:if test="${qnas.size() eq 0 }">
					<tr>
						<td colspan="5">등록된 게시물이 없습니다</td>
					</tr>
				</c:if>
				<c:if test="${qnas.size() != 0 }">
					<c:forEach items="${qnas}" var="q">
						<tr>
							<td>${q.qno }</td>
							<td class="title">
								<c:forEach var="i" begin="1" end="${q.qindent }">
									<c:if test="${i eq q.qindent }">
										└
									</c:if>
									<c:if test="${i != q.qindent }">
										&nbsp; &nbsp;
									</c:if>
								</c:forEach>
							<a href="${conPath }/qna/myContent.do?qno=${q.qno}&pageNum=${paging.currentPage}">${q.qtitle }</a>
							</td>
							<td>
								${q.qwriter }
							</td>
							<td>${q.qrdate }</td>
							<td>${q.qhit }</td>
						</tr>
					</c:forEach>
				</c:if>
				<tr>
					<td colspan="5" class="bottom"></td>
				</tr>
			</table>
		</div>
		<div class="paging">
				<a href="${conPath }/qna/myList.do?pageNum=${paging.startPage - 1 eq 0 ? 1 : paging.startPage-1}"><img src="${conPath }/img/btn01.gif" height="25"></a>
				<c:forEach var="j" begin="${paging.startPage }" end="${paging.endPage }">
					<c:if test="${j eq paging.currentPage }">
						<b> &nbsp; ${j } &nbsp; </b>
					</c:if>
					<c:if test="${j != paging.currentPage }">
						<a href="${conPath }/qna/myList.do?pageNum=${j}"> &nbsp; ${j } &nbsp; </a>
					</c:if>
				</c:forEach>
				<a href="${conPath }/qna/myList.do?pageNum=${paging.endPage == paging.pageCnt ? paging.endPage : paging.endPage + 1 }"><img src="${conPath }/img/btn0010.gif" height="25"></a>
		</div>
		</div>
		<div id="sub_nav">
			<ul>
				<li><a href="${conPath }/qna/list.do?pageNum=1">Q&A목록</a></li>
				<li><a href="${conPath }/qna/writeView.do">Q&A작성</a></li>
				<li><a href="${conPath }/qna/myList.do">My Q&A List</a></li>
			</ul>
		</div>
	</div>
</body>
</html>