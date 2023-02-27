<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/header.jsp"%>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">회원 관리</h1>
                    <p class="mb-4">회원을 검토하자.</p>

                    <!-- DataTales -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <div class="m-0 font-weight-bold text-primary" >회원 게시판
                            	
                            </div>
                        </div>
                        
                        
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" width="100%" cellspacing="0">
                                   
                                    <thead>
                                        <tr>
                                            <th>userid</th>
                                            <th>username</th>
                                            <th>useremail</th>
                                            <th>phone</th>
                                            <th>regDate</th>
                                            <th>enabled</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
	                                    <c:forEach items="${memberList }" var="mem">
											<tr>
												<td><c:out value="${mem.userid }" /></td>
												<td><c:out value="${mem.username }" /></td>
												<td><c:out value="${mem.useremail }" /></td>
												<td><c:out value="${mem.phone }" /></td>
												<td><fmt:formatDate pattern="yyyy-MM-dd" value="${mem.regDate }" /></td>
												<td>
													<c:if test="${mem.enabled == true }">
														가입
													</c:if>
													<c:if test="${mem.enabled == false }">
														탈퇴
													</c:if>
												</td>
												
												<%-- <td><c:out value="${mem.enabled }" /></td> --%>
												
												
												
												
											</tr>
										</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->





<%@include file="../includes/footer.jsp"%>


           