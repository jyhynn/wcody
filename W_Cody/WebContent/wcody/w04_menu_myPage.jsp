<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../menubar/w03_headerBar.jsp" %><!-- 메뉴상단바 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- 메뉴상단바 -->
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
		*{margin:0;padding:0;}
		body{font-size: 17px;}
		#tt{border-top: hidden; border-left: hidden; border-right:hidden; font-size: 10px; padding:0;}
		.edit{width: 300px; height:20px; background-color: #49C3FD;
		  color:white; font-size:20px; text-align:center;
		  top:530px; margin:20px auto; padding:10px;
		  line-height: 1em; border-radius:0.5em;
		  -webkit-border-radius: 0.5em;}
		.unsubscribe{width: 300px; height:20px; background-color: #49C3FD;
		  color:white; font-size:20px; text-align:center;
		  top:560px; margin:20px auto; padding:10px;
		  line-height: 1em; border-radius:0.5em;
		  -webkit-border-radius: 0.5em;}
		  .th_size{width:80px; font-weight: bold;}
		  td{ padding:10px 20px;}
		  .dd{background: #edf3f7; margin:3px 0; display: block; line-height: 1em; border-radius:0.5em;
		  -webkit-border-radius: 0.5em;}
	</style>
</head>
<body>

	<table style="margin:20px auto 0 auto;">
		<tr id="tt">
			<td colspan="4">마이페이지 > 내 정보></td>
		</tr>
		<tr>
			<td class="th_size">ID</td>
			<td class="dd">${sessionScope.vo.id}</td>
		</tr>
		<tr>
			<td class="th_size">별명</td>
			<td class="dd">${sessionScope.vo.nickname}</td>
		</tr>
		<tr>
			<td class="th_size">이메일</td>
			<td class="dd">${sessionScope.vo.email}</td>
		</tr>
		<tr>
			<td class="th_size">생년월일</td>
			<td class="dd">${sessionScope.vo.birth_year}년&nbsp;${sessionScope.vo.birth_month}월&nbsp;${sessionScope.vo.birth_day}일</td>
		</tr>
		<tr>
			<td class="th_size">지역</td>
			<td class="dd">${sessionScope.vo.sido}&nbsp;${sessionScope.vo.gugun}</td>
		</tr>
		<tr>
			<td class="th_size">성별</td>
			<td class="dd">${sessionScope.vo.gender}</td>
		</tr>			
		<tr>
			<td class="th_size">체감정도</td>
			<td class="dd">
				<c:if test="${sessionScope.vo.coldhot eq 1}" >
					추위를 많이 타요
				</c:if>
				<c:if test="${sessionScope.vo.coldhot eq 2}" >
					더위를 많이 타요
				</c:if>
				<c:if test="${sessionScope.vo.coldhot eq 3}" >
					추위와 더위 둘 다 많이 타요
				</c:if>										
				<c:if test="${sessionScope.vo.coldhot eq 4}" >
					추위와 더위 둘 다 잘 타지 않아요
				</c:if>	
			</td>
		</tr>
		<tr>
			<td class="th_size">가입일</td>
			<td class="dd">${sessionScope.vo.regdate}</td>
		</tr>			
	</table>
	<div class="edit" onclick="edit();" style="cursor:pointer;">수정</div> 		
	<div class="unsubscribe" onclick="unsubscribe();" style="cursor:pointer;">탈퇴</div>
</body>
</html>