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
		.thin{border-left:hidden; border-right: hidden; height: 5px; padding:2px;}
		.ch{display: inline-block; width: 70px; height:13px; background-color: #49C3FD;
			  color:white; font-size:15px; text-align:center; padding:10px; margin-left:20px; margin-right:0;
			  line-height: 1em; border-radius:0.5em; -moz-border-radius: 0.5em;
			  -webkit-border-radius: 0.5em;}
		.t_b{border-bottom:hidden; border-left: hidden; border-right: hidden; padding:20px;}
	</style>
	<script type="text/javascript">
		function edit(){
			var idx = document.getElementById("idx").value;
			location.href="notice_edit_form.do?idx=" + idx;
		}
		
		//삭제
		function del(){
			var idx = document.getElementById("idx").value;
			if(confirm("삭제하시겠습니까?") == false){
				return;
			}
			var url = "notice_del.do"
			var param = "idx=" + idx;
			sendRequest(url,param,delRes,"post");
		}
		
		function delRes(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				var json = eval(data);
				if(json[0].result == 'no'){
					alert("오류: 삭제실패.. 문제가 생겼습니다.. 해결하세요..");
					return;
				}
			alert("삭제되었습니다. F&Q페이지로 돌아갑니다.");
			location.href="notice_list.do";
			}
		}
	</script>

</head>
<body>
	<input type="hidden" id="idx" name="idx" value="${list.idx }">
	<table border="1">
		<tr id="tt">
			<td colspan="4">마이페이지 > <a href="notice_list.do">공지사항 > 공지</a></td>
		</tr>
		<tr>
			<td width=400>Q. ${list.title }</td>
		</tr>
		<tr>
			<td colspan="3" class="thin"></td>
		</tr>
		<tr>
			<td colspan="3" height=350>${list.content }</td>
		</tr>
		<c:if test="${sessionScope.vo.id eq 'admin'}"><!-- 로그인 중인 아이디가 관리자일 경우에만 뜸 -->
			<tr align="right" class="t_b">
				<td colspan="3">
				<div class="ch" onclick="edit();" style="cursor:pointer;">수정</div>
				<div class="ch" onclick="del();" style="cursor:pointer;">삭제</div></td>
			</tr>
		</c:if>
		<tr class="t_b">
			<td colspan="3" align="center"><div class="ch" onclick="location.href='notice_list.do'" style="cursor:pointer;">목록으로</div></td>
		</tr>	
	</table>
</body>
</html>