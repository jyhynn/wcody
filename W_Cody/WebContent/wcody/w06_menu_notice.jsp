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
	#tt{border-top: hidden; border-left: hidden; border-right:hidden;}
	table{border-collapse: collapse; margin:40px auto 0 auto; width:700px;}
	td{padding:10px;}
	.td_idx{font-size: 10px; width:30px;}	
	.td_date{font-size: 10px; width:70px; text-align: right;}
	.ch {width: 70px; height:13px; background-color: #49C3FD;
		  color:white; font-size:15px; text-align:center; padding:8px; 
		  line-height: 1em; border-radius:0.5em; -moz-border-radius: 0.5em;
		  -webkit-border-radius: 0.5em;} 
	.t_b{border-bottom:hidden; border-left: hidden; border-right: hidden; padding:20px;} 	  
</style>
</head>
<body>
		
		<table border="1">
			<tr id="tt">
				<td colspan="4">마이페이지 > <a href="notice_list.do">공지사항</a></td>
			</tr>
			<c:forEach var="n" items="${list }">
				<tr>
					<td class="td_idx" align="center">${n.idx }</td>
					<td width=510>
							<a href="notice_view.do?idx=${n.idx }">${n.title }</a></td>
					<td class="td_idx" align="center">${n.click }</td>
					<td class="td_date">${n.noticedate }</td>
				</tr>
			</c:forEach>
				<c:if test="${ sessionScope.vo.id eq 'admin' }"><!-- 관리자만 쓸 수 있음 -->
			<tr class="t_b">
					<td colspan="5" align="right" >
						<div class="ch" onclick="location.href='notice_write_form.do?id=${sessionScope.vo.id}'" style="cursor:pointer;">공지추가</div>
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