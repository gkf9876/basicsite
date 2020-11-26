<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="resources/jquery.min.js" type="text/javascript"></script>
	<script src="resources/jquery.uploadifive.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="resources/uploadifive.css">
	
	<title>Home</title>
</head>
<body>
	<h1>
		Hello world!  
	</h1>
	
	<p>  The time on the server is ${serverTime}. </p>
	
	<div>
		<form:form modelAttribute="board" method="get">
			<div id="uploadqueue">
				<input id="file_upload" name="file_upload" type="file" multiple="true"/>
				<a href="javascript:$('#file_upload').uploadifive('upload')">Upload files</a> |
				<a href="javascript:$('#file_upload').uploadifive('stop')">Stop uploading!</a>
			</div>
		</form:form>
	</div>
	
	<script type="text/javascript">
	//<![CDATA[
		function write(){
			console.log("Hello World");
		}
		
		$(function() {
			$('#file_upload').uploadifive({
				'auto'             : false,
				'buttonClass': 'btn btn-primary',
				'buttonText': "Select file",
				'queueID'          : 'uploadqueue',
				'uploadScript'     : '/basic/uploadfiles',
				'onUploadComplete' : function(file, data) { console.log(data); },
				'formData'         : {
					'timestamp' : '111',
					'token'     : '222'
				},
				'fileObjName' : 'Hello World',
				'fileType'         : 'image/png'
			});
		});
	//]]>
	</script>
</body>
</html>
