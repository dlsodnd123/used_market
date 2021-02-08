<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가판대</title>
<style>
        .stand-top,
        .stand-middle{
            padding: 40px 100px 20px 100px;
        }
        .stand-top::after{
            content: '';
            clear: both;
            display: block;
        }
        .img-box{
            display:inline-block;
            width: 304px;
            height: 236px;
            float: left;
            padding-right: 20px;
        }
        .content-box{
            float: left;
        }
        .stand-title-box, .stand-introduce-box{
            display: block;
            margin-left: 20px;
        }
        .stand-introduce-box{
            margin-top: 15px;
        }
        .stand-title-box .btn,
        .stand-introduce-box .stand-btn-box>.btn{
            font-size: 13px;
            padding: 2px;
            margin-left: 5px;
        }
        .stand-introduce-box .stand-btn-box>.btn{
            margin-top: 10px;
        }
        .stand-introduce-box .stand-btn-box>a>.btn-primary{
            float: right;
            font-size: 15px;
        }
        .stand-title{
        	width: 250px;        	
        }
        .show-box>.stand-title{
        	font-size : 20px;
        	 font-weight: bold;
        }
        .stand-title, .stand-introduce{
            border: none;
            outline: none;
        }
        .stand-introduce{
            width: 450px;
            height: 152px;
        }
        .stand-introduce-box .confirm{
        	float: right;
            margin: 0;
            height: 152px;
            font-size: 16px;
            border-radius: 0;
            border-left: 1px solid #dae0e5;
        }
        .modify-box{
            display: inline-block;
            border: 1px solid #dae0e5;
        }
        .stand-title-box .modify-box .btn-box{
        	float: right;
        }
        .stand-title-box .modify-box .confirm,
        .stand-title-box .modify-box .cancel{
            margin: 0;
            float: left;
        }
        .stand-title-box .modify-box .cancel{
        	float: right;
        }
        .hidden{
        	display: none;
        }
    </style>
