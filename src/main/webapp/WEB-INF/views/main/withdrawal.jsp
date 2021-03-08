<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<style>
	.withdrawal-box{
		padding: 75px 40px;
		text-align: center;
	}
	.withdrawal-title{
		font-size: 27px;
		font-weight: 700;
		color: firebrick;
		margin-bottom: 25px;
	}
	.withdrawal-contents{
		font-size: 18px;
		margin-bottom: 15px;
	}
	.withdrawal-btn{
		font-size: 18px;
		margin-top: 20px;
		font-weight: 700;
	}
</style>
</head>
<body>
	<div class="container withdrawal-box">
		<div class="info-box">
			<div class="withdrawal-title">회원탈퇴시 주의사항</div>
			<div class="withdrawal-contents">회원탈퇴시 7일이내 재가입이 불가능 합니다.</div>
			<div class="withdrawal-contents">탈퇴시 계정의 모든 정보가 삭제 되며 재가입시에도 복구 되지 않습니다.</div>
		</div>
		<div class="btn-box">
			<button type="button" class="btn btn-danger col-6 withdrawal-btn">탈 퇴</button>
		</div>
		<input type="hidden" class="withdrawal-mb-id" value="${member.mb_id}">		
	</div>
<script>
	$('.withdrawal-btn').click(function(){
		var isWithdreawl = confirm('정말로 탈퇴하시겠습니까?');
		if(isWithdreawl){
			var mb_id = $('.withdrawal-mb-id').val()
			var data = {"mb_id" : mb_id}
			$.ajax({
       	        type:'post',
       	        data:data,
       	        url:'<%=request.getContextPath()%>/member/withdrawal',
       	        success : function(data){
       	              			
       	        },
   	   	     	error: function(error) {
   	   	        	console.log('에러발생');
   	   	    	}
       	    })
		}
	})
</script>
</body>
</html>