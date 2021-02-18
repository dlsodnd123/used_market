<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .login-top{
            text-align: center;
            margin: 65px 0 100px 0;
        }
        .login{
            display: inline-block;
        }
        .find-box{
            padding-top: 15px;
        }
        .id-find, .pw-find{
            color: black;
        }
        .id-find{
            padding-right: 20px;
        }
        .pw-find{
            padding-left: 20px;
        }
    </style>
</head>
<body>
  	<div class="container login-top">
      <h3>로그인</h3>
      <form action="<%=request.getContextPath()%>/login" method="post">
        <div class="form-group">
          <input type="text" class="form-control login col-4" id="id" name="id" placeholder="아이디">
        </div>
        <div class="form-group">
          <input type="password" class="form-control login col-4" id="pw" name="pw" placeholder="비밀번호">
        </div>
        <button type="submit" class="btn btn-primary col-4">로그인</button>
        <div class="find-box">
          <a href="#" class="id-find">아이디 찾기</a>
          <a href="#" class="pw-find">비밀번호 찾기</a>
        </div>
      </form>
    </div>
    <script type="text/javascript">
    	$(function(){
    		var check = false;
    		$('form').submit(function(){
    			var id = $('input[name=id]').val();
    			var pw = $('input[name=pw]').val();
    			var sendData = {'mb_id' : id, 'mb_pw' : pw};
    			$.ajax({
    				url : '<%=request.getContextPath()%>/idpw/check',
    				async:false,
    				type : 'post',
    				data : JSON.stringify(sendData),
    				dataType:"json",
    		        contentType:"application/json; charset=UTF-8",
    				success : function(data){
    					if(data.result == 'notId'){
    						alert('존재하는 아이디가 아닙니다');
    						check = false;
    					}else if(data.result == 'notSamePw'){
    						alert('비밀번호가 일치하지 않습니다.');
    						check = false;
    					}else if(data.result == 'same'){
    						check = true;
    					}
    				},
    	   	     	error: function(error) {
    	   	        	console.log('에러발생');
    	   	    	}
    			})
    			console.log(check);
    			return check;
    		})
    	})
    </script>
</body>
</html>