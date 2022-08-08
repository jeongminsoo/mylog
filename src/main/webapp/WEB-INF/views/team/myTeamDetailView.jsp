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
<link href="${conPath }/css/style.css" rel="stylesheet">
	<style>
	table td {
		width: 50px;
		height: 50px;
	}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			$('select[name="year"], select[name="month"]').change(function(){
				$('form').submit();
			});
		});
		function myTeamModify(tno){
			location.href = '${conPath}/team/myTeamModifyView.do?tno='+tno;
		}
	
		$(document).ready(function(){
			// 토글
			$('.toggle').hide();
			$('.toggle_button').click(function(){
				var ttno = $(this).attr('id');
				$('.toggle'+ttno).toggle();
				$('.toggle:not(.toggle'+ttno+')').hide();
			})
			
			// 투두 만들기
			$('#teamTodo_make').click(function(){
				var tno = $(this).attr('name');
				var ttrdate =  '${ttrdate }';
				$.ajax({
					url : '${conPath}/teamtodo/makeView.do',
					data : 'tno='+tno+'&ttrdate='+ttrdate,
					type : 'get',
					success : function(data){
						$('#teamTodo_make_form').html(data);
					}
				})
			});
			
			// 투두 수정
			$('.team_todoModify').click(function(){
				var tno = '${tno }'
				var ttno = $(this).attr('name');
				var ttcontent = $('.ttcontent'+ttno).text();
				var ttrdate =  '${ttrdate }';
				
				$.ajax({
					url : '${conPath}/teamtodo/modifyView.do',
					data : 'tno='+tno+'ttno='+ttno+'&ttcontent='+ttcontent+'&ttrdate='+ttrdate,
					type : 'get',
					success : function(data){
						$('.ttcontent'+ttno).html(data);
					}
				})
				
				
			}); 
		
			// 다이어리 쓰기로 이동
			$('#diary_write').click(function(){
				location.href="${conPath}/diary/write.do?ddate=${nowDate }";
			})
			
		});
		
	</script>
</head>
<body>
	<c:if test="${myTeamModifyResult  eq 1}">
		<script>
			alert('그룹 디테일 수정 성공');
		</script>
	</c:if>
	<c:if test="${myTeamModifyResult  eq 0}">
		<script>
			alert('그룹 디테일 수정 실패');
			history.back();
		</script>
	</c:if>

	<!-- 그룹디테일(헤더, 수정하러가기) -->
	<div>
		<table style="width: 250px; border: 1px solid black;"
			<c:if test="${member.mid eq teamDetail.mid }">
				onclick="myTeamModify(${teamDetail.tno})"
			</c:if>>
			<tr>
				<td><h2>${teamDetail.tname }</h2></td>
				<td>(${teamDetail.mname } | ${teamMemberTotCnt })</td>
			</tr>
			<tr>
				<td colspan="2">목표 : ${teamDetail.tgoal }</td>
			</tr>
		</table>
	</div>

	<!-- 그룹가입 신청자 list -->
	<c:if test="${member.mid eq teamDetail.mid }">
		<div>
			<a href="${conPath }/teammember/teamApplyList.do?tno=${teamDetail.tno }">그룹가입 신청자 list</a>
		</div>
	</c:if>

	<!-- 달력 -->
	<h2>${year }년${month }월</h2>
	<b>
		<form action="${conPath }/team/myTeamDetailView.do">
			<select name="year">
				<c:forEach var="i" begin="${year-10 }" end="${year+10 }">
					<c:if test="${i eq year }">
						<option selected="selected">${i }</option>
					</c:if>
					<c:if test="${i != year }">
						<option>${i }</option>
					</c:if>
				</c:forEach>
			</select> 년 <select name="month">
				<c:forEach var="i" begin="1" end="12">
					<c:if test="${i eq month }">
						<option selected="selected">${i }</option>
					</c:if>
					<c:if test="${i != month }">
						<option>${i }</option>
					</c:if>
				</c:forEach>
			</select> 월
		</form>
	</b>
	<table>
		<tr>
			<c:forEach var="t" items="${calPrint.title }">
				<th>${t }</th>
			</c:forEach>
		</tr>
		<c:forEach var="i" begin="0" end="5">
			<tr>
				<c:forEach var="j" begin="0" end="6">
					<c:if test="${empty calPrint.calDate[i][j] }">
						<td></td>
					</c:if>
					<c:if test="${not empty calPrint.calDate[i][j] }">
						<td
							onclick="location.href='${conPath}/teamtodo/todoList.do?year=${year }&month=${month }&day=${calPrint.calDate[i][j] }&tno=${teamDetail.tno }'">
							<h3>${calPrint.calDate[i][j] }</h3>
						</td>
					</c:if>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>

	<!-- teamTodoList -->
	<div id="teamTodo_list" style="border:1px solid black;">
		<h3>${teamDetail.tname } TODO LIST</h3>
		<c:if test="${empty teamTodoList }">
			<p>생성된 할 일이 없습니다.</p>
		</c:if>
		<c:if test="${not empty teamTodoList }">
			<c:forEach var="todo" items="${teamTodoList }">
				<div id="todo${todo.ttno }">
					<span>
						<img alt="체크이미지${todo.ttcheck }" src="${conPath }/img/checkImg${todo.ttcheck }" class="check${todo.ttno }">
					</span>
					<span class="ttcontent${todo.ttno }">${todo.ttcontent }</span>
					<span>${todo.mname }</span>
					<c:if test="${todo.mid eq member.mid }">
						<span class="toggle_button" id="${todo.ttno }">...</span>
					</c:if>
					<div class="toggle toggle${todo.ttno}">
						<button class="team_todoModify" name="${todo.ttno }">수정</button>
						<button class="team_todoDelay" onclick="location.href='${conPath}/teamtodo/check.do?ttno=${todo.ttno }&ttcheck=1'">내일로 미루기</button>
						<button onclick="location.href='${conPath}/teamtodo/delete.do?ttno=${todo.ttno }&ttrdate=${ttrdate }&tno=${teamDetail.tno }'">삭제</button>
					</div>
				</div>
			</c:forEach>
		</c:if>
		<div id="teamTodo_make_form"></div>
		<div id="teamTodo_make" name=${teamDetail.tno }>
			<span>+</span>
			<span>새로운 투두 만들기</span>
		</div>
	</div>
</body>
</html>