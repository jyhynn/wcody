<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../menubar/w03_headerBar.jsp" %><!-- 메뉴상단바 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ sessionScope.vo.id ne 'admin' }"><!-- 세션에 로그인된 정보가 없을 경우 -->
	<script>
		alert("관리자만 이용가능합니다");
		return;	
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		#tt{border-top: hidden; border-left: hidden; border-right:hidden;}
		table{margin:40px auto 0 auto; width:700px;}
		td{padding:0; font-size: 17px;}
		.thin{border-left:hidden; border-right: hidden; height: 5px; padding:2px;}
		.ch{display: inline-block; width: 70px; height:13px; background-color: #49C3FD;
			  color:white; font-size:15px; text-align:center; padding:10px; margin-top:10px; margin-left:20px; margin-right:0;
			  line-height: 1em; border-radius:0.5em; -moz-border-radius: 0.5em;
			  -webkit-border-radius: 0.5em;}
		.t_b{border-bottom:hidden; border-left: hidden; border-right: hidden; padding:20px;}
		input{border: hidden; background-color: transparent; font-size: 17px; padding:10px;
			background: #edf3f7; margin:0; display: block; line-height: 1em; border-radius:0.5em;
			  -webkit-border-radius: 0.5em; border: hidden;}	
		textarea{border: hidden; background-color: transparent; font-size: 17px; padding:10px;
			background: #edf3f7; margin:0; display: block; border: hidden;}	
		.t2{padding:0 5px;}
		#content{width:97%; height:400px;}
		#title{width:97%; margin:0;}
		.t5{font-weight: bold; text-align: center; padding:0;}
	</style>
	<script type="text/javascript" src="../js/httpRequest.js"></script>
	<script type="text/javascript">
	
		function edit_check(){
			
			var title = document.getElementById("title").value;
			var content = document.getElementById("content").value;
			var idx = document.getElementById("idx").value;
			
			if(title==''){
				alert("제목은 비워둘 수 없습니다.");
				return;
			}
			if(content==''){
				alert("내용은 비워둘 수 없습니다.");
				return;
			}		
			
			var url = "notice_edit.do";
			var param = "idx=" + idx + "&title=" + encodeURIComponent(title) + "&content=" + encodeURIComponent(content);
			sendRequest(url,param, editRes,"post");
		}
		
		function editRes(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				var json = eval(data);
				if(json[0].result == 'no'){
					alert("오류: 수정실패.. 문제를 해결합시다...");
					return;
				}
			alert("공지 수정 완료. 공지페이지로 돌아갑니다.");
			location.href="notice_list.do";
			}
		}
	
	</script>
</head>
<body>
	<input type="hidden" id="idx" value="${list.idx }" name="idx">
	<table>
		<tr id="tt">
			<td colspan="4">마이페이지 > <a href="notice_list.do">공지사항 > 공지사항 수정</a></td>
		</tr>	
		<tr>
			<td class="t5">제목 |</td>
			<td class="t2"><input name="title" id="title" value="${list.title }"></td>
		</tr>
		<tr>
			<td colspan="3" class="thin"></td>
		</tr>
		<tr>
			<td class="t2" colspan="3">
			<textarea rows="20" cols="36" name="content" id="content">${list.content }</textarea></td>
		</tr>
			<tr align="right" class="t_b">
				<td colspan="3">
				<div class="ch" onclick="edit_check();" style="cursor:pointer;">수정</div>
			</tr>
	</table>


</body>
</html>