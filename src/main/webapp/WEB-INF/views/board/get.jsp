<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<!-- ******** -->
<!-- 작성자 : 정선  -->
<!-- ******** -->

<!--<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Board Read</h1>
  </div>   <!-- /.col-lg-12 
</div> <!-- /.row -->

<br>
<br>
<br>
<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading"></div>
	      <div class="container contact-form">
	 		  <h1>리뷰</h1> 
	               <div class="row">
	                    <div class="col-md-6">
	                        <div class="form-group">
	                        	<label>&nbsp;글 제목</label>
	                            <input type="text" name="title" class="form-control"  value='<c:out value="${board.title }"/>' readonly="readonly"" />
	                        </div>
	                        <div class="form-group">
	                         	<label>&nbsp;작성자</label>
	                            <input type="text" name="writer" class="form-control" readonly="readonly" value='<c:out value="${board.writer}"/>' />
	                        </div>
	                        
	                        <div class="form-group">
	                        	<div class="d-flex">
	                        	<label>&nbsp;난이도&nbsp;&nbsp;</label>
		                        	<div class="d-flex small text-warning mb-2">
		                        	<c:forEach var="i" begin="1" end="${board.difficulty}">	                           
											<div class="bi-star-fill"></div>									
									</c:forEach>
									</div>
								</div>
	                        </div>
	                        
	                        <div class="form-group">    
	      						<button data-oper='modify' class="btn btn-default" style='width: 20%; border: none;
	                              border-radius: 1rem; padding: 1.5%; background: #dc3545; font-weight: 600; color: #fff; 
	                              cursor: pointer'>글 수정</button>
	       
	       						<button data-oper='list' class="btn btn-info" style='width: 30%; border: none;
	                             	 border-radius: 1rem; padding: 1.5%; background: #0000CD; font-weight: 600; color: #fff; 
	                              		cursor: pointer; heigth:15px'> 리뷰 목록으로 
	                       	 	</button>       
		        				<!--<a href="/board/list" style='color:white'>리뷰 목록으로</a>-->
		        				<form id='operForm' action="/board/modify" method="get">    		  
				      				<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
				      				<input type='hidden' name='pageNum' value='<c:out value="${pageVO.pageNum}"/>'>
				  	  				<input type='hidden' name='amount' value='<c:out value="${pageVO.amount}"/>'>
				  	  				<input type='hidden' name='keyword' value='<c:out value="${pageVO.keyword}"/>'>
				  	  				<input type='hidden' name='type' value='<c:out value="${pageVO.type}"/>'>
				      			</form>
				      				
		       				
		       					 
						       <form id='operForm' action="/boad/modify" method="get">
						       		<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
							   </form>         
							</div>
	                        
	                    </div>
	                    <div class="col-md-6">
	                        <div class="form-group">
	                        	<label>&nbsp;내용</label>
	                            <textarea name='content' class="form-control" style="width: 100%; height: 150px;"  readonly="readonly"><c:out value="${board.review}" /></textarea>
	                        </div>
	                    </div>
	              </div>
			</div>
    </div>     <!--  end panel-body -->
  </div>   <!-- end panel -->
</div> <!-- /.row -->


<%@include file="../includes/footer.jsp"%>

<!--버튼 JS처리  -->
<script type="text/javascript">
$(document).ready(function() {
  
  var operForm = $("#operForm"); 
  
  $("button[data-oper='modify']").on("click", function(e){
    
    operForm.attr("action","/board/modify").submit();
    
  });//end modify
  
    
  $("button[data-oper='list']").on("click", function(e){
    
    operForm.find("#bno").remove(); //from 태그에서 값지우기
    operForm.attr("action","/board/list")
    operForm.submit();
    
  });  //end list
});//end ready
</script>

