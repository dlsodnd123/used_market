<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
<style>
        .pd-line{
            border-bottom: 1px solid #dae0e5;
            padding: 25px 0;
            font-size: 17px;
        }
        .pd-line{
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
            margin-bottom: 20px;
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
        .product-register-error{
        	margin: 30px 25px;
        }
        .register-error-message{
        	font-size: 25px;
        	margin-bottom: 20px;
        	font-weight: 700;
        }
        .register-move-main,
        .register-move-login{
        	font-size: 18px;
        }
    </style>
</head>
<body>
	<c:if test="${member != null}">
	    <div class="container">
	        <form action="<%=request.getContextPath()%>/product/register" method="post" enctype="multipart/form-data">
	          <div class="form-group pd-line">
	            <h4>제목(필수)</h4>
	            <input type="text" class="form-control col-8" id="pd_title" name="pd_title" placeholder="최대 25자까지 가능합니다." maxlength="24">
	          </div>
	          <div class="form-group pd-line">
	            <h4>카테고리(필수)</h4>
	            <label for="pd_category" class="error" id="pd_category-error"></label>
	            <select multiple class="form-control col-8 category" id="pd_category" name="pd_category">
	                <option value="여성의류">여성의류</option>
	                <option value="남성의류">남성의류</option>
	                <option value="패션잡화">패션잡화</option>
	                <option value="뷰티/미용">뷰티/미용</option>
	                <option value="키즈">키즈</option>
	                <option value="가전">가전</option>
	                <option value="가구/인테리어">가구/인테리어</option>
	                <option value="생활용품">생활용품</option>
	                <option value="스포츠">스포츠</option>
	                <option value="문화">문화</option>
	                <option value="차량/오토바이">차량/오토바이</option>
	                <option value="기타">기타</option>
	                <option value="무료나눔">무료나눔</option>
	            </select>
	          </div>
	          <div class="form-group pd-line">
	            <h4>상품이미지(필수)</h4>
	            <label for="pdimg_name" class="error" id="pdimg_name-error"></label>
	              <ul class="pd-img-box">
	                  <li class="pd-img-content">
	                    <i class="far fa-images uploadpdimg"></i>이미지등록
	                  </li>
	              </ul>
	          </div>
	          <div class="form-group pd-line">
	            <h4>거래방법(필수)</h4>
	            <label for="pd_deal" class="error" id="pd_deal-error"></label>
	            <div class="form-check-inline">
	                <label class="form-check-label" for="radio1">
	                  <input type="radio" class="form-check-input" id="radio1" name="pd_deal" value="택배">택배
	                </label>
	              </div>
	              <div class="form-check-inline">
	                <label class="form-check-label" for="radio2">
	                  <input type="radio" class="form-check-input" id="radio2" name="pd_deal" value="직거래">직거래
	                </label>
	              </div>
	          </div>
	          <div class="form-group pd-line">
	          	<h4>거래지역(필수)</h4>
	          	<label for="pd_area" class="error" id="pd_area-error"></label>
	          	<input type="text" class="form-control col-8" id="pd_area" placeholder="상세주소는 빼고 입력해주세요.(ex. 충북 청주시 상당구)" name="pd_area" maxlength="24">          	
	          </div>
	          <div class="form-group pd-line">
	            <h4>상품내용</h4>
	            <textarea class="form-control col-8" rows="8" id="pd_content" name="pd_content"></textarea>
	          </div>
	          <div class="form-group pd-line">
	              <h4>상품가격(필수)</h4>
	              <label for="pd_price" class="error" id="pd_price-error"></label> <br>
	            <input type="text" class="form-control col-6 pd_price" id="pd_price" name="pd_price">원 
	          </div>
	          <button type="submit" class="btn btn-primary register-btn col-2">등록하기</button>
	          <input type="hidden" name="pd_mb_id" value="${member.mb_id}">
	        </form>
	    </div>
    </c:if>
    <c:if test="${member == null}">
    	<div class="container product-register-error">
	    	<div class="register-error-message"><i class="fas fa-exclamation-triangle"></i> 잘못된 접근 방식입니다.</div>
	    	<a href="<%=request.getContextPath()%>/"><button type="button" class="btn btn-primary register-move-main">메인페이지로</button></a>
	    	<a href="<%=request.getContextPath()%>/login"><button type="button" class="btn btn-primary register-move-login">로그인</button></a>
    	</div>
    </c:if>
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
            pd_area : {
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
            pd_area : {
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
    // 택배를 선택했을때 거래지역에 택배로 입력되고 readonly 적용시키키
       $('.form-check-label').click(function(){
    	   var checkDeal = $(this).find('input[name=pd_deal]').val();    	  
    	   if(checkDeal == '택배'){
    		   $(this).parents('.form-group').next().find('input[name=pd_area]').val('전국');
    		   $(this).parents('.form-group').next().find('input[name=pd_area]').attr('readonly', 'true');
    	   }else{
    		   $(this).parents('.form-group').next().find('input[name=pd_area]').val('');
    		   $(this).parents('.form-group').next().find('input[name=pd_area]').removeAttr('readonly');
    	   }
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