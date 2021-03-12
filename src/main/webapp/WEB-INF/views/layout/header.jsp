<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
    .line-box{
      border-bottom: 1px solid rgb(238, 238, 238);
    }
    .navbar{
      width: 100%;
      display: inline-block;
      padding: 30px 30px 0 30px
    }
    .form-inline{
      display: block; 
    }
    .navbar-brand{
      padding-right: 55px;
    }
    .navbar-nav{
      float: right;
    }
    .search-box{
      display: inline-block;
      border: 2px solid #5a93fa;
      padding: 5px 10px;
      width: 450px;
    }
    .search-box input{
      border: none;
      outline: none;
      padding-top: 3px;
    }
    .search-box .btn{
      color: #5a93fa;
      float: right;
    }
    ul>li, .dropdown-item{
      font-size: 12px;
    }
    .navbar-light .navbar-nav .nav-link {
      color: #505050;
    }
    .modal-body{
      text-align: center;
      margin-top: 25px;
    }
    .modal-body>div{
      margin-bottom: 25px;
    }
    .modal-body>div>a>.btn{
      width: 250px;
      height: 75px;
      font-size: 20px;
      font-weight: bold;
    }
    .barsMenu{
    	margin-top: 10px;
    	font-size: 24px;
    }
    .productCategory-box{
    	position: relative;
    }
    .productCategory-content-box{
    	position: absolute;
    	width: 200px;
    	height: 500px;
    	background-color: white;
    	z-index: 100;
    	margin-left: 30px;
    	font-size: 14px;
    	border: 1px solid #dae0e5;
    	box-shadow: 1px 1px 3px 0 rgb(0 0 0 / 12%);
    	display: none;
    }
    .productCategory-title{
    	font-weight: 700;
    	padding: 10px 20px;
    	margin-bottom: 10px;
    	border-bottom: 1px solid #dae0e5;    	
    }
    .productCategory-content{
    	padding: 5px 15px;
    	cursor: pointer;   
    }
    .productCategory-content:hover{
    	background-color: #dee2e6;
    }
    .fa-bars{
    	cursor: pointer;
    }
    .productCategory-content-box>.productCategory-content>a{
    	text-decoration: none;
    	color: black;
    	display: block;
    }
}	
  </style>
