<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">

<style>
input.form-control.w300 {
	width: 300px;
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
				<li></li>
				<li style="font-size: 20px; margin-left: -5px;">비밀번호 찾기</li>
			</div>
			<hr>
		</div>
	</div>
	<div class="aboutus">
		<div class="container"
			style="margin-left: 230px; margin-top: 50px; margin-bottom: 70px">
			<div
				style="width: 132px; height: 158px; margin-right: 0; border-radius: 5px; padding-right: 20px; font-size: 150px;">
				<i class="fas fa-user-graduate"></i>
			</div>
			<div
				style="float: right; margin-left: 140px; margin-right: 300px; margin-top: -150px">
				<form:form method="post" modelAttribute="student"
					style="margin-right:350px;">
					<div>
						<div class="form-group">
							<label>새 비밀번호 입력</label>
							<form:input type="password" path="password"
								class="form-control w300" />
						</div>
						<div class="form-group">
							<label>새 비밀번호 재입력</label>
							<form:input type="password" path="password2"
								class="form-control w300" />
						</div>
					</div>
					<hr />
					<div>
						<button type="submit" class="btn btn-submit"
							style="float: right; margin-top: -10px">
							<span class="glyphicon glyphicon-ok"></span> 인증
						</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
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