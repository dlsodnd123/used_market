<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style>
	.pwFind-box{
		text-align: center;
		margin: 65px 0;		
	}
	.pwFind>a{
		text-decoration: underline;
		
	}
	.pwFind>a:hover {
		color: black;
	}
	.pwFind-title{
		font-size: 26px;
		margin-bottom: 15px;
		padding-bottom: 10px;
		border-bottom: 2px solid #5a93fa;
		display: inline-block; 
	}
	.pwFind-explain{
		font-size: 13px;
	}
	.pwFind-id{
		margin-top: 15px;
	}
	.pwFind-name,
	.pwFind-email,
	.pwFind-id{
		display: inline-block;		
	}
	.pwFind-btn{
		margin: 20px 0 15px 0;
	}
}
</style>
</head>
<body>
	<div class="container pwFind-box">
		<div class="form-group col-4 pwFind-title"><i class="fas fa-lock"></i> 비밀번호 찾기</div>
		<div class="pwFind-explain">아이디, 이름, 회원가입시 입력한 이메일을 입력해주세요</div>
		<div class="form-group">
          <input type="text" class="form-control pwFind-id col-4" name="pwFind-id" placeholder="아이디">
        </div>
		<div class="form-group">
          <input type="text" class="form-control pwFind-name col-4" name="pwFind-name" placeholder="이름">
        </div>
        <div class="form-group">
          <input type="email" class="form-control pwFind-email col-4" name="pwFind-email" placeholder="이메일">
        </div>
        <button type="submit" class="btn btn-primary col-4 pwFind-btn">찾기</button>
        <div class="pwFind">아이디를 찾으시나요? <a href="<%=request.getContextPath()%>/idFind">아이디 찾기</a></div>
	</div>
<script>
	$('.pwFind-btn').click(function(){
		var isOk = confirm('기존에 사용중이던 비밀번호는 랜덤의 8자리로 초기화되어 가입시 입력한 이메일로 전송됩니다. 진행하겠습니까?')
		if(isOk){
			var mb_id = $('.pwFind-id').val();
			var mb_name = $('.pwFind-name').val();
			var mb_email = $('.pwFind-email').val();
			var sendData = {"mb_id" : mb_id, "mb_name" : mb_name, "mb_email" : mb_email} 
			$.ajax({
				url : '<%=request.getContextPath()%>/pw/find',
				async:false,
				type : 'post',
				data : JSON.stringify(sendData),
				dataType:"json",
		        contentType:"application/json; charset=UTF-8",
				success : function(data){
					console.log(data.result);
					if(data.result == 'notInfo')
						alert('일치하는 정보가 없습니다.')
					else{
						
					}
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