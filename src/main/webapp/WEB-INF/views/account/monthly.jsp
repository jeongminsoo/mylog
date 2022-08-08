<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MyLog : Account Daily List</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		$(document).ready(function(){
			 
		});
	</script>
	
	<script>
		window.onload = function () {
		    pieChartDraw();
		}
		
		var labels;
		var data;
		
		for(int i = 0; i<Number('${mothlyCategoryTotal.size() }'); i++){
			labels.push('${mothlyCategoryTotal.get(i).getAtitle()}');
			data.push('${mothlyCategoryTotal.get(i).getAprice()}');
		}
		alert(labels);
		alert(data);
		
		let pieChartData = {
			    labels: labels,
			    datasets: [{
			        data: data,
			        backgroundColor: ['rgb(255, 99, 132)', 'rgb(255, 159, 64)', 'rgb(255, 205, 86)', 'rgb(75, 192, 192)', 'rgb(54, 162, 235)', 'rgb(153, 102, 255)']
			    }] 
			};

			let pieChartDraw = function () {
			    let ctx = document.getElementById('pieChartCanvas').getContext('2d');
			    
			    window.pieChart = new Chart(ctx, {
			        type: 'pie',
			        data: pieChartData,
			        options: {
			            responsive: false
			        }
			    });
			};
	</script>
</head>
<body>
	<div id="main_wrap">
		<div id="month">
			<a href="list.do?adate=${before }">이전</a>
			<fmt:formatDate value="${monthTotal.adate }" pattern="yyyy년 MM월"/>
			<a href="list.do?adate=${after }">이후</a>
		</div>
		<div id="month_total">
			<table>
				<tr>
					<th colspan="2">월 누적 금액</th>
				</tr>
				<tr>
					<td colspan="2">${monthTotal.total }</td>
				</tr>
				<tr>
					<th>수입</th>
					<th>지출</th>
				</tr>
				<tr>
					<td>${monthTotal.incomeTotal }</td>
					<td>${monthTotal.expenseTotal }</td>
				</tr>
			</table>
		</div>
		<div id="category_total">
			<canvas id="pieChartCanvas" width="300px" height="300px"></canvas>
		</div>
		<div id="list">
			<c:forEach var="list" items="monthlyList">
				<div class="one">
					<span>${list.acontent }</span>
					<span><fmt:formatDate value="${list.adate }" pattern="MM/dd"/></span>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>