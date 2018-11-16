<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<c:url var="R" value="/" />

<script>
	$(function() {
		$('#password').keyup(function() {
			$('font[name=check]').text('');
		}); //#user_pass.keyup
		$('#password2').keyup(function() {
			if ($('#password').val() != $('#password2').val()) {
				$('font[name=check]').text('');
				$('font[name=check]').html("암호틀림");
			} else {
				$('font[name=check]').text('');
				$('font[name=check]').html("암호맞음");
			}
		}); //#chpass.keyup
	});

	<script type="text/javascript">
	window.onload = function() {

		document.getElementById('signForm').onsubmit = function() {
			if ($('#password').val() != $('#password2').val()) {
				alert('다시입력');
				return false;
			}

		}
	}
</script>
</script>

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
<!-- =======================================================
    Theme Name: Company
    Theme URL: https://bootstrapmade.com/company-free-html-bootstrap-template/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
  ======================================================= -->

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

input.form-control.w300 {
	width: 300px;
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
							<a href="index.html"><h1>
									<span>SKHU</span>졸업관리시스템
								</h1></a>
						</div>
					</div>

					<div class="navbar-collapse collapse">
						<div class="menu">
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation"><a href="graduation_Guide.html">졸업요건</a></li>
								<li role="presentation" class="dropdown"><a href="">졸업관리</a>
									<div class="dropdown-content">
										<a href="about.html">마이페이지</a> <a href="checkGrades.html">성적조회</a>
										<a href="">대체/타전공 현황</a>
									</div></li>
								<li role="presentation"><a href="http://www.skhu.ac.kr">학교홈페이지</a></li>
								<li role="presentation"><a
									href="https://forest.skhu.ac.kr/">종합정보시스템</a></li>
								<li role="presentation"><a href="guest/login">Login</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</nav>
	</header>
	<div id="breadcrumb">
		<div class="container">
			<div class="breadcrumb">
				<li></li>
				<li style="font-size: 20px; margin-left: -5px;">회원가입</li>
			</div>
			<hr>
		</div>
	</div>
	<div class="aboutus">
		<div class="container"
			style="margin-left: 140px; margin-bottom: 150px">
			<img src="${R}res/images/abouti/professor-1.png"
				style="width: 250px; height: 250px; float: left; border-radius: 5px; padding-right: 20px;">
			<div style="margin-left: 250px;">
				<form:form method="post" modelAttribute="student" id="signForm" enctype="multipart/form-data">
					<div class="form-group">
						<label>학번</label>
						<form:input path="id" class="form-control w300" />
					</div>
					<div class="form-group">
						<label>이름</label>
						<form:input path="name" class="form-control w300" />
					</div>
					<div class="form-group">
						<label>학과</label>
						<form:select path="departmentId" class="form-control w300"
							itemValue="id" itemLabel="departmentName"
							items="${ departments }" />
					</div>
					<div class="form-group">
						<label>입학구분</label>
						<form:input path="entranceType" class="form-control w300" />
					</div>
					<div class="form-group">
						<label>학년</label>
						<form:input path="grade" type="number" class="form-control w300" />
					</div>
					<div class="form-group">
						<label>비밀번호</label>
						<form:input path="password" type="password"
							class="form-control w300" />
					</div>
					<div class="form-group">
						<label>비밀번호 재입력</label>
						<form:input path="password2" type="password"
							class="form-control w300" />
					</div>
					<div class="form-group">
						<label>비밀번호 찾기 질문</label>
						<form:select path="passwordQuestion" class="form-control w200"
							itemValue="quizCode" itemLabel="quizContent" items="${ quizs }" />
					</div>
					<div class="form-group">
						<label>비밀번호 찾기 답변</label>
						<form:input path="passwordAnswer" class="form-control w300" />
					</div>
					<div class="form-group">
						<label>이메일</label>
						<form:input path="email" type="email" class="form-control w300" />
					</div>
					<div class="form-group">
						<label>이수완료학기</label>
						<form:input path="completeSemester" type="number"
							class="form-control w300" />
					</div>
					
					<div class="form-group">
						<label>성적파일 업로드</label>
						<form:input path="file" type="file" class="form-control w300" accept=".xls,xlsx"/>
					</div>
					
					<hr />
					<div>
						<button type="submit" class="btn btn-submit">
							<span class="glyphicon glyphicon-ok"></span> 회원가입
						</button>
						<a href="${R}guest/index" class="btn btn-submit"> <i
							class="glyphicon glyphicon-remove"> 취소</i>
						</a>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<footer>
		<div class="footer">
			<div class="container">
				문의:test123@naver.com<br> 152-716 서울시 구로구 연동로320<br>
				Copyright&copy; 2018SKHU Software Engineering All Rights Reserved<br>


			</div>
		</div>
	</footer>
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