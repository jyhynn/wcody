<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../menubar/w03_headerBar.jsp" %><!-- 메뉴상단바 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ empty sessionScope.vo }"><!-- 세션에 로그인된 정보가 없을 경우 -->
	<script>
		alert("로그인 후 이용가능합니다");
		location.href="w02_loginForm.jsp";		
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
	#tt{border-top: hidden; border-left: hidden; border-right:hidden; font-size: 10px; padding-bottom:10px;}
	table{margin:40px auto 40px auto; width:700px; }
	td{padding:0; font-size: 17px;}
	.thin{border-left:hidden; border-right: hidden; height: 5px; padding:2px;}
	.ch{display: inline-block; width: 70px; height:30px; background-color: #49C3FD;
		  color:white; font-size:15px; text-align:center; padding:10px; margin-top:10px; margin-left:20px; margin-right:0;
		  line-height: 1em; border-radius:0.5em; -moz-border-radius: 0.5em;
		  -webkit-border-radius: 0.5em;}
	.t_b{border-bottom:hidden; border-left: hidden; border-right: hidden; padding:20px;}
	input{border: hidden; background-color: transparent; font-size: 17px; padding:10px;
		background: #edf3f7; margin:0; display: inline-block; line-height: 1em; border-radius:0.5em;
		  -webkit-border-radius: 0.5em; }	
	textarea{width:97%; border: hidden; background-color: transparent; font-size: 17px; padding:10px;
		background: #edf3f7; margin:0; display: block; border: hidden;}	
	#file{width:97%;}
	#title{width:97%; margin:0;}
	.t5{font-weight: bold; text-align: center;}
	.tm{font-size: 12px;}
	</style>
	<script type="text/javascript" src="../js/httpRequest.js"></script>
	<script type="text/javascript">
		function write_check(f){
			var title = f.title.value;
			var content = f.content.value;
			var id = f.id.value;
			var nickname = f.nickname.value;
			var sati = f.sati.value;			
			var fcontent = f.fcontent.value;
			var filename= f.filename.vlaue;
			
			if(title==''){
				alert("제목을 입력해주세요!");
				return;
			}
			if(content==''){
				alert("내용을 입력해주세요!");
				return;
			}
			if(sati==''){
				alert("평가점수를 매겨주세요!");
				return;
			}		
			
			f.action="review_write.do";
			f.submit();
		}
	</script>
</head>
<body>
	<form method="post" enctype="multipart/form-data">
		<input type="hidden" id="id" value="${sessionScope.vo.id}" name="id">
		<input type="hidden" id="nickname" value="${sessionScope.vo.nickname}" name="nickname">	
		<table>
			<tr id="tt">
				<td colspan="4">마이페이지 > <a href="review_list.do">코디자랑 </a> > 자랑하기</td>
			</tr>
			<tr>
				<td class="t5" width=70>제목 </td>
				<td><input name="title" id="title"></td>
				<td class="t5" width=150> ${list.nickname }</td>
			</tr>
			<tr>
				<td colspan="3" class="thin"></td>
			</tr>
			<tr>
				<td colspan="3">
				<textarea rows="20" cols="36" name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="3"><input name="filename" type="file" id="file"></td>		
			</tr>
			<tr>
				<td colspan="3" class="m">사이트 만족도를 평가해주세요!</td>
			</tr>
			<tr>
				<td colspan="3"><!-- 일단 라디오로 만들엇습니다 -->
					<input type="radio" value="1" name="sati">★
					<input type="radio" value="2" name="sati">★★
					<input type="radio" value="3" name="sati">★★★
					<input type="radio" value="4" name="sati">★★★★	
					<input type="radio" value="5" name="sati">★★★★★						
				</td>
			</tr>				
			<tr>
				<td colspan="3" class="m">자유서술평가란(생략가능)</td>
			</tr>
			<tr>
				<td class="t2" colspan="3">
				<textarea rows="4" cols="46" name="fcontent" id="fcontent"></textarea></td>
			</tr>
			<tr align="right" class="t_b">
				<td colspan="3">
				<input type="button" value="등록" class="ch" onclick="write_check(this.form);" style="cursor:pointer;">
			</tr>
		</table>
	</form>
</body>
</html>