</head>
<body>
	<div class="container stand-top">
		<form action="<%=request.getContextPath()%>/stand" method="post" enctype="multipart/form-data">
	        <div class="img-box">
	            <img src="<%=request.getContextPath()%>/resources/stand_img/${stand.st_img}" class="rounded" alt="가판대 대표 이미지" width="304px" height="236px">
	        </div>
	        <div class="content-box">
	            <div class="stand-title-box">
	            	<div class="show-box">
		                <input type="text" class="stand-title" value="${stand.st_name}" readonly id="StandName">
		                <button type="button" class="btn btn-light">가판대명수정</button>
	                </div>
	                <div class="modify-box" style="display: none;">
		                <input type="text" class="stand-title modify" maxlength="15" value="${stand.st_name}">
		                <div class="btn-box">
			                <button type="button" class="btn btn-light confirm">확인</button>
			                <button type="button" class="btn btn-light cancel">취소</button>
		                </div>
	                </div>
	            </div>
	            <div class="stand-introduce-box">
	                <div class="show-box">
	                    <input type="text" class="stand-introduce" value="${stand.st_content}" readonly>
	                </div>
	                <div class="modify-box" style="display: none;">
	                    <input type="text" class="stand-introduce modify" value="${stand.st_content}">
	                    <button type="button" class="btn btn-light confirm">확인</button>
	                </div>
	                <div class="stand-btn-box">
	                    <button type="button" class="btn btn-light introduce-btn">가판대소개글수정</button>
	                    <button type="button" class="btn btn-light img-modify">가판대이미지수정</button>
	                    <input type="file" class="stand-img-upload" style="display: none;" name="file">
	                    <button type="sumbit" class="send-img-btn" style="display: none;">전송</button>
	                    <a href="<%=request.getContextPath()%>/product/register?name=${stand.st_name}"><button type="button" class="btn btn-primary">상품등록</button></a>
	                </div>
	            </div>
	        </div>
        </form>
    </div>
    <div class="container stand-middle">
       <!-- Nav tabs -->
       <ul class="nav nav-tabs" role="tablist">
         <li class="nav-item">
           <a class="nav-link active" data-toggle="tab" href="#home">판매목록</a>
         </li>
         <li class="nav-item">
           <a class="nav-link" data-toggle="tab" href="#menu1">상품관리</a>
         </li>
         <li class="nav-item">
           <a class="nav-link" data-toggle="tab" href="#menu2">거래후기</a>
         </li>
         <li class="nav-item">
           <a class="nav-link" data-toggle="tab" href="#menu3">문의사항</a>
         </li>
       </ul>
     
       <!-- Tab panes -->
       <div class="tab-content">
         <div id="home" class="container tab-pane active"><br>
           <h4>판매목록</h4>
           <div class="container">
           		<table class="table table-active table-hover">
                    <thead>
                        <tr>
                        	<th>상품번호</th>
                            <th>제목</th>
                            <th>카테고리</th>
                            <th>가격</th>
                            <th>거래방법</th>
                            <th>등록일</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${productList}" var="product">                
	                        <tr>
	                        	<td>${product.pd_num}</td>
	                            <td>${product.pd_title}</td>
	                            <td>${product.pd_category}</td>
	                            <td>${product.pd_price}</td>
	                            <td>${product.pd_deal}</td>
	                            <td>${product.pd_registerDate}</td>
	                            <td><a href="#"><button type="button" class="btn btn-light">관리</button></a></td>
	                        </tr>             
                        </c:forEach>
                    </tbody>
                </table>
            </div>
         </div>
         <div id="menu1" class="container tab-pane fade"><br>
           <h3>상품관리</h3>
           <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
         </div>
         <div id="menu2" class="container tab-pane fade"><br>
           <h3>거래후기</h3>
           <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
         </div>
         <div id="menu3" class="container tab-pane fade"><br>
           <h3>문의사항</h3>
           <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
         </div>
       </div>
     </div>
   <script type="text/javascript">
   	 	$('.stand-title-box>.show-box>.btn').click(function(){
	   		  $('.stand-title-box .show-box').hide();
	   		  $('.stand-title-box .modify-box').show();
   	  	})
   	  	$('.stand-title-box .modify-box .btn').click(function(){
		  	if($(this).text() == '취소'){
			  	$('.stand-title-box .modify-box').hide();
	       		$('.stand-title-box .show-box').show();
	       		return false;
	  		}
		  	var standName = $(this).parent().prev().val();
		  	if(standName == ''){
		  		alert('가판대명을 입력해주세요.')
				return false;
		  	}
	  		var data = {'standName' : standName}
   			$.ajax({
	  	        type:'post',
	  	        data:data,
	  	        url:'<%=request.getContextPath()%>/modify/standName',
	  	        success : function(data){
		        	if(data == 'overlap'){
		        		alert('사용중인 가판대명입니다.')
		        		return false;
		        	}else{
		        		$('.stand-title-box .modify-box').hide();
		        		$('.stand-title-box .show-box').show();
		        		$('.stand-title').val(standName);
		        	}
	   	        }
   	    	})
   	  	})
   	    $('.stand-introduce-box .stand-btn-box .introduce-btn').click(function(){
   	    	$('.stand-introduce-box .modify-box').show();
   	    	$('.stand-introduce-box .show-box').hide();
   	    })
   	    $('.stand-introduce-box .modify-box .confirm').click(function(){
   	    	var standIntroduce = $(this).prev().val();
   	    	var data = {'standIntroduce' : standIntroduce}; 
   	    	$.ajax({
	  	        type:'post',
	  	        data:data,
	  	        url:'<%=request.getContextPath()%>/modify/standIntroduce',
	  	        success : function(data){ 
	  	        	$('.stand-introduce-box .modify-box').hide();
	  	   	    	$('.stand-introduce-box .show-box').show();
	        		$('.stand-introduce').val(standIntroduce);
	   	        }
   	    	})
   	    })
   	    $('.img-modify').click(function(){
   	    	$('.stand-img-upload').click();
   	    })
   	    $('.stand-img-upload').change(function(){
   	    	$('.send-img-btn').click();
   	    })
   	    
  	</script>
</body>
</html>