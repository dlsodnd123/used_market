<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내용수정</title>
<style>
        .pd-line{
            border-bottom: 1px solid #dae0e5;
            padding: 35px 0;
            font-size: 17px;
        }
        .top{
        	padding: 35px 0 10px 0;
        	border-bottom: 1px solid black;
        }
        .pd-line::after{
            content: '';
            clear: both;
            display: block;
        }
        select.form-control[multiple], select.form-control[size] {
            height: 200px;
        }
        ul, li{
            list-style: none;
        }
        .pd-img-box{
            margin-left: 30px;
            padding: 0;
        }
        .pd-img-content{
            width: 240px;
            height: 240px;
            margin-right: 20px;
            display: inline-block;
            text-align: center;
            border: 1px solid  #dae0e5;
        }
        .pd-img-box>li{
            float: left;
        }
        .pd-img-content{
        	position: relative;
        }
        .pd-img-content .fa-images{
            font-size: 45px;
            display: block;
            cursor: pointer;
            padding-top: 50px;
        }
        .deleteImg{
        	font-size: 18px;
        	position: absolute;
        	right: 10px;
        	top: 10px;
        	opacity: 0.7;
        	cursor: pointer;
        	z-index: 1;
        }
        .pd_price{
            display: inline-block;
            margin-right: 15px;
        }
        .register-btn{
            margin: 30px 0 70px 0;
            padding: 30px;
            font-size: 25px;
        }
        label.error{
            color: red;
            display: none;
        }
        .previewImg>img{
        	width: 240px;
            height: 240px;
        }
    </style>
</head>
<body>
    <div class="container">
    	<div class="container top">
    		<h3>내용수정</h3>
    	</div>
        <form action="<%=request.getContextPath()%>/product/modify" method="post" enctype="multipart/form-data">
          <div class="form-group pd-line">
            <h4>제목(필수)</h4> <br>
            <input type="text" class="form-control col-8" id="pd_title" name="pd_title" placeholder="최대 25자까지 가능합니다." maxlength="24" value="${product.pd_title}">
          </div>
          <div class="form-group pd-line">
            <h4>카테고리(필수)</h4> <br>
            <label for="pd_category" class="error" id="pd_category-error"></label>
            <select multiple class="form-control col-8 category" id="pd_category" name="pd_category">
                <option value="여성의류" <c:if test="${product.pd_category == '여성의류'}">selected</c:if>>여성의류</option>
                <option value="남성의류" <c:if test="${product.pd_category == '남성의류'}">selected</c:if>>남성의류</option>
                <option value="패션잡화" <c:if test="${product.pd_category == '패션잡화'}">selected</c:if>>패션잡화</option>
                <option value="뷰티/미용" <c:if test="${product.pd_category == '뷰티/미용'}">selected</c:if>>뷰티/미용</option>
                <option value="키즈" <c:if test="${product.pd_category == '키즈'}">selected</c:if>>키즈</option>
                <option value="가전" <c:if test="${product.pd_category == '가전'}">selected</c:if>>가전</option>
                <option value="가구/인테리어" <c:if test="${product.pd_category == '가구/인테리어'}">selected</c:if>>가구/인테리어</option>
                <option value="생활용품" <c:if test="${product.pd_category == '생활용품'}">selected</c:if>>생활용품</option>
                <option value="스포츠" <c:if test="${product.pd_category == '스포츠'}">selected</c:if>>스포츠</option>
                <option value="문화" <c:if test="${product.pd_category == '문화'}">selected</c:if>>문화</option>
                <option value="차량/오토바이" <c:if test="${product.pd_category == '차량/오토바이'}">selected</c:if>>차량/오토바이</option>
                <option value="무료나눔" <c:if test="${product.pd_category == '무료나눔'}">selected</c:if>>무료나눔</option>
            </select>
          </div>
          <div class="form-group pd-line">
            <h4>상품이미지(필수)</h4> <br>
            <label for="pdimg_name" class="error" id="pdimg_name-error"></label>
              <ul class="pd-img-box">
                  <li class="pd-img-content">
                    <i class="far fa-images uploadpdimg"></i>이미지등록
                  </li>
              </ul>
          </div>
          <div class="form-group pd-line">
            <h4>거래방법(필수)</h4> <br>
            <label for="pd_deal" class="error" id="pd_deal-error"></label>
            <div class="form-check-inline">
                <label class="form-check-label" for="radio1">
                  <input type="radio" class="form-check-input" id="radio1" name="pd_deal" value="택배" <c:if test="${product.pd_deal == '택배'}">checked</c:if>>택배
                </label>
              </div>
              <div class="form-check-inline">
                <label class="form-check-label" for="radio2">
                  <input type="radio" class="form-check-input" id="radio2" name="pd_deal" value="직거래" <c:if test="${product.pd_deal == '직거래'}">checked</c:if>>직거래
                </label>
              </div>
          </div>
          <div class="form-group pd-line">
            <h4>상품내용</h4> <br>
            <textarea class="form-control col-8" rows="8" id="pd_content" name="pd_content">${product.pd_content}</textarea>
          </div>
          <div class="form-group pd-line">
              <h4>상품가격(필수)</h4> <br>
              <label for="pd_price" class="error" id="pd_price-error"></label> <br>
            <input type="text" class="form-control col-6 pd_price" id="pd_price" name="pd_price" value="${product.pd_price}">원 
          </div>
          <button type="submit" class="btn btn-primary register-btn col-2">수정하기</button>
          <input type="hidden" name="pd_num" value="${product.pd_num}">
        </form>
    </div>
