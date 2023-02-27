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

    <title>SB Admin 2 - Tables</title>

    <!-- Custom fonts for this template -->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">



<style>
      
      .lottotext {
        padding: 3px 8px;
        background-color: #444444;
        border-radius: 5px;
        color: #ffffff;
        position: absolute;
        display: none;
      }
      .lottoimg:hover + .lottotext {
        display: block;
      }

      .roulettetext {
        padding: 3px 8px;
        background-color: #444444;
        border-radius: 5px;
        color: #ffffff;
        position: absolute;
        display: none;
      }
      .rouletteimg:hover + .roulettetext {
        display: block;
      }
    </style>


</head>


<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">놀러와 <sup>99</sup></div>
            </a>


            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>관리</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Components</h6>
                        
                        <c:if test="${member == null}">
							<a class="collapse-item" href="${pageContext.request.contextPath}/member/memberLogin">
								<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
								로그인
							</a>
							<a class="collapse-item" href="${pageContext.request.contextPath}/member/memberRegister">
								<i class="fas fa-users fa-sm fa-fw mr-2 text-gray-400"></i>
								회원가입
							</a>
						</c:if>
															
						<c:if test="${member != null }">
							<a class="collapse-item" href="${pageContext.request.contextPath}/member/memberUpdate">
								<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
								정보수정
							</a>
							
							<c:if test="${member.auth == '0' }">
								<a class="collapse-item" href="${pageContext.request.contextPath}/member/memberList">
									<i class="fas fa-users fa-sm fa-fw mr-2 text-gray-400"></i>
									회원관리
								</a>
							</c:if>
									                                
							<a class="collapse-item" href="${pageContext.request.contextPath}/member/memberLogout">
								<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
								로그아웃
							</a>
						</c:if>
						
                    </div>
                </div>
            </li>


            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Addons
            </div>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="/board/list">
                    <i class="fas fa-fw fa-table"></i>
                    <span>게시판</span></a>
            </li>
            
            <!-- 채팅 -->
            <li class="nav-item">
                <a class="nav-link" href="#" id="chat" title="채팅">
                    <i class="fas fa-fw fa-table"></i>
                    <span>채팅</span>
				</a>
            </li>
            
            
            

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <form class="form-inline">
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                    </form>


					<!-- 로또번호 추천 -->
					<div class="lottoimg">
						<img id="lotto" src="/resources/img/lotto.jpg" width=80px; height=50px;>
					</div>
					<div class= "lottotext">로또 추천</div>
					<!-- 로또번호 추천 끝 -->


                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>


                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">click here</span>
                                <img class="img-profile rounded-circle" src="/resources/img/undraw_profile.svg">
                            </a>
                            
                            
                            
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                
									<c:if test="${member == null}">
										<a class="dropdown-item" href="${pageContext.request.contextPath}/member/memberLogin">
		                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
		                                    Login
		                                </a>
		                                <a class="dropdown-item" href="${pageContext.request.contextPath}/member/memberRegister">
		                                    <i class="fas fa-users fa-sm fa-fw mr-2 text-gray-400"></i>
		                                    Join
		                                </a>
									</c:if>
									
									<c:if test="${member != null }">
										<div>
											<p class="text-center">${member.username}님. 반가워</p>
										</div>
										<div class="dropdown-divider"></div>
		                                <a class="dropdown-item" href="${pageContext.request.contextPath}/member/memberUpdate">
		                                   <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
		                                    정보수정
		                                </a>
		                                
		                                <c:if test="${member.auth == '0' }">
			                                <a class="dropdown-item" href="${pageContext.request.contextPath}/member/memberList">
			                                   <i class="fas fa-users fa-sm fa-fw mr-2 text-gray-400"></i>
			                                    회원관리
			                                </a>
		                                </c:if>
		                                
		                                <a class="dropdown-item" href="${pageContext.request.contextPath}/member/memberLogout">
		                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
		                                    Logout
		                                </a>
		                                
									</c:if>
                            </div>
                            
                            
                            
                            
                            
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->
                
                
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<!-- 채팅 -->     
<script>
	$("#chat").on('click',function(e){
		e.preventDefault();
		window.open("/chat","chat","width=500, height=650, top=200, left=200");
       				 // 경로, 파일, 너비, 높이, 위치 지정
	})
</script>




