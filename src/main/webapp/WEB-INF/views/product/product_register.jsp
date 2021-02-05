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
            padding: 35px 0;
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
            margin-right: 25px;
            display: inline-block;
            text-align: center;
            padding-top: 50px;
            border: 1px solid  #dae0e5;
            cursor: pointer;
        }
        .pd-img-box>li{
            float: left;
        }
        .pd-img-content .fa-images{
            font-size: 45px;
            display: block;
        }
        .pd_price{
            display: inline-block;
            margin-right: 15px;
        }
        .register-btn{
            float: right;
            margin: 0 50px 70px 0;
            padding: 20px;
            font-size: 20px;
        }
        label.error{
            color: red;
            display: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <form action="<%=request.getContextPath()%>/product/register" method="post">
          <div class="form-group pd-line">
            <h4>제목(필수)</h4> <br>
            <input type="text" class="form-control col-8" id="pd_title" name="pd_title" placeholder="최대 25자까지 가능합니다." maxlength="24">
          </div>
          <div class="form-group pd-line">
            <h4>카테고리(필수)</h4> <br>
            <label for="pd_category" class="error" id="pd_category-error"></label>
            <select multiple class="form-control col-8 category" id="pd_category" name="pd_category">
                <option>여성의류</option>
                <option>남성의류</option>
                <option>패션잡화</option>
                <option>뷰티/미용</option>
                <option>키즈</option>
                <option>가전</option>
                <option>가구/인테리어</option>
                <option>생활용품</option>
                <option>스포츠</option>
                <option>문화</option>
                <option>차량/오토바이</option>
                <option>무료나눔</option>
            </select>
          </div>
          <div class="form-group pd-line">
            <h4>상품이미지(필수)</h4> <br>
            <label for="pdimg_name" class="error" id="pdimg_name-error"></label>
              <ul class="pd-img-box">
                  <li class="pd-img-content">
                    <i class="far fa-images uploadpdimg"></i>이미지등록
                    <input type="file" name="pdimg_name" id="pdimg_name" class="pd-img-file" style="display: none;">
                    <button type="submit" class="send-pdimg-btn" style="display: none;">전송</button>
                  </li>
              </ul>
          </div>
          <div class="form-group pd-line">
            <h4>거래방법(필수)</h4> <br>
            <label for="pd_deal" class="error" id="pd_deal-error"></label>
            <div class="form-check-inline">
                <label class="form-check-label" for="radio1">
                  <input type="radio" class="form-check-input" id="radio1" name="pd_deal" value="택배" checked>택배
                </label>
              </div>
              <div class="form-check-inline">
                <label class="form-check-label" for="radio2">
                  <input type="radio" class="form-check-input" id="radio2" name="pd_deal" value="직거래">직거래
                </label>
              </div>
          </div>
          <div class="form-group pd-line">
            <h4>상품내용</h4> <br>
            <textarea class="form-control col-8" rows="8" id="pd_content" name="pd_content"></textarea>
          </div>
          <div class="form-group pd-line">
              <h4>상품가격(필수)</h4> <br>
              <label for="pd_price" class="error" id="pd_price-error"></label> <br>
            <input type="text" class="form-control col-6 pd_price" id="pd_price" name="pd_price">원 
          </div>
          <button type="submit" class="btn btn-primary register-btn col-2">등록하기</button>
          <input type="hidden" name="pd_st_name" value="${name}">
          <input type="hidden" name="pd_mb_id" value="${member.mb_id}">
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
        $('.pd-img-file').click();
    })
</script>
</body>
</html>