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

<!--style-->


<style>
.btn-submit {
	padding: 8px 20px;
	background: #1BBD36;
	color: #fff;
	border-radius: 4px;
	border: none;
	margin-top: 10px;
}

.btn-line {
	padding: 8px 20px;
	background-color: #fff;
	border-color: #000000;
	border-radius: 4px;
	margin-top: 10px;
}

.modal-title {
	width: 540px;
	margin: 0;
}

.modal {
	overflow: scroll;
}

.menu li ul {
	background-color: #1BBD36;
	display: none;
	height: auto;
	padding: 0px;
	margin: 0px;
	border: 0px;
	position: absolute;
	list-style: none;
	width: 200px;
	z-index: 200;
}

.menu li:hover ul {
	display: block;
}

input.form-control.w300 {
	width: 300px;
}

.atag:hover {
	color: black;
}
</style>
	<script>
		function alertGuest() {
			alert("로그인 후 이용해주세요.");
		}
	</script>
</head>
<body onload="initialize()">
	<%@ include file="/WEB-INF/views/include/guestNavibar.jsp"%>
	<div id="breadcrumb">
		<div class="container">
			<div class="breadcrumb">
				<li></li>
				<li style="font-size: 20px; margin-left: -5px;">로그인</li>
			</div>
			<hr>
		</div>
	</div>
	<div class="aboutus">
		<div class="container"
			style="margin-left: 140px; margin-right: 100px; margin-bottom: 150px">
			<img src="${R}res/images/abouti/professor-1.png"
				style="width: 250px; height: 250px; float: left; border-radius: 5px; padding-right: 20px;">
			<div style="margin-left: 250px; margin-right: 100px;">
				<form method="post" action="login_processing"
					style="margin-right: 350px;">
					<div>
						<div class="form-group">
							<label>ID</label> <input type="text" name="loginId"
								class="form-control w300" />
						</div>
						<div class="form-group">
							<label>PASSWORD</label> <input type="password" name="passwd"
								class="form-control w300" />
						</div>
					</div>
					<hr />
					<div>
						<div style="margin-top: 20px;">
							<a href="sign" class="atag"><U>회원가입</U></a> - <a href="findPw"
								class="atag"><U>비밀번호 찾기</U></a>
						</div>
						<button type="submit" class="btn btn-submit"
							style="float: right; margin-top: -30px; margin-right:-30px">
							<span class="glyphicon glyphicon-ok"></span> 로그인
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<c:if test="${param.error !=null }">
		<script>
			alert("로그인을 실패했습니다.")
		</script>
	</c:if>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="${R}res/js/jquery-2.1.1.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="${R}res/js/bootstrap.min.js"></script>
	<script src="${R}res/js/jquery.prettyPhoto.js"></script>
	<script src="${R}res/js/jquery.isotope.min.js"></script>
	<script src="${R}res/js/wow.min.js"></script>
	<script src="${R}res/js/functions.js"></script>
</body>
</html>