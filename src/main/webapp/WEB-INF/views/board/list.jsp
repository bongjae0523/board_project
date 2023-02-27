<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/header.jsp"%>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">게시판</h1>
                    <p class="mb-4">게시판을 자유롭게 작성하시오.</p>

                    <!-- DataTales -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <div class="m-0 font-weight-bold text-primary" >게시판
                            	
                            	<c:if test="${member != null }">
                            		<button id='regBtn' type="button" class="btn btn-primary btn-s" style="float:right; padding:0;" >등록</button>
                            	</c:if>
                            
                            
                            
                            </div>
                        </div>
                        
                        <!-- 검색기능 시작 -->
                        <div class='row' style="margin-top: 10px;">
							<div class="col-lg-12 ">
		
								<form id='searchForm' action="/board/list" method='get'
								 class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
									
									<div class="input-group">
									
										<select name='type'>
											<option value=""
											<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
											<option value="T"
											<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
											<option value="C"
											<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
											<option value="W"
											<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
											<option value="TC"
											<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목 or 내용</option>
											<option value="TW"
											<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목 or 작성자</option>
											<option value="TWC"
											<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목 or 내용 or 작성자</option>
										</select> 
									
										<div class="input-group-append">
											<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' /> 
											<input type='hidden' name='pageNum'	value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
											<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
											
											<button class='btn btn-primary'><i class="fas fa-search fa-sm"></i></button>
										</div>
									</div>
								</form>
							</div>
						</div>
                        <!-- 검색기능 끝 -->
                        
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>조회수</th>
                                            <th>작성일</th>
                                            <th>수정일</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>조회수</th>
                                            <th>작성일</th>
                                            <th>수정일</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
	                                    <c:forEach items="${list }" var="board">
											<tr>
												<td><c:out value="${board.bno }" /></td>
												<td><a class='move' href='<c:out value="${board.bno}"/>'><c:out value="${board.title}" />
												 <b>[  <c:out value="${board.replyCnt}" />  ]</b>
												</a></td>
												<td><c:out value="${board.writer }" /></td>
												<td><c:out value="${board.readcount }" /></td>
												<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }" /></td>
												<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate }" /></td>
											</tr>
										</c:forEach>
                                    </tbody>
                                </table>
                                
                                
                                <!-- 게시물 갯수 -->
	                            <div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">
	                            total ${pageMaker.total }
	                            </div>
	                            <!-- 게시물 갯수 끝 -->
	                            
	                            
	                            <!-- 페이지 처리 시작  -->
                                <div class="row">
									<div class="col-sm-12 col-md-7" style="text-align:right">
										<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
											<ul class="pagination">
												
												<c:if test="${pageMaker.prev}">
												    <li class="paginate_button page-item previous" id="dataTable_previous">
												    	<a href="${pageMaker.startPage -1}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
												    </li>
											    </c:if>
													
												<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
												    <li class="paginate_button page-item ${pageMaker.cri.pageNum == num ? "active" : ""} ">
												    	<a href="${num}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">${num}</a>
												    </li>
											    </c:forEach>
														
												<c:if test="${pageMaker.next}">
												    <li class="paginate_button page-item next" id="dataTable_next">
												    	<a href="${pageMaker.endPage +1 }" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Next</a>
												    </li>
											    </c:if>
											</ul>
										</div>
									</div>
                                </div>
                                
                                <form id='actionForm' action="/board/list" method='get'>
									<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
									<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
									<!-- BoardController의 list에서 Criteria cri의 변수가 받아줌. -->
									
									<!-- 검색 정보 -->
									<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'> 
									<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
									
								</form>
                                
                                <!-- 페이징 처리 끝 -->
                                
                                
                                <!-- Modal  추가 -->
								<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
									aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
												<h4 class="modal-title" id="myModalLabel">Modal title</h4>
											</div>
											<div class="modal-body">처리가 완료되었습니다.</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
											</div>
										</div>
										<!-- /.modal-content -->
									</div>
									<!-- /.modal-dialog -->
								</div>
								<!-- /.modal -->
								
								
								
								
								
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->


<script type="text/javascript">

$(document).ready(function(){
	
	var result = '<c:out value="${result}"/>';
	
	checkModal(result);
	
	history.replaceState({}, null, null);

	function checkModal(result) {

		if (result === '' || history.state) { 
			return;
		}

		if (parseInt(result) > 0) {
			$(".modal-body").html( "게시글 " + parseInt(result) + " 번이 등록되었습니다.");
		}

		$("#myModal").modal("show");
	}
	
	$("#regBtn").on("click", function() {

		self.location = "/board/register";

	});
	
	var actionForm = $("#actionForm");

	$(".paginate_button a").on("click",	function(e) {

		e.preventDefault(); 
	
		console.log('click');
		actionForm.attr("action", "/board/list");
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	$(".move").on("click", function(e) {
		e.preventDefault();
		actionForm.find("input[name='bno']").remove(); 
		actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
		actionForm.attr("action", "/board/get");
		actionForm.submit();
	});
	
	var searchForm = $("#searchForm");

	$("#searchForm button").on("click", function(e) {

		if (!searchForm.find("option:selected").val()) {
			alert("검색종류를 선택하세요");
			return false;
		}

		if (!searchForm.find("input[name='keyword']").val()) {
			alert("키워드를 입력하세요");
			return false;
		}

		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();

		searchForm.submit();

	});


	
});

</script>




<%@include file="../includes/footer.jsp"%>


           