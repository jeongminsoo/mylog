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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>

$(document).ready(function() {
	/* $.ajax({
		type : 'get', // 타입 (get, post, put 등등)
		url : 'timetable/view.do', // 요청할 서버url
		dataType : 'json', // 데이터 타입 (html, xml, json, text 등등)
		data : {
			'tableIdList' : "${tableIdList}"
		},
		success : function(data) { // 결과 성공 콜백함수
				var array = new array();
			array.push(tableIdList);
			
		},
 
	})*/
	var tableList = '${tableIdList}';

	alert(tableList);
	console.log(tableList.length);
	
	$(tableList).forEach(function(idx, list){
		
		var tbshour = list.tbsour;
	});
	
	/* var tbshour = $('input[name=tbshour]').val();
	var tbsmin = Math.round($('input[name=tbsmin]').val());
	var tbehour = $('input[name=tbehour]').val();
	var tbemin = Math.round($('input[name=tbemin]').val());
	var tduring = Math.round($('input[name=tduring]').val()/10); */
	
	/* var stime = Number(tbshour+tbsmin);
	var etime = Number(tbehour+tbemin);
	console.log(tduring);
	console.log(stime);
	console.log(etime); */

	/* for(var idx=stime; idx<etime; idx++){
	    $('.'+idx).css('background-color', 'lightgray');
	} */
		 

			});
</script>
</head>
<body>

	<div id="timetable">
	<h1>기록한 시간</h1>
	<div class="col-sm-6">
<%--  <c:if test="${not empty tableIdList }">
  <input type="text" name="tbshour" value="${tableIdList.tbshour }"> 
${tableIdList }
</c:if>

<c:if test="${empty tableIdList }">
	기록된 시간이 없습니다
</c:if> --%>
<%-- <input type="text" name="tbshour" value="${tableIdList.tbshour }">
<input type="text" name="tbsmin" value="${tableIdList.tbsmin }">
<input type="text" name="tbehour" value="${tableIdList.tbehour }">
<input type="text" name="tbemin" value="${tableIdList.tbemin }">
<input type="text" name="tduring" value="${tableIdList.tduring }"> --%>

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