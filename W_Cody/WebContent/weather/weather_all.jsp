<%@page import="vo.PM10_1VO"%>
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
		div{padding: 0;}
		outline{position: absolute; text-align:center;margin-top: 8%;}
		.v01{margin-top: 6%; width:35%; height:500px; position: absolute; background-size: 100% 100%;}
		div > h3{text-align: center;}
		#weather{margin-left: 5%; position: relative; float: left; z-index: 1;}
		#misedust{margin-top: 5%; margin-right: 5%; width:810px; height:500px; position: relative; float: right;padding: 0; z-index: 1;}
		#pm101{float: right;z-index: 1;}
		#pm251{float:left;z-index: 1;}
		* {z-index: 2;}
	</style>
	<script type="text/javascript">
		window.onload = function(){ // 오전 6시 오후 6시 기준으로 날씨 div 배경색 변경
			var date = new Date();
			var hours = date.getHours();
			var weather = document.getElementById("weather");
			
			if(hours >=6 && hours < 18){
				weather.style.backgroundImage = "url('../img/light.jpg')";
				weather.style.color="black";
			}else{
				weather.style.backgroundImage = "url('../img/dark.jpg')";
				weather.style.color="white";
			}
		};
		function pm101(){
			location.href="pm101.jsp";
			
		}
		function pm251(){
			location.href="pm251.jsp";
		}
	</script>
</head>
<body>
	<div id=outline>
		<div class="v01" id="weather" style="overflow : auto;"> <!-- 날씨뜨는 곳 -->
			<c:if test="${!empty sessionScope.wvo}">
					<div>
						<div style="padding-top: 3%;text-align: center; margin-top:5%;"><h2>${vo.gugun}</h2></div>
						<div style="text-align: center; padding-top: 0; margin-top:5%;">
							<c:if test="${wdv.pty eq '0'}">
								<c:if test="${!(hours >=6 && hours < 18)}">
									<c:if test="${wvo.sky eq '1'}">							
										<img src="../img/sun.png" width="130px;" height="130px;"><br>맑음
									</c:if>
									<c:if test="${wvo.sky eq '2'}">							
										<img src="../img/cloudOne.png" width="130px;" height="130px;"><br>구름조금
									</c:if>
									<c:if test="${wvo.sky eq '3'}">							
										<img src="../img/cloudMany.png" width="130px;" height="130px;"><br>구름많음
									</c:if>
									<c:if test="${wvo.sky eq '4'}">							
										<img src="../img/hlim.png" width="130px;" height="130px;"><br>흐림
									</c:if>
								</c:if>							
								<c:if test="${(hours <6 && hours >= 18) }">
									<img src="../img/moon.png" width="130px;" height="130px;"><br>
								</c:if>
							</c:if>
							<c:if test="${wdv.pty eq '1'}">							
								<img src="../img/rain.png" width="130px;" height="130px;"><br>비
							</c:if>
							<c:if test="${wdv.pty eq '2'}">							
								<img src="../img/rainSnow.png" width="130px;" height="130px;"><br>비/눈(진눈개비)
							</c:if>
							<c:if test="${wdv.pty eq '3'}">							
								<img src="../img/snow.png" width="130px;" height="130px;"><br>눈
							</c:if>
						</div>
						<div style="text-align: center; font-size:45px;" >${wdv.t1h}℃</div>						
					</div>
					<div style="position:absolute; margin: 3% 7%; padding-left:19%;">
						<table style="text-align: center; padding: 10px 20px;">
							<tr>
								<th>강수확률 &nbsp;:</th>
								<td> &nbsp; ${wvo.pop}% &nbsp;</td>
								<th>습도  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</th>
								<td> &nbsp; ${wvo.reh}% &nbsp;</td>
							</tr>
							<tr>
								<th>강수형태  &nbsp;:</th>
								<td>
									<c:if test="${wdv.pty eq '0'}">							
										맑음
									</c:if>
									<c:if test="${wdv.pty eq '1'}">							
										비
									</c:if>
									<c:if test="${wdv.pty eq '2'}">							
										비/눈(진눈개비)
									</c:if>
									<c:if test="${wdv.pty eq '3'}">							
										눈
									</c:if>
								</td>
								<th>강수량 &nbsp;&nbsp;&nbsp;&nbsp;:</th>
								<td> &nbsp; ${wdv.rn1}mm</td>
							</tr>
							<tr>
								<th>동서 풍속 :</th>
								<td>${wvo.uuu}</td>
								<th>남북 풍속 :</th>
								<td>${wvo.vvv}</td>
							</tr>
							<tr>
								<th>풍향 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</th>
								<td>${wvo.vec}</td>
								<th>바람세기 &nbsp;:</th>
								<td>
							<c:if test="${Float.valueOf(wdv.wsd) < 4}">							
								약함
							</c:if>
							<c:if test="${4.0 <= Float.valueOf(wdv.wsd) && Float.valueOf(wdv.wsd) < 9.0}">							
								보통
							</c:if>
							<c:if test="${9.0 <= Float.valueOf(wdv.wsd) && Float.valueOf(wdv.wsd) < 14.0}">							
								강함
							</c:if>
							<c:if test="${14.0 <= Float.valueOf(wdv.wsd)}">							
								매우강함
							</c:if></td>
							</tr>
							
						</table>
					</div>
			</c:if>
		</div> <!-- /날씨뜨는 곳 -->
		<div id="misedust"> 
			<div id="pm101" onclick="pm101();">
				<img alt="" src="${sessionScope.pm101.imageUrl7 }" style="margin:0; padding:0; width: 400px; height: 460px;">
				<h3>미세먼지 예측모델결과</h3>
		
			</div>
			<div id="pm251" onclick="pm251();">
				<img alt="" src="${sessionScope.pm251.imageUrl8 }" style="margin:0; padding:0; width: 400px; height: 460px;">
				<h3>초미세먼지 예측모델결과</h3>
			</div>
		</div>	
	</div>
</body>
</html>