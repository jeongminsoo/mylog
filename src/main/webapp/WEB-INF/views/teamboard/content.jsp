<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath}/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		function replyComment(tcnum, pageNum, tnum, tcpageNum) {
			$.ajax({
				url : '${conPath}/teamcomment/replyView.do',
				data : { 'tcnum': tcnum, 'pageNum': pageNum, 'tnum':tnum , 'tcpageNum':tcpageNum },
				type : 'get',
				dataType : 'html',
				success : function(data, status) {
					$('#replyDiv').html(data);
				}
			});
		}
		function modifyComment(tcnum, pageNum, tnum, tcpageNum) {
			$.ajax({
				url : '${conPath}/teamcomment/modifyView.do',
				data : { 'tcnum': tcnum, 'pageNum': pageNum, 'tnum':tnum , 'tcpageNum':tcpageNum },
				type : 'get',
				dataType : 'html',
				success : function(data, status) {
					$('#modifyDiv').html(data);
				}
			});
		}
	</script>
</head>
<body>
	<c:if test="${teamboarddeleteResult eq 1 }">
		<script>
			alert('댓글삭제 성공');
		</script>
	</c:if>
	<c:if test="${teamboarddeleteResult eq 0 }">
		<script>
			alert('댓글삭제 실패');
		</script>
	</c:if>
	<div id="content">
		<table>
			<tr>
				<td>${content.ttitle }(${content.thit })</td>
			</tr>
			<tr class="left">
				<td>${content.mname }</td>
			</tr>
			<tr>
				<td>${content.tcontent }</td>
			</tr>
			<tr>
				<td>작성일 : ${content.trdate }</td>
			</tr>
			<tr>
				<td>ip : ${content.tip }</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="목록"
						onclick="location.href='${conPath}/teamboard/list.do?pageNum=${pageNum }'"
						class="btn"> 
					<c:if test="${member.mid eq content.mid }">
						<input type="button" value="수정"
							onclick="location.href='${conPath}/teamboard/modifyView.do?tnum=${content.tnum}&pageNum=${pageNum }'"
							class="btn"> 
						<input type="button" value="삭제"
							onclick="location.href='${conPath}/teamboard/delete.do?tnum=${content.tnum}&pageNum=${pageNum }'"
							class="btn">
					</c:if>
				</td>
			</tr>
		</table>
		<form action="${conPath }/teamcomment/write.do" method="post">
			<input type="hidden" name="mid" value="${member.mid }">
			<input type="hidden" name="tnum" value="${content.tnum }">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<table>
				<tr>
					<td><input type="text" name="mname" value="${member.mname }" readonly="readonly"></td>
					<td><input type="text" name="tccontent" required="required"></td>
					<td><input type="submit" value="댓글쓰기" class="btn"></td>
				</tr>
			</table>
		</form>
		<table>
			<caption>댓글</caption>
			<c:if test="${teamCommentTotCnt eq 0 }">
				<tr>
					<td>등록된 댓글이 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${teamCommentTotCnt ne 0 or teamCommentTotCnt ne null}">
				<c:forEach items="${teamcommentList }" var="tcDto">
					
					<tr>
						<c:if test="${tcDto.tcindent eq 1 }">
				  			&nbsp; &nbsp;
				  			<td style="color:red;">@${tcDto.tcmention }</td>
				  		</c:if>
						<td>${tcDto.mname }</td>
				  		<td>${tcDto.tccontent }</td>
						<td>
							<button
								onclick="replyComment('${tcDto.tcnum}', '${param.pageNum}', '${content.tnum }', '${tcpaging.currentPage }')">답댓글</button>
							<c:if test="${member.mid eq tcDto.mid }">
								<button 
									onclick="modifyComment('${tcDto.tcnum}', '${param.pageNum}', '${content.tnum }', '${tcpaging.currentPage }')">수정</button>
								<button 
									onclick="location.href='${conPath}/teamcomment/delete.do?tnum=${content.tnum}&pageNum=${pageNum }&tcnum=${tcDto.tcnum }'">삭제</button>
							</c:if>
						</td>
					</tr>
				</c:forEach>
				<div id="modifyDiv"></div>
				<div id="replyDiv"></div>
			</c:if>
		</table>
		<div id="paging">
			<c:if test="${tcpaging.startPage > tcpaging.blockSize }">
	  			[ <a href="${conPath }/teamboard/content.do?tnum=${content.tnum}&pageNum=${param.pageNum }&tcpageNum=${tcpaging.startPage-1 }"> 이 전 </a>]
	  		</c:if>
		  	<c:forEach var="i" begin="${tcpaging.startPage }" end="${tcpaging.endPage }">
		  		<c:if test="${i eq tcpaging.currentPage }">
		  			[ <b>${i }</b> ]
		  		</c:if>
		  		<c:if test="${i != tcpaging.currentPage }">
		  			[ <a href="${conPath }/teamboard/content.do?tnum=${content.tnum}&pageNum=${param.pageNum }&tcpageNum=${i }">${i }</a> ]
		  		</c:if>
		  	</c:forEach>
		  	<c:if test="${tcpaging.endPage < tcpaging.pageCnt }">
		  		[ <a href="${conPath }/teamboard/content.do?tnum=${content.tnum}&pageNum=${param.pageNum }&tcpageNum=${tcpaging.endPage+1 }"> 다 음 </a>]
		  	</c:if>
		</div>
	</div>
</body>
</html>