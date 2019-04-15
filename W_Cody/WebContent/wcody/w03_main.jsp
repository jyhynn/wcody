<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../menubar/w03_headerBar.jsp"%><!-- 메뉴상단바 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
#div01 {display: block; width: 97%; height: 735px; margin: 20px; position: relative; z-index: 1;}

.v01 {width: 35%; height: 72%; position: absolute; background-size: 100% 100%;  border-radius:0.5em; -moz-border-radius: 0.5em; -webkit-border-radius: 0.5em}

.v02 {width: 35%; height: 25%; position: absolute; bottom: 0;}
.v02 > img{margin:0;}

.v03 {border: 1px solid black; width: 25%; height: 62%; position: absolute; right: 0; border-radius:0.5em; -moz-border-radius: 0.5em; -webkit-border-radius: 0.5em;}
.v03 > .photo_type > img{width: 90%; height: 70%;}
.v04 {border: 1px solid black; width: 37%; height: 62%; position: absolute; right: 26%; border-radius:0.5em; -moz-border-radius: 0.5em; -webkit-border-radius: 0.5em}
.v04 > img{margin-top: 4%; margin-left: 7%; }
.v04 > p{margin-left: 2%;}

p {display: inline-block;}

.v05 {border: 1px solid gray; width: 63%; height: 35%; position: absolute; right: 0; bottom: 0; font-weight: bold; 
	background-color: #F6F6F6; border-radius:0.5em; -moz-border-radius: 0.5em; -webkit-border-radius: 0.5em;
	}

.help {position: absolute; bottom: 0; right: 0;}

li {margin: 5px;}

span {font-weight: bold;}

* {z-index: 2;}
</style>
<script type="text/javascript">
	window.onload = function() { // 오전 6시 오후 6시 기준으로 날씨 div 배경색 변경
		var date = new Date();
		var hours = date.getHours();
		var weather = document.getElementById("weather");

		if (hours >= 6 && hours < 18) {
			weather.style.backgroundImage = "url('../img/light.jpg')";
			weather.style.color = "black";
		} else {
			weather.style.backgroundImage = "url('../img/dark.jpg')";
			weather.style.color = "white";
		}
	};
