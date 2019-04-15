<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="../menubar/w03_headerBar.jsp" %>
<c:if test="${ sessionScope.vo.id ne 'admin' }"><!-- 관리자만 이용가능 -->
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
<style type="text/css">
	#back{margin:0; padding:10px; position: relative; z-index: 1;}
	#tabb{position:absolute; height:70px; text-align: center; margin:30px;}
	#tabb ul{position: absolute; font-size:25px; }
	#tabb li{display: block; padding:20px; width:200px; border:1px solid #ccc; }
	#tabb li:hover {display:block; background: #ccc;}
	#total{ position:absolute; padding:5px; left:20%; top:109%;}
	table{border-collapse: collapse; position:absolute; top:120%; left:20%;  width:1100px;}	
	.td{text-align: center;}
	td{padding:5px;}
	*{z-index: 2;}
	
	#gra{position:relative; left:400px;}
	.vGraph{ padding:20px 0;   display: inline-block;}
	.vGraph ul{ margin:0; padding:0; width:300px; height:200px; border:1px solid #ddd; border-top:0; border-right:0; font-size:11px; font-family:Tahoma, Geneva, sans-serif; list-style:none;}
	.vGraph ul:after{ content:""; display:block; clear:both;}
	.vGraph li{ float:left; display:inline; width:20%; height:100%; margin:0 15%; position:relative; text-align:center; white-space:nowrap;}
	.vGraph .gTerm{ position:relative; display:inline-block; width:100%; height:20px; line-height:20px; margin:0 -100% -20px 0; padding:200px 0 0 0; vertical-align:bottom; color:#767676; font-weight:bold;}
	.vGraph .gBar{ position:relative; display:inline-block; width:100%; margin:-1px 0 0 0; border:1px solid #ccc; border-bottom:0; background:#e9e9e9; vertical-align:bottom;}
	.vGraph .gBar span{ position:absolute; width:100%; top:-20px; left:0; color:#767676;}
	
	.vGraph2{ margin:0 50px; padding:20px 0; display: inline-block ;}
	.vGraph2 ul{ margin:0; padding:0; width:400px; height:200px; border:1px solid #ddd; border-top:0; border-right:0; font-size:11px; font-family:Tahoma, Geneva, sans-serif; list-style:none;}
	.vGraph2 ul:after{ content:""; display:block; clear:both;}
	.vGraph2 li{ float:left; display:inline; width:12%; height:100%; margin:0 5%; position:relative; text-align:center; white-space:nowrap;}
	.vGraph2 .gTerm{ position:relative; display:inline-block; width:100%; height:20px; line-height:20px; margin:0 -100% -20px 0; padding:200px 0 0 0; vertical-align:bottom; color:#767676; font-weight:bold;}
	.vGraph2 .gBar{ position:relative; display:inline-block; width:100%; margin:-1px 0 0 0; border:1px solid #ccc; border-bottom:0; background:#e9e9e9; vertical-align:bottom;}
	.vGraph2 .gBar span{ position:absolute; width:100%; top:-20px; left:0; color:#767676;}
</style>
</head>
<body>
	<div id="back">
		<div id="tabb">
			<ul>
				<li><a href="admin_list.do">회원리스트</a></li>
				<li><a href="admin_feed.do">평가데이터</a></li>
			</ul>
		</div>
		<div id="gra">
			<div class="vGraph">
				<h4>이용자 성별 추이</h4>
				<ul>
					<li><span class="gTerm">여</span><span class="gBar" style="height:${female}%"><span>${female}%</span></span></li>
					<li><span class="gTerm">남</span><span class="gBar" style="height:${male}%"><span>${male}%</span></span></li>
				</ul>
			</div>
			<div class="vGraph2">
				<h4>이용자 추위더위 추이</h4>
				<ul>
					<li><span class="gTerm">추위</span><span class="gBar" style="height:${cold}%"><span>${cold}%</span></span></li>
					<li><span class="gTerm">더위</span><span class="gBar" style="height:${hot}%"><span>${hot}%</span></span></li>
					<li><span class="gTerm">둘 다</span><span class="gBar" style="height:${both}%"><span>${both}%</span></span></li>
					<li><span class="gTerm">둘 다 X</span><span class="gBar" style="height:${no}%"><span>${no}%</span></span></li>
				</ul>
			</div>
		</div>
		<div id="total"> 총 회원수 : ${count } </div>
		<table border="1">
			<tr>
				<th>회원번호</th>
				<th>ID</th>
				<th>별명</th>
				<th>email</th>
				<th>생년월일</th>
				<th>지역</th>
				<th>성별</th>
				<th>추위더위</th>
				<th>아이피</th>
				<th>가입일</th>
			</tr>
			
			<c:forEach var="m" items="${list }">
				<tr>
					<td class="td">${m.idx }</td>
					<td class="td">${m.id }</td>
					<td class="td">${m.nickname }</td>
					<td>${m.email }</td>
					<td>${m.birth_year }.${m.birth_month }.${m.birth_day }</td>
					<td>${m.sido } ${m.gugun }</td>
					<td class="td">${m.gender }</td>
					<td class="td">
						<c:if test="${m.coldhot == 1}">
							추위
						</c:if>
						<c:if test="${m.coldhot == 2}">
							더위
						</c:if>
						<c:if test="${m.coldhot == 3}">
							둘 다
						</c:if>
						<c:if test="${m.coldhot == 4}">
							둘다안탐
						</c:if></td>
					<td class="td">${m.ip }</td>
					<td class="td">${m.regdate }</td>
				</tr>
			</c:forEach>
		
		</table>
	</div>
</body>
</html>