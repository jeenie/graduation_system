<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>SKHU 졸업요건 관리 시스템</title>
<!-- Bootstrap core CSS -->
<link rel="stylesheet" type="text/css"
	href="res/vendor/bootstrap/css/bootstrap.min.css">

<!-- Custom styles for this template -->
<link href="res/css/modern-business.css" rel="stylesheet">

<!--personal making-->
<link href="res/vendor/bootstrap/css/make1.css" rel="stylesheet">
</head>
<body>
	<!-- Navigation -->
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-dark bg-green fixed-top">
		<div class="container">
			<a class="navbar-brand" href="index.jsp"><img
				src="res/img/skhu logot.png" width=50px; height=40px;> SKHU
				졸업관리시스템</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="">졸업요건</a></li>
					<li class="nav-item"><a class="nav-link" href="">Mypage</a></li>
					<li class="nav-item"><a class="nav-link"
						href="http://www.skhu.ac.kr">학교홈페이지</a></li>
					<li class="nav-item"><a class="nav-link"
						href="https://forest.skhu.ac.kr/">종합정보시스템</a></li>
					<li class="nav-item"><a class="nav-link" href="">Login</a></li>

				</ul>
			</div>
		</div>
	</nav>

	<header>
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<!-- Slide One - Set the background image for this slide in the line below -->
				<div class="carousel-item active">
					<img src="res/img/graduation-1.jpg" width="100%" height="550px">
					<div class="carousel-caption d-none d-md-block">

						<!--
              <h3>First Slide</h3>
              <p>This is a description for the first slide.</p> -->
					</div>
				</div>
				<!-- Slide Two - Set the background image for this slide in the line below -->
				<div class="carousel-item">
					<img src="res/img/graduation-3.jpg" width="100%" height="550px">
					<div class="carousel-caption d-none d-md-block"></div>
				</div>
				<!-- Slide Three - Set the background image for this slide in the line below -->
				<div class="carousel-item">
					<img src="res/img/graduation-2.jpg" width="100%" height="550px">
					<div class="carousel-caption d-none d-md-block"></div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</header>

	<!-- Footer -->
	<footer class="py-footer bg-white">
		<div class="container">
			<p class="m-0 text-left text-grey">문의:test123@naver.com</p>
			<p class="m-0 text-left text-grey">152-716 서울시 구로구 연동로320</p>
			<p class="m-0 text-left text-grey">Copyright&copy; 2018SKHU
				Software Engineering All Rights Reserved</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="res/vendor/jquery/jquery.min.js"></script>
	<script src="res/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>