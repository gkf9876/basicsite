<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
	<title>Home</title>
</head>
<body>
	<h1>
		Hello world!  
	</h1>
	
	<p>  The time on the server is ${serverTime}. </p>
	
	<form:form modelAttribute="board" method="get">
		<table>
			<colgroup>
				<col width="*"/>
				<col width="*"/>
			</colgroup>
			<thead>
			</thead>
			<tbody>
				<tr>
					<td>이름</td>
					<td>
						${board.name}
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						${board.content}
					</td>
				</tr>
			</tbody>
		</table>
		<div>
			<span><a href="javascript:edit();" onclick="">수정</a></span>
		</div>
	</form:form>

	<script type="text/javascript">
	//<![CDATA[
		function edit(){
			/* $('#board').submit(); */
		}
	//]]>
	</script>
</body>
</html>
