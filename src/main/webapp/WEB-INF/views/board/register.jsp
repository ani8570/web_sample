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
    <h1 class="page-header">리뷰 작성</h1>
  </div>
  <!-- /.col-lg-12 -->
<!--</div>-->
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
	<div class="container contact-form">
 		<form role="form" action="/board/register" method="post">
 		  <h1>리뷰 작성</h1>
 		  <!-- 매장번호는 별도로 처리 필요 -->
 		  <input type="text" name="store_num" class="form-control"  value="" />
               <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                        	<label>&nbsp;글 제목</label>
                            <input type="text" name="title" class="form-control"  value="" />
                        </div>
                        <div class="form-group">
                         	<label>&nbsp;작성자</label>
                            <input type="text" name="writer" class="form-control" value="" />
                        </div>
                        <div class="form-group">
                        	 <label>&nbsp;난이도</label><br>

                        	 <div class="d-flex">
	                        	  <p>&nbsp;&nbsp;</p>
	                            <label class="d-flex small text-warning mb-2">
	                            	<input type="radio" name="difficulty" value="1">&nbsp; 
									<div class="bi-star-fill"></div>							
								</label>
								<p>&nbsp;&nbsp;</p>
	                            <label class="d-flex small text-warning mb-2">
		                            	<input type="radio" name="difficulty" value="2">&nbsp; 
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>							
								</label>
								<p>&nbsp;&nbsp;</p>
	                            <label class="d-flex small text-warning mb-2">
		                            <input type="radio" name="difficulty" value="3">&nbsp; 
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>							
								</label>
								
								<p>&nbsp;&nbsp;</p>
	                            <label class="d-flex small text-warning mb-2">
		                            <input type="radio" name="difficulty" value="4">&nbsp; 
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>	
									<div class="bi-star-fill"></div>	
									<div class="bi-star-fill"></div>								
								</label>
								<p>&nbsp;&nbsp;</p>
								 <label class="d-flex small text-warning mb-2">
		                            <input type="radio" name="difficulty" value="5">&nbsp; 
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>	
									<div class="bi-star-fill"></div>	
									<div class="bi-star-fill"></div>	
									<div class="bi-star-fill"></div>							
								</label>
							</div>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-default btnContact">작성 완료</button>
                             <button type="reset" class="btn btn-default" style='width: 37%; border: none; border-radius: 1rem; padding: 1.5%; background: darkblue; font-weight: 600; color: #fff; cursor: pointer'>작성 초기화</button>
                        </div>
                        
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                        	<label>&nbsp;내용</label>
                            <textarea name="review" class="form-control" style="width: 100%; height: 150px;"></textarea>
                        </div>
                        <div class="form-group">
                         	<label>&nbsp;비밀번호</label>
                            <input type="text" name="password" class="form-control" value="" />
                        </div>
                    </div>
                </div>
          </form>
		</div>
    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->
<%@include file="../includes/footer.jsp"%>
