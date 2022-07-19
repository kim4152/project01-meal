<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 뭐 먹지</title>

<style type="text/css">
.button1{
	text-align:center;
	position:fixed;		
	margin-top: 100px;
}
.button2{
	font-size:40px;
	text-align:center; 
	margin-top: 20px;
	margin-bottom: 20px;
	border-radius:100%;
 	transition-duration:0.3s;
 	background-color:#F39C12;
 	color:white;
 	outline:0;
 	height:100px;
	width:100px;
}
.button3{
	font-size:40px;
	text-align:center; 
	margin-top: 30px;
	margin-bottom: 20px;
	border-radius:100%;
	height:100px;
	width:100px;
	color:white;
 	transition-duration:0.3s;
 	background-color:#F39C12;
 	outline:0;
}
.buttionsection{
	width: 150px;
	vertical-align: top;
}
.section1{
	height:600px; 
	width:800px;
	vertical-align: top;
}
.section2{
	height:auto;
	boarder:none;
	margin:none;
	padding-left:100px;
	padding-right:10px;
	vertical-align: top;
	
	
}
/*스크롤바 설정*/
.scroll{
	overflow: overlay; 
	height: auto;
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

/*이미지 텍스트*/
.centered {
  position: absolute;
  top: 260%;
  left: 50%;
  transform: translate(-50%, -50%);
  margin:none;
}

</style>




</head>
<body>

	<%@include file="../default/header.jsp" %>
		
	<form id="fo">
	<table width="100%" style=" border:none; margin: auto;width: 1000px;color: white;">	
		<tr style="height:700px;">
			
			<td class="section1" colspan="2" >
				<div class="section2">				
					<span   style="position: relative;text-align:center;">
	  					<img alt='이미지없음' src='<spring:url value="/resources/img/ball3.png"/>' width="200px" style="margin:26px">		
	  					<span class="centered">
	  						<input type="text" size="10" name="1">
	  					</span>
	  				</span>
	  				<span style="position: relative;text-align: center;">
	  					<img alt='이미지없음' src='<spring:url value="/resources/img/ball3.png"/>' width="200px" style="margin:26px">		
	  					<span class="centered">
	  						<input type="text" size="10" name="2">
	  					</span>
	  				</span>
										
				<span id="addball"></span>				
								
				
											
				</div>
			</td>
			<td class="buttionsection">
			<div class="button1" >
				<input type="button" value="추가" onclick="add()" class="button2"><br>
				<input type="button" value="삭제" onclick="del()" class="button3"><br>	
				<input type="button" value="뽑기" onclick="start()" class="button3">					
			</div>
			
			</td>
			
			<td style="background-color:#71d6aa; color: white; width: 20%;table-layout:fixed;text-align: center;vertical-align: top;">
				<div class="scroll">
				<h3>List</h3>
				<span id="list"></span>
				</div>
			</td>
		
		</tr>				
				
		
		
		<tr>
			<td colspan="4" style="background-color:#FFCC00; text-align: center;">
				<h2>8개까지 만들 수 있습니다</h2>
			</td>
		</tr>
	
	</table>
	</form>
	
	
	
	
	
	


	<script type="text/javascript">
		var cnt =2;
		var i=10;
		function add(){
			if(cnt==8){
				alert("더 이상 추가할 수 없습니다")
			}else{
			cnt++;	 
			$("#addball").append("<span style='position: relative;text-align: center;'><img id='"+cnt+"'  alt='이미지없음' src='<spring:url value="/resources/img/ball3.png"/>' width='200px' style='margin:26px'>	<span class='centered'><input type='text' name='"+cnt+"' id='"+cnt+i+"' size='10'></span></span>")		
			}
			$.ajax({
				url:'add',type:'get',success:function(data){				 
				 },error:function(){
					 alert("새로고침 해주세요")
				 }
			})
		}
		function del(){
			$("#"+cnt).remove();
			$("#"+cnt+i).remove();
			cnt--;
		}
		function start(){
			let arr = $("#fo").serializeArray()
			console.log( arr )
			let form = {}
			
			for(let i=0; i<arr.length;i++){
				form[arr[i].name] = arr[i].value
			}
			console.log( form )
			$.ajax({
				url : 'mlist',method:'post',
				data:JSON.stringify(form),dataType:'text',contentType:'application/json;charset=utf8',
				success : function(data){																										
					var cnt =0;
					alert(data);
					if($.trim(data) == "한글,영어,숫자만 입력해주세요" )
						cnt++;					
					if($.trim(data) =="더 이상 볼이 없습니다")
						cnt++;
					if($.trim(data) == "빈 칸이 있습니다")
						cnt++;
					if(cnt==0)
						$("#list").prepend("<div>"+data+"</div>");
					
				},error(){
					alert("새로고침 해주세요")
				}
				
			});
		}
		window.onload = function () {
			 $.ajax({
				 url:'mreload',type:'get',success:function(data){
					 
				 },error:function(){
					 alert("새로고침 실패")
				 }
			 })
			}

		
	</script>
</body>
</html>