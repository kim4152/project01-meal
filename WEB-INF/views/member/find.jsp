<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 뭐 먹지</title>


</head>

<body>
	<%@ include file="../default/header.jsp"%>
	<table width="100%" style="border: none; margin: auto; width: 1000px;">
		<tr>
			<td style="height: 700px;">

				<div style="column-span: all; align-content: center; height: 700px; margin: auto; width: 300px">
					<div style="align-content: center; text-align: center; width: 200px; margin: auto">
						<form id="fo">
							<span id="hid"></span>
							<p style="margin-bottom: 4px"><input id="id" name="id" placeholder="아이디" tabindex="1"></p>
							<p style="margin-bottom: 4px"><input name="name" placeholder="이름" tabindex="2"> </p>
							<p style="margin-left: 70%;"><input type="button" value="찾기" onclick="find()" tabindex="3"></p>
						</form>
						<p><span id="sp"></span><p>
					</div>
					<div style="display: none;align-content: center; text-align: center; width: 200px; margin: auto; height: 300px;" id="di">
						<form>
						<p style="margin-bottom: 4px"><input type="password" id="password" placeholder="새 비밀번호" oninput="pwOn()" tabindex="4"></p><span id="pwAdd"></span>
						<p style="margin-bottom: 4px"><input type="password" id="passwordCheck" placeholder="비밀번호 재확인" oninput="pw2On()" tabindex="5"></p><span id="pw2Add"></span>
						<p style="margin-left: 70%;"><input type="button" value="저장" onclick="find2()" tabindex="6"></p>
						</form>
					</div>

				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="background-color: #FFCC00">
				<h2>FOOTER</h2>
			</td>
		</tr>
	</table>
	<script type="text/javascript">
	var iidd="";
	
	window.onload=function(){
		$("#id").focus();
	}
	
	
	/*뉴 비번 저장*/
	function find2(){
		var pw=$("#password").val()
		console.log(id)
		let form = {id:id,password:pw};
		location.href="/com/member/pw?password="+pw+"&id="+iidd;
		
	}
	
	
	
	/*비밀번호 oninput*/
	function pwOn(){
		var id=$("#password").val()
		$.ajax({
			url:'<c:url value="/member/pwCheck"/>', type:'post', data:JSON.stringify(id), dataType:'text',contentType:'application/json; charset=utf8', success: function(data){
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
	
	
	
	
	
	
	/*찾기 버튼*/
	function find() {
			let arr = $("#fo").serializeArray();
			let form = {};
			for (let i = 0; i < arr.length; i++) {
				form[arr[i].name] = arr[i].value
			}
			$.ajax({
				url : '<c:url value="/member/findP"/>',
				type : 'POST',
				data : form,
				dataType : 'text',
				success : function(data) {
					if (data == "계정이 없습니다") {
						$("#sp").html("<b>" + data + "</b>")
						return;
					}
					findDisplay(); 
					iidd=data;
					console.log(iidd);
				}
			})
		}
		function findDisplay() {
			$("#di").show();
		}
	</script>
</body>
</html>