<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>클라이밍 리뷰 커뮤니티</title>
        
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/styles.css" rel="stylesheet" />
        <link href="/resources/css/style2.css" rel="stylesheet" />
        <link href="/resources/css/style3.css" rel="stylesheet" />
        

	    <!-- DataTables CSS -->
	    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">
	
	    <!-- DataTables Responsive CSS -->
	    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

		
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#!" style='font-weight: bolder'>🌄 Hola Hola!
                </a>
                <!--<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                	<div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">All Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                                <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                    </form>
                </div>-->
                
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder" style='text-shadow:2px 2px 2px #000; color: white'>Climbing experience</h1>
                    <!--<p class="lead fw-normal text-white-50 mb-0">review list</p>-->
                    <section class="newsletter">
					<div class="container">
					<div class="row">
						<div class="content">
						<div class="input-group">
							<form id='searchForm' class='d-flex input-group' action="/board/list" method='get'>  
									<select name='type' class="search-btn">
											<option value="TDWR"<c:out value= "${pageMaker.pageVO.type eq 'TDWR'?'selected':''}"/> />전 체</option>
											<option value="T"<c:out value="${pageMaker.pageVO.type eq 'T'?'selected':''}"/> />제 목</option>
											<option value="D"<c:out value="${pageMaker.pageVO.type eq 'D'?'selected':''}"/> />난이도</option>
											<option value="W"<c:out value="${pageMaker.pageVO.type eq 'W'?'selected':''}"/> />작성자</option>
											<option value="R"<c:out value="${pageMaker.pageVO.type eq 'R'?'selected':''}"/> />내 용</option>
										</select>
										<!--end select  -->
										<input type="text" name='keyword' class="form-control"
											placeholder="Q. 검색어를 입력하세요" /> <input type="hidden"
											name='pageNum' value='<c:out value="${pageMaker.pageVO.pageNum}"/>' />
										<input type="hidden" name='pageNum' value='<c:out value="${pageMaker.pageVO.pageNum}"/>' /> 
										<input type="hidden" name='amount' value='<c:out value="${pageMaker.pageVO.amount}"/>' />
										<span class="input-group-btn">
											<button class="search-btn" type="submit">&nbsp;&nbsp;검
												색&nbsp;&nbsp;</button>
										</span>
									</form>
					          </div>
						</div>
					</div>
					
					</div>
</section>
                </div>
            </div>
        </header>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
            	
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
       