
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
#comment {
	border: 1px solid black;
}
</style>
<%-- <link href="${conPath }/css/style.css" rel="stylesheet"> --%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(document).ready(function() {
	
		
		$('#submit').click(function() {
			/* var rnum = $('input[name=rnum]').val();
			var mid = $('input[name=mid]').val();
			var rpcontent = $('#rpcontent').val();
			var rpip = $('input[name=rpip]').val(); */

			/* 	var all = rnum+mid+rpcontent+rpip;
				console.log(all); */
			$.ajax({
				type : 'post', // 타입 (get, post, put 등등)
				url : 'replywrite.do', // 요청할 서버url
				dataType : 'html', // 데이터 타입 (html, xml, json, text 등등)
				data :$("#wform").serialize(),
				success : function(data) { // 결과 성공 콜백함수
					$("#rpcontent").val("");

				},

			})

		});
	});
	//$("#comment").serialize(),
/* 	 function replylist(){
		
		 $.ajax({
			type : 'get', // 타입 (get, post, put 등등)
			url : 'replylist.do', // 요청할 서버url
			dataType : 'html', // 데이터 타입 (html, xml, json, text 등등)
			data : $("#comment").serialize(),
			success : function(data) { // 결과 성공 콜백함수
				$('#cmtlist').text(data);
			

			},

		})
 
	
		
	}  */
	alert(replylist);
</script>
</head>
<body>
	<div id="title">
		${reviewContent.rtitle }
		<!-- 태그도 넣기 -->
	</div>
	<div id="nav">${reviewContent.rrdate }/ ${reviewContent.mname }</div>

	<div id="content">${reviewContent.rcontent }${relist.rpdate }</div>

	<button
		onclick="location.href='${conPath}/review/modify.do?rnum=${reviewContent.rnum}'">수정</button>
	<button
		onclick="location.href='${conPath}/review/delete.do?rnum=${reviewContent.rnum}'">삭제</button>
	<button onclick="location.href='${conPath}/review/list.do'">목록</button>
	<button
		onclick="location.href='${conPath}/review/replylist.do?rnum=${reviewContent.rnum}'">댓글목록</button>
	<div id="cmtwrite">
		<%-- 	<form action="${conPath }/review/replywrite.do" method="post"> --%>
		<form name="wform" id="wform" method="post">
			<input type="hidden" name="rnum" value="${reviewContent.rnum }">
			<input type="text" name="mid">
			<textarea rows="5" cols="10" id="rpcontent" name="rpcontent"></textarea>
			<input type="text" name="rpip">
			<button id="submit">작성</button>
		</form>
		<!-- 	</form> -->
	</div>
	<div id="cmtlist">
	</div>
		<div id="comment">

			<c:forEach items="${replylist }" var="relist">
				<div class="reply">
					번호 : ${relist. rpnum } 글번호 : ${relist.rnum } 작성자 : ${relist.mname }
					내용: ${relist.rpcontent } 작성일: ${relist.rpdate }
					<button
						onclick="location.href='${conPath}/review/replymodify.do?rpnum=${relist. rpnum}'">수정</button>
					<button
						onclick="location.href='${conPath}/review/replydelete.do?rpnum=${relist. rpnum}'">삭제</button>
					<button
						onclick="location.href='${conPath}/review/replycomment.do?rpnum=${relist. rpnum}'">답변</button>
				</div>
			</c:forEach>
		</div>

</body>
</html>