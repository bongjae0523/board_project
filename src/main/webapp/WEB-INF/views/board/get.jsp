<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<div class="row" style="margin-bottom: 20px; margin-left: 1px;">
	<div class="col-lg-12">
		<h1 class="page-header">조회 페이지</h1>
		<div>조회수
		<c:out value="${board.readcount }"/>
		</div>
	</div>
</div>

<div class="panel" style="margin-left: 1px;">
	<div id="contAreaBox">
		<div class="panel">
			<div class="panel-body">

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
									value='<c:out value="${board.title }"/>' readonly="readonly" /></td>
								</tr>
								<tr>
									<th class="active">내용</th>
									<td class="form-inline">
									<textarea id="board_content" name="content" cols="100" rows="10" class="form-control" readonly="readonly">
									<c:out value="${board.content }" /></textarea></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div style="text-align: center;">
						<c:if test="${sessionScope.id == board.writer || member.auth == 0}">
							<button data-oper='modify' class="btn btn-info">수정</button>
						</c:if>
						
						<button data-oper='list' class="btn btn-info">목록</button>
					</div>
					
					<form id='operForm' action="/board/modify" method="get">
						
						<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno }"/>'> 
						
						<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'> 
						<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
						
						<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'> 
						<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
						
					</form>

			</div>
		</div>
	</div>
</div>




<!-- 댓글처리 -->
<div class="row" style="margin-bottom: 20px; margin-left: 1px;" style="float:right; padding:0;">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i> 댓글
				
				<c:if test="${member != null }">
					<button id='addReplyBtn' class="btn btn-primary btn-xs">등록</button>
				</c:if>
			
			
			
			</div>

		</div>
		<hr>
		
		<!-- /.panel-heading -->
		<div class="panel-body">

			<ul class="chat">
				<!-- start reply -->
				
				
				<!-- end reply -->
			</ul>
			<!-- ./ end ul -->
		</div>
		<!-- /.panel .chat-panel -->

		<div class="panel-footer"></div>
		
	</div>
</div>
<!-- ./ end row -->

<!-- 댓글 추가는 모달창을 이용해서 진행 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">댓글 등록</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>내용</label> <input class="form-control" name='reply' value='New Reply!!!!'>
				</div>
				<div class="form-group">
					<label>작성자</label> <input class="form-control" name='replyer' value='replyer'>
				</div>
				<div class="form-group">
					<label>작성날짜</label> <input class="form-control" name='replyDate' value=''>
				</div>

			</div>
			<div class="modal-footer">
			
				<button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
				<button id='modalRemoveBtn' type="button" class="btn btn-danger">제거</button>
				<button id='modalRegisterBtn' type="button" class="btn btn-primary">등록</button>
				<button id='modalCloseBtn' type="button" class="btn btn-default">닫기</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->




<script type="text/javascript" src="/resources/js/reply.js"></script>

<script>

console.log("==============");
console.log("JS.TEST");