</script>
</head>
<body>
	<div id="div01">
		<div class="v01" id="weather" style="overflow: auto;">
			<!-- 날씨뜨는 곳 -->
			<c:if test="${empty sessionScope.vo}">
				로그인을 하셔야 합니다.
			</c:if>
			<c:if test="${!empty sessionScope.vo}">
				<div>
					<div style="padding-top: 3%; text-align: center; margin-top: 5%;">
						<h2>${vo.gugun}</h2>
					</div>
					<div style="text-align: center; padding-top: 7%;">
						<c:if test="${wdv.pty eq '0'}">
							<c:if test="${!(hours >=6 && hours < 18)}">
								<c:if test="${wvo.sky eq '1'}">
									<img src="../img/sun.png" width="150px;" height="150px;">
									<br>맑음
									</c:if>
								<c:if test="${wvo.sky eq '2'}">
									<img src="../img/cloudOne.png" width="150px;" height="150px;">
									<br>구름조금
									</c:if>
								<c:if test="${wvo.sky eq '3'}">
									<img src="../img/cloudMany.png" width="150px;" height="150px;">
									<br>구름많음
									</c:if>
								<c:if test="${wvo.sky eq '4'}">
									<img src="../img/hlim.png" width="150px;" height="150px;">
									<br>흐림
									</c:if>
							</c:if>
							<c:if test="${(hours <6 && hours >= 18) }">
								<img src="../img/moon.png" width="150px;" height="150px;">
								<br>
							</c:if>
						</c:if>
						<c:if test="${wdv.pty eq '1'}">
							<img src="../img/rain.png" width="150px;" height="150px;">
							<br>비
							</c:if>
						<c:if test="${wdv.pty eq '2'}">
							<img src="../img/rainSnow.png" width="150px;" height="150px;">
							<br>비/눈(진눈개비)
							</c:if>
						<c:if test="${wdv.pty eq '3'}">
							<img src="../img/snow.png" width="150px;" height="150px;">
							<br>눈
							</c:if>
					</div>
					<div style="text-align: center; font-size: 45px;">${wdv.t1h}℃</div>
				</div>
				<div
					style="position: absolute; margin: 3% 7%; padding-left: 19%;">
					<table style="text-align: center; padding: 10px 20px;">
						<tr>
							<th>강수확률 &nbsp;:</th>
							<td>&nbsp; ${wvo.pop}% &nbsp;</td>
							<th>습도 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</th>
							<td>&nbsp; ${wvo.reh}% &nbsp;</td>
						</tr>
						<tr>
							<th>강수형태 &nbsp;:</th>
							<td><c:if test="${wdv.pty eq '0'}">							
										맑음
									</c:if> <c:if test="${wdv.pty eq '1'}">							
										비
									</c:if> <c:if test="${wdv.pty eq '2'}">							
										비/눈(진눈개비)
									</c:if> <c:if test="${wdv.pty eq '3'}">							
										눈
									</c:if></td>
							<th>강수량 &nbsp;&nbsp;&nbsp;&nbsp;:</th>
							<td>&nbsp; ${wdv.rn1}mm</td>
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
							<td><c:if test="${Float.valueOf(wdv.wsd) < 4}">							
								약함
							</c:if> <c:if
									test="${4.0 <= Float.valueOf(wdv.wsd) && Float.valueOf(wdv.wsd) < 9.0}">							
								보통
							</c:if> <c:if
									test="${9.0 <= Float.valueOf(wdv.wsd) && Float.valueOf(wdv.wsd) < 14.0}">							
								강함
							</c:if> <c:if test="${14.0 <= Float.valueOf(wdv.wsd)}">							
								매우강함
							</c:if></td>
						</tr>

					</table>
				</div>
			</c:if>
		</div><!-- /날씨뜨는 곳 -->
		<div class="v02">
			 <img alt="banner" src="../img/banner.gif" width=100% height=100%>
		</div>
		<div class="v03">
			추천옷 <input type="button" value="확인" onclick="location.href='chuchun.do'">
			
			<c:if test="${ empty list }">
				<!-- list가 비어있다면... -->
				<div id="no_cloth" align="center">추천 옷이 없습니다.</div>
			</c:if>
			<c:if test="${ !empty list }">
				<c:forEach var="vo1" items="${ list }">
				<c:if test="${sessionScope.vo.id eq vo1.id }">
					<c:if
						test="${-20 <= Float.valueOf(wvo.t3h) && Float.valueOf(wvo.t3h) <= 0}">
						<c:if
							test="${ vo1.property1 eq '면' || vo1.property1 eq '울' || vo1.property1 eq '아크릴' || vo1.property1 eq '폴리' || vo1.property1 eq '나일론' || vo1.property1 eq '모직' }">
							<div class="photo_type">
								<img src="../upload/${ vo1.filename }">
							</div>
						</c:if>
					</c:if>

					<c:if
						test="${0 < Float.valueOf(wvo.t3h) && Float.valueOf(wvo.t3h) <= 15}">
						<c:if
							test="${ vo1.property1 eq '면' || vo1.property1 eq '폴리' || vo1.property1 eq '나일론'}">
							<div class="photo_type">
								<img src="../upload/${ vo1.filename }">
							</div>
						</c:if>
					</c:if>

					<c:if
						test="${15< Float.valueOf(wvo.t3h) && Float.valueOf(wvo.t3h) <= 25}">
						<c:if
							test="${vo1.property1 eq '면' || vo1.property1 eq '폴리' || vo1.property1 eq '레이온' || vo1.property1 eq '마' || vo1.property1 eq '린넨'}">
							<div class="photo_type">
								<img src="../upload/${ vo1.filename }">
							</div>
						</c:if>
					</c:if>
				</c:if>

			</c:forEach>
			
			</c:if>

		</div>
		<div class="v04">
			<img class="cody" alt="bestLiked"
				src="../upload_review/${rVo.filename }" width=400 height=370>
			<p>
				B E S T<br> 코디자랑<br> <span>${rVo.nickname }</span>님의 코디
			</p>
		</div>
		<div class="v05">
			공지사항
			<ul>
				<c:forEach var="n" items="${nList }">
					<li><a href="notice_view.do?idx=${n.idx }">- ${n.title }</a></li>
				</c:forEach>
			</ul>
		</div>
		<img class="help" alt="help" src="../img/helppp.png" onclick="location.href='help.jsp'" width=90 style="cursor: pointer;">
	</div>
</body>
</html>