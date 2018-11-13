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
<link rel="stylesheet" href="${R}res/css/font-awesome.css">
<link rel="stylesheet" href="${R}res/css/font-awesome.min.css">
<link rel="stylesheet" href="${R}res/css/animate.css">
<link rel="stylesheet" href="https://icono-49d6.kxcdn.com/icono.min.css">
<link href="${R}res/css/prettyPhoto.css" rel="stylesheet">
<link href="${R}res/css/style.css" rel="stylesheet" />
<!-- =======================================================
    Theme Name: Company
    Theme URL: https://bootstrapmade.com/company-free-html-bootstrap-template/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
  ======================================================= -->

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
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

/* Style The Dropdown Button */
.dropbtn {
	background-color: #4CAF50;
	color: white;
	padding: 16px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
	position: relative;
	display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
	display: none;
	position: absolute;
	background-color: #4CAF50;
	min-width: 140px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
	color: white;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {
	background-color: rgb(96, 185, 96)
}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
	display: block;
}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {
	background-color: #3e8e41;
}

/****** LOGIN MODAL ******/
.loginmodal-container {
	padding: 30px;
	max-width: 350px;
	width: 100% !important;
	background-color: #F7F7F7;
	margin: 0 auto;
	border-radius: 2px;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	overflow: hidden;
	font-family: roboto;
}

.loginmodal-container h1 {
	text-align: center;
	font-size: 1.8em;
	font-family: roboto;
}

.loginmodal-container input[type=submit] {
	width: 100%;
	display: block;
	margin-bottom: 10px;
	position: relative;
}

.loginmodal-container input[type=text], input[type=password] {
	height: 44px;
	font-size: 16px;
	width: 100%;
	margin-bottom: 10px;
	-webkit-appearance: none;
	background: #fff;
	border: 1px solid #d9d9d9;
	border-top: 1px solid #c0c0c0;
	/* border-radius: 2px; */
	padding: 0 8px;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
}

.loginmodal-container input[type=text]:hover, input[type=password]:hover
	{
	border: 1px solid #b9b9b9;
	border-top: 1px solid #a0a0a0;
	-moz-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
	-webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
	box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
}

.loginmodal {
	text-align: center;
	font-size: 14px;
	font-family: 'Arial', sans-serif;
	font-weight: 700;
	height: 36px;
	padding: 0 8px;
	/* border-radius: 3px; */
	/* -webkit-user-select: none;
    user-select: none; */
}

.loginmodal-submit {
	/* border: 1px solid #3079ed; */
	border: 0px;
	color: #fff;
	text-shadow: 0 1px rgba(0, 0, 0, 0.1);
	background-color: #1BBD36;
	padding: 17px 0px;
	font-family: roboto;
	font-size: 14px;
	/* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#4787ed)); */
}

.loginmodal-submit:hover {
	/* border: 1px solid #2f5bb7; */
	border: 0px;
	text-shadow: 0 1px rgba(0, 0, 0, 0.3);
	background-color: #04B404;
	/* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#357ae8)); */
}

.loginmodal-container a {
	text-decoration: none;
	color: #666;
	font-weight: 400;
	text-align: center;
	display: inline-block;
	opacity: 0.6;
	transition: opacity ease 0.5s;
}

.login-help {
	font-size: 12px;
}
</style>
</head>

