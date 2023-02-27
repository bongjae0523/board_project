<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Register</title>

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

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">우리의 일꾼의 정보!</h1>
                            </div>
                            <form class="user" action="/member/memberUpdate" method="post" id="updateForm">
                               
                               
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="userid"
                                        name="userid" value="${member.userid }" readonly="readonly">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control form-control-user" id="userpw"
                                        name="userpw" placeholder="기존 비밀번호">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control form-control-user" id="userpw_chk"
                                        name="userpw_chk" placeholder="변경 비밀번호">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="username"
                                        name="username" value="${member.username }">
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-user" id="useremail"
                                        name="useremail" value="${member.useremail }">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="phone"
                                        name="phone" value="${member.phone }">
                                </div>
                                
                                <div class="form-group row">
                                	<div class="col-sm-6 mb-3 mb-sm-0">
                                		<button class="tn btn-primary btn-user btn-block" type="submit" id="submit">수정</button>
                                	</div>
                                	<div class="col-sm-6 mb-3 mb-sm-0">
                                		<button class="tn btn-primary btn-user btn-block" type="reset">리셋</button>
                                	</div>
                                
                                
                                </div>
                                
                            </form>
                            <hr>
                            <div class="text-center">
                            	<a class="small" href="/">홈으로!</a>
							</div>
                            <div class="text-center">
                            	<a class="small" href="/member/memberDelete">탈퇴</a>
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

<script type="text/javascript">
	$(document).ready(function(){
		
		$("#submit").on("click", function(){
			if($("#userid").val()==""){
				alert("아이디를 입력해주세요.");
				$("#userid").focus();
				return false;
			}
			if($("#userpw").val()==""){
				alert("기존비밀번호를 입력해주세요.");
				$("#userpw").focus();
				return false;
			}
			if($("#userpw_chk").val()==""){
				alert("변경할 비밀번호를 입력해주세요.");
				$("#userpw").focus();
				return false;
			}
			if($("#username").val()==""){
				alert("성명을 입력해주세요.");
				$("#username").focus();
				return false;
			}
			if($("#useremail").val()==""){
				alert("이메일을 입력해주세요.");
				$("#useremail").focus();
				return false;
			}
			if($("#phone").val()==""){
				alert("핸드폰이 없으신가요?");
				$("#phone").focus();
				return false;
			}
			
			var inputtedPhoneNumber = $("#phone").val();
			// 입력 값이 000-0000-0000 형식인지 확인한다.
			var phoneNumberRegex = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;
			if(!phoneNumberRegex.test(inputtedPhoneNumber)) {
				alert("'-' 포함한 양식에 맞게 작성하시오");
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

</html>