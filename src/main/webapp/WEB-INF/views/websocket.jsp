<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
	<title>Insert title here</title>
</head>
<body>
    <div>
        <input type="text" id="sender" value="${sessionScope.member.m_id }">
        <input type="text" id="messageinput">
    </div>
    <div>
        <button type="button" onclick="send();">Send</button>
        <button type="button" onclick="closeSocket();">Close</button>
    </div>
    <!-- Server responses get written here -->
    <div id="messages"></div>
    <!-- websocket javascript -->
    <script type="text/javascript">
        var ws;
        var messages=document.getElementById("messages");

        $(document).ready(function(){
            if(ws !== undefined && ws.readyState !== WebSocket.CLOSED){
                writeResponse("WebSocket is already opened.");
                return;
            }
            //웹소켓 객체 만드는 코드
            ws = new WebSocket("ws://localhost:8080/basic/echo.do");
            
            ws.onopen = function(event){
                if(event.data === undefined)
                    return;
                
                writeResponse(event.data);
            };
            
            ws.onmessage = function(event){
                writeResponse(event.data);
            };
            
            ws.onclose=function(event){
                writeResponse("Connection closed");
            }
        });
        
        function send(){
            var text = $("#sender").val() + " : " + $("#messageinput").val();
            ws.send(text);
            text = "";
        }
        
        function closeSocket(){
            ws.close();
        }
        
        function writeResponse(text){
            messages.innerHTML += "<br/>" + text;
        }
  </script>
</body>
</html>