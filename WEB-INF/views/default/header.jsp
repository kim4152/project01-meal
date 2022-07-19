<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 

<!DOCTYPE html>
<html>
<head>


<!-- ######  드롭박스 설정 #########-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- 드롭박스  끝 -->

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>


<script type="text/javascript">
	function but(){
		
	}
</script>
<style type="text/css">
ul li a {
	text-decoration: none; /* <a>밑줄 없애줌*/
	text-decoration-line: none;
	color:#2C3E50;
	font-weight: 600;
}

a{
	text-decoration: none; /* <a>밑줄 없애줌*/
	text-decoration-line: none;
	color:#566573;
}

a:hover {
	color:#566573 ;	/* 마우스 갖다대면 색 바꿈*/
	text-decoration-line: none;
}
a:hover{
text-decoration: none; /* <a>밑줄 없애줌*/
border-bottom: none;
}
ul {
	list-style: none; 	/* <li>테그의 . 을 빼줌*/
	display: flex;		/* <li> 태그를 가로로 배치*/
	justify-content: flex-end;	/* <li> 태그를 끝으로 배치*/
	margin:7px;
}
ul li{
	margin: 0 10px;	/* <li>끼리 간격*/
	padding: 0;	/* <li> 높낮이 설정*/
}
.title{
	text-align:center;
	margin-top:40px;
	margin-bottom:40px;
	color:#277A17;font-weight: 900;
	
}
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

</style>


</head>


<body>
	
	<h1 class="title" ><a href="https://ndproj1.netlify.app/" ">오늘 뭐 먹지</a></h1>
	<hr style="margin:0;">
	
	<table width="100%" style="text-align:center; border:none; margin: auto;width: 1000px; font-size:20px">	
		<tr>
			<td colspan="2" style="background-color:white ; width:100%; height:3px">
				<ul>
					<li>
						<a href="<c:url value='/meal/mealMain'/>">식사</a>
					</li>
					<li>
						<a href="<c:url value='/nudel/nudelMain'/>">라면</a>
					</li>
					<li>
						<a href="<c:url value='/list/list'/>">리스트만들기</a>
					</li>
					<li>
						<a href="<c:url value='/board/main'/>">게시판</a>
					</li>
				</ul>
			</td>
		</tr>
	</table>
	
	<hr style="margin:0;">
	
	
	
	
	
</body>
</html>



