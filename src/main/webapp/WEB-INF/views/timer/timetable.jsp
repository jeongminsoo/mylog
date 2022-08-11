<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="${conPath }/css/timetable.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(document).ready(
			function() {
				document.getElementById('dolist').innerHTML = "<h4>What to do ?</h4>";
				
			
					//타임테이블 출력
					var array = [];
					var tableList = ${tableIdList};
					$(tableList).each(function(idx, list) {
						array.push(list);

					});

					$(array).each(function(idx, item) {
						var tname= item.tname;
						var tbshour = item.tbshour;
						var tbsmin = item.tbsmin;
						var tbehour = item.tbehour;
						var tbemin = item.tbemin;
						var tduring = item.tduring;
						var stime = Number(tbshour + tbsmin);
						var etime = Number(tbehour + tbemin);
						
					/* 	for(var i in tname){
							document.getElementById('do').innerHTML += "<h4>"+tname+"</h4>";
							
							
						} */
						for (var idx = stime; idx < etime; idx++) {
							$('.' + idx).css('background-color', 'lightgray');
						
						}
						
						

					});
				
				
					

				$('button').click(function(){
					
					var color= $(this).attr('id');
					console.log(color);
					
					
					var array = [];
					var tableList = ${tableIdList};
					$(tableList).each(function(idx, list) {
						array.push(list);

					});

					$(array).each(function(idx, item) {
						var tname= item.tname;
						var tbshour = item.tbshour;
						var tbsmin = item.tbsmin;
						var tbehour = item.tbehour;
						var tbemin = item.tbemin;
						var tduring = item.tduring;
						var stime = Number(tbshour + tbsmin);
						var etime = Number(tbehour + tbemin);
						
					/* 	for(var i in tname){
							document.getElementById('do').innerHTML += "<h4>"+tname+"</h4>";
							
							
						} */
						for (var idx = stime; idx < etime; idx++) {
							$('.' + idx).css('background-color', color);
						
						}
						
						

					});
					
				});
				//색변경
				var color = [ '#f4cccc', '#fbe4cd', '#fdf2cc', '#d9ead3',
						'#d0e0e3', '#cfe2f2', '#d9d2e9', '#ead1dc' ];
				

			});
</script>
</head>
<body>
	<div id="wrap">
		<div id="timetable">
			<h1>DAY CALENDAR</h1>
			
			<div class="col-sm-6">

				<c:if test="${empty tableIdList }">
	기록된 시간이 없습니다
</c:if>

				<div>
				<button id="#f4cccc">o</button>
				<button id="#fbe4cd">o</button>
				<button id="#fdf2cc">o</button>
				<button id="#d9ead3">o</button>
				<button id="#d0e0e3">o</button>
				<button id="#cfe2f2">o</button>
				<button id="#d9d2e9">o</button>
				<button id="#ead1dc">o</button>
				
				</div>
				<table class="table table-bordered" >
					<thead>
						<tr>
							<th scope="col">시간</th>
							<th scope="col">10</th>
							<th scope="col">20</th>
							<th scope="col">30</th>
							<th scope="col">40</th>
							<th scope="col">50</th>
							<th scope="col">60</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" begin="5" end="24">
							<tr class="${i}">
								<th>${i }</th>
								<td class="${i}10"></td>
								<td class="${i}20"></td>
								<td class="${i}30"></td>
								<td class="${i}40"></td>
								<td class="${i}50"></td>
								<td class="${i}60"></td>
							</tr>

						</c:forEach>
						<c:forEach var="i" begin="1" end="4">
							<tr class="${i}">
								<th>${i }</th>
								<td class="${i}10"></td>
								<td class="${i}20"></td>
								<td class="${i}30"></td>
								<td class="${i}40"></td>
								<td class="${i}50"></td>
								<td class="${i}60"></td>
							</tr>

						</c:forEach>
					</tbody>
				</table>
			</div>
			<div id="do" style="height:600px; width:20%;">
				<span id="dolist"></span>
				
			</div>
			
		</div>
	</div>
</body>
</html>