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
	
	<div>
		<form:form modelAttribute="board" method="get">
			<table>
				<colgroup>
					<col width="5%"/>
					<col width="*"/>
					<col width="*"/>
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>이름</th>
						<th>내용</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td rowspan="3">게시물이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="vo">
								<tr>
									<td style="text-align: center;">${vo.idx}</td>
									<td style="text-align: center;">${vo.name}</td>
									<td style="text-align: left;">${vo.content}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div style="text-align: right;">
				<a href="/basic/write">글쓰기</a>
				<a href="/basic/websocket">채팅</a>
				<a href="/basic/download1">다운1</a>
				<a href="/basic/download2">다운2</a>
			</div>
		</form:form>
	</div>
	
	<script type="text/javascript">
	//<![CDATA[
		function write(){
			console.log("Hello World");
		}
	//]]>
	</script>
</body>
</html>
