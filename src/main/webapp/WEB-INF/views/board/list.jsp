<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>

<!-- ******** -->
<!-- 작성자 : 정선  -->
<!-- ******** -->

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header" style='font-weight: bolder'>리뷰 목록</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<br>
<!-- /.row -->
<!--  -------------------------------------------------------------------------------------->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<!--<div class="panel-heading"> Board List Page-->
			<button id='regBtn' type="button" class="btn btn-xs pull-right"
				style='float: right; width: 15%; border: none; border-radius: 1rem; padding: 1.5%; background: #CD1039; font-weight: 600; color: #fff; cursor: pointer; font-size: 18px'>
				리뷰 작성하기</button>
			<br> 
			<br>
		</div>
		<!-- /.panel-heading -->
		<hr style='width: 100%; height: 1px; border: none'>
		<div class="panel-body">

			<c:forEach items="${list }" var="review">
				<div class="card col-md-8 mt-5 mb-5 my-0 mx-auto border-0">
					<h5 style='font-weight: bolder'>
						<span>📅&nbsp;<fmt:formatDate value="${review.updateDate}" pattern="yyyy.MM.dd" /></span>
					</h5>
					<div class="carousel-item active">
						<div class="carousel-caption">
							<div class="row">
								<div class="col-sm-3">
									<img src="/resources/assets/climbing<c:out value="${Math.round(Math.random() * 5)}"/>.png"
										style='border-width: "10px"' alt=""
										class="rounded-circle img-fluid" />
								</div>
								<div class="col-sm-9">
									<h3>
										<!--<a href='/board/get?bno=<c:out value="${review.bno}"/>'><c:out value="${review.title}" /> </a>-->
										<a class='move' href='<c:out value="${review.bno}"/>'>
									<c:out value="${review.title}" /></a>
									<!-- 
										<a href='/board/get?bno=<c:out value="${review.bno}"/>'><c:out
												value="${review.title}" /> </a>
												-->
									</h3>

									<div class="d-flex small text-warning mb-2">
										<c:forEach var="i" begin="1" end="${review.difficulty}">	                           
											<div class="bi-star-fill"></div>						
										</c:forEach>	
									</div>
									
									<h7 class="smallest mute">작성자 : <c:out value="${review.writer }" /> </h7>
									<br>
									<p>
									<!-- 길이 체크해서 16 이상이면 ...으로 표현 -->
										<c:choose>
											<c:when test="${ fn:length(review.review)>= 16 }">
												<c:out value="${fn:substring(review.review,0,16)}" /> ...
											</c:when>
											<c:otherwise>
												<c:out value="${review.review }" />
											</c:otherwise>
										</c:choose>
									</p>

								</div>
							</div>
						</div>
					</div>
				</div>
				<hr style='width: 100%; height: 1px; border: none'>
			</c:forEach>
			
			<!-- 페이지 번호 처리 -->			
			<div class='pull-right'>
         		<ul class="pagination">
 
 					<!-- 이전 버튼 -->
               	 	<c:if test="${pageMaker.prev}"> 
                	<li class="paginate_button previous">
              		<a href="${pageMaker.startPage - 1}">Previous</a>
               		</li>
               		</c:if>
            
                    <!-- 1~10 버튼 -->
                	<c:forEach var="num" begin="${pageMaker.startPage}" 
            	                     	 end="${pageMaker.endPage}">
                	<li class="paginate_button">
              		<a href="${num}">${num}</a>
                	</li>
                	</c:forEach>
 
  					<!-- 다음 버튼 -->
                	<c:if test="${pageMaker.next}">
                	<li class="paginate_button next">
              		<a href="${pageMaker.endPage + 1}">Next</a>
                	</li>
                	</c:if>            
                </ul> <!--end ul  -->          
           </div>
           
           <form id='actionForm' action = "/board/list" method = 'get'>
           		<input type = 'hidden' name = 'pageNum' value = '${pageMaker.pageVO.pageNum}'>
           		<input type = 'hidden' name = 'amount' value = '${pageMaker.pageVO.amount}'>
           		<input type="hidden" name='type' value='<c:out value="${pageMaker.pageVO.type}"/>'> 
				<input type="hidden" name='keyword' value='<c:out value="${pageMaker.pageVO.keyword}"/>'>
           </form>
           <!-- 페이지 번호 처리 종료 -->  

			<!-- Modal  추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Modal title</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save
								changes</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- 모달끝/.modal -->

		</div>
		<!-- end panel-body -->
	</div>
	<!-- end panel panel-default  -->
</div>
<!-- /.panel -->
</div>
<!-- /.col-lg-6 -->
</div>
<!-- /.row -->
<%@ include file="../includes/footer.jsp"%>



<script type="text/javascript">
	$(document).ready(
			function() {
				var result = '<c:out value="${result}"/>';
				checkModal(result);

				history.replaceState({}, null, null);

				function checkModal(result) {
					if (result === '' || history.state) {
						return;
					}//end if
					if (parseInt(result) > 0) {
						$(".modal-body").html(
								"게시글 " + parseInt(result) + " 번이 등록되었습니다.");
					}//end if
					$("#myModal").modal("show");
				}//end checkModel
				$(document).on("click", "#regBtn", function(event) {
					//$("#regBtn").on("click", function() {
					self.location = "/board/register";
				});//end click
				
				//페이징 버튼 처리 부분
				var actionForm = $("#actionForm"); //폼 등록
				$(".paginate_button a").on("click", function(e) {
					e.preventDefault(); //<a> 작동 중지
					console.log('click');
					actionForm.find("input[name='pageNum']").val($(this).attr("href"));
					actionForm.submit(); //form submit
					}); //end click					
				
				//조회페이지 이동부분 처리
				$(".move").on("click",function(e) {
					e.preventDefault(); //<a> 작동 중지
					//input 태그 추가
					actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href") + "'>");
					actionForm.attr("action","/board/get"); //url변경
					actionForm.submit(); //form submit
				});//end click
				
				
			});//  end ready
</script>