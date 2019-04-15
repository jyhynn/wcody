<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		*{margin:0;padding:0;}
		body{background-color: #49C3FD;}
		#f{margin:4% auto 0 auto;}
		#f div{position: relative; height:100%; margin:0 auto;}
		.hi{ color: white; font-size: 50px; text-align: center;	position:absolute; top:180px;}
		.frame1 {position:absolute; width: 400px; height:30px; background-color: #49C3FD;
		  color:white; font-size:30px; text-align:center;
		  border:4px solid white; top:300px; margin:10px; padding:10px;
		  line-height: 1em; border-radius:0.5em; -moz-border-radius: 0.5em;
		  -webkit-border-radius: 0.5em;}
		.frame2 {position:absolute; width: 400px; height:30px; background-color: #49C3FD;
		  color:white; font-size:30px; text-align:center;
		  border:4px solid white; top:310px; margin:10px; padding:10px;
		  line-height: 1em; border-radius:0.5em; -moz-border-radius: 0.5em;
		  -webkit-border-radius: 0.5em;}
		.frame3 {position:absolute; 
		  color:white; font-size:20px; text-align:center; width:150px; height:10px;
		  border:hidden; top:320px; margin:10px; }
	</style>
</head>
<body>
	<div id="f">
		<div class="hi">안녕하세요?<br>저는 당신에게 날씨에 따라 <br>옷을 추천해 줄 W cody입니다.</div>
		<div class="frame1" onclick="location.href='w02_loginForm.jsp'" style="cursor:pointer;" onMouseOver="this.innerHTML='클릭'" onMouseOut="this.innerHTML='로그인'">로그인</div>
		<!-- DB에서 시도/구군 정보 가져와 리스트로 보여주기 위해 서블릿으로 먼저 이동-->
		<div class="frame2" onclick="location.href='join_location.do'" style="cursor:pointer;" onMouseOver="this.innerHTML='클릭'" onMouseOut="this.innerHTML='회원가입'">회원가입</div>
		<div class="frame3" onclick="location.href='main.do'" style="cursor:pointer;">그냥 둘러볼래요</div>
	</div>	
</body>
</html>