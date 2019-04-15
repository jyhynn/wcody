<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../menubar/w03_headerBar.jsp" %><!-- 메뉴상단바 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

<style type="text/css">
* {	margin: 0; padding: 0;}

input {	text-decoration: none;}

#list_box {	top: 50%; left: 50%; border-collapse: collapse; z-index: 1;}

#list_box input {width: 300px;background: white; color: #49C3FD;font-size: 40px;}

#list_box #top {width: 100%;height: 400px;}

#list_box #bot {width: 100%;height: 400px;}

#list_box #cap {height: 300px;}

#list_box #sho {height: 300px;}

#list_box #etc {height: 300px;}

#list_box {	position: absolute;top: 20%; left: 25%; margin-bottom: 30px;}

#list_box tr td input:hover {background:  #49C3FD; color: white;}
* {z-index: 2;}
</style>
</head>
<body>
	<div id="mainbox">
		<table id="list_box" border="1">
			<tr>
				<td colspan="2">
					<input id="top" type="button" value="상의"onclick="location.href='list.do'">
				</td>
				<td colspan="2">
					<input id="bot" type="button" value="하의"onclick="location.href='list2.do'">
				</td>
			</tr>

			<tr>
				<td>
					<input id="cap" type="button" value="모자"onclick="location.href='list3.do'">
				</td>
				<td colspan="2">
					<input id="sho" type="button" value="신발"onclick="location.href='list4.do'">
				</td>

				<td>
					<input id="etc" type="button" value="액세서리"onclick="location.href='list5.do'">
				</td>
			</tr>
		</table>
	</div>

</body>
</html>

