<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>    

<script>
	var path = "${pageContext.request.contextPath }";
	 
	$(document).ready(function() {
		var msg = "${msg}";
		
		if(msg != ""){
			alert(msg);    
		}
	});
	 
	 
	function fnSubmit() {
	 
		var tel_rule = /^\d{2,3}-\d{3,4}-\d{4}$/;
		
		if ($("#userid").val() == null || $("#userid").val() == "") {
			alert("아이디를 입력해주세요.");
			$("#userid").focus();
			 
			return false;
		}
		
		if ($("#username").val() == null || $("#username").val() == "") {
			alert("이름을 입력해주세요.");
			$("#username").focus();
			 
			return false;
		}
		 
		if ($("#phone").val() == null || $("#phone").val() == "") {
			alert("전화번호를 입력해주세요.");
			$("#phone").focus();
			 
			return false;
		}
		 
		if(!tel_rule.test($("#phone").val())){
			alert("전화번호 형식에 맞게 입력해주세요.");
			return false;
		}
		 
		 
		if (confirm("비밀번호를 찾으시겠습니까?")) {
		 
			$("#createForm").submit();
		 
		return false;
		}
	}
 
</script>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Forgot id</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body>

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">Forgot Your ID?</h1>
                                        <p class="mb-4">We get it, stuff happens. Just enter your name and phon number below
         								 and we'll send you a link to reset your ID!</p>
                                    </div>
                                    
                                    
                                    <form class="user" id="createForm" action="${path}/member/search_result_pwd" method="post">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                id="userid" name="userid"
                                                placeholder="Enter ID...">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                id="username" name="username"
                                                placeholder="Enter Name...">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                id="phone" name="phone"
                                                placeholder="Enter Phone...">
                                        </div>
											<a href="javascript:void(0)" onclick="fnSubmit(); return false;" class="btn btn-primary btn-user btn-block">
												Reset Password
											</a>
                                    </form>
                                    
                                    
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="${pageContext.request.contextPath}/member/memberRegister">가입해!</a>
                                    </div>
                                    <div class="text-center">
                                       <a class="small" href="${pageContext.request.contextPath}/member/memberLogin">기억났어? 로그인 해야지!</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="/">홈으로!</a>
                                    </div>
                                </div>
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