<body onload="initialize()">
	<header>
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="navigation">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target=".navbar-collapse.collapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<div class="navbar-brand">
							<a href=""><h1>
									<span>SKHU</span>졸업관리시스템
								</h1></a>
						</div>
					</div>

					<div class="navbar-collapse collapse">
						<div class="menu">
							<ul class="nav nav-tabs" role="tablist">
								<sec:authorize access="hasRole('ROLE_ADMIN')">
									<li role="presentation"><a
										href="${R}user/graduationRule?departmentId=99&entranceYear=99">졸업요건</a></li>
									<li role="presentation" class="dropdown"><a href="">졸업관리</a>
										<div class="dropdown-content">
											<a
												href="${R}graduation/deptRuleEdit?departmentId=99&entranceYear=99">학과별
												졸업요건 </a> <a href="${R}graduation/culturalSubject">교양 필수 과목
											</a> <a href="${R}graduation/SubstitutionSubject">대체 과목 관리</a>
										</div></li>
								</sec:authorize>
								<sec:authorize access="hasRole('ROLE_PROFESSOR')">
									<li role="presentation"><a
										href="${R}user/graduationRule?departmentId=99&entranceYear=99">졸업요건</a></li>
									<li role="presentation"><a
										href="studentInquiryForProfessor.html">학생조회</a></li>
								</sec:authorize>
								<sec:authorize access="hasRole('ROLE_STUDENT')">
									<li role="presentation"><a
										href="${R}user/graduationRule?departmentId=99&entranceYear=99">졸업요건</a></li>
									<li role="presentation" class="dropdown"><a href="">졸업관리</a>
										<div class="dropdown-content">
											<a href="${R}user/myPage">마이페이지</a> <a
												href="checkGrades.html">성적조회</a> <a href="">대체/타전공 현황</a>
										</div></li>
								</sec:authorize>
								<li role="presentation"><a href="http://www.skhu.ac.kr">학교홈페이지</a></li>
								<li role="presentation"><a
									href="https://forest.skhu.ac.kr/">종합정보시스템</a></li>
								<sec:authorize access="hasRole('ROLE_ADMIN')">
									<li role="presentation" class="dropdown"><a
										href="StudentInquiryForAdmin.html">사용자관리</a>
										<div class="dropdown-content">
											<a href="professorInquiry">교수조회</a> <a
												href="studentListForAdmin">학생조회</a>
										</div></li>
								</sec:authorize>
								<li role="presentation"><a
									href="${R}user/logout_processing">Logout</a></li>
								<sec:authorize access="hasRole('ROLE_ADMIN')">
									<li>
										<div style="margin-top: 28px; margin-left: 1.5px;">
											<a href="adminEdit"> <i class="fas fa-user-edit fa-lg"></i>
											</a>
										</div>
									</li>
								</sec:authorize>
								<sec:authorize access="hasRole('ROLE_PROFESSOR')">
									<li>
										<div style="margin-top: 28px; margin-left: 1.5px;">
											<a href="professorEdit"> <i
												class="fas fa-user-edit fa-lg"></i>
											</a>
										</div>
									</li>
								</sec:authorize>
								<sec:authorize access="hasRole('ROLE_STUDENT')">
									<li>
										<div style="margin-top: 28px; margin-left: 1.5px;">
											<a href="studentEdit"> <i class="fas fa-user-edit fa-lg"></i>
											</a>
										</div>
									</li>
								</sec:authorize>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</nav>
	</header>

	<section id="main-slider" class="no-margin">
		<div class="carousel slide">
			<div class="carousel-inner">
				<div class="item active"
					style="background-image: url(${R}res/img/graduation-3.jpg)">
					<div class="container">
						<div class="row slide-margin">
							<div class="col-sm-6">
								<div class="carousel-content">
									<h2 class="animation animated-item-1">
										&nbsp;Welcome <span>SKHU</span>
									</h2>
									<p class="animation animated-item-2"></p>
									&nbsp;&nbsp; <a class="btn-slide animation animated-item-3"
										href="#">이용안내</a>
								</div>
							</div>

							<div class="col-sm-6 hidden-xs animation animated-item-4">
								<div class="slider-img">
									<!--<img src="images/slider/img3.png" class="img-responsive"> -->
								</div>
							</div>

						</div>
					</div>
				</div>
				<!--/.item-->
			</div>
			<!--/.carousel-inner-->
		</div>
		<!--/.carousel-->
	</section>
	<!--/#main-slider-->

	<div class="feature">
		<div class="container">
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<div class="text-center">
					<div class="col-md-3">
						<div class="hi-icon-wrap hi-icon-effect wow fadeInDown"
							data-wow-duration="1000ms" data-wow-delay="300ms">
							<a href=""><i class="fa fa-book"></i></a>
							<h2>졸업요건 수정</h2>
							<p></p>
						</div>
					</div>
					<div class="col-md-3">
						<div class="hi-icon-wrap hi-icon-effect wow fadeInDown"
							data-wow-duration="1000ms" data-wow-delay="600ms">
							<a href=""><i class="fa fa-laptop"></i></a>
							<h2>대체리스트 수정</h2>
							<p></p>

						</div>
					</div>
					<div class="col-md-3">
						<div class="hi-icon-wrap hi-icon-effect wow fadeInDown"
							data-wow-duration="1000ms" data-wow-delay="900ms">
							<a href="majorAdmitManage.html"><i class="fas fa-book-reader"></i></a>
							<h2>전공인정관리</h2>
							<p></p>
						</div>
					</div>
					<div class="col-md-3">
						<div class="hi-icon-wrap hi-icon-effect wow fadeInDown"
							data-wow-duration="1000ms" data-wow-delay="1200ms">
							<a href="registerProfessor"><i class="far fa-address-card"></i></a>
							<h2>교수 추가</h2>
							<p></p>
						</div>
					</div>
				</div>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_PROFESSOR')">

			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_STUDENT')">
				<div class="text-center">
					<div class="col-md-3">
						<div class="hi-icon-wrap hi-icon-effect wow fadeInDown"
							data-wow-duration="1000ms" data-wow-delay="300ms">
							<a href="graduation_Guide.html"><i class="fa fa-book"></i></a>
							<h2>졸업요건</h2>
							<p>전체졸업요건을 확인해보세요</p>
						</div>
					</div>
					<div class="col-md-3">
						<div class="hi-icon-wrap hi-icon-effect wow fadeInDown"
							data-wow-duration="1000ms" data-wow-delay="600ms">
							<a href="about.html"><i class="fa fa-laptop"></i></a>
							<h2>마이페이지</h2>
							<p>졸업하기 위해 필요한 나의 남은 학점및 과정을 확인해보세요</p>
						</div>
					</div>
					<div class="col-md-3">
						<div class="hi-icon-wrap hi-icon-effect wow fadeInDown"
							data-wow-duration="1000ms" data-wow-delay="900ms">
							<a href="checkGrades.html"><i class="fa fa-heart"></i></a>
							<h2>성적조회</h2>
							<p>자신의 성적을 확인해보세요</p>
						</div>
					</div>
					<div class="col-md-3">
						<div class="hi-icon-wrap hi-icon-effect wow fadeInDown"
							data-wow-duration="1000ms" data-wow-delay="1200ms">
							<a href=""><i class="fa fa-cloud"></i></a>
							<h2>대체/타전공 현황</h2>
							<p>타전공 수강학점을 전공학점으로 신청하세요</p>
						</div>
					</div>
				</div>
			</sec:authorize>
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