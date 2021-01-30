<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고시장-회원가입</title>
<style>
        *{
            padding: 0;
            margin: 0;
        }
        body{
            background-color: rgb(243,243,243);
        }
        .container{
            padding-top: 20px;
            min-width: 1140px;
            margin: 0 auto;
        }
        .logo>img{
            margin-bottom: 20px;  
        }
        .address{
            display: inline-block;
            margin-bottom: 5px;
        }
        .form-group:last-child{
            margin-bottom: 30px;
        }
        .form-group:nth-child(6){
            margin-bottom: 25px;
        }
        h5{
            font-weight: bold;
        }
        label.error{
            color: red;
            display: none;
        }
        .check{
            display: inline-block;
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="<%=request.getContextPath()%>/" class="logo"><img width="200px" src="<%=request.getContextPath()%>/resources/img/중고시장_로고.jpg" alt=""></a>
        <form action="<%=request.getContextPath()%>/signup" class="container" method="post">
            <div class="form-group">
                <h5>아이디</h5>
                <div>
                    <input type="text" class="form-control col-6 check" id="id" name="mb_id">
                    <button class="btn btn-info col-2 check" id="id-check-btn" type="button">아이디 중복검사</button>
                </div>
                <label for="id" class="error" id="id-error"></label>
            </div>
            <div class="form-group">
                <h5>비밀번호</h5>
                <input type="password" class="form-control col-8" id="pw" name="mb_pw">
                <label for="pw" class="error" id="pw-error"></label>
            </div>
            <div class="form-group">
                <h5>비밀번호확인</h5>
                <input type="password" class="form-control col-8" id="pw2" name="mb_pw2">
                <label for="pw2" class="error" id="pw2-error"></label>
            </div>
            <div class="form-group">
                <h5>이름</h5>
                <input type="text" class="form-control col-8" id="name" name="mb_name">
                <label for="name" class="error" id="name-error"></label>
            </div>
            <div class="form-group">
                <h5>성별</h5>
                <select class="form-control col-8" id="gender" name="mb_gender">
                    <option value="남">남자</option>
                    <option value="여">여자</option>
                </select>
                <label for="gender" class="error" id="gender-error"></label>
            </div>
            <div class="form-group">
                <h5>주소(선택)</h5>
                <input type="text"  class="form-control col-3 address" id="sample4_postcode" placeholder="우편번호" name="mb_postcode">
                <input type="button" class="btn btn-secondary col-2 address" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
                <input type="text" class="form-control col-8" id="sample4_roadAddress" placeholder="도로명주소" name="mb_roadAddress" style="margin-bottom: 5px;">
                <input type="text" class="form-control col-8" id="sample4_jibunAddress" placeholder="지번주소" name="mb_jibunAddress" style="margin-bottom: 5px;">
                <span id="guide" style="color:#999;display:none"></span>
                <input type="text" class="form-control col-3 address" id="sample4_detailAddress" placeholder="상세주소" name="mb_detailAddress">
                <input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
            </div>
            <div class="form-group">
                <h5>연락처</h5>
                <input type="number" class="form-control col-8" id="phone" name="mb_phone" placeholder="'-' 빼고 입력">
                <label for="phone" class="error" id="phone-error"></label>
            </div>
            <div class="form-group">
                <h5>이메일(선택)</h5>
                <input type="email" class="form-control col-8" id="email" name="mb_email">
                <label for="email" class="error" id="email-error"></label>
            </div>
            <input type="hidden" name="mb_division" value="normal">
            <div class="form-group">
                <button class="btn btn-success col-8">회원가입</button>
            </div>
        </form>
    </div>
    <script>
        $(function(){
        	var idCheck = false;
        	$('#id-check-btn').click(function(){
        		var id = $('input[name=mb_id]').val()
        		if(id == ''){
        			alert('아이디를 입력해주세요');
        			return false;
        		}
        		var data = {'id' : id}
        		$.ajax({
        	        type:'post',
        	        data:data,
        	        url:'<%=request.getContextPath()%>/check/id',
        	        success : function(data){
        	          	if(data == 'possible'){
        	          		alert('사용가능한 아이디 입니다.');
        	          		idCheck = true;        	      
        	          	}else{
        	          		alert('사용중인 아이디 입니다.');
        	          		idCheck = false;
        	          	}      	          			
        	        }
        	    })
        	})
        	$('input[name=id]').change(function(){
        		console.log(idCheck);
        	})
        	$('form').submit(function(){
        		if(!idCheck){
        			alert('아이디 중복검사를 해주세요');
        			return false;
        		}
        	})
            $('form').validate({
                rules : {
                	mb_id : {
                        required : true,
                        regex : /^[a-z0-9]{8,15}$/
                    },
                    mb_pw : {
                        required : true,
                        regex : /^[a-zA-Z0-9]{8,}$/
                    },
                    mb_pw2 : {
                        required : true,
                        equalTo : pw
                    },
                    mb_name : {
                        required : true,
                    },
                    mb_phone : {
                        required : true
                    },
                    mb_email : {
                        email : true
                    }
                },
                messages : {
                	mb_id : {
                        required : '필수 입력사항 입니다.',
                        regex : '8~15자의 영문 소문자, 숫자만 사용 가능합니다.'
                    },
                    mb_pw : {
                        required : '필수 입력사항 입니다.',
                        regex : '8자이상 영문 소문자, 영문 대문자, 숫자만 사용 가능합니다.'
                    },
                    mb_pw2 : {
                        required : '필수 입력사항 입니다.',
                        equalTo : '비밀번호가 일치하지 않습니다.'
                    },
                    mb_name : {
                        required : '필수 입력사항 입니다.'
                    },
                    mb_phone : {
                        required : '필수 입력사항 입니다.',
                        digits : '숫자만 입력 가능합니다.'
                    },
                    mb_email : {
                        email : '이메일 형식에 맞지 않습니다.'
                    }
                }
            })
            $.validator.addMethod('regex',function(value, elemnt, regexp){
                var re = new RegExp(regexp);
                return this.optional(elemnt) || re.test(value);
            })
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