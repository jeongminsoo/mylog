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
<!-- 부트스트랩 3.3.2css -->
<link rel="stylesheet" href="${conPath }/css/bootstrap.min.css">
<style>

</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	function playtoggle() {

		// 토글 할 버튼 선택 (btn1)
		const play = document.getElementById('play');
		var pause = document.getElementById('pause');
		// btn1 숨기기 (display: none)

		play.style.display = 'none';
		pause.style.display = 'show';

	}

	function pausetoggle() {
		const play = document.getElementById('play');
		var pause = document.getElementById('pause');
		const stop = document.getElementById('stop');

		pause.style.display = 'none';
		play.style.display = 'show';

	}

	$(document).ready(function() {
				$('#pause').hide();
				//기록될 시간
				var start;
				var snow;
				var during;
				var end;
				var enow;
				
				//타이머
				var tdo = $('input[name=tdo]').val();
				//var time = tdo * 3600;
				var time = tdo * 6
				var hour = 0;
				var min = 0;
				var sec = 0;
				var timer;

				if (tdo < 10) {
					tdo = '0' + tdo;
				}
				//document.getElementById('timer').innerHTML = tdo + ":00:00";
				document.getElementById('timer').innerHTML =  "00:00:"+tdo;

				//▶누른 경우
				$('#play').click(
						function() {
							$('#play').hide();
							$('#pause').show();

							timer = setInterval(function() {
								time--;

								min = Math.floor(time / 60);
								hour = Math.floor(time / 3600);
								sec = time % 60;
								min = min % 60;

								var ph = hour;
								var pm = min;
								var ps = sec;
								if (ph < 10) {
									ph = '0' + ph;
								}
								if (pm < 10) {
									pm = '0' + pm;
								}
								if (ps < 10) {
									ps = '0' + ps;

								}
								document.getElementById('timer').innerHTML = ph
										+ ":" + pm + ":" + ps;
								
								//타이머 시간이 다 된 경우
								if(time < 0){
				                   
				                    time = 0;
				                    clearInterval(timer);
				                    var enow = end.toLocaleTimeString('ko-kr');
				                    $.ajax({
				        				type : 'get', // 타입 (get, post, put 등등)
				        				url : 'timewrite.do', // 요청할 서버url
				        				dataType : 'html', // 데이터 타입 (html, xml, json, text 등등)
				        				data : {'start':start, 'end':end },
				        				success : function(data) { // 결과 성공 콜백함수
				        					//
				        					console.log(data);

				        				},

				        			})
				                    
								}
								
							}, 1000);
							
							//시작 시간 보내기
						var	snow = new Date();
							start = snow.toLocaleTimeString('ko-kr');
							var snowmilli = snow.getMilliseconds();
				             console.log(start);
				             console.log(snowmilli);
							
							
							
						});

				// ||누른 경우
				$('#pause').click(function() {
					$('#pause').hide();
					$('#play').show();

					clearInterval(timer);
					
					during = new Date();
		             var dnow = during.toLocaleTimeString('ko-kr');
		             var dnowmilli = during.getMilliseconds();
		             console.log(dnow);
		             console.log(dnowmilli);
				});

				//■ 누른 경우
				$('#stop').click(
						function() {
							$('#play').show();
							$('#pause').hide();
							clearInterval(timer);
							timer = 0;
							document.getElementById('timer').innerHTML = tdo
									+ ":00:00";
							
							
							var enow = new Date();
				            end = enow.toLocaleTimeString('ko-kr');
				             var enowmilli = enow.getMilliseconds();
				             console.log(enow);
				             console.log(enowmilli);
				             
				             $.ajax({
			        				type : 'get', // 타입 (get, post, put 등등)
			        				url : 'timewrite.do', // 요청할 서버url
			        				dataType : 'html', // 데이터 타입 (html, xml, json, text 등등)
			        				data : {'start':start, 'end':end },
			        				success : function(data) { // 결과 성공 콜백함수
			        					//
			        					console.log(data);

			        				},

			        			})
						});
				
				
				
				

			});
</script>
</head>
<body>
	${member.mname }님의 타이머 태그 ${param.tname }
	<div id="time">시간 ${param.tdo }</div>
	<input type="hidden" name="tdo" value="${param.tdo }">
	<div id="timer"></div>
	<div id="tbtn">
		<button id="play">▶</button>
		<button id="pause">◇</button>
		<button id="stop">■</button>
	</div>
	<div id="timetable">
	<div class="col-sm-6">
		<c:if test="${not empty param.start }">
		
		${param.start }</c:if>
		<table class="table table-bordered">
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

	</div>
</body>
</html>