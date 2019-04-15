<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="../css/mainbar.css" /> -->

<style type="text/css">
		*{margin:0;padding:0;}
		a{ text-decoration:none;}
		li { list-style:none;}
		#nav{width:100%; height: 120px; background:#49C3FD; }
		#nav > li{display:inline-block; position:relative; padding:0;font-size: 230%; margin-left: 3%;}
		#nav > li >a{display:block; padding:10% 100px; color:white; margin:-5px; z-index: 99;}
		#nav li:hover a{background: #fff; color:#444;}	  
		#nav li ul{position:absolute; left:0; top:45; text-align:center; width:270px; 
					font-size:20px; margin:5px 0; border:1px solid #b4b4b4; display: none; width: 100%;}
		#nav li ul a{display:block; padding:20px 0; margin:-5px; z-index: 99;}			
		#nav li:hover ul{display: block;}
		#nav ul li:hover a{background: #ccc; color:#fff;}	
</style>

</head>
<body>
	<div>
		<ul id="nav">
			<li><a href="../wcody/main.do">w cody</a></li>
			<li><a href="../weather/mise_pic.do">날씨</a></li>
			<li><a href="#">내 옷</a>
				<ul>
					<li><a href="../photo/cloth_page.jsp">전체보기</a></li>
					<li><a href="../photo/list.do">상의</a></li>
					<li><a href="../photo/list2.do">하의</a></li>
					<li><a href="../photo/list3.do">모자</a></li>
					<li><a href="../photo/list4.do">신발</a></li>
					<li><a href="../photo/list5.do">액세서리</a></li>
				</ul>
			</li>
			<li><a href="#">코디</a>
				<ul>
					<li><a href="review_list.do">코디자랑</a></li>
				</ul>
			</li>
			<li>
				<a href="#"> 
					<c:if test="${!empty sessionScope.vo }">${sessionScope.vo.nickname }님</c:if> 
					<c:if test="${empty sessionScope.vo }">마이페이지</c:if>
				</a>
				<ul>
					<c:if test="${ !empty sessionScope.vo }">
						<!-- 세션에 로그인된 정보가 없을 경우 -->
						<li><a href="../wcody/w04_menu_myPage.jsp">마이페이지</a></li>
						<li><a href="logout.do">로그아웃</a></li>
					</c:if>
					<c:if test="${ sessionScope.vo.id eq 'admin' }">
						<!-- 관리자 로그인인 경우 -->
						<li><a href="../wcody/w99_admin_main.jsp">관리자페이지</a></li>
					</c:if>
					<c:if test="${ empty sessionScope.vo }">
						<!-- 세션에 로그인된 정보가 없을 경우 -->
						<li><a href="../wcody/w02_loginForm.jsp">로그인</a></li>
						<li><a href="join_location.do">가입하기</a></li>
					</c:if>
					<li><a href="notice_list.do">공지사항</a></li>
					<li><a href="que_list.do">Q&A</a></li>
					<li><a href="fnq_list.do">F&Q</a></li>
				</ul>
			</li>
		</ul>
	</div>
</body>
</html>