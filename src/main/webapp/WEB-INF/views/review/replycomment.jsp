
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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(document).ready(function() {

		$('.modify').click(function() {
			//$(this).attr('id')
			//var rpnum = $('input[name=rpnum]').val();
			//var rnum = $('input[name=rnum]').val();
			//	var rpcontent = $('textarea[name=rpcontent]').text();
			//	console.log(rpnum + ',' + rnum +", " +rpcontent );
			$.ajax({
				type : 'post',
				url : 'replymodify.do',
				dataType : 'html',
				data : $("#mform").serialize(),
				success : function(data) {
					//location.reload();
					console.log(data);

				},

			})
		});

	});
</script>
</head>
<body>

	<form name="cform" id="cform" method="post">
	
		<input type="hidden" name="rpgroup" value="">
		<input type="hidden" name="rnum" value="">
		<input type="text" name="mid" value="AAA">
		<textarea rows="5" cols="10" id="rpcontent" name="rpcontent"></textarea>
		<input type="text" name="rpip" value="120.12.10">
		<button id="submit">작성</button>
		<button onclick="history.back()">취소</button>
	</form>

</body>
</html>