<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script type="text/javascript">

		function send( f ){
			
			var id = f.id.value;
			var title = f.title.value.trim();
			var photo = f.wphoto4.value;
			var color = f.color.value.trim();
			var property1 = f.property1.value;
			var property2 = f.property2.value;
			
			if( title == '' ){
				alert("제목을 입력하세요");
				return;
			}
			
			if( color == ''){
				alert("색을 입력하세요");
				return;
			}
			
			if( property1 = ''){
				alert("소재1를 입력하세요");
				return;
			}
			
			if( property2 = ''){
				alert("소재2를 입력하세요");
				return;
			}
			
			if( photo == '' ){
				alert("등록할 사진을 선택하세요");
				return;
			}
			
			f.submit();
			
		}
	</script>
	
	<style type="text/css">
		table tr td{width: 30px; }
	</style>

</head>

<body>
	
	<form action="insert4.do"
	      method="POST"
	      enctype="multipart/form-data">
		
		<input type="hidden" value="${sessionScope.vo.id }" name="id">	
		<table border="1" align="center">
			
			<caption>:::사진등록:::</caption>
			
			<tr>
				<th>제목</th>
				<td><input name="title"></td>
			</tr>
			
			<tr>
				<th>업로드 할 사진</th>
				<td><input name="wphoto4" type="file"></td>
			</tr>
			
			<tr>
				<th>색상</th>
				<td><input name="color"></td>
			</tr>
			
			<tr>
				<th>소재1</th>
				<td><input name="property1" type="radio"  value="면" checked="checked">면 </td>
				<td><input name="property1" type="radio" value="울">울 </td>
				<td><input name="property1" type="radio" value="아크릴">아크릴 </td>
				<td><input name="property1" type="radio" value="폴리">폴리 </td>
				<td><input name="property1" type="radio" value="나일론">나일론 </td>
				<td><input name="property1" type="radio" value="레이온">레이온 </td>
				<td><input name="property1" type="radio" value="마">마 </td>
				<td><input name="property1" type="radio" value="린넨">린넨 </td>
				<td><input name="property1" type="radio" value="모직">모직 </td>
				<!-- <td><input name="property"></td> -->
			</tr>
			
			<tr>
				<th>소재2</th>
				<td><input name="property2" type="radio"  value="면" checked="checked">면 </td>
				<td><input name="property2" type="radio" value="울">울 </td>
				<td><input name="property2" type="radio" value="아크릴">아크릴 </td>
				<td><input name="property2" type="radio" value="폴리">폴리 </td>
				<td><input name="property2" type="radio" value="나일론">나일론 </td>
				<td><input name="property2" type="radio" value="레이온">레이온 </td>
				<td><input name="property2" type="radio" value="마">마 </td>
				<td><input name="property2" type="radio" value="린넨">린넨 </td>
				<td><input name="property2" type="radio" value="모직">모직 </td>
				<td><input name="property2" type="radio" value="없음">없음 </td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="등록하기" onclick="send( this.form );">
					<input type="button" value="목록으로 돌아가기" onclick="location.href='list4.do';">
				</td>
			</tr>
			
		</table>	
			
	</form>
	
</body>

</html>