<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="../css/loginFind.css"/>
	<script type="text/javascript" src="../js/httpRequest.js"></script>
	<script>
		//아이디찾기
		function find_id(){
			
			var email = document.getElementById("email").value;
			if(email==''){
				alert("이메일을 입력하세요");
				return;
			}
			var url = "find_id.do";
			var param = "email=" + email;
			sendRequest(url,param,res_id,"post");
		}
		
		function res_id(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				var json = eval(data);
				if(json[0].result == 'no'){
					alert("존재하지 않는 이메일입니다.");
					return;
				}
				alert("찾으시는 아이디는 [" + json[1].id + "]입니다");
			}
		}
		
		//비번찾기
		function find_pwd(){
			var id = document.getElementById("id").value;
			var email = document.getElementById("email2").value;
			if(email==''){
				alert("이메일을 입력하세요");
				return;
			}
			if(id==''){
				alert("아이디를 입력하세요");
				return;				
			}
			var url = "find_pwd.do";
			var param = "id=" + id + "&email=" + email;
			sendRequest(url,param,res_id,"post");
		}
		
		function res_id(){
			var id = document.getElementById("id").value;
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				var json = eval(data);
				if(json[0].result == 'no'){
					alert("존재하지 않는 아이디 혹은 이메일 입니다.");
					return;
				}
				alert("ID [" + id + "]의 비밀번호는 [" + json[1].pwd + "]입니다");
			}
		}		
		</script>
</head>
<!-- 회원가입할 때 아이디/비번찾기용 질문선택 , 주관식답변칸 만들어서 아이디/비번찾기할 때 쓰고 싶은데 복잡해질 것 같아서
	나중에 시간 되면 해보는 게 좋을 것 같아요.. -->
<body>
	<div class="header"> 계정 찾기 </div>
	<table >
		<tr>
			<td class="th">이메일</td>
			<td><input id="email" name="email" placeholder="회원가입 시 기입한 이메일을 입력하세요."></td>
			<td><div class="next1" onclick="find_id();" style="cursor:pointer;">아이디 찾기</div></td>
		</tr>
	</table>
<hr>	
	<table >
		<tr>
			<td class="th">ID</td>
			<td><input id="id" name="pwd" placeholder="아이디를 입력하세요."></td>
			<td rowspan="2"><div class="next2" onclick="find_pwd();" style="cursor:pointer;">비밀번호 찾기</div></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input id="email2" name="email" placeholder="회원가입 시 기입한 이메일을 입력하세요."></td>
		<tr>
		</tr>
	</table>

		<div class="frame1" onclick="location.href='w02_loginForm.jsp'" style="cursor:pointer;">로그인</div>	
</body>
</html>