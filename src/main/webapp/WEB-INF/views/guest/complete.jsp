<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SKHU졸업관리시스템</title>

<!-- Bootstrap -->
<link href="${R}res/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${R}res/css/font-awesome.min.css">
<link rel="stylesheet" href="${R}res/css/animate.css">
<link href="${R}res/css/prettyPhoto.css" rel="stylesheet">
<link href="${R}res/css/style.css" rel="stylesheet" />
<link rel="stylesheet" href="${R}res/css/custom.css">

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

<style>
	.btn-login {
      padding: 8px 20px;
      background: #04B404;
      color: #fff;
      font-size: 15px;
      border-radius: 4px;
      border:none;
      margin-top: 10px;
    }
    .myfont {
    	text-align:center; 
    	font-weight: bold; 
    	font-size: 15px;
    }
</style>
<script>
	function alertGuest() {
		alert("로그인 후 이용해주세요.");
	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/guestNavibar.jsp"%>
	<div id="breadcrumb">
    	<div class="container">
        	<div class="breadcrumb">
            	<li>
            	</li>
            	<li style="font-size: 20px; margin-left: -5px;">
                	비밀번호 찾기
            	</li>
        	</div>
        	<hr>
    	</div>
	</div>
	<div style="margin-top:80px;margin-left:-20px; margin-bottom:130px;">
		<p class="myfont">회원가입이 성공적으로 완료되었습니다.</p>
		<p class="myfont">로그인을 해주세요.</p>
		<p style="text-align:center;"><a href="${R}guest/login" class="btn btn-login"><i class="fas fa-child"></i>로그인</a></p>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>