<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<form action="${conPath }/teamtodo/modify.do" method="post" id="teamTodo_form">
		<input type="hidden" name="tno" value="${param.tno }">
		<input type="hidden" name="ttno" value="${param.ttno }">
		<input type="hidden" name="ttrdate" value="${param.ttrdate }">
		
		<input type="text" id="ttcontent" name="ttcontent" value="${param.ttcontent }" autofocus="autofocus">
		<label for="${teamTodoDetail.mid }">담당자</label>
		<select name="mid">
			<c:forEach var="list" items="${teamMemberList }">
				<option value="${list.mid }" 
					<c:if test ="${teamTodoDetail.mid eq list.mid }">selected="selected"</c:if>>${list.mname }(${list.mid })
				</option>
			</c:forEach>
		</select>
		<input type="submit" value="수정">
	</form>
</body>
</html>