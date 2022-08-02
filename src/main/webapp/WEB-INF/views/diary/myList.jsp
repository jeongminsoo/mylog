<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MyLog : My List 날짜 파라미터 넘어오는거 보고 수정해야함</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		$(document).ready(function(){
			$('#todo_make').click(function(){
				$.ajax({
					url : 'todo.do/make';
					data : 'tdrdate=${nowDate}'
					type : 'get'
					sucess : function(data){
						$('#todo_make').html(data);
					}
				})
			});
			$('.todo_menu').click(function(){
				var tdno = $(this).attr('id');
				$('.toggle'+tdno).toggle():
			})
			$('body:not(.todo_menu)').click(function(){
				$('#toggle').hide():
			})
		});
	</script>
</head>
<body>
	<div id="main_wrap">
		<div id="date">
			<button>이전</button>
			<div class="nowDate">${nowDate }</div>
			<button>이후</button>
		</div>
		<div id="diaryList">
			<c:if test="${not empty myDiaryList }">
				<c:forEach var="mine" items="${myDiaryList }">
					<div class="list" onclick="location.href='${conPath}/diary.do/content?dnum=${mine.dnum }'">
						<span>${mine.dtitle }</span>
						<c:if test="${mine.dstatus eq 0 }">
							<span class="status">비밀 일기</span>
						</c:if>
						<c:if test="${mine.dstatus eq 1 }">
							<span class="status">친구 공개</span>
						</c:if>
						<c:if test="${mine.dstatus eq 0 }">
							<span class="status">전체 공개</span>
							<span class="hit">조회수 : ${mine.dhit }</span>
						</c:if>
					</div>
				</c:forEach>
			</c:if>
			<div id="diary_write" onclick="location.href='${conPath}/diary.do/wirte?mid=${member.mid }&drdate=${nowDate }">
				<span>+</span>
				<span>새로운 일기 쓰기</span>
			</div>
		</div>
		<div id="todo_list">
			<c:forEach var="todo" items="${todoList }">
				<div id="todo_${todo.tdno }">
					<span>
						<img alt="체크이미지 넣을거임" src="${conPath }/img/checkImg${todo.tdcontent }" id="checkBox" class="${todo.tdno }">
					</span>
					<span>${todo.tdcontent }</span>
					<div class="todo_menu" id="${todo.tdno }"><span>...</span>
						<div id="toggle" class="toggle${todo.tdno}">
							<span id="todo_modify" class="${todo.tdno }">수정</span>
							<span id="todo_delete" class="${todo.tdno }">삭제</span>
						</div>
					</div>
				</div>
			</c:forEach>
			<div id="todo_make">
				<span>+</span>
				<span>새로운 투두 만들기</span>
			</div>
		</div>
	</div>
</body>
</html>