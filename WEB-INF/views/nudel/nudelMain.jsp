<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>





<style type="text/css">	
a{
text-decoration: none; /* <a>밑줄 없애줌*/
border-bottom: none;
}
/* ######  드롭박스 세부설정   ###### */
.dropbtn {
  background-color: white;
  color: #4CAF50;
  padding: none;
  font-size: 25px;
  border: none;
  cursor: pointer;
  align:center;
  outline:0;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display:none;
  position: absolute;
  z-index: 99;
}



.dropdown:hover .dropdown-content {
  display: block;
}

.dropdown:hover .dropbtn {
  color: red; 
  
}
.groove {border-style: groove; color:blue; border:10} /*테두리 설정 */
/*드롭박스 세부설정 끝 */

/* ####### round slider 시작 #######*/
.slider {
    -webkit-appearance: none; /* 기본 CSS 스타일을 적용하지 않기 위해서 */
    border-radius: 5px; /* 슬라이더 모서리를 약간 둥글게 */
     height: 10px; /* 슬라이더 두께 */
    background: #D5F5E3; /* 슬라이더 색상 */
    outline: none; /* 슬라이더 테두리 없이 */
}
.slider:hover {
  opacity: 1;
}
.slider::-webkit-slider-thumb {
    -webkit-appearance: none; /* 기본 CSS 스타일을 적용하지 않기 위해서 */
    appearance: none; /* 기본 CSS 스타일을 적용하지 않기 위해서 */
    width: 20px; /* 슬라이더 핸들 길이 */
    height: 20px; /* 슬라이더 핸들 높이 */
    border-radius: 50%; /* 핸들 모양을 원모양으로 만들기 위함 */
    background: #EC7063; /* 슬라이더 핸들 색상 */
    cursor: pointer; /* 슬라이더 핸들에 마우스를 갖다대면 포인터로 변경 */
}
.slider::-moz-range-thumb {
    width: 20px; /* 슬라이더 핸들 길이 */
    height: 20px; /* 슬라이더 핸들 높이 */
    border-radius: 50%; /* 핸들 모양을 원모양으로 만들기 위함 */
    background: #EC7063; /* 슬라이더 핸들 색상 */
    cursor: pointer; /* 슬라이더 핸들에 마우스를 갖다대면 포인터로 변경 */
}
/* round slider 끝  */

/*라디오버튼 */
.radio1{
  background-color: white;
  color: black;
  border:none;
  width:100%;
  display:none;
  padding:none;
  
}

input[type=radio]:checked + label
{
	background: #ccc;
	color:blue;
}


.radio2{
  font-size: small;
}
/*라디오 버튼 설정 끝*/
/*테이블 크기조정 */
table{
	table-layout:fixed;
	text-align: center; 
	border: none; 
	margin: auto; 
	width: 1000px;
	width="100%";
}
.th{
	table-layout:fixed;
	height:400px;
}
.reset{ /* reset button 설정*/
 	border-radius:15px;
 	transition-duration:0.3s;
 	
 	background-color:#EDBB99;
 	outline:0;	
}
.reset:active{
	margin-left:5px;
	margin-top:5px;
	box-shadow:none;
}

/*스크롤바 설정*/
.scroll{
	overflow: overlay; 
	height: 700px;
}
.scroll::-webkit-scrollbar {
    width:10px; 
}
.scroll::-webkit-scrollbar-track {
    background-color: #71d6aa; /* 스크롤바 뒤 배경*/
   
}
.scroll::-webkit-scrollbar-thumb {
    color: white ;
}

/*modal*/
.modal{
	display: none;
	z-index: 20;
	width: 100%; height:100%;
	background: rgba(0,0,0,0.8);
	top:0; left:0;
}
.modal_content{
	width: 400px; height: 400px;
	background:white; border-radius: 200%;
	top:50%; left:50%; 
	margin-left: 40%; margin-right: 60%;
	margin-top: 10%;
}
.mealTitleC{
    top:50%; left:50%; cursor:poninter; box-sizing:boarder-box;
	height:200px;
	width:800px;
	margin-left: 32%; margin-right: 68%;
	margin-top:50px;
	color:white; text-align: center;
	align-content: center;
	text-align: center;
}


.img{
	width:400px;
	height: 400px;
	border-radius: 100%;
}

</style>


