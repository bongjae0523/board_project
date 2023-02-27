<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<div class="row" style="margin-bottom: 20px; margin-left: 1px;">
	<div class="col-lg-12">
		<h1 class="page-header">수정 페이지</h1>
	</div>
</div>

<div class="panel" style="margin-left: 1px;">
	<div id="contAreaBox">
		<div class="panel">
			<div class="panel-body">
				<form role="form" action="/board/modify" method="post">
					<div class="table-responsive" style="text-align: center;">
						<table id="datatable-scroller" class="table table-bordered tbl_Form">
							<caption></caption>
							<colgroup>
								<col width="250px" />
								<col />
							</colgroup>
							<tbody>
								<tr>
									<th class="active">게시물 번호</th>
									<td class="form-inline">
									<input type="text" id="board_writer" name="bno" class="form-control" style="width: 200px" 
									value='<c:out value="${board.bno }"/>' readonly="readonly"/></td>
								</tr>
								<tr>
									<th class="active">작성자</th>
									<td class="form-inline">
									<input type="text" id="board_writer" name="writer" class="form-control" style="width: 200px" 
									value='<c:out value="${board.writer }"/>' readonly="readonly"/></td>
								</tr>
								<tr>
									<th class="active">제목</th>
									<td class="form-inline">
									<input type="text" id="board_title" name="title" class="form-control" style="width: 840px"
									value='<c:out value="${board.title }"/>' /></td>
								</tr>
								<tr>
									<th class="active">내용</th>
									<td class="form-inline">
									<textarea id="board_content" name="content" cols="100" rows="10" class="form-control">
									<c:out value="${board.content }" /></textarea></td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<input type='hidden' name='regdate'	value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.regdate}" />' >
					<input type='hidden' name='updateDate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.updateDate}" />' >
					
					<input type='hidden' name='pageNum'	value='<c:out value="${cri.pageNum }"/>'> 
					<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'> 
					
					<input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
					<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
					
					
					<div style="text-align: center;">
						<button type="submit" data-oper='modify' class="btn btn-info" >수정</button>
						<button type="submit" data-oper='remove' class="btn btn-danger">제거</button>
						<button type="submit" data-oper='list' class="btn btn-info">목록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("form");

		$('button').on("click", function(e) {

			e.preventDefault();

			var operation = $(this).data("oper");

			console.log(operation);

			if (operation === 'remove') {
				formObj.attr("action", "/board/remove");

			} else if (operation === 'list') {

				//move to list
				formObj.attr("action", "/board/list").attr("method", "get");

				var pageNumTag = $("input[name='pageNum']").clone(); //.clone() 잠시 저장.
				var amountTag = $("input[name='amount']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone();

				formObj.empty(); //모든 내용 지우기

				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);
			}

			formObj.submit();
		});

	});
</script>


<%@include file="../includes/footer.jsp"%>