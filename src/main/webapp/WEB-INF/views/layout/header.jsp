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
      padding: 30px;
      padding-bottom: 20px;
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
      border: 1px solid #17a2b8;
      padding: 5px 10px;
      width: 450px;
    }
    .search-box input{
      border: none;
      outline: none;
      padding-top: 3px;
    }
    .search-box .btn{
      color: #17a2b8;
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
	          <input type="text" placeholder="상품명, 지역명 입력">
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
		            <a class="nav-link" href="<%=request.getContextPath()%>/stand">내가판대</a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="#">채팅</a>
		          </li>
		
		          <li class="nav-item dropdown">
		            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
		              마이페이지
		            </a>
		            <div class="dropdown-menu">
		                <a class="dropdown-item" href="#">회원정보수정</a>
		                <a class="dropdown-item" href="#">구매/판매 내역</a>
		                <a class="dropdown-item" href="#">찜한상품</a>
		            </div>
		          </li>
	          </c:if>
	        </ul>
      		</nav>
    		</form>
  		</div>
	</div>
</body>