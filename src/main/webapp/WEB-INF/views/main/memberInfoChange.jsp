<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.address{
    	display: inline-block;
    	margin-bottom: 5px;
    }
    label.error{
        color: red;
        display: none;
    }
    .memberInfoChange-box{
    	padding-top: 125px;
    }
    .memberInfoChange-title{
    	font-size: 25px;
		font-weight: 700;
		border-bottom: 2px solid #5a93fa;
		padding: 10px 0;
		margin-bottom: 10px;
    }
    .mb-infoChange-btn,
    .mb-infoChangeCancel-btn{
    	font-size: 18px;
    	padding: 10px 25px;
    }
</style>
</head>
<body>
	<div class="container memberInfoChange-box">
        <form action="<%=request.getContextPath()%>/memberInfoChange" class="container" method="post" id="form">
        	<div class="memberInfoChange-title">회원정보수정</div>
            <div class="form-group">         
                <h6>아이디</h6>
                <div>
                    <input type="text" class="form-control col-6 check" id="id" name="mb_id" readonly value="${member.mb_id}">
                </div>
            </div>
            <div class="form-group">
                <h6>비밀번호(변경하는 경우에만 입력)</h6>
                <input type="password" class="form-control col-8" id="pw" name="mb_pw">
                <label for="pw" class="error" id="pw-error"></label>
            </div>
            <div class="form-group">
                <h6>비밀번호확인</h6>
                <input type="password" class="form-control col-8" id="pw2" name="mb_pw2">
                <label for="pw2" class="error" id="pw2-error"></label>
            </div>
            <div class="form-group">
                <h6>이름</h6>
                <input type="text" class="form-control col-8" id="name" name="mb_name" readonly value="${member.mb_name}">
            </div>
            <div class="form-group">
                <h6>성별</h6>
                <input type="text" class="form-control col-1" id="mb_gender" name="mb_gender" readonly value="${member.mb_gender}">
            </div>
            <div class="form-group">
                <h6>주소(선택)</h6>
                <input type="text"  class="form-control col-3 address" id="sample4_postcode" placeholder="우편번호" name="mb_postcode" value="${member.mb_postcode}">
                <input type="button" class="btn btn-secondary col-2 address" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
                <input type="text" class="form-control col-8" id="sample4_roadAddress" placeholder="도로명주소" name="mb_roadAddress" style="margin-bottom: 5px;" value="${member.mb_roadAddress}">
                <input type="text" class="form-control col-8" id="sample4_jibunAddress" placeholder="지번주소" name="mb_jibunAddress" style="margin-bottom: 5px;" value="${member.mb_jibunAddress}">
                <span id="guide" style="color:#999;display:none"></span>
                <input type="text" class="form-control col-3 address" id="sample4_detailAddress" placeholder="상세주소" name="mb_detailAddress" value="${member.mb_detailAddress}">
                <input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
            </div>
            <div class="form-group">
                <h6>연락처</h6>
                <input type="text" class="form-control col-8" id="phone" name="mb_phone" placeholder="'-' 빼고 입력" value="${member.mb_phone}">
                <label for="phone" class="error" id="phone-error"></label>
            </div>
            <div class="form-group">
                <h6>이메일(선택)</h6>
                <input type="email" class="form-control col-8" id="email" name="mb_email" value="${member.mb_email}">
                <label for="email" class="error" id="email-error"></label>
            </div>
            <div class="form-group">
            	<button type="submit" class="btn btn-success mb-infoChange-btn">수정</button>
            	<button type="button" class="btn btn-secondary mb-infoChangeCancel-btn">취소</button>
            </div>
        </form>
    </div>
<script type="text/javascript">
	// 취소 버튼 클릭시
	$('.mb-infoChangeCancel-btn').click(function(){
		location.href = '<%=request.getContextPath()%>/'
	})
	$(function(){		
		$('#form').validate({
		    rules : {
		        mb_pw : {
		            regex : /^[a-zA-Z0-9]{8,}$/
		        },
		        mb_pw2 : {
                    equalTo : pw
                },
                mb_phone : {
                    required : true,
                    regex : /^[0-9]*$/
                },
		        mb_email : {
		            email : true
		        }
		    },
		    messages : {
		        mb_pw : {
		            required : '필수 입력사항 입니다.',
		            regex : '8자이상 영문 소문자, 영문 대문자, 숫자만 사용 가능합니다.'
		        },
		        mb_pw2 : {
		            required : '필수 입력사항 입니다.',
		            equalTo : '비밀번호가 일치하지 않습니다.'
		        },
		        mb_phone : {
                    required : '필수 입력사항 입니다.',
                    regex : '숫자만 입력 가능합니다.'
                },
		        mb_email : {
		            email : '이메일 형식에 맞지 않습니다.'
		        }
		    }	   
		})
		
	})
	$.validator.addMethod('regex',function(value, elemnt, regexp){
			var re = new RegExp(regexp);
			return this.optional(elemnt) || re.test(value);
		})
	function sample4_execDaumPostcode() {			
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
</body>
</html>