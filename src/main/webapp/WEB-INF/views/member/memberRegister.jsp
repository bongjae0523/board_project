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

    <title>SB Admin 2 - memberRegister</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>



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
                                <h1 class="h4 text-gray-900 mb-4">우리의 일꾼이 될 준비!</h1>
                            </div>
                            <form class="user" action="/member/memberRegister" method="post" id="memberRegisterForm">
                               
                               
                                <div class="form-group row">
                                	<div class="col-sm-6 mb-3 mb-sm-0">
	                                    <input type="text" class="form-control form-control-user" id="userid"
	                                        placeholder="id" name="userid">
									</div>
									<button class="useridChk btn-primary btn-user" type="button" id="useridChk" onclick="fn_idChk();" value="N">중복확인</button>
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control form-control-user" id="userpw"
                                        placeholder="password" name="userpw">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="username"
                                        placeholder="name" name="username">
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-user" id="useremail"
                                        placeholder="Email Address" name="useremail">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="phone"
                                        placeholder="phone" name="phone">
                                </div>
                                
                                <!-- 관리자 설정 위한 키 -->
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="auth"
                                        placeholder="관리자 가입을 위한 키" name="auth" value="">
                                </div>
                                
                                <button class="tn btn-primary btn-user btn-block" type="submit" id="submit">가입</button>
                                <hr>
                                
                                <a href="#" class="btn btn-google btn-user btn-block">
                                    <i class="fab fa-google fa-fw"></i> Register with Google
                                </a>
                                
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="/member/search_pwd">비밀번호 잃어버렸슈?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="${pageContext.request.contextPath}/member/memberLogin">가입 했으면 클릭해! 로그인 해야지?</a>
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
					alert("비밀번호를 입력해주세요.");
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
				
				var useridChkVal = $("#useridChk").val();
				
				if(useridChkVal == "N"){
					alert("중복확인 버튼을 눌러주세요.");
					return false;
					
				}else if(useridChkVal == "Y"){
					$("#memberRegisterForm").submit();
				}
			});
			
		})
		
		function fn_idChk(){
			$.ajax({
				url : "/member/useridChk",
				type : "post",
				dataType : "json",
				data : {"userid" : $("#userid").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
					}else if(data == 0){
						$("#useridChk").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		}
	</script>


</html>