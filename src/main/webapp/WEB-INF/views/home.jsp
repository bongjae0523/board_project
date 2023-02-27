<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="includes/header.jsp"%>



<h1 style="text-align:center">
	 
	 '놀러와' 게시판에 오신것을 환영합니다.
	  
</h1>

<h3 style="text-align:center">  현재 시간은 ${serverTime} 입니다.</h3>

<div style="text-align: center; ">
	<img src="/resources/img/main.jpg" width=800px; height=800px;>
</div>


<br>

<script>

	window.open("popuppage", "popup", "width=600, height=300, left=0, top=0")

</script>

<script>

$(document).ready(function() {

	var lottoButton = $("#lotto");
	
	lottoButton.on("click", function (e){
	
	
		var lotto = []; 
		
		for(var i=0;i<6;i++){
			
			var num = Math.floor(Math.random() * 44) + 1;
		
			for(var j in lotto){
				while(num == lotto[j]){ 
					num = Math.floor(Math.random() * 44) + 1;
				}
			}
			lotto.push(num);
		}
		
		lotto.sort(function(a,b){
			return a - b;
		});
		alert(lotto);
	});
});

</script>

<script type="text/javascript">

$(document).ready(function() {
	
	var msg = "${msg}";
	
	if(msg != ""){
		alert(msg);	
	}
	
});
</script>






<%@include file="includes/footer.jsp"%>
