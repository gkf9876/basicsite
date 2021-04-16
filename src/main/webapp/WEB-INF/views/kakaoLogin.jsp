<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
	<title>Home</title>
</head>
<body>
	<h1>
		Hello world!  
	</h1>
	
	<p>  The time on the server is ${serverTime}. </p>
	
	<div>
	<a id="custom-login-btn" onclick="kakaoLogin();" title="카카오 계정으로 시작하기">
	  <img
	    src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
	    alt="카카오 계정으로 시작하기"
	    style="width:500px;"
	  />
	</a>
	<a href="/basic/kakaoClose">연결끊기</a>
	</div>
	<div id="naverIdLogin" alt="네이버 계정으로 시작하기" class="naver">
		<span>네이버 로그인</span>
		<a id="naverLogin" onclick="document.getElementById('naverIdLogin_loginButton').click();" title="네이버 계정으로 시작하기" class="naver"></a>
	</div>
	<a onclick="fbLogin();" title="페이스북 계정으로 시작하기" class="facebook">
		<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" alt="페이스북 계정으로 시작하기" style="height: 35px;">
		<span>페이스북 로그인</span>
	</a>
	
	<form method="post" id="snsLoginForm" name="snsLoginForm" accept-charset="utf-8" style="display:none;">
		<input name="snsUsrId" id="snsUsrId" value=""/>
		<input name="snsUsrEmail" id="snsUsrEmail" value=""/>
		<input name="snsUsrNm" id="snsUsrNm" value=""/>
		<input name="snsDivision" id="snsDivision" value=""/>
		<input name="certMethCd" id="certMethCd" value=""/>
	</form>
	
	<script type="text/javascript">
	//<![CDATA[
		window.name = "parentWin";
		
		function write(){
			console.log("Hello World");
		}
		
		Kakao.init('b74190378e0f772af00c0c27d09d0b25');
		console.log(Kakao.isInitialized());
		function kakaoLogin(){
			Kakao.Auth.login({
				success: function(authObj){
					Kakao.API.request({
						url:'/v2/user/me',
						success:function(res){
							var kakaoData={
									snsUsrId : res.id
									, snsUsrEmail : res.kakao_account.email
									, snsUsrNm : res.properties.nickname
									, snsDivision : 'K'
									, certMethCd : 'FA3905'
							}
							
							$('#snsUsrId').val(kakaoData.snsUsrId);
							$('#snsUSrEmail').val(kakaoData.snsUsrEmail);
							$('#snsUsrNm').val(kakaoData.snsUsrNm);
							$('#snsDivision').val(kakaoData.snsDivision);
							$('form#snsLoginForm #certMethCd').val(kakaoData.certMethCd);
							snsSubmit();
						}
					})
				},
				fail:function(err){
					alert('로그인에 실패하였습니다.');
					console.log(JSON.stringify(err));
				}
			});
		}
		
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "wJcJNJ4JKK80U9r6UTfP",
				//callbackUrl: "http://localhost:8080/basic/redirectBlankUrl",
				callbackUrl: "http://localhost:8080/basic/redirectBlankUrl",
				isPopup: true,
				loginButton: {color: "green", type: 1, height: 40},
				callbackHandel: false
			}
		);
		
		naverLogin.init();
		
/* 		window.addEventListener('load', function(){
			naverLogin.getLoginStatus(function (status){
				console.log("Hello World1");
				if(status){
					console.log("Hello World2");
					var email = naverLogin.user.getEmail();
					if(email == undefined || email == null){
						alert('이메일은 필수정보입니다. 정보제공을 동의해 주세요');
						naverLogin.reprompt();
						return;
					}
					setLoginStatus();
				}
			});
		});
		
		function setLoginStatus(){
			console.log("Hello World2");
		} */


		  (function(d, s, id){
		     var js, fjs = d.getElementsByTagName(s)[0];
		     if (d.getElementById(id)) {return;}
		     js = d.createElement(s); js.id = id;
		     js.src = "https://connect.facebook.net/ko_KR/sdk.js";
		     fjs.parentNode.insertBefore(js, fjs);
		   }(document, 'script', 'facebook-jssdk'));
		window.fbAsyncInit = function(){
			FB.init({
				appId : '2933914510227604',
				cookie     : true,
				xfbml : true,
				version : 'v5.0'
			});
			FB.AppEvents.logPageView();
		}
		  
		function fbLogin(){
			console.log("Hello World1");
			var browse = navigator.userAgent.toLowerCase();
			if((navigator.appName == 'Netscape' && browse.indexOf('trident') != -1) || (browse.indexOf('msie') != -1)){
				console.log("Hello World2");
				if(confirm("Internet Explorer 11이하 버전에서는 페이스북 로그인이 정상적으로 작동하지 않을수도 있습니다.\n계속 진행하시겠습니까?")){
					FB.login(function(response){
						statusChangeCallback(response);
					}, {scope:'public_profile, email'});
				}
			}else{
				console.log("Hello World3");
				FB.login(function(response){
					statusChangeCallback(response);
				},{scope:'public_profile, email'});
			}
		}
		
		function checkLoginState(){
			FB.getLoginStatus(function(response){
				statusChangeCallback(response);
			});
		}
		
		function statusChangeCallback(response){
			if(response.status === 'connected'){
				FB.api('/me', function(response){
					$('#snsUsrId').val(response.id);
					$('#snsUsrNm').val(response.name);
					$('#snsDivision').val('F');
					$('form#snsLoginForm #certMethCd').val('FA3903');
					
					fbGetEmail();
				});
			}else{
				alert('계정 확인에 실패하였습니다.\n다른 SNS로 시도하시거나 다른 인터넷 브라우저를 사용하여 시도하여 주시기 바랍니다.');
			}
		}
		
		function snsSubmit(){
			window.open('', 'memberEnterPopup', 'width=1300,height=800');
			
			var frm = document.snsLoginForm;
			frm.target = 'memberEnterPopup';
			frm.action = '/basic/snsLogin';
			frm.submit();
		}
		
		function fbGetEmail(){
			FB.api('/me', {fields:'email'}, function(response){
				$('#snsUsrEmail').val(response.email);
				fbSubmit();
			});
		}
		
		function fbSubmit(){
			snsSubmit();
		}
	//]]>
	</script>
</body>
</html>
