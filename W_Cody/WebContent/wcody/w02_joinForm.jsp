<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="../css/joinForm.css"/>
	<script type="text/javascript" src="../js/httpRequest.js"></script>
	<script>
		//아이디 중복여부 체크
		var b_idCheck = false;
		//아이디 입력여부
		var b_idInput = false;
		//아이디 적합여부
		var b_idCorr = false;
		//비밀번호 적합여부
		var b_pwdCheck = false;
		//비밀번호재확인 통과여부
		var b_pwd2Check = false;
		//닉네임 적합여부
		var b_nickCorr = false;
		//닉네임 중복체크 여부
		var b_nickCheck = false;
		//이메일 적합여부
		var b_emailCorr = false;
		//이메일 중복체크 여부
		var b_emailCheck = false;

		//아이디 유효성 실시간 체크
		function id_check(){
			var id = document.getElementById("id").value.trim();
			var check = /^[a-z]+[a-z0-9]{5,19}$/g;
			if(!check.test(id)){
				document.getElementById('id_a').innerHTML="아이디는 영문, 숫자로만 이루어진 6 ~ 20자 이내로 입력해주세요.";
				b_idInput = true;
			}else{
				document.getElementById('id_a').innerHTML="";
				b_idCorr = true;
			}			
		}
		
		//아이디 중복 체크
		function join_idCheck(){
			var id = document.getElementById("id").value.trim();
			//값이 없거나 유효하지 않을 경우
			if(b_idInput != true || b_idCorr != true){
				alert("적합한 아이디 형식이 아닙니다.");
				return;
			}
			
			var url="join_id_check.do";
			var param="id="+id;
			sendRequest(url,param,resultIdcheck,"post");
			
		}
		
		function resultIdcheck(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				var json = eval(data);
				if(json[0].result == 'no'){
					alert("앗! 이미 존재하는 아이디입니다");
					return;
				}
			//입력한 아이디 그자리에..
			alert("사용가능한 아이디입니다!");
			b_idCheck = true;	//중복체크완료
			document.getElementById("id").readOnly = false;
			document.getElementById('nick_a').innerHTML="사용가능한 아이디입니다.";
			}
		}
		
		//비밀번호 유효성 실시간체크
		function pw_check(){
			var pwd = document.getElementById("pwd").value;
			//비밀번호 영문,숫자 조합 6~20자리
			var check = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
			if(!check.test(pwd)){
				document.getElementById('pwd_a').innerHTML="비밀번호는 영문, 숫자를 조합하여 6~20자 이내로 입력해주세요.";
			}else{
				document.getElementById('pwd_a').innerHTML="적합";
				b_pwdCheck = true; 	//비밀번호 적합여부 체크완료
			}
		}
		
		//비밀번호재확인 실시간체크
		function pw_check2(){
			var pwd = document.getElementById("pwd").value;
			var pwd2 = document.getElementById("pwd2").value;
			//비밀번호 영문,숫자 조합 6~20자리
			if(pwd!=pwd2){
				document.getElementById('pwd_b').innerHTML="불일치";
			}else{
				document.getElementById('pwd_b').innerHTML="일치";
				b_pwd2Check = true;
			}
		}
		
		//닉네임 유효성 실시간체크
		function nick_check(){
			var nickname = document.getElementById("nickname").value;
			//닉네임 2~8글자제한
			if(nickname.length < 2 || nickname.length > 9){
				document.getElementById('nick_a').innerHTML="별명은 2~8자 이내로 입력해주세요.";
			}else{
				document.getElementById('nick_a').innerHTML="";
				b_nickCorr = true;
			}
		}
		
		//닉네임 중복체크
		function join_nickCheck(){
			var nickname = document.getElementById("nickname").value;
			if(b_nickCorr != true){
				alert("별명은 2~8자 이내로 입력해주세요.");
				return;
			}
			
			var url="join_nickname_check.do";
			var param = "nickname=" + encodeURIComponent(nickname);
			sendRequest(url,param,resultNickCheck,"post");
		}
		
		function resultNickCheck(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				var json = eval(data);
				if(json[0].result == 'no'){
					alert("앗! 이미 사용중인 별명입니다.");
					return;
				}
			//입력한 별명 그자리에..
			alert("사용가능한 별명입니다!");
			b_nickCheck = true;	//중복체크완료
			document.getElementById("nickname").readOnly = false;
			}
		}
		
		//이메일 실시간 유효성체크
		function email_check(){
			var email = document.getElementById("email").value;
			var check = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if(!check.test(email)){
				document.getElementById('email_a').innerHTML="올바른 이메일 형식이 아닙니다.";
			}else{
				document.getElementById('email_a').innerHTML="";
				b_emailCorr = true;
			}
		}
		//이메일 중복체크
		function join_emailCheck(){
			var email = document.getElementById("email").value;
			if(b_emailCorr != true){
				alert("올바른 이메일 형식이 아닙니다.");
				return;
			}
			
			var url="join_email_check.do";
			var param = "email=" + email;
			sendRequest(url,param,resultEmailCheck,"post");
		}
		
		function resultEmailCheck(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				var json = eval(data);
				if(json[0].result == 'no'){
					alert("이미 사용중인 이메일입니다.");
					return;
				}
			//입력한 별명 그자리에..
			alert("사용가능한 이메일입니다!");
			b_emailCheck = true;	//중복체크완료
			document.getElementById("email").readOnly = false;
			}
		}
			
		//생년월일 선택감지자
		function check_feb(){
			var year = document.getElementById("birth_year").value;
			var month = document.getElementById("birth_month").value;
			var day = document.getElementById("birth_day");		
			var feb = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28];	
			var yun_feb = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29];			
			var thirty = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30];	
			var thirtyOne = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];	
			var changeDay;
			if(month=='1'||month=='3'||month=='5'||month=='7'||month=='8'||month=='10'||month=='12'){
				changeDay = thirtyOne;
		 	}
		 	if(month=='4'||month=='6'||month=='9'||month=='11'){ changeDay = thirty;	}
		 	if(month=='2'){ changeDay = feb; }
		 	if((year%4==0 && year%100!=0) || year%400==0){
		 		if(month == '2'){ changeDay = yun_feb; }	 					
		 	}
		 	
		 	var n = day.length;
			while(n > 0){
				day.remove(0);
				n--;
			}//while
		 	
			for(var count = 0; count < changeDay.length; count++){                
		            var option = document.createElement("option");
		            option.innerHTML = changeDay[count];
			        day.appendChild(option);
		    }
		 }
		
		 //지역선택감지자
		function selectLocation(){
			var sido = document.getElementById("sido").value;	//value="${sidoVO.ref}"
			var gugun = document.getElementById("gugun");

		 	var n = gugun.length;
			while(n > 0){
				gugun.remove(0);
				n--;
			}//while
			
			<c:forEach items="${gugunList}" var="g">
				var json = new Object();
				json.ref = "${g.ref}";
				json.gugun = "${g.gugun}";
				
				if(sido==json.ref){
		            var option = document.createElement("option");
	    	        option.innerHTML = json.gugun;
	    	        gugun.appendChild(option);
				}
			</c:forEach>
			
		}//selectLocation()
		
		//가입하기 버튼
		function check_join(){
			var ff = document.getElementById("ff");
			var coldhot = ff.coldhot.value;

			if(b_idCheck != true || b_idInput != true || b_idCorr != true || b_pwdCheck != true 
					|| b_pwd2Check != true || b_nickCorr != true || b_nickCheck != true || b_emailCorr != true || b_emailCheck != true){
				alert("입력 혹은 체크되지 않은 항목이 있습니다.");
				return;
			}
			if(coldhot == ''){
				alert("추위/더위 여부를 체크해주세요");
				return;
			}
			
			var gugun = document.getElementById("gugun").value;	//한글
			var gUrl = "nxny.do";
			var param = "gugun=" + encodeURIComponent(gugun);
			sendRequest(gUrl, param, takeNxNy, "post");
		}
		
		// MemberDB 가서 저장하기 전에 LocationDB 갔다와서 해당 gugun의 경도 위도 받아오는 함수
		function takeNxNy(){
			// [{'nx':'52'},{'ny':'33'}]
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				var json = eval(data);
				
				var id = document.getElementById("id").value.trim();
				var pwd = document.getElementById("pwd").value;
				var nickname = document.getElementById("nickname").value;	//한글
				var email = document.getElementById("email").value;
				var year = document.getElementById("birth_year").value;
				var month = document.getElementById("birth_month").value;
				var day = document.getElementById("birth_day").value;	
				var sido = document.getElementById("sido").value;	//숫자
				var gugun = document.getElementById("gugun").value;	//한글
				var ff = document.getElementById("ff");
				var coldhot = ff.coldhot.value;
				
				var g = document.getElementById("gender").value;
				var gender;
				if(g=='female'){
					gender="여";
				}
				if(g=='male'){
					gender="남";
				}				
				
				var url = "join_insert.do"; // action - JoinAction
				var param = "id=" + id 
							+ "&pwd=" + pwd 
							+ "&nickname=" + encodeURIComponent(nickname) 
							+ "&email=" + email 
							+ "&year=" + year 
							+ "&month=" + month 
							+ "&day=" + day 
							+ "&sido=" + sido 
							+ "&gugun=" + encodeURIComponent(gugun)
							+ "&gender=" + encodeURIComponent(gender) 
							+ "&coldhot=" + coldhot
							+ "&nx=" + json[0].nx  
							+ "&ny=" + json[1].ny;
				
				sendRequest(url, param, joinResult, "post");
				
			}
		}
		
		function joinResult(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				var json = eval(data);
				if(json[0].result == 'no'){
					alert("오류: 가입실패! 관리자에게 문의하세요.");
					return;
				}
			//입력한 별명 그자리에..
			alert("가입을 환영합니다! 로그인을 위해 메인으로 돌아갑니다.");
			location.href="w01_welcome_2.jsp";
			}
			
		}
	</script>
