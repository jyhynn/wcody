<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="../menubar/w03_headerBar.jsp" %>
<c:if test="${ sessionScope.vo.id ne 'admin' }"><!-- 관리자만 이용가능 -->
	<script>
		alert("관리자만 이용가능합니다");
		return;	
	</script>
</c:if>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#back{margin:0; padding:10px; position: relative; z-index: 1;}
	#tabb{position:absolute; height:70px; text-align: center; margin:30px;}
	#tabb ul{position: absolute; font-size:25px; }
	#tabb li{display: block; padding:20px; width:200px; border:1px solid #ccc; }
	#tabb li:hover {display:block; background: #ccc;}
	#aver{ position:absolute; padding:0; right:23%; top:120px;}
	#filter{ position:absolute; padding:5px; left:20%; top:110px;}
	table{border-collapse: collapse; position:absolute; top:150px; left:20%; width:1100px;}	
	.td{text-align: center;}
	td{padding:5px;}
	*{z-index: 2;}
</style>
<script type="text/javascript">
	function filter(){
		var filter = document.getElementById("filter").value;
		location.href = "admin_feed.do?filter=" + filter;
	}
	  window.onload=function(){
	      //초기화 영역
	      var filter = document.getElementById("filter");
	      
	      var filter_array = ["idx", "low", "high", "sugg"];
	         
	      for( var i = 0; i < filter_array.length; i++ ){
	         
	         //sawonlist.do?deptno=20
	         if( '${param.filter}' == filter_array[i]){
	            //다음과 같이 특정 option을 강제선택할 수 있다.
	            filter[ i ].selected = true;
	            break;
	         }   
	      }
	      
	   };
</script>
</head>
<body>
	<div id="back">
		<div id="tabb">
			<ul>
				<li><a href="admin_list.do">회원리스트</a></li>
				<li><a href="admin_feed.do">평가데이터</a></li>
			</ul>
		</div>
		
		<div id="aver"> 별점평균 ${avg } / 5(점)</div>	
		<select id="filter" name="filter" onchange="filter();">
			<option value="idx">-등록순-</option>
			<option value="low">-낮은평가순-</option>
			<option value="high">-높은평가순-</option>
			<option value="sugg">-추가의견만-</option>				
		</select>
		<table border="1">
			<tr>
				<th width=80>회원번호</th>
				<th width=110>ID</th>
				<th width=110>별명</th>
				<th width=60>별점</th>
				<th>추가의견</th>
				<th width=160>평가일</th>
				<th width=130>ip</th>
			</tr>
			
			<c:forEach var="f" items="${list }">
				<tr>
					<td class="td">${f.idx }</td>
					<td class="td">${f.id }</td>
					<td class="td">${f.nickname }</td>
					<td class="td">${f.sati }</td>
					<td>${f.fcontent }</td>
					<td class="td">${f.fdate }</td>
					<td class="td">${f.ip }</td>
				</tr>
			</c:forEach>
		
		</table>
	</div>
</body>
</html>