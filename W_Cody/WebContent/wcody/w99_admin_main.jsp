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
	#back{margin:0; padding:10px; z-index: 1;}
	#tt{text-align: center; margin:50px; display:block;}
	#tabb{height:70px; text-align: center; margin:30px;}
	#tabb ul{font-size:25px; margin:0 auto;}
	#tabb li{display: inline-block; padding:20px; width:200px; border:1px solid #ccc;}
	#tabb li:hover {background: #ccc;}
	#tabb li:hover a{padding:20px;}
	*{z-index: 2;}
</style>
</head>
<body>
	<div id="back" >
	<div id="tt">관리자페이지</div>
		<div id="tabb" >
			<ul>
				<li><a href="admin_list.do">회원리스트</a></li>
				<li><a href="admin_feed.do">평가데이터</a></li>
			</ul>
		</div>
	</div>
</body>
</html>