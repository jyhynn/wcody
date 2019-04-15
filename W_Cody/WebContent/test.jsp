<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
	table{margin:40px auto 0 auto;}
	td{padding:0; font-size: 17px;}
	.thin{border-left:hidden; border-right: hidden; height: 5px; padding:2px;}
	.ch{display: inline-block; width: 70px; height:13px; background-color: #49C3FD;
		  color:white; font-size:15px; text-align:center; padding:10px; margin-top:10px; margin-left:20px; margin-right:0;
		  line-height: 1em; border-radius:0.5em; -moz-border-radius: 0.5em;
		  -webkit-border-radius: 0.5em;}
	.t_b{border-bottom:hidden; border-left: hidden; border-right: hidden; padding:20px;}
	.tt{border: hidden; background-color: transparent; font-size: 17px; padding:10px;
		background: #edf3f7; margin:0; display: block; line-height: 1em; border-radius:0.5em;
		  -webkit-border-radius: 0.5em; border: hidden;}	
	.t2{width:370px; height:30px; padding:0 5px;}
	.t3{width:550px; height:400px;}
	.t4{width:380px; margin:0;}
	.t5{font-weight: bold; text-align: center;}
	.t6{width:100px;}
	</style>

</head>	
<body>

	<table>
		<tr>
			<td class="t5">제목 |</td>
			<td class="t2"><input class="t4 tt" name="title"></td>
			<td class="t5 t6">| dd</td>
		</tr>
		<tr>
			<td colspan="3" class="thin"></td>
		</tr>
		<tr>
			<td class="t2" colspan="3">
			<textarea class="tt t3" rows="20" cols="36" name="content"></textarea></td>
		</tr>
			<tr align="right" class="t_b">
				<td colspan="3">
				
				<div class="ch" onclick="" style="cursor:pointer;">문의 등록</div>
			</tr>
	</table>
</body>
</html>