</head>
<body>
	<div class="header"> w cody에게 당신을 알려주세요 </div>
		<table style="margin:20px auto 0 auto;">
			<tr>
				<td class="th_size">ID</td>
				<td><input name="id" id="id" placeholder="아이디를 입력하세요" onKeyUp="id_check();"></td>
				<td><div class="ch" onclick="join_idCheck();" style="cursor:pointer;">중복확인</div>
			</tr>
			<tr>
				<td height="20"></td><!-- 실시간 유효성 체크 -->
				<td colspan="2"><span id="id_a"></span></td>
			</tr>
			<tr>
				<td class="th_size">비밀번호</td>
				<td><input name="pwd" type="password" id="pwd" placeholder="비밀번호를 입력하세요" onKeyUp="pw_check();"></td>
			</tr>
			<tr>
				<td height="20"></td><!-- 실시간 유효성 체크 -->
				<td colspan="2"><span id="pwd_a"></span></td>
			</tr>
			<tr>
				<td class="th_size">비밀번호 확인</td>
				<td><input name="pwd2" type="password" id="pwd2" placeholder="비밀번호 재확인" onKeyUp="pw_check2();"></td>
			</tr>
			<tr>
				<td height="20"></td><!-- 실시간 유효성 체크 -->
				<td colspan="2"><span id="pwd_b"></span></td>
			</tr>
			<tr>
				<td class="th_size">별명</td>
				<td><input name="nickname" id="nickname" placeholder="별명을 입력하세요" onKeyUp="nick_check();"></td>
				<td><div class="ch" onclick="join_nickCheck();" style="cursor:pointer;">중복확인</div>
			</tr>
			<tr>
				<td height="20"></td><!-- 실시간 유효성 체크 -->
				<td colspan="2"><span id="nick_a"></span></td>
			</tr>			
			<tr>
				<td class="th_size">이메일</td><!-- 아이디/비번 찾을 때 참고할 정보 -->
				<td><input name="email" id="email" placeholder="이메일을 입력하세요" onKeyUp="email_check();"></td>
				<td><div class="ch" onclick="join_emailCheck();" style="cursor:pointer;">중복확인</div>
			</tr>
			<tr>
				<td height="20"></td><!-- 실시간 유효성 체크 -->
				<td colspan="2"><span id="email_a"></span></td>
			</tr>	
			
		</table>
		<table style="margin:0 auto;" id="t2">			
			<tr>
				<td colspan="3" style="font-weight: bold;">생년월일</td>
			</tr>
			<tr>
				<td>
					<select id="birth_year" name="year">
						<option>--연도--</option>
				    	<c:forEach var="year" begin="1910" end="2018" step="1">
				     		<option value="${year }">${ year }</option>
				       </c:forEach>
					</select>
				</td>
				<td>
				 	<select id="birth_month" name="month" onchange="check_feb();">
						<option>--월--</option>
					    <c:forEach var="month" begin="1" end="12" step="1">
							<option value="${month}">${ month }</option>
						</c:forEach>
					</select>
				</td>
				<td>
					<select id="birth_day" name="day">
						<option>--일--</option>
					</select>
				</td>								
			</tr>
			<tr>
				<td colspan="2" style="font-weight: bold;">지역
				<span style="font-size:10px; color:#ED0000;">(선택한 지역을 기준으로 날씨정보가 제공됩니다)</span></td>
				<td style="font-weight: bold;">성별</td>
			</tr> 
			<tr>
				<td>
					<select id="sido" name="sido" onchange="selectLocation();">
						<option>--도/시---</option>
						<c:forEach var="sidoVO" items="${sidoList }">
		              		<option value="${sidoVO.ref}">${sidoVO.sido }</option>
						</c:forEach>
	         	   </select>
	         	</td>
				<td>
					<select id="gugun" name="gugun"> 
						<option>--구/군--</option>
					</select>
	         	</td>	         	
				<td>
					<select id="gender" name="gender">
						<option>--성별--</option>
				     		<option value="male">남</option>
				     		<option value="female">여</option>				     		
					</select>				
			</td>
			</tr>	
			<tr>
				<td colspan="3">추위를 많이 타시나요? 더위를 많이 타시나요?</td>
			</tr>
			<tr>
				<td colspan="3">
					<form id="ff">
						<input type="radio" value="1" name="coldhot" >추위
						<input type="radio" value="2" name="coldhot" >더위
						<input type="radio" value="3" name="coldhot" >둘 다
						<input type="radio" value="4" name="coldhot" >안 탄다	
					</form>								
				</td>
			</tr>	
		</table>
			<div class="next" onclick="check_join();" style="cursor:pointer;">가입하기</div> 
</body>
</html>
