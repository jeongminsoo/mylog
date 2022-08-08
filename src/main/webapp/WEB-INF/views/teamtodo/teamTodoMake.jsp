<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath}/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		function (){
			
		}
	</script>
</head>
<body>
	<form action="${conPath }/teamtodo/make.do" method="post">
		<input type="hidden" name="tno" value=${param.tno }>
		<input type="hidden" name="ttrdate" value=${param.ttrdate }>
		<table>
			<caption>todo 작성</caption>
			<tr>
				<td><input type="text" name="ttcontent" required="required" autofocus="autofocus"></td>
				<td>
					<select name="tmno">
						<c:forEach var="list" items="${teamMemberList }">
							<option value="${list.tmno }" 
								<c:if test ="${teamDetail.mid eq list.mid }">selected="selected"</c:if>>${list.mname }(${list.mid })
							</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="작성" class="btn">
					<input type="reset" value="초기화" class="btn">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>