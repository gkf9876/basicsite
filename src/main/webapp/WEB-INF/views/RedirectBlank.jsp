<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
	<title>Home</title>
</head>
<body>
<script type="text/javascript">


var naverLogin = new naver.LoginWithNaverId(
	{
		clientId: "wJcJNJ4JKK80U9r6UTfP",
		callbackUrl: "http://localhost:8080/basic/redirectBlankUrl",
		isPopup: true
	}
);

naverLogin.init();

window.addEventListener('load', function(){
	naverLogin.getLoginStatus(function (status){
		if(status){
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
	if(!window.opener){
		window.opener = window.open('', 'parentWin');
	}else{
		window.opener = window.opener;
	}
	
	$('#snsUsrId', window.opener.document).val(naverLogin.user.getId());
	$('#snsUsrEmail', window.opener.document).val(naverLogin.user.getEmail());
	$('#snsUsrNm', window.opener.document).val(naverLogin.user.getName());
	$('#snsDivision', window.opener.document).val('N');
	$('#certMethCd', window.opener.document).val('FA3906');
	window.opener.snsSubmit();
	
	top.window.open('about:blank','_self').close();
	top.window.opener=self;
	top.self.close();
}
</script>
</body>
</html>