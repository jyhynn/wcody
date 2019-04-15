<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../menubar/w03_headerBar.jsp" %><!-- 메뉴상단바 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 	<link rel="stylesheet" href="../css/photo.css"> --%>
<style type="text/css">
	#main_box{ width:90%; margin:auto;}
	#photo_box{width:100%; height:100%;	padding:10px; margin:10px auto; overflow:auto;/* 스크롤 */}
	
	.photo_type{width:300px; height:390px; float:left; margin:20px;}
	#text_box{position: relative;}			
	.title{white-space:nowrap; overflow:hidden; text-overflow: ellipsis; padding:5px; display:inline-block; position: absolute; font-weight: bold;}
	.likee{white-space:nowrap; overflow:hidden; padding:5px; display:inline-block; position: absolute; right: 5px;}
	.nick{white-space:nowrap; overflow:hidden; text-overflow: ellipsis; padding:5px; position: absolute; top:30px;}
	.date{white-space:nowrap; overflow:hidden; text-overflow: ellipsis; padding:5px; display:inline-block; font-size: 10px; position: absolute;  top:60px;}
	.click{white-space:nowrap; overflow:hidden; text-overflow: ellipsis; padding:5px; display:inline-block; font-size: 10px; position: absolute; right: 5px;  top:60px;}
	.photo_type img{display:block; margin:auto; width:300px; height:300px;}
	.ch {width: 60px; height:13px; background-color: #49C3FD;
			  color:white; font-size:15px; text-align:center; padding:8px; 
			  line-height: 1em; border-radius:0.5em; -moz-border-radius: 0.5em;
			  -webkit-border-radius: 0.5em;} 
</style>
</head>
<body>
	<div id="main_box">
		<c:if test="${!empty sessionScope.vo }">
			<div align="center" style="padding:10px;">
				<div class="ch" onclick="location.href='review_insert_form.do?id=${sessionScope.vo.id}'" style="cursor:pointer;">자랑하기</div>
			</div>
		</c:if>
		<div id="photo_box">
			<c:if test="${empty list }"><!-- db상에 사진데이터가 0개이면. list가 비어있으면 -->
				<div align="center">등록된 사진이 없습니다.</div>
			</c:if>
		
			<c:forEach var="vo" items="${ list }">
				<c:if test="${vo.step eq 0 }">
					<div class="photo_type">
						<img src="../upload_review/${vo.filename }" onclick="location.href='review_view.do?idx=${vo.idx}'" style="cursor:pointer;" width=300><!-- 업로드한 이미지 -->
						<div id="text_box">
							<div>
								<div class="title"><a href="review_view.do?idx=${vo.idx}">${vo.title}</a></div>
								<div class="likee">♥ ${vo.likee}</div>		
							</div>
								<div class="nick">${vo.nickname}</div>
							<div>	
								<div class="date">${vo.reviewdate}</div>
								<div class="click">${vo.click}</div>	
							</div>	
						</div>												
					</div>
				</c:if>
			</c:forEach>
		
		</div>

	</div>
	
	
	
</body>
</html>