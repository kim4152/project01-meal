<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 뭐 먹지</title>
<style type="text/css">
	/*로그인 버튼*/
	.loginbutton{
		width:205px;
	}
	.groove {border-style: groove; color:blue; border:10} /*테두리 설정 */
</style>
</head>
<body>
	
	
	
	<%@include file="default/header.jsp" %>
	<form action="<c:url value='/member/login'/>"  method="post">
	<table width="100%" style=" border:none; margin: auto;width: 1000px;">	
		<tr>			
			<td style="height:700px;" >
				<c:if test="${login==null}">
				<div style="text-align:right; column-span:all; height: 100%; width: 210px;  right: 100%; margin-left: 78%;">
				
				<p  style=" margin-bottom: 5px; margin-top: 10px;">
					<input id="id" placeholder="아이디" style="height:40px;" size="21" tabindex="1" maxlength="15">
				</p>
				<c:if test="${keepId==null}">
				<p  style=" margin-bottom: 5px; margin-top: 10px;">
					
				</p>
				</c:if>
				<p>
					<input type="password" id ="password" placeholder="비밀번호" style="height:40px;" size="21" maxlength="15" tabindex="2"  onkeyup="enter()">
				</p>
				<span>
					<input type="button" value="로그인" class="loginbutton" tabindex="3" onclick="sub()">
				</span>
				<span>
					<input type="checkbox" value="autoLogin" name="autoLogin" id="autoLogin" ><label for="autoLogin" tabindex="4">자동 로그인</label>
					<input type="checkbox" value="keepId" name="keepId" id="keepId"><label for="keepId" tabindex="5">아이디 저장</label>
				</span>
				<p>
					<a href="<c:url value='/member/find'/>">비밀번호 찾기</a> &nbsp; | &nbsp; <a href="<c:url value='/member/join'/>">회원가입</a> &nbsp;
				</p>
				<span>
					<img alt='a' src='<spring:url value="/resources/img/kakaoLogin.png"/>' style="width: 205px" onclick="kakaoLogin()">
				</span>
	
				</div>
				</c:if>
				
				<c:if test="${login!=null}">
				<div style="text-align:right; column-span:all; height: 100%; width: 210px;  right: 100%; margin-left: 78%;">
					<input type="button" value="로그아웃" onclick="logOut(${login})">
				</div>
				</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="background-color:#FFCC00">
				<h2>FOOTER ${login}</h2>
			</td>
		</tr>
	
	</table>
	</form>
	
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	
	
	<script type="text/javascript">
	window.onload=function(){
		$("#id").focus();
	}
	
	/*로그인 실패 코드*/
	function sub(){
		var id=$("#id").val(); 
		var password=$("#password").val();
		var autoLogin="";
		var keepId="";
		let form={id:id,password:password};
		$('input:checkbox[name=autoLogin]').each(function (index) {
			if($(this).is(":checked")==true)
		    	autoLogin=$(this).val();						    
		});
		$('input:checkbox[name=keepId]').each(function (index) {
			if($(this).is(":checked")==true)
		    	keepId=$(this).val();						    
		});
			$.ajax({
				url:'<c:url value='member/login'/>',type:'POST',data:JSON.stringify(form),dataType:'text',
				contentType:'application/json;charset=utf8',success:function(data){
					if(data=="success"){
						console.log("suc");
						loginSec(id,autoLogin,keepId); return;
					}
					alert(data);
				},error:function(){
					console.log("error");
					alert("error")
				}
			})

	}
	function loginSec(id,autoLogin,keepId){
		let form={id:id,autoLogin:autoLogin,keepId:keepId}
		console.log(form)
		$.ajax({
			url:'<c:url value='member/loginSuccess'/>', type:'POST', data:JSON.stringify(form),
			contentType:'application/json;charset=utf8',dataType:'text',success:function(data){
				console.log(data);
				location.href="<c:url value='/'/>"
			}
		})
		
	}
	/*엔터키 이벤트*/
	function enter(){
		if (window.event.keyCode == 13) {
	    	sub();
	    }
	}
		
	
	/*카톡 로그인 시작*/
	Kakao.init("46b14e20ee81b576aef4c3fefeff66be");
		
	function kakaoLogin(){
		var id=""; var name ="";
		Kakao.Auth.loginForm({			
			success:function(authObj){
				Kakao.API.request({
					url:'/v2/user/me',
					success: function(res){
						 id = res.id;
						 name = res.properties.nickname;
						 let form={id:id,name:name};
						 kakaoLoginController(res)
					}
				})
				var token = authObj.access_token;
			},
			fail:function(err){
				alert(JSON.stringify(err));
			}					
		})
		
		}
	function kakaoLoginController(res){
		let form={id:res.id,name:res.properties.nickname};
		$.ajax({
			url:'<c:url value='member/hi'/>', type:'GET',data:form,dataType:'text',
			success:function(data){
				console.log("kls");
				location.href="/com/member/kLoginSuccess?id="+data;
			},error:function(){
				alert("error")
			}
		});
		
	}
	/*카톡 로그인 끝*/
	
	/*로그아웃*/
	function logOut(id){
		$.ajax({
			url:'<c:url value="/member/logOut"/>',data:JSON.stringify(id), type:'POST',
			contentType:'application/json; charset=utf8',success:function(){
				console.log("suc")
				location.href="<c:url value='/'/>";
			}
		})
	}
	</script>
		
</body>
</html>