<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../menubar/w03_headerBar.jsp" %><!-- 메뉴상단바 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="../js/httpRequest.js"></script>
	<style>
		#tt{border-top: hidden; border-left: hidden; border-right:hidden; font-size: 10px; padding:0;}
		table{border-collapse: collapse; margin:40px auto 0 auto; width:700px;}
		td{padding:10px;}
		textarea{width:100%; border: hidden;}
		.thin{border-left:hidden; border-right: hidden; height: 5px; padding:2px;}
		.ch{display: inline-block; width: 70px; height:13px; background-color: #49C3FD;
			  color:white; font-size:15px; text-align:center; padding:10px; margin-left:20px; margin-right:0;
			  line-height: 1em; border-radius:0.5em; -moz-border-radius: 0.5em; -webkit-border-radius: 0.5em;}
		.t_b{border-bottom:hidden; border-left: hidden; border-right: hidden; padding:20px;}
		#t_cmt{margin-bottom: 30px;}
		.co{font-size: 10px; text-align: center;}
	</style>
	<script type="text/javascript">
		function edit(){
			var idx = document.getElementById("idx").value;
			location.href="review_edit_form.do?idx=" + idx;
		}
		
		//삭제
		function del(){
			var idx = document.getElementById("idx").value;
			if(confirm("삭제하시겠습니까?") == false){
				return;
			}
			var url = "review_del.do"
			var param = "idx=" + idx;
			sendRequest(url,param,delRes,"post");
		}
		
		function delRes(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				var json = eval(data);
				if(json[0].result == 'no'){
					alert("오류: 삭제실패.. 관리자에게 문의하세요.");
					return;
				}
			alert("삭제되었습니다. 코디자랑 메인으로 돌아갑니다.");
			location.href="review_list.do";
			}
		}
		
		function comment(){
			var idx = document.getElementById("idx").value;
			var comment = document.getElementById("comment").value;
			var id = document.getElementById("id").value;
			var nickname = document.getElementById("nickname").value;
			
			if(comment == ''){
				alert("댓글 내용을 입력해주세요");
				return;
			}
			
			var url = "insert_comment.do";
			var param = "idx=" + idx + "&comment=" + encodeURIComponent(comment) + "&id=" + encodeURIComponent(id) + "&nickname=" + encodeURIComponent(nickname);
			sendRequest(url,param,resComment,"post");
		}
		
		function resComment(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				var json = eval(data);
				if(json[0].result == 'no'){
					alert("오류: 댓글등록실패.. 관리자에게 문의하세요.");
					return;
				}
			location.href="review_view.do?idx=" + document.getElementById("idx").value;
		
			}
			
		}
		
		function like(){
			var url = "update_like.do";
			var param = "idx=" + document.getElementById("idx").value;
			sendRequest(url,param,resLike,"post");
		}
		
		function resLike(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				var json = eval(data);
				if(json[0].result == 'no'){
					alert("오류: 좋아요반영실패.. 관리자에게 문의하세요.");
					return;
				}
			location.href="review_view.do?idx=" + document.getElementById("idx").value;
		
			}
		}
		
	</script>
</head>
<body>
	<input type="hidden" id="id" name="id" value="${sessionScope.vo.id }">
	<input type="hidden" id="nickname" name="nickname" value="${sessionScope.vo.nickname }">	
	<input type="hidden" id="idx" name="idx" value="${vo.idx }">
	<table border="1">
		<tr id="tt">
			<td colspan="4">마이페이지 > <a href="fnq_list.do">코디자랑 </a> > 코디보기</td>
		</tr>
		<tr>
			<td width=300>${vo.title }</td>
			<td width=80 align="center">${vo.nickname }</td>
			<td align="center">♥ ${vo.likee }</td>
			<td align="center">${vo.click }</td>
			<td class="co">${vo.reviewdate }</td>
		</tr>
		<tr>
			<td colspan="3" class="thin"></td>
		</tr>
		<tr>
			<td height=350><img src="../upload_review/${vo.filename }" width="350"></td>		
			<td colspan="4" height=350 width="350">${vo.content }</td>
		</tr>
		<tr class="t_b">
			<td><c:if test="${vo.id ne sessionScope.vo.id or empty sessionScope.vo}">
					<div class="ch" onclick="like();" style="cursor:pointer;">좋아요♥</div>
				</c:if></td>
				<c:if test="${vo.id eq sessionScope.vo.id}">
					<td colspan="4" align="right"><div class="ch" onclick="edit();" style="cursor:pointer;">수정</div>
									<div class="ch" onclick="del();" style="cursor:pointer;">삭제</div></td>
				</c:if>
		</tr>	
		<tr class="t_b">
			<td colspan="5" align="center"><div class="ch" onclick="location.href='review_list.do'" style="cursor:pointer;">목록으로</div></td>
		</tr>
		</table>
		
		<table border="1">		
	 		<c:if test="${!empty sessionScope.vo }"> 
				<tr>
					<td><textarea rows="3" cols="50" name="content" id="comment"></textarea></td>
					<td width=50><div class="ch" onclick="comment();" style="cursor:pointer;">comment</div></td>
				</tr>
			</c:if> 
		</table>
		<table id="t_cmt" border="1"><!-- 댓글리스트 -->
			<c:forEach var="c" items="${list }">
				<c:if test="${c.ref eq vo.idx and c.step eq 1}">
						<tr>
							<td width=70>${c.nickname }</td>
							<td>${c.content }</td>
							<td width=100 class="co">${c.reviewdate }</td>
						</tr>
				</c:if>
			</c:forEach>
		</table>
</body>
</html>