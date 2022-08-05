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
				var tname = $('input[name=tname]').val();
				var tno = $('input[name=tno]').val();
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
								/* if(time < 0){
				                   
				                    
				                    clearInterval(timer);
				                    var enow = end.toLocaleTimeString('ko-kr');
				                    document.getElementById('timer').innerHTML = tdo
									+ ":00:00";
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
				                    
								} */
								
							}, 1000);
							
							//시작 시간 보내기
						var	snow = new Date();
							start = snow.getTime();
							stime = snow.toLocaleTimeString('ko-kr');
				            ssecond=Math.floor((start/1000)%60);
					         
					        
					         $.ajax({
			        				type : 'get', // 타입 (get, post, put 등등)
			        				url : 'timestart.do', // 요청할 서버url
			        				dataType : 'text', // 데이터 타입 (html, xml, json, text 등등)
			        				data : {'tstart':ssecond, 'tdo':tdo, 'tname':tname,'tno':tno },
			        				success : function(data) { // 결과 성공 콜백함수
			        					alert(data);
		
			        				},

			        			})
							
							
						});

				// ||누른 경우
				$('#pause').click(function() {
					$('#pause').hide();
					$('#play').show();

					clearInterval(timer);
					
					dnow = new Date();
					dtime = dnow.getTime();
					during = Math.floor(((dtime-start)/1000)%60);
					console.log(dtime);
				
					 $.ajax({
	        				type : 'get', // 타입 (get, post, put 등등)
	        				url : 'timesave.do', // 요청할 서버url
	        				dataType : 'text', // 데이터 타입 (html, xml, json, text 등등)
	        				data : {'tduring':during, 'tname':tname, 'tno':tno },
	        				success : function(data) { // 결과 성공 콜백함수
	        					//
	        					

	        				},

	        			})  
					
				});

				//■ 누른 경우
				$('#stop').click(
						function() {
							$('#play').show();
							$('#pause').hide();
							clearInterval(timer);
							time = tdo * 6;
							document.getElementById('timer').innerHTML = tdo
									+ ":00:00";
							
							
							var enow = new Date();
				            end = enow.getTime();
				            etime = enow.toLocaleTimeString('ko-kr');
				            tduring = Math.floor(((end-start)/1000)%60);
				            esecond=Math.floor((end/1000)%60);

				             
				               $.ajax({
			        				type : 'get', // 타입 (get, post, put 등등)
			        				url : 'timewrite.do', // 요청할 서버url
			        				dataType : 'text', // 데이터 타입 (html, xml, json, text 등등)
			        				data : {'tstart':ssecond, 'tend':esecond, 'tname':tname, 'tno':tno, 'tduring':tduring },
			        				success : function(data) { // 결과 성공 콜백함수
			        					//
			        					

			        				},

			        			})  
						});
				
				
				
				

			});
</script>
</head>
<body>
	${member.mname }님의 타이머 태그 ${param.tname }
	<div id="time">시간 ${param.tdo }</div>
	<input type="hidden" name="tname" value="${param.tname }">
	<input type="hidden" name="tdo" value="${param.tdo }">
	<input type=hidden name="tno" value="${tno }">
	<div id="timer"></div>
	<div id="tbtn">
		<button id="play">▶</button>
		<button id="pause">◇</button>
		<button id="stop">■</button>
	</div>
	
	
	<button onclick="location.href='${conPath}/timer/tableview.do'">이동</button>
</body>
</html>