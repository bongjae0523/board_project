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

    <title>SB Admin 2 - memberLogin</title>

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
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                    </div>
                                    
                                    <form id="loginform" class="user" action="/member/memberLogin" method="post">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user" id="userid"
                                       			placeholder="id" name="userid">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user" id="userpw"
                                        		placeholder="password" name="userpw">
                                        </div>
                                        
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="checkId" name="checkId" name="checkId" />
                                                <label class="custom-control-label" for="checkId">????????? ????????????</label>
                                            </div>
                                        </div>
                                        
                                       <a href="#" class="btn btn-primary btn-user btn-block" onclick="return frmCheck();">?????????</a>
                                        <hr>
                                        
                                        <a href="#" class="btn btn-google btn-user btn-block">
                                            <i class="fab fa-google fa-fw"></i> Login with Google
                                        </a>
                                        <a href="#" class="btn btn-facebook btn-user btn-block">
                                            <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                                        </a>
                                    </form>
                                    
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="/member/search_id">????????? ????????????????</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="/member/search_pwd">???????????? ????????????????</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="${pageContext.request.contextPath}/member/memberRegister">?????? ????????? ?????????!</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="/">?????????!</a>
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







<script type="text/javascript">

$(document).ready(function() {
	
	var msg = "${msg}";
	
	if(msg != ""){
		alert(msg);	
	}
	
});

function frmCheck() {                                                                                                                                                                             
	if ($("#userid").val() == "") {                                                                                                                                                                  
		alert("???????????? ??????????????????.");                                                                                                                                                              
		$("#userid").focus();                                                                                                                                                                          
		return false;                                                                                                                                                                                 
	}                                                                                                                                                                                               
	if ($("#userpw").val() == "") {                                                                                                                                                                 
		alert("??????????????? ??????????????????.");                                                                                                                                                            
		$("#userpw").focus();                                                                                                                                                                         
		return false;                                                                                                                                                                                 
	}                                                                                                                                                                                               
	$("#loginform").submit();                                                                                                                                                                       
}   
</script>

<script>	
$(document).ready(function(){
	// ????????? ???????????? ???????????? ID ?????? ????????????. ????????? ???????????? ?????????.
    var key = getCookie("key");
    $("#userid").val(key); 
     
    // ??? ?????? ID??? ???????????? ?????? ????????? ?????? ???, ?????? ?????? ????????? ID??? ????????? ????????????,
    if($("#userid").val() != ""){ 
        $("#checkId").attr("checked", true); // ID ??????????????? ?????? ????????? ??????.
    }
     
    $("#checkId").change(function(){ // ??????????????? ????????? ?????????,
        if($("#checkId").is(":checked")){ // ID ???????????? ???????????? ???,
            setCookie("key", $("#userid").val(), 7); // 7??? ?????? ?????? ??????
        }else{ // ID ???????????? ?????? ?????? ???,
            deleteCookie("key");
        }
    });
     
    // ID ??????????????? ????????? ???????????? ID??? ???????????? ??????, ?????? ?????? ?????? ??????.
    $("#userid").keyup(function(){ // ID ?????? ?????? ID??? ????????? ???,
        if($("#checkId").is(":checked")){ // ID ??????????????? ????????? ????????????,
            setCookie("key", $("#userid").val(), 7); // 7??? ?????? ?????? ??????
        }
    });

// ?????? ???????????? 
// setCookie => saveid???????????? ????????? ????????? ??????????????? ???????????? ????????? ???????????? ???????????? ??????
function setCookie(cookieName, value, exdays) {
	var exdate = new Date();
	exdate.setDate(exdate.getDate() + exdays);
	var cookieValue = escape(value)
			+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
	document.cookie = cookieName + "=" + cookieValue;
}

// ?????? ??????
function deleteCookie(cookieName) {
	var expireDate = new Date();
	expireDate.setDate(expireDate.getDate() - 1);
	document.cookie = cookieName + "= " + "; expires="
			+ expireDate.toGMTString();
}
 
// ?????? ????????????
function getCookie(cookieName) {
	cookieName = cookieName + '=';
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cookieName);
	var cookieValue = '';
	if (start != -1) { // ????????? ????????????
		start += cookieName.length;
		var end = cookieData.indexOf(';', start);
		if (end == -1) // ?????? ?????? ????????? ?????? ????????? ?????? ?????? 
			end = cookieData.length;
            console.log("end??????  : " + end);
		cookieValue = cookieData.substring(start, end);
	}
	return unescape(cookieValue);
}
</script>







</script>

</html>