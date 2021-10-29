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
    <h1 class="page-header">Board Modify Page</h1>
  </div>   <!-- /.col-lg-12 
</div> <!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading"></div>
      <!-- /.panel-heading -->
      <div class="panel-body">
      
      	<div class="container contact-form">
 		<form role="form" action="/board/modify" method="post"> 
 		  <h1>리뷰 수정</h1>
               <div class="row">
                    <div class="col-md-6">
                    <div class="form-group">
          				<input type="hidden" class="form-control" name='bno' value='<c:out value="${board.bno }"/>' readonly="readonly">
          				
          				<!-- 추가 작성자 : 조윤희 - 페이징 정보 추가  -->	         				
  		 				<input type='hidden' name='pageNum' value='<c:out value="${pageVO.pageNum}"/>'>
  	  	  				<input type='hidden' name='amount' value='<c:out value="${pageVO.amount}"/>'>
  	  	  				<!-- 페이징 정보 완료 -->
        			</div>
                        <div class="form-group">
                        	<label>&nbsp;글 제목</label>
                            <input type="text" name="title" class="form-control"  value='<c:out value="${board.title }"/>' />
                        </div>
                        <div class="form-group">
                         	<label>&nbsp;작성자</label>
                            <input type="text" name="writer" class="form-control" value='<c:out value="${board.writer }"/>' readonly="readonly" />
                        </div>
                  
                        <div class="form-group">
                        	 <label>&nbsp;난이도</label><br>

                        	 <div class="d-flex">
	                        	  <p>&nbsp;&nbsp;</p>
	                            <label class="d-flex small text-warning mb-2">
	                            	<input type="radio" name="difficulty" value="1" <c:if test="${board.difficulty eq '1'}">checked</c:if>>&nbsp; 
									<div class="bi-star-fill"></div>							
								</label>
								<p>&nbsp;&nbsp;</p>
	                            <label class="d-flex small text-warning mb-2">
		                            	<input type="radio" name="difficulty" value="2" <c:if test="${board.difficulty eq '2'}">checked</c:if>>&nbsp; 		                            	
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>							
								</label>
								<p>&nbsp;&nbsp;</p>
	                            <label class="d-flex small text-warning mb-2">
		                            <input type="radio" name="difficulty" value="3" <c:if test="${board.difficulty eq '3'}">checked</c:if>>&nbsp; 
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>							
								</label>
								
								<p>&nbsp;&nbsp;</p>
	                            <label class="d-flex small text-warning mb-2">
		                            <input type="radio" name="difficulty" value="4" <c:if test="${board.difficulty eq '4'}">checked</c:if>>&nbsp; 
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>	
									<div class="bi-star-fill"></div>	
									<div class="bi-star-fill"></div>								
								</label>
								<p>&nbsp;&nbsp;</p>
								 <label class="d-flex small text-warning mb-2">
		                            <input type="radio" name="difficulty" value="5" <c:if test="${board.difficulty eq '5'}">checked</c:if>>&nbsp; 
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>	
									<div class="bi-star-fill"></div>	
									<div class="bi-star-fill"></div>	
									<div class="bi-star-fill"></div>							
								</label>
							</div>
                        </div>
                        
                        <div class="form-group">
                        <button data-oper='modify' class="btn btn-default" style='width: 25%; 
                             border: none; border-radius: 1rem; padding: 1.5%; background: darkblue; 
                             font-weight: 600; color: #fff; cursor: pointer'>
       										수정 완료
        				</button>
        				 <button type="submit" data-oper='remove' class="btn btn-danger" style='border-radius: 1rem'>
         							글 삭제
         				</button>
				        <button data-oper='list' class="btn btn-info" style='border-radius: 1rem; color:white'>
				        	<a href="/board/list" style='color:white'>리뷰 목록으로</a>
				        </button> 
                        </div>
                        
                    </div>
	                    <div class="col-md-6">
	                        <div class="form-group">
	                        	<label>&nbsp;내용</label>
	                            <textarea name='review' class="form-control" style="width: 100%; height: 150px;"><c:out value="${board.review }"/></textarea>
	                        </div>
	                    </div>
                </div>
        	</form>
      </div>      <!--  end panel-body -->
    </div>     <!--  end panel-body -->
  </div>   <!-- end panel -->
</div> <!-- /.row -->

<!--버튼 동작 설정 JS 
 이지훈 : 검색 처리를 위한 변수 추가 및 formObj에 변수 추가-->

<script type="text/javascript">
$(document).ready(function() {	
	
	  var formObj = $("form"); //폼할당	
	  
	  $('button').on("click", function(e){	
		  
	    e.preventDefault();  //기본동작 막기[기본이 submit]	    
	    var operation = $(this).data("oper");	    
	    console.log(operation); //내용 출력
	    
	    if(operation === 'remove'){
	      formObj.attr("action", "/board/remove");	      
	    }else if(operation === 'list'){
	      //move to list
	      formObj.attr("action","/board/list" ).attr("method","get");
	      
	      var pageNumTag = $("input[name='pageNum']").clone();
	      var amountTag = $("input[name='amount']").clone();
	      var keywordTag = $("input[name='keyword']").clone();
	      var typeTag = $("input[name='type']").clone();
	      
	      formObj.empty();
	      formObj.append(pageNumTag);
	      formObj.append(amountTag);
	      formObj.append(keywordTag);
	      formObj.append(typeTag);
	    }//end if	    
	    
	    formObj.submit(); //form 
	  });//end click
});//end ready
</script>


<%@include file="../includes/footer.jsp"%>
