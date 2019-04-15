<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../menubar/w03_headerBar.jsp"%><!-- 메뉴상단바-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/photo_list.css">
<script type="text/javascript" src="../js/httpRequest.js"></script>

<script type="text/javascript">
	function del(f) {

		var idx = f.idx.value.trim();//삭제할 게시글 번호

		if (!confirm("정말로 삭제하시겠습니까?")) {
			return;
		}

		//idx를 ajax를 통해서 서버로 전송
		var url = "photo_del.do";
		var param = "idx=" + idx;
		sendRequest(url, param, resultFn, "POST");

	}

	function resultFn() {

		if (xhr.readyState == 4 && xhr.status == 200) {

			//도착한 데이터 받기
			var data = xhr.responseText;

			//[{'param':'no'}]
			var json = eval(data);

			if (json[0].param == 'yes') {
				alert("삭제성공");

			} else {
				alert("삭제실패");

			}

			location.href = "list.do";

		}

	}

	//파일 다운로드
	function download(filename) {

		location.href = "download.do?dir=/upload/&filename="
				+ encodeURIComponent(filename);

	}
</script>

<style type="text/css">
.join {position: absolute; width: 80px; height:40px; background-color: #49C3FD; top: 15%; left: 49%; color:white; font-size:15px; text-align:center; padding:8px; 
		line-height: 1em; border-radius:0.5em; -moz-border-radius: 0.5em; -webkit-border-radius: 0.5em;}

#no_cloth {	position: relative; top: 300px;}

#back {	position: absolute; top: 75%; left: 49%;  width: 80px; height:40px; background-color: #49C3FD;color:white; font-size:15px; text-align:center; padding:8px; 
		line-height: 1em; border-radius:0.5em; -moz-border-radius: 0.5em; -webkit-border-radius: 0.5em;}
#photobox{background-color: #49C3FD; }
#nav { position: relative; z-index: 2;}

.photo_type{
	width:150px;
	height:300px;
	border:1px solid #49C3FD;
	float:left;
	margin-left:30px; margin-top:5%; line-height: 1em; border-radius:0.5em; -moz-border-radius: 0.5em; -webkit-border-radius: 0.5em;
	color: white; text-align: center; font-weight:bold; 
	background-color: #49C3FD;
}

.photo_type img{
	display:block;
	margin:auto;
	width:98%;
	height:150px;
	border:1px solid #49C3FD; line-height: 1em; border-radius:0.5em; -moz-border-radius: 0.5em; -webkit-border-radius: 0.5em;
	margin-bottom: 10px;
}
</style>

</head>
<body>

	<div id="mainbox">
		<div align="center">
			<input class="join" type="button" value="사진등록"
				onclick="location.href='insert_form.do'">
		</div>

		<div id="photobox">

			<c:if test="${ empty list}">
				<!-- list가 비어있다면... -->
				<div id="no_cloth" align="center">옷장에 옷이 없습니다.</div>
			</c:if>

			<c:if test="${ !(empty list) }">
				<c:forEach var="vo1" items="${ list }">
					<c:if test="${ sessionScope.vo.id eq vo1.id }">
						<div class="photo_type">
							<img src="../upload/${ vo1.filename }">
							<div class="title">${ vo1.title }</div>

							<form>
								<input type="hidden" name="idx" value="${ vo1.idx }">
								<p class="color">${ vo1.color }</p>
								<p class="property1">${ vo1.property1 }</p>
								<p class="property2">${ vo1.property2 }</p>

								<div align="center">
									<input type="button" value="삭제" onclick="del( this.form );">
									<input type="button" value="down"
										onclick="download('${vo1.filename}');">
								</div>
							</form>
						</div>
					</c:if>
				</c:forEach>
			</c:if>

		</div>

		<div align="center">
			<input id="back" type="button" value="돌아가기"
				onclick="location.href='back.do'">
		</div>



	</div>

</body>
</html>