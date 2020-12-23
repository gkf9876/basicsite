<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

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
	
	<script type="text/javascript">
	//<![CDATA[
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
							
							console.log(kakaoData);
						}
					})
				},
				fail:function(err){
					alert('로그인에 실패하였습니다.');
					console.log(JSON.stringify(err));
				}
			});
		}
	//]]>
	</script>
</body>
</html>
