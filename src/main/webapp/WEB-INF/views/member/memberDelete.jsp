<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - memberDelete</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
				
		$("#submit").on("click", function(){
			
			if($("#userpw").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#userpw").focus();
				return false;
			}
			
			
		});
		
		
	})
</script>

<script type="text/javascript">

$(document).ready(function() {
	
	var msg = "${msg}";
	
	if(msg != ""){
		alert(msg);	
	}
	
});
</script>

<body>

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">비밀번호 맞으면 보내줄게....</h1>
                            </div>
                            <form class="user" action="/member/memberDelete" method="post" id="delForm">
                               
                               
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="userid"
                                        name="userid" value="${member.userid }" readonly="readonly">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control form-control-user" id="userpw" name="userpw">
                                </div>
                                
                                <div class="form-group">
                                		<button class="tn btn-primary btn-user btn-block" type="submit" id="submit">삭제</button>
                                </div>
                            </form>



                            <hr>
                            <div class="text-center">
                            	<a class="small" href="/">홈으로!</a>
							</div>
							
							
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/sb-admin-2.min.js"></script>

</body>




</html>