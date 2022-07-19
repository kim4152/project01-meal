<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.join{
	font-size: 20px;
	font-weight: 500;
	color: black;
}
.input1{
	width: 200px;
	height: 37px;
}
</style>
</head>
<body>
	<%@ include file="../default/header.jsp"%>
	<form id="fo">
	<table width="100%" style="border: none; margin: auto; width: 1000px;">
		<tr>
			<td style="height: 700px;">

				<div style=" column-span: all; align-content:center; height: 700px; margin: auto; width: 300px">
					<p>
						<span class="join">아이디</span><br> <input size="15" tabindex="1" id="id" name="id" class="input1" oninput="idOn()"> <br> <span id="idAdd"></span>
					</p>
					<p>
						<span class="join">비밀번호</span><br> <input size="15" type="password" tabindex="2" id="password" name="password" class="input1" oninput="pwOn()"> <br> <span id="pwAdd"></span>
					</p>
					<p>
						<span class="join">비밀번호 재확인</span><br> <input size="15" type="password" tabindex="3" id="passwordCheck" class="input1" oninput="pw2On()"> <br> <span id="pw2Add"></span>
					</p>
					<p>
						<span class="join">이름</span><br> <input size="15" id="name"  name="name" class="input1" tabindex="4" "> <br>
					</p>
					<p style="width: 200px; text-align: right;">
						<input type="hidden" name="sessionId" value="null">
						<input type="button" value="회원가입" style="width: 80px;" tabindex="4" onclick="join()">					
					</p>

				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="background-color: #FFCC00">
				<h2>FOOTER</h2>
			</td>
		</tr>
	</table>
	</form>
	
	
	
	<script type="text/javascript">
	window.onload=function(){
		$("#id").focus();
	}
	
	
	
		var cnt=0;
		/*아이디 oninput*/
		function idOn(){
			var id=$("#id").val()
			$.ajax({
				url:'idCheck', type:'post', data:JSON.stringify(id), dataType:'text',contentType:'application/json; charset=utf8', success: function(data){
					if(data=="사용가능한 아이디입니다"){
						$("#idAdd").html("<b style='color:blue;'>"+data+"</b>"); 
						return;
					}
					$("#idAdd").html("<b style='color:red;'>"+data+"</b>")
				},error:function(){
					
				}
			});
			
		}
		/*비밀번호 oninput*/
		function pwOn(){
			var id=$("#password").val()
			$.ajax({
				url:'pwCheck', type:'post', data:JSON.stringify(id), dataType:'text',contentType:'application/json; charset=utf8', success: function(data){
					if(data=="사용가능한 비밀번호입니다"){
						$("#pwAdd").html("<b style='color:blue;'>"+data+"</b>"); 
						return;
					}
					$("#pwAdd").html("<b style='color:red;'>"+data+"</b>")
				},error:function(){
					
				}
			});
			
		}
		/*비밀번호 oninput*/
		function pw2On(){
			var pw2=$("#passwordCheck").val();
			var pw=$("#password").val();
			if(pw==pw2){
				$("#pw2Add").html("<b style='color:blue;'>비밀번호가 일치합니다</b>"); return;
			}
			$("#pw2Add").html("<b style='color:red;'>비밀번호가 다릅니다</b>");
			
		}
		/*회원가입*/
		function join(){
			var id=$("#id").val()
			var pw=$("#password").val()
			var name=$("#name").val()
			var pw2=$("#passwordCheck").val()
			form={id:id,password:pw,name:name}
			console.log(form);
			$.ajax({
				url:'joinSuc', type:'post',data:form,dataType:'text' ,success:function(data){
					if(data=="다시 확인해주세요"){
						console.log(data)
						alert("다시 확인해주세요");return;
					}
					if(pw!=pw2){
						console.log("pw ㄴㄴ")
						alert("다시 확인해주세요");return;
					}
					location.href="<c:url value='/'/>";
				}
			});
			
		}
		

	</script>
</body>
</html>