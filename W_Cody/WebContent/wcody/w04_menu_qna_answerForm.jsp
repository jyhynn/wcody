<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../menubar/w03_headerBar.jsp" %><!-- 메뉴상단바 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ sessionScope.vo.id ne 'admin'}"><!-- 세션에 로그인된 정보가 없을 경우 -->
	<script>
		alert("관리자 계정이 아닙니다.");
		location.href="w02_loginForm.jsp";		
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		#tt{border-top: hidden; border-left: hidden; border-right:hidden; font-size: 10px;}
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
		function answer_check(){
			var title = document.getElementById("title").value;
			var content = document.getElementById("content").value;
			var id = document.getElementById("id").value;
			var nickname = document.getElementById("nickname").value;
			var ref = document.getElementById("ref").value;
			if(title==''){
				alert("제목을 입력해주세요!");
				return;
			}
			if(content==''){
				alert("내용을 입력해주세요!");
				return;
			}	
			var url = "ask_answer.do";
			var param = "title=" + encodeURIComponent(title) + "&content=" + encodeURIComponent(content)
						+ "&id=" + id + "&nickname=" + encodeURIComponent(nickname) + "&ref=" + ref;
			sendRequest(url,param,writeRes,"post");
		}
		
		function writeRes(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				var json = eval(data);
				if(json[0].result == 'no'){
					alert("오류: 답변등록 실패... 문제가 뭘까요...? 해결합시다..");
					return;
				}
			alert("답변등록완료. Q&A페이지로 돌아갑니다.");
			location.href="que_list.do";
			}
		}
	</script>
</head>
<body>
	<input type="hidden" id="id" value="${sessionScope.vo.id}" name="id">
	<input type="hidden" id="nickname" value="${sessionScope.vo.nickname}" name="nickname">	
	<input type="hidden" id="ref" value="${list.ref }" name="ref">
	<p align="left">마이페이지 > <a href="que_list.do">Q&A</a> > 문의 답변</p>
	<table>
		<tr id="tt">
				<td colspan="4">마이페이지 > <a href="notice_list.do">공지사항</a></td>
		</tr>
		<tr>
			<td class="t5">제목 |</td>
			<td class="t2"><input name="title" id="title"></td>
			<td class="t5 t6">| 관리자</td>
		</tr>
		<tr>
			<td colspan="3" class="thin"></td>
		</tr>
		<tr>
			<td class="t2" colspan="3">
			<textarea rows="20" cols="36" name="content" id="content">문의내용 : ${list.content } </textarea></td>
		</tr>
			<tr align="right" class="t_b">
				<td colspan="3">
				<div class="ch" onclick="answer_check();" style="cursor:pointer;">답변 등록</div>
			</tr>
	</table>
</body>
</html>