<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정 비밀번호 확인</title>
<style>
	.memberPwCheck-box{
		text-align: center;
	}
	.title{
		border-bottom: 1px solid #dae0e5;
		padding: 10px 0;
	}
	.memberPwCheck-box{
		font-size: 13px;
		padding: 155px 25px 35px 25px;
	}
	.memberPwCheck-box::after{
		content: '';
		clear: both;
		display: block;
	}
	.mb_pw{
		margin: 8px 0 8px 6px;
		padding: 4px;
	}
	.memberPwCheck-contnet{
		font-size: 11px;
	}
	.memberPwCheck-con-btn{
		font-size: 13px;
		height: 31px
	}
    .memberPwCheck-error{
   		margin: 30px 25px;
    }
    .memberPwCheck-error-message{
    	font-size: 25px;
    	margin-bottom: 20px;
    	font-weight: 700;
    }
</style>
</head>
<body>
	<c:if test="${member != null }">
		<div class="container memberPwCheck">
			<h3 class="title">회원정보수정</h3>
			<div class="memberPwCheck-box">
				<span class="memberPwCheck-title">로그인 비밀번호</span>
				<input type="password" class="mb_pw">
				<button type="submit" class="btn btn-primary memberPwCheck-con-btn">확인</button> <br>			
				<span class="memberPwCheck-contnet">안전한 회원정보 수정을 위해 로그인 비밀번호를 입력해주세요</span>
			</div>
		</div>
	</c:if>
	<c:if test="${member == null }">
    	<div class="container memberPwCheck-error">
	    	<div class="memberPwCheck-error-message"><i class="fas fa-exclamation-triangle"></i> 잘못된 접근 방식입니다.</div>
    	</div>
	</c:if>	
<script>	
	// 확인 버튼 클릭시
	$('.memberPwCheck-con-btn').click(function(){
		eventPwCheck();
	})
	// 비밀번호 입력 후 엔터를 눌렀을 때
	$('.mb_pw').keydown(function(){
		if(event.keyCode == 13){
			eventPwCheck();
		}
	})	
	// 확인 버튼 클릭하거나 엔터를 눌렀을 때 처리하는 함수
	function eventPwCheck(){
		var mb_pw = $('.mb_pw').val();
		var data = {"mb_pw" : mb_pw}
		$.ajax({
  	        type:'post',
  	        data:data,
  	        url:'<%=request.getContextPath()%>/pw/check',
  	        success : function(data){ 
  	        	if(data == 'notLogin'){
  	        		alert('로그인이 필요합니다. 메인 페이지로 이동합니다.')
  	        		location.href = '<%=request.getContextPath()%>/'
  	        		return false;
  	        	}else if(data == 'notSame'){
  	        		alert('비밀번호가 일치하지 않습니다.')
  	        		return false;
  	        	}
  	        	location.href = '<%=request.getContextPath()%>/memberInfoChange'
  	        },
  	     	error: function(error) {
  	        	console.log('에러발생');
  	    	}
  	    })
	}
</script>
</body>
</html>