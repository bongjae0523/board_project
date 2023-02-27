<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

<link rel="stylesheet" href="/resources/css/chat.css" />


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Simple Chat</title>

<style>
div.header {
	position: sticky;
	top: 0;
	background-color: blue;
}
</style>

<style>
#messages{
    padding-left:0;
    margin:0;
    list-style-type:none;
    display:flex;
    flex-direction: column-reverse;
    overflow-y:auto;
    height:535px;
    border-top:2px solid #fff;
    border-bottom:2px solid #fff;
}

</style>



</head>
<body>

	<div class="chat_wrap">
		<div class="header">
			<h3>채팅방(${member.userid})</h3>
	        <button type="button" onclick="openSocket();">대화방 참여</button>
	        <button type="button" onclick="closeSocket();">대회방 나가기</button>
		</div>
		<div id="chat"></div>
		
		<div class="input-div">
	  		메세지 입력 : 
	        <input type="text" id="sender" value="${sessionScope.id}" style="display: none;">
	        <input type="text" id="messageinput">
	        <button type="button" onclick="send();">메세지 전송</button>
	    </div>
	    <!-- Server responses get written here -->
    <div id="messages"></div>
    </div>
    
    <!-- 메시지 입력시 오른쪽 왼쪽으로 기입되는 방식 지정 -->
<script>
	var uid = "${member.userid}";
	var sender = "$(#sender)";
	Handlebars.registerHelper("printLeftRight", function(sender) {
		if (uid != sender) {
			return "left";
		} else {
			return "right";
		}
	});
</script>
    
    
    <!-- websocket javascript -->
<script type="text/javascript">
	var ws;
    var messages = document.getElementById("messages");
    
    function openSocket(){
		if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
            writeResponse("WebSocket is already opened.");
            return;
        }
        //웹소켓 객체 만드는 코드
        ws = new WebSocket("ws://localhost:8081/echo.do");
        
        ws.onopen = function(event){
            if(event.data === undefined){
          		return;
            }
            writeResponse(event.data);
        };
        
        ws.onmessage = function(event){
            console.log('writeResponse');
            console.log(event.data)
            writeResponse(event.data);
            
        };
        
        ws.onclose = function(event){
            writeResponse("대화 종료");
        }
        
    }
    
    function send(){
        var text = document.getElementById("messageinput").value+","+document.getElementById("sender").value;
        ws.send(text);
        text = "";
    }
    
    function closeSocket(){
        ws.close();
    }
    
    function writeResponse(text){
        messages.innerHTML += "<br/>"+text;
    }
    
</script>

</body>
</html>