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
<link href="${R}res/css/custom.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<!--style-->


<style>
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

<body>
	<sec:authorize access="hasRole('ROLE_STUDENT')">
		<%@ include file="/WEB-INF/views/include/studentNavibar.jsp"%>
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_PROFESSOR')">
		<%@ include file="/WEB-INF/views/include/professorNavibar.jsp"%>
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<%@ include file="/WEB-INF/views/include/adminNavibar.jsp"%>
	</sec:authorize>

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
										href="#guide" data-toggle="modal">이용안내</a>
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
							<a
								href="${R}graduation/deptRuleEdit?departmentId=99&entranceYear=99"><i
								class="fa fa-book"></i></a>
							<h2>학과별 졸업 요건 관리</h2>
							<p></p>
						</div>
					</div>
					<div class="col-md-3">
						<div class="hi-icon-wrap hi-icon-effect wow fadeInDown"
							data-wow-duration="1000ms" data-wow-delay="600ms">
							<a href="${R}graduation/culturalSubject"><i
								class="fa fa-laptop"></i></a>
							<h2>교양필수 과목 관리</h2>
							<p></p>

						</div>
					</div>
					<div class="col-md-3">
						<div class="hi-icon-wrap hi-icon-effect wow fadeInDown"
							data-wow-duration="1000ms" data-wow-delay="900ms">
							<a href="${R}graduation/SubstitutionSubject"><i
								class="fas fa-book-reader"></i></a>
							<h2>대체과목 관리</h2>
							<p></p>
						</div>
					</div>
					<div class="col-md-3">
						<div class="hi-icon-wrap hi-icon-effect wow fadeInDown"
							data-wow-duration="1000ms" data-wow-delay="1200ms">
							<a href="${R}user/professorAdd"><i
								class="far fa-address-card"></i></a>
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
							<a href="${R}user/graduationRule?departmentId=99&entranceYear=99"><i
								class="fa fa-book"></i></a>
							<h2>졸업요건</h2>
							<p>전체졸업요건을 확인해보세요</p>
						</div>
					</div>
					<div class="col-md-3">
						<div class="hi-icon-wrap hi-icon-effect wow fadeInDown"
							data-wow-duration="1000ms" data-wow-delay="600ms">
							<a href="${R}student/graduationStatus?processId=0"><i
								class="fa fa-laptop"></i></a>
							<h2>나의 졸업현황</h2>
							<p>졸업하기 위해 필요한 나의 남은 학점및 과정을 확인해보세요</p>
						</div>
					</div>
					<div class="col-md-3">
						<div class="hi-icon-wrap hi-icon-effect wow fadeInDown"
							data-wow-duration="1000ms" data-wow-delay="900ms">
							<a href="${R}student/checkGrades"><i class="fa fa-heart"></i></a>
							<h2>성적 조회</h2>
							<p>자신의 성적을 확인해보세요</p>
						</div>
					</div>
					<div class="col-md-3">
						<div class="hi-icon-wrap hi-icon-effect wow fadeInDown"
							data-wow-duration="1000ms" data-wow-delay="1200ms">
							<a href="${R}student/status"><i class="fa fa-cloud"></i></a>
							<h2>대체/타전공 현황</h2>
							<p>타전공 수강학점을 전공학점으로 신청하세요</p>
						</div>
					</div>
				</div>
			</sec:authorize>
		</div>
	</div>

	<div class="modal fade" id="guide" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="padding-bottom: 1.5px;">
					<h4>
						<b>SKHU졸업관리시스템 이용안내</b>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
						</button>
					</h4>
				</div>
				<div class="modal-body">
					<p style="font-size: 16px; font-weight: bold;">성공회대 학생들을 위해 보다
						편한 졸업관리시스템</p>
					<p style="font-size: 14px; font-weight: bold;">&nbsp - &nbsp나의
						졸업현황을 한 번에 볼 수 있고 자신에게 맞는 특별과정을 찾아보세요</p>
					<hr>
					<p style="font-size: 14px; font-weight: bold;">성적파일 업로드 준비과정</p>
					<p>① 성공회대학교 종합정보시스템 https://forest.skhu.ac.kr/ 접속하기</p>
					<img src="${R}res/img/guide1.png" width="550px" height="400px">
					<br> <br>
					<p>② 성적관리 - 학내 제출용 성적증명서 출력</p>
					<img src="${R}res/img/guide2.png" width="550px" height="400px">
					<br> <br>
					<p>③ 자신의 성적을 맨 위에 행부터 쫘악 드래그하기</p>
					<img src="${R}res/img/guide3.png" width="550px" height="400px">
					<br> <br>
					<p>④ Excel에 붙여넣기 한 후 과목에 해당하는 행 이외에는 모두 지우기</p>
					<img src="${R}res/img/guide4.png" width="550px" height="300px">
					<br> <br>
					<p>그럼 성적파일 완사앙 - ☆</p>
					<p style="color: red; font-size: 12px;">※ Excel에 불필요한 내용이나 빈 셀이
						포함된 경우 올바른 결과가 나오지 않을 수 있습니다.</p>
				</div>
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