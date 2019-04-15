<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="../css/loginForm.css"/>
	<script type="text/javascript" src="../js/httpRequest.js"></script>	
	<script type="text/javascript">
		function check_login(f){
	
			var id = document.getElementById("f").id.value.trim();
			var pwd = document.getElementById("f").pwd.value.trim();
			
			if(id==''){
				alert("아이디를 입력하세요.");
				return;
			}
			if(pwd==''){
				alert("비밀번호를 입력하세요.");
				return;
			}
			
			var url="check_login.do"; // LoginAction
			var param = "id=" + id + "&pwd=" + pwd;
			sendRequest(url,param,resultFn,"post");
		}
		
		function resultFn(){
			
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				var json = eval(data);
				if(json[0].res == 'no'){
					alert("아이디/비밀번호를 확인해주세요.");
					return;
				}
				var baseDate = new Date();
				var baseTime = null;
				var dd = baseDate.getDate();
				var mm = baseDate.getMonth()+1;
				var yyyy = baseDate.getFullYear();
				var hours = baseDate.getHours();
				var minutes = baseDate.getMinutes();
				 
				if(minutes < 30){
				// 30분보다 작으면 한시간 전 값
					hours = hours - 1;
				  	if(hours < 0){
				    // 자정 이전은 전날로 계산
				    	baseDate.setDate(baseDate.getDate() - 1);
				        dd = baseDate.getDate();
				        mm = baseDate.getMonth()+1;
				        yyyy = baseDate.getFullYear();
				       	hours = 23;
				    }
				}
				if(hours<10) {
					hours='0'+hours
				}
				if(mm<10) {
					mm='0'+mm
				}
				if(dd<10) {
					dd='0'+dd
				} 
				
				var baseDate2 = yyyy+""+mm+""+dd; 
			    baseTime = hours + "00";
			    
			    var urlDangi = "take_weatherDangi.do";
			    var param = "nx=" + json[1].nx
				 + "&ny=" + json[2].ny
				 + "&baseDate="+baseDate2 
				 + "&baseTime="+baseTime;
				 
				sendRequest(urlDangi,param,resultFnDangi,"post");
			    
				switch (baseTime) {
				case "2300":
				case "2400":
				case "0100":
					baseTime = "2300";
					break;
				case "0200":
				case "0300":
				case "0400":
					baseTime = "0200";
					break;
				case "0500":
				case "0600":
				case "0700":
					baseTime = "0500";
					break;
				case "0800":
				case "0900":
				case "1000":
					baseTime = "0800";
					break;
				case "1100":
				case "1200":
				case "1300":
					baseTime ="1100";
					break;
				case "1400":
				case "1500":
				case "1600":
					baseTime ="1400";
					break;
				case "1700":
				case "1800":
				case "1900":
					baseTime ="1700";
					break;
				case "2000":
				case "2100":
				case "2200":
					baseTime ="2000";
					break;

				default:
					break;
				}
				var urlDongne = "take_weatherDongne.do";
				param = "nx=" + json[1].nx
						 + "&ny=" + json[2].ny
						 + "&baseDate="+baseDate2 
						 + "&baseTime="+baseTime;
						 
				sendRequest(urlDongne,param,resultFnDongne,"post");
				
				alert("환영합니다");
				location.href="main.do";
				//location.href="main으로 가기 전에 사용자가 저장한 정보 로드해놓기 위해 서블릿으로 먼저 이동 후 거기서 main으로"
			}
			
		}
		function resultFnDongne(){
			if(xhr.readyState == 4 && xhr.status == 200){
				return;
			}
		}
		function resultFnDangi(){
			if(xhr.readyState == 4 && xhr.status == 200){
				return;
			}
		}

	</script>
</head>
<body>
	<div class="header"> 로그인 </div>
	<div id="d">
		<form id="f">
			<table>
				<tr>
					<th>ID</th>
					<td><input name="id"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pwd"></td>
				</tr>
			</table>			
		</form>		
				<!-- table로  아이디찾기/비밀번호찾기-->
			<a href="w02_login_find.jsp" class="find" style="display:inline">아이디 / 비밀번호 찾기</a>
			<div class="next" onclick="check_login();" style="cursor:pointer;">로그인</div> 
			<div class="frame2" onclick="location.href='join_location.do'" style="cursor:pointer;">회원가입</div>
	</div>		

</body>
</html>