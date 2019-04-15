<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{margin:0; padding:0; position: relative;}
	.i1{z-index: 1; width:100%; height:100%; }
	.i2{z-index: 2; width:90px; position: absolute; bottom:25px; right:29px;} 
</style>
</head>
<body>
	<img class="i1" alt="helppage" src="../img/help.png">
	<img class="i2" alt="closehelp" src="../img/closehelp.png" onclick="location.href='main.do'" style="cursor:pointer;">
</body>
</html>