<script>
    $('form').validate({
        rules : {
            pd_category : {
                required : true
            },
            pdimg_name : {
                required : true
            },
            pd_deal : {
                required : true
            },
            pd_price : {
                required : true
            }
        },
        messages : {
            pd_category : {
                required : '필수 선택 사항입니다.'
            },
            pdimg_name : {
                required : '필수 입력 사항입니다.'
            },
            pd_deal : {
                required : '필수 선택 사항입니다.'
            },
            pd_price : {
                required : '필수 입력 사항입니다.'
            }
        }
    })
    $.validator.addMethod('regex',function(value, elemnt, regexp){
        var re = new RegExp(regexp);
        return this.optional(elemnt) || re.test(value);
    })
    $('.uploadpdimg').click(function(){
    	// 숨겨져 있는 이미지 파일 첨부박스 있는 확인
    	var fileCheck = $('.pd-img-file').last().val()
    	// 숨겨져 있는 이미지 파일이 없으면 새로운 이미지 파일 첨부박스를 생성
    	if(fileCheck != ''){
    		$('.pd-img-box').append('<li class="pd-img-content">');
    		$('.pd-img-content').last().append('<i class="fas fa-times deleteImg"></i>')
	    	$('.pd-img-content').last().append('<input type="file" name="imgFileList" id="pdimg_name" class="pd-img-file" onchange="previewImg(event);" style="display: none;">');
	    	$('.pd-img-content').last().append('<div class="previewImg"></div>');
	    	$('.pd-img-box').append('</li>');
    	}
        $('.pd-img-file').last().click();
        $('.pd-img-content').last().hide();
        $('.pd-img-file').last().change(function(){
        	$('.pd-img-content').last().show();
    	})
    	// 첨부한 이미지 box 오른쪽 상단 X 클릭시 이미지 box삭제
	    $('.deleteImg').click(function(){
	    	$(this).parent().remove();
	    })
    })
    
       
    function previewImg(event) { 
    	var reader = new FileReader(); 
    	
    	reader.onload = function(event) { 
    		var img = document.createElement("img"); 
    		img.setAttribute("src", event.target.result); 
    		document.querySelector(".pd-img-content:last-child .previewImg").appendChild(img);
    	};
    	reader.readAsDataURL(event.target.files[0]);
    }
</script>
</body>
</html>