$(document).ready(function() {

	var bnoValue = '<c:out value="${board.bno}"/>';
	var replyUL = $(".chat");

	showList(1);
	
	function showList(page){
	    	
		console.log("show list " + page);
	        
		replyService.getList({bno:bnoValue,page: page|| 1 }, function(replyCnt, list) {
	          
		console.log("replyCnt: "+ replyCnt );
		console.log("list: " + list);
	        
		if(page == -1){
			pageNum = Math.ceil(replyCnt/10.0);
			showList(pageNum);
			return;
		}
	          
		var str="";
	         
		if(list == null || list.length == 0){
			return;
		}
	         
		for (var i = 0, len = list.length || 0; i < len; i++) {
			str += "<li class='left clearfix' data-rno='" + list[i].rno + "'>";
			str += " <div><div class='header'><strong class='primary-font'>" + list[i].replyer + "</strong>";
			str += "    <small class='pull-right text-muted' style='float:right; margin-right: 10px;'>" + replyService.displayTime(list[i].replyDate) + "</small></div>";
			str += "    <p>" + list[i].reply + "</p></div></li>";
		}
	         
		replyUL.html(str);
	         
		showReplyPage(replyCnt);
	
	     
		});//end function
	         
	}//end showList
	

    var pageNum = 1;
    var replyPageFooter = $(".panel-footer");
    
    function showReplyPage(replyCnt){
      
		var endNum = Math.ceil(pageNum / 10.0) * 10;  
		var startNum = endNum - 9; 
      
		var prev = startNum != 1;
		var next = false;
      
		if(endNum * 10 >= replyCnt){
			endNum = Math.ceil(replyCnt/10.0);
		}
	      
		if(endNum * 10 < replyCnt){
			next = true;
		}
	      
		var str = "<ul class='pagination pull-right'>";
	      
		if(prev){
			str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
		}
	      
	       
	      
		for(var i = startNum ; i <= endNum; i++){
	        
			var active = pageNum == i? "active":"";
			str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
		}
	      
		if(next){
			str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
		}
	      
		str += "</ul></div>";
	      
		console.log(str);
	      
		replyPageFooter.html(str);
	}
	
    replyPageFooter.on("click","li a", function(e){
        
    	e.preventDefault();
        
    	console.log("page click");
        
        var targetPageNum = $(this).attr("href");
        
        console.log("targetPageNum: " + targetPageNum);
        
        pageNum = targetPageNum;
        
		showList(pageNum);
	});  
	
	var modal = $(".modal");
    var modalInputReply = modal.find("input[name='reply']");
    var modalInputReplyer = modal.find("input[name='replyer']");
    var modalInputReplyDate = modal.find("input[name='replyDate']");
    
    var modalModBtn = $("#modalModBtn");
    var modalRemoveBtn = $("#modalRemoveBtn");
    var modalRegisterBtn = $("#modalRegisterBtn");
    
    $("#modalCloseBtn").on("click", function(e){
    	
    	modal.modal('hide');
    });
    
    $("#addReplyBtn").on("click", function(e){
      
      modal.find("input").val("");
      modalInputReplyDate.closest("div").hide(); 
      modal.find("button[id !='modalCloseBtn']").hide(); 
      
      // 댓글 등록시 작성자 기입
      var memberReply = "${member.userid}" ;
      modalInputReplyer.val(memberReply);
      
      
      
      modalRegisterBtn.show(); 
      $(".modal").modal("show");
      
    });
	
	//댓글 등록
    modalRegisterBtn.on("click",function(e){
        
        var reply = {
              reply: modalInputReply.val(),
              replyer:modalInputReplyer.val(),
              bno:bnoValue
            };
        replyService.add(reply, function(result){
          
          alert(result);
          
          modal.find("input").val("");
          modal.modal("hide");
          
          //showList(1);
          showList(-1);
          
		});
        
	});

	
	
    $(".chat").on("click", "li", function(e){
	      
		var rno = $(this).data("rno");
			      
		replyService.get(rno, function(reply){
			      
			modalInputReply.val(reply.reply);
			modalInputReplyer.val(reply.replyer);
			modalInputReplyDate.val(replyService.displayTime( reply.replyDate)).attr("readonly","readonly");
			modal.data("rno", reply.rno);
				        
			modal.find("button[id !='modalCloseBtn']").hide();
			
				modalModBtn.show();
				modalRemoveBtn.show();
			
			
			
			
			$(".modal").modal("show");
			            
		});
	});
    
	
    modalModBtn.on("click", function(e){
        
		var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
	        
		replyService.update(reply, function(result){
	              
			alert(result);
			modal.modal("hide");
			showList(pageNum);
	          
		});
	        
	});
    
	modalRemoveBtn.on("click", function (e){
    	  
		var rno = modal.data("rno");
	    	  
		replyService.remove(rno, function(result){
			alert(result);
			modal.modal("hide");
			showList(pageNum);
			   	      
		});
				    	  
	});
		
		
});
	

</script>





<script type="text/javascript">
	$(document).ready(function() {

		var operForm = $("#operForm");

		$("button[data-oper='modify']").on("click", function(e) {

			operForm.attr("action", "/board/modify").submit(); // 수정버튼을 누른경우 bno값이 같이 간다.

		});

		$("button[data-oper='list']").on("click", function(e) {

			operForm.find("#bno").remove(); //리스트로 가는 경우 bno가 필요없으므로 삭제 후 이동.
			operForm.attr("action", "/board/list")
			operForm.submit();

		});
	});
</script>



<%@include file="../includes/footer.jsp"%>