</head>
<body>
	<div class="line-box">
		<div class="container">
    		<form class="form-inline" action="#">
      		<nav class="navbar navbar-expand-sm navbar-light">
        	<!-- Brand -->
        	<a class="navbar-brand" href="<%=request.getContextPath()%>/"><img width="125px" src="<%=request.getContextPath()%>/resources/img/중고시장_로고.jpg" alt=""></a>

	        <div class="search-box">
	          <input type="text" placeholder="상품명, 검색할 내용 입력">
	          <button class="btn btn-basic" type="submit"><i class="fas fa-search"></i></button>
	        </div>

	        <ul class="navbar-nav">
	          <li class="nav-item">
	          	  <c:if test="${member == null}">
	             	 <a class="nav-link" href="#" data-toggle="modal" data-target="#myModal">회원가입</a>
	              </c:if>
	                <!-- The Modal -->
	               <div class="container">
	                 <div class="modal fade" id="myModal">
	                   <div class="modal-dialog modal-dialog-centered">
	                     <div class="modal-content">
	                      
	                        <!-- Modal Header -->
	                       <div class="modal-header">
	                         <h4 class="modal-title">중고시장 회원가입</h4>
	                         <button type="button" class="close" data-dismiss="modal">&times;</button>
	                       </div>
	                        
	                        <!-- Modal body -->
	                       <div class="modal-body">
	                         <div><a href="<%=request.getContextPath()%>/termsOfService"><button type="button" class="btn btn-outline-secondary">일반회원가입</button></a></div>
	                         <div><a href="#"><button type="button" class="btn btn-outline-warning">카카오로 가입하기</button></a></div>
	                         <div><a href="#"><button type="button" class="btn btn-outline-success">네이버로 가입하기</button></a></div>
	                       </div>
	                        
	                       <!-- Modal footer -->
	                       <div class="modal-footer">
	                       </div>
	                        
	                     </div>
	                   </div>
	                 </div>
	               </div>
	           </li>
	          <c:if test="${member == null}">
		          <li class="nav-item">
		            <a class="nav-link" href="<%=request.getContextPath()%>/login">로그인</a>
		          </li>
	          </c:if>
	          <c:if test="${member != null }">
		          <li class="nav-item">
		            <a class="nav-link" href="<%=request.getContextPath()%>/logout">로그아웃</a>
		          </li>
	          
		          <li class="nav-item">
		            <a class="nav-link" href="<%=request.getContextPath()%>/stand?mb_id=${member.mb_id}#home">내가판대</a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="#">채팅</a>
		          </li>
		
		          <li class="nav-item dropdown">
		            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
		              마이페이지
		            </a>
		            <div class="dropdown-menu">
		                <a class="dropdown-item" href="<%=request.getContextPath()%>/memberConfirm">회원정보수정</a>
		                <a class="dropdown-item" href="<%=request.getContextPath()%>/stand?mb_id=${member.mb_id}#menu2">찜한상품</a>
		                <a class="dropdown-item" href="<%=request.getContextPath()%>/withdrawal">회원탈퇴</a>
		            </div>
		          </li>
	          </c:if>
	        </ul>
    		<div class="barsMenu"><i class="fas fa-bars"></i></div>
      		</nav>
    		</form>
  		</div>
	</div>
	<div class="container productCategory-box">
		<div class="productCategory-content-box">
			<div class="productCategory-title">전체카테고리</div>
			<div class="productCategory-content"><a href="<%=request.getContextPath()%>/product/category?pd_category=여성의류&page=1&order=date">여성의류</a></div>
			<div class="productCategory-content"><a href="<%=request.getContextPath()%>/product/category?pd_category=남성의류&page=1&order=date">남성의류</a></div>
			<div class="productCategory-content"><a href="<%=request.getContextPath()%>/product/category?pd_category=패션잡화&page=1&order=date">패션잡화</a></div>
			<div class="productCategory-content"><a href="<%=request.getContextPath()%>/product/category?pd_category=뷰티/미용&page=1&order=date">뷰티/미용</a></div>
			<div class="productCategory-content"><a href="<%=request.getContextPath()%>/product/category?pd_category=키즈&page=1&order=date">키즈</a></div>
			<div class="productCategory-content"><a href="<%=request.getContextPath()%>/product/category?pd_category=가전&page=1&order=date">가전</a></div>
			<div class="productCategory-content"><a href="<%=request.getContextPath()%>/product/category?pd_category=가구/인테리어&page=1&order=date">가구/인테리어</a></div>
			<div class="productCategory-content"><a href="<%=request.getContextPath()%>/product/category?pd_category=생활용품&page=1&order=date">생활용품</a></div>
			<div class="productCategory-content"><a href="<%=request.getContextPath()%>/product/category?pd_category=스포츠&page=1&order=date">스포츠</a></div>
			<div class="productCategory-content"><a href="<%=request.getContextPath()%>/product/category?pd_category=문화(도서,티켓 등)&page=1&order=date">문화(도서,티켓 등)</a></div>
			<div class="productCategory-content"><a href="<%=request.getContextPath()%>/product/category?pd_category=차량/오토바이&page=1&order=date">차량/오토바이</a></div>
			<div class="productCategory-content"><a href="<%=request.getContextPath()%>/product/category?pd_category=기타&page=1&order=date">기타</a></div>
			<div class="productCategory-content"><a href="<%=request.getContextPath()%>/product/category?pd_category=무료나눔&page=1&order=date">무료나눔</a></div>
		</div>
	</div>
<script>
	// 햄버거 메뉴에 마우스를 올리면 카테고리 박스 보여주기 및 숨기기
	$('.fa-bars').click(function(){
		$('.productCategory-content-box').toggle();		
	})	
</script>
</body>