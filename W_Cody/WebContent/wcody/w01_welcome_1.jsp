<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
	
	/*  align="center" body{background-color:linear-gradient(45deg, #49C3FD, #0BAAF5); position:relative; } */
	
		html, body {width: 100%; height: 100%; display: flex; background-color: #49C3FD;}
		
		* {margin: 0; padding: 0;}
		
		.parent { margin: auto; background-color: #49C3FD; display: flex; height: 80%; width: 80%;}
		
		.child {margin: auto auto; max-width: 100%; max-height: 100%; }
		
		.ex1{color: white; font-size: 20px; margin-right: 0; margin-left: 18%;}
		
		.ex2{margin-left: 0;}
	</style>
</head>
<body>
<div class="parent">
	<div class="child ex1">w cody를 클릭하세요!</div>
	<img class="child ex2"alt="wCodyLogo" src="../img/w_homeLogo.png" style="cursor:pointer;" onclick="location.href='w01_welcome_2.jsp'">
</div>
</body>
</html>