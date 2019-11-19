<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
	<title>Home</title>
</head>
<body>
	<h1>
		Hello world!  
	</h1>
	
	<P>  The time on the server is ${serverTime}. </P>
	
	<form:form commandName="board" method="post">
		<table>
			<colgroup>
				<col width="*"/>
				<col width="*"/>
			</colgroup>
			<thead>
			</thead>
			<tbody>
				<tr>
					<td>num</td>
					<td>
						<form:input type="text" path="name"/>
					</td>
				</tr>
				<tr>
					<td>content</td>
					<td>
						<form:input type="text" path="content"/>
					</td>
				</tr>
			</tbody>
		</table>
		<div>
			<span><a href="javascript:regist();" onclick="">regist</a></span>
		</div>
	</form:form>

	<script type="text/javascript">
	//<![CDATA[
		function regist(){
			$('#board').submit();
		}
	//]]>
	</script>
</body>
</html>
