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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	<script>
		window.onload = function () {
			new Chart(document.getElementById("doughnut-chart"), {
			    type: 'doughnut',
			    data: {
			      labels: ["Africa", "Asia", "Europe", "Latin America", "North America"],
			      datasets: [
			        {
			          label: "Category (won)",
			          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
			          data: [2478,5267,734,784,433]
			        }
			      ]
			    },
			    options: {
			      title: {
			        display: true,
			        text: '월 지출 총액'
			      }
			    }
			});
			
		}
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
			<c:if test="${empty monthTotal }">
				<table>
					<tr>
						<th colspan="2">월 누적 금액</th>
					</tr>
					<tr>
						<td colspan="2">0</td>
					</tr>
					<tr>
						<th>수입</th>
						<th>지출</th>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
					</tr>
				</table>
			</c:if>
			<c:if test="${not empty monthTotal }">
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
			</c:if>
		</div>
		<div id="category_total">
			<canvas id="doughnut-chart" width="100px" height="100px"></canvas>
		</div>
		<div id="list">
			<c:if test="${empty monthlyList }">
				<span>수입/지출 내역이 없습니다</span>
			</c:if>
			<c:if test="${not empty monthlyList }">
				<c:forEach var="list" items="${monthlyList }">
					<div class="one">
						<span><fmt:formatDate value="${list.adate }" pattern="MM/dd"/></span>
						<span>
							<c:if test="${list.astatus eq 0 }">
								지출
							</c:if>
							<c:if test="${list.astatus eq 1 }">
								수입
							</c:if>
						</span>
						<span>${list.acontent }</span>
						<span>${list.aprice }</span>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
</body>
</html>