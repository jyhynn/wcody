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
	img{width: 230px; height: 270px;z-index: 1;}
	div > .text{width:50%; padding-top: 9%;}
	* {z-index: 2;}
</style>
</head>
<body>
<div  class="text" style="width:600px;  position:relative; float:right; padding-right: 15%; margin-top:10%;">
	"${sessionScope.pm251.informOverall}"
	<br><br>
	"${sessionScope.pm251.informCause}"
	<br><br>
	"${sessionScope.pm251.informGrade}"
	<br><br>
	
	"${sessionScope.pm252.informOverall}"
	<br><br>
	"${sessionScope.pm252.informCause}"
	<br><br>
	"${sessionScope.pm252.informGrade}"
</div>
	<div  class="text" style="position:relative; float:left; padding-left:10%; margin-top:10%;">
		<img alt="" src="${sessionScope.pm101.imageUrl1 }">
		<img alt="" src="${sessionScope.pm101.imageUrl2 }">
		<img alt="" src="${sessionScope.pm101.imageUrl3 }">

	</div>

</body>
</html>