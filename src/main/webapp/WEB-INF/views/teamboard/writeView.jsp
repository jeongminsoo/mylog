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
	<link href="${conPath }/css/teamboard/write.css" rel="stylesheet">
	<style>
		.ck.ck-editor {
	    	max-width: 500px;
		}
		.ck-editor__editable {
		    min-height: 400px;
	}
	</style>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="${conPath }/resources/ckeditor/ckeditor.js"></script>
	<script>
	$(function() {
		CKEDITOR.replace('tcontent');
	});
	</script>
</head>
<body>
<div class="wrap" style="background-image: url('../img/main_wraper.png'); border: 1px solid white;">
    <form action="${conPath }/teamboard/write.do" method="post" class="teamBoardWrite_wrap" name="bWriteForm">
		<input type="hidden" name="mid" value="${member.mid }">
		<input type="hidden" name="mname" value="${member.mname }">
		<table class="teamBoardWrite">
			<tr>
				<td><input type="text" name="ttitle" required="required" placeholder="title"></td>
			</tr>
			<tr>
				<td>${member.mname }</td>
			</tr>
			<tr>
				<td><textarea name="tcontent" required="required" id="classic"></textarea></td>
			</tr>
			<tr class="btn">
				<td colspan="2">
					<input style="border: none; background-color: white; padding:3px;" 
						type="submit" value="[write]" class="btn" onclick="return jbSubmit();">
					<input style="border: none; background-color: white; padding:3px;" 
						type="reset" value="[reset]" class="btn">
					<input style="border: none; background-color: white; padding:3px;" 
						type="button" value="[list]" onclick="location.href='${conPath}/teamboard/list.do'" class="btn">
				</td>
			</tr>
		</table>
	</form>
    <script>
    	ClassicEditor.create( document.querySelector( '#classic' ), {
        	// 제거 하고싶은 플러그인 (배열)
            removePlugins: [ 'ImageUpload' ]
        } )
        .catch( error => {
            console.error( error );
        } );
    </script>
    <script>
		$(document).ready(function(){
			//인덱스
			$('#teamboard').addClass('nowIndex');
	  	});
	</script>
	<jsp:include page="../main/header.jsp"/>
</div>
</body>
</html>