<meta charset="UTF-8">
<title>오늘 뭐 먹지</title>
</head>
<body>
	
	<%@ include file="../default/header.jsp"%>
	
	<table>

		<tr class="th">	
			
			
			<td style="text-align: center;">
				
				<form id="fo">
				
				<!-- 룰렛 돌리기 -->
				<img alt='a' src='<spring:url value="/resources/img/roullete.png"/>' id="start">
					
				<!-- 드롭다운 -->
				
				<div class="container">
					<div id="accordion">
							
								<div class="card-header" style="background-color:white; font-size:28px;">
									<a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo" onclick="set()" style="font-color:red"> 세부 검색 </a>
								</div>
								<div id="collapseTwo" class="collapse" data-parent="#accordion">
									<div class="card-body">							
																		
										
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<!-- 2드롭박스 세부 설정 시작 -->
										<div class="dropdown">
											  <input type="button" class="dropbtn" value="맵기" size="3" id="nudelHot">
											  <div class="dropdown-content">
											  	<div class="groove">											  
											  	<div class="slidecontainer">	 
												  <input type="range" min="0" max="3" value="0" id="myRange" class="slider" name="nudelHot" oninput="rag()">
												  <label id="demo"></label>	<!-- 고추 사진 -->										    
												</div></div>	
																					  
											  </div>
											</div>
										<!-- 2드롭삭스 세부 설정 끝 -->
										
											
										
										<div class="dropdown">
											<div>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="reset" onclick="radioReset()" value="초기화" class="reset">
											</div>
										</div>
										<!-- 3드롭삭스 세부 설정 끝 -->
									
									</div>
								</div>
							</div></div>
				<!-- 드롭다운 끝 --><br><br><br><br>
				</form>
			</td>
			
			<td style="background-color:#71d6aa; color: white; width: 20%;table-layout:fixed;">
				<div class="scroll">
				<h3>라면 List</h3>
				<span id="list"></span>
				</div>
			</td>
		</tr>



		


		<tr>
			<td colspan="2" style="background-color: #FFCC00; color:white;">
				<h2>뽑기 이미지를 눌러주세요</h2>
			</td>
		</tr>

	</table>
	
	<!-- 모달 창 -->
	
	<div class="modal">
		<div class="modal_content">
			<span id="resultName"></span>
		</div>
		
		<div class="mealTitleC">
			<h1><span id="mealTitle"></span></h1>				
		</div>
	</div>
	
	
	
	<script>
		//맵기별 고추
		function rag(){
			let v = $("#myRange").val()
			console.log(v)
			if(v==2){
				$("#demo").html("<b> <img alt='a' src='<spring:url value="/resources/img/rhcn1.png"/>'> </b>")
			}else if(v==3){
				$("#demo").html("<b> <img alt='a' src='<spring:url value="/resources/img/rhcn1.png"/>'> <img alt='a' src='<spring:url value="/resources/img/rhcn1.png"/>'></b>")
			}else if(v==1){
				$("#demo").html("<b>순한맛</b>")
			}else{
				$("#demo").html("<b>상관없음</b>")
				$("#mealHot").css("color","#4CAF50");
			}
			if(v != 0){
				$("#nudelHot").css("color","red");
			}
			
	
		}
		//기본 고추
		function set(){
			$("#demo").html("<b>맵기 정하기</b>")
		}
		//컨트롤러
		$("#start").click(function(){
			let arr = $("#fo").serializeArray()
			console.log( arr )
			let form = {}
			
			for(let i=0; i<arr.length;i++){
				form[arr[i].name] = arr[i].value
			}
			console.log( form )
			$.ajax({
				url : 'nRoulette',method:'get',
				data:form,
				success : function(data){
					$(".modal").fadeIn();
					$("#list").prepend("<div>"+data.nudelName+"</div>");	
					$("#mealTitle").html("<div>오늘은 &nbsp;<span style='color:red;'>"+data.nudelName+"</span></div>")
					createImg(data)/*음식 이미지*/
					
				},error(){
					alert("라면이 더 이상 없습니다.새로고침 해주세요")
				}
			})
		})
		
			
		
		/*모달 창 끄기*/
		$(function(){  
			$(".modal").click(function(){
				$(".modal").fadeOut();
			});
		});
		
		function createImg(data){
			let imgInfo = data.imgName;
			$.ajax({
			url:'download', type:'get',
			success:function(){
				$("#resultName").html("<b><img alt='a' src='download?imgName=${'"+data.nudelImg+"'}' class='img'></b>");
			},error(){
				alert("이미지 오류");
			}
			});
		}
		
		
		
		function radioReset(){ //radio reset
			$("#demo").html("<b>맵기 정하기</b>");
			$("#nudelHot").css("color","#4CAF50");		
		}
		
		
		window.onload = function () {
			 $.ajax({
				 url:'nReload',type:'get',success:function(data){
					 
				 },error:function(){
					 alert("새로고침 실패")
				 }
			 })
			}
		
		
		
	
	</script>
</body>
</html>