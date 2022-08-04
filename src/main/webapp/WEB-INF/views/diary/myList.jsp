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
			$('.toggle').hide();
			$('#todo_make').click(function(){
				var nowDate =  '${nowDate }';
				$.ajax({
					url : '${conPath}/todo/make.do',
					data : 'tdrdate='+nowDate,
					type : 'get',
					success : function(data){
						$('#todo_make_form').html(data);
					}
				})
			});
			$('#diary_write').click(function(){
				location.href="${conPath}/diary/write.do?ddate=${nowDate }";
			})
			$('.toggle_button').click(function(){
				var tdno = $(this).attr('id');
				$('.toggle'+tdno).toggle();
				$('.toggle:not(.toggle'+tdno+')').hide();
			})
			$('.todoModify').click(function(){
				var tdno = $(this).attr('name');
				var tdcontent = $('.tdcontent'+tdno).text();
				$.ajax({
					url : '${conPath}/todo/modify.do',
					data : 'tdno='+tdno+'&tdcontent='+tdcontent,
					type : 'get',
					success : function(data){
						$('.tdcontent'+tdno).html(data);
					}
				})
			});
		});
	</script>
</head>
<body>
	<div id="main_wrap">
		<div id="date">
			<button onclick="location.href='${conPath }/diary/myList.do?ddate=${before }'">이전</button>
			<div class="nowDate">${nowDate }</div>
			<button onclick="location.href='${conPath }/diary/myList.do?ddate=${after }'">이후</button>
		</div>
		<div id="diaryList">
			<c:if test="${not empty diaryList }">
				<c:forEach var="diary" items="${diaryList }">
					<div class="list" onclick="location.href='${conPath }/list/content.do?dnum=${diary.dnum }'">
						<span>${diary.dtitle }</span>
						<c:if test="${diary.dstatus eq 0 }">
							<span class="status">비밀 일기</span>
						</c:if>
						<c:if test="${diary.dstatus eq 1 }">
							<span class="status">친구 공개</span>
						</c:if>
						<c:if test="${diary.dstatus eq 2 }">
							<span class="status">전체 공개</span>
							<span class="hit">조회수 : ${diary.dhit }</span>
						</c:if>
						<span class="drdate">작성일 : ${diary.drdate }</span>
					</div>
				</c:forEach>
			</c:if>
			<div id="diary_write">
				<span>+</span>
				<span>새로운 일기 쓰기</span>
			</div>
			<div class="paging">
				<c:if test="${paging.startPage > paging.blockSize }">
					<a href="${conPath }/diary/myList.do?ddate=${nowDate }&pageNum=${paging.startPage-1 }">[ 이전 ]</a>
				</c:if>
				<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
					<c:if test="${i eq paging.currentPage }">
						[ <b>${i }</b> ]
					</c:if>
					<c:if test="${i != paging.currentPage }">
						<a href="${conPath }/diary/myList.do?ddate=${nowDate }&pageNum=${i}">[ ${i } ]</a>
					</c:if>
				</c:forEach>
				<c:if test="${ paging.endPage < paging.pageCnt }">
					<a href="${conPath }/diary/myList.do?ddate=${nowDate }&pageNum=${paging.endPage + 1 }">[ 다음 ]</a>
				</c:if>
			</div>
		</div>
		<div id="todo_list">
			<c:forEach var="todo" items="${todoList }">
				<div id="todo${todo.tdno }">
					<span>
						<img alt="체크이미지 넣을거임" src="${conPath }/img/checkImg${todo.tdcontent }" class="${todo.tdno }">
					</span>
					<span class="tdcontent${todo.tdno }">${todo.tdcontent }</span>
					<span class="toggle_button" id="${todo.tdno }">...</span>
					<div class="toggle toggle${todo.tdno}">
						<button class="todoModify" name="${todo.tdno}">수정</button>
						<button onclick="location.href='${conPath}/todo/delete.do?tdno=${todo.tdno }'">삭제</button>
					</div>
				</div>
			</c:forEach>
			<div id="todo_make_form"></div>
			<div id="todo_make">
				<span>+</span>
				<span>새로운 투두 만들기</span>
			</div>
		</div>
	</div>
</body>
</html>