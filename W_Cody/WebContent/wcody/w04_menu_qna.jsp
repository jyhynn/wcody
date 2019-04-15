<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../menubar/w03_headerBar.jsp" %><!-- 메뉴상단바 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#tt{border-top: hidden; border-left: hidden; border-right:hidden; font-size: 10px; padding:0;}
	table{border-collapse: collapse; margin:40px auto 0 auto; width:700px;}
	td{padding:10px;}
	.td_idx{font-size: 10px; width:30px;}
	.td_date{font-size: 10px; width:70px; text-align: right;}
	.ch {width: 60px; height:13px; background-color: #49C3FD;
		  color:white; font-size:15px; text-align:center; padding:8px; 
		  line-height: 1em; border-radius:0.5em; -moz-border-radius: 0.5em;
		  -webkit-border-radius: 0.5em;} 
	.t_b{border-bottom:hidden; border-left: hidden; border-right: hidden; padding:20px;} 	  
</style>
</head>
<body>
		<table border="1">
			<tr id="tt">
				<td colspan="4">마이페이지 > <a href="que_list.do">Q&A</a></td>
			</tr>
			<tr>
				<td class="td_idx" align="center">-</td>
				<td colspan="4"><a href="fnq_list.do">&nbsp;자주 들어오는 질문은 F&Q에 정리되어 있답니다</a></td>
			</tr>
			<c:forEach var="q" items="${list }">
				<tr>
					<td class="td_idx" align="center">${q.idx }</td>
					<td width=400>
						<a href="ask_view.do?idx=${q.idx }">
							<c:if test="${q.step eq 1 }"> &nbsp;&nbsp; ㄴ답변 : </c:if>
							<c:if test="${q.step ne 1 }"> &nbsp;</c:if>
							 ${q.title }</a></td>
					<td>${q.nickname }</td>
					<td class="td_idx" align="center">${q.click }</td>
					<td class="td_date">${q.quedate }</td>
				</tr>
			</c:forEach>
				<c:if test="${ !empty sessionScope.vo }"><!-- 로그인 된 경우에만 나타남 -->
			<tr class="t_b">
					<td colspan="5" align="right" >
						<div class="ch" onclick="location.href='ask_write_form.do?id=${sessionScope.vo.id}'" style="cursor:pointer;">문의하기</div>
					</td>
			</tr>
				</c:if>
		</table>
		<table width="690">
			<tr>
				<td class="f11" align="center">
					${pageMenu }
				</td>
			</tr>
		</table>
</body>
</html>