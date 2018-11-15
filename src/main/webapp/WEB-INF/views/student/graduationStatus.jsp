<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SKHU졸업관리시스템</title>

<!-- Bootstrap -->
<link href="${R}res/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${R}res/css/font-awesome.min.css">
<link rel="stylesheet" href="${R}res/css/animate.css">
<link rel="stylesheet" href="${R}res/css/custom.css">
<link rel="stylesheet" href="https://icono-49d6.kxcdn.com/icono.min.css">
<link href="${R}res/css/prettyPhoto.css" rel="stylesheet">
<link href="${R}res/css/style.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">

<style>
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
	min-width: 160px;
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

/*input class 변경*/
.form-controls {
	width: 160px;
	height: 35px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
}

.form-group {
	margin-bottom: 0;
}

.btn-submit {
	padding: 6px 15px;
	background: #1BBD36;
	color: #fff;
	border-radius: 4px;
	border: none;
	margin-top: 0;
}

.btn-warning {
	padding: 6px 15px;
	background-color: #f0ad4e;
	border-color: #eea236;
	color: #fff;
	border-radius: 4px;
	border: none;
	margin-top: 0;
}

.btn-cancle {
	padding: 6px 15px;
	background-color: #BDBDBD;
	border-color: #eea236;
	color: #fff;
	border-radius: 4px;
	border: none;
	margin-top: 0;
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

.contents {
	margin-top: 5px;
	margin-right: 100px;
	margin-left: 140px;
	margin-bottom: 100px;
}

.divide {
	margin-top: 20px;
	margin-left: 60px;
	margin-right: 60px;
	height: 520px;
}

.myLavel {
	margin: 0;
	font-weight: bold;
	font-size: 22px;
}

.selectSpan {
	overflow: hidden;
	width: 25px;
}

.selectSpan:before {
	content: '';
	height: 20px;
	width: 20px;
	display: block;
	border: 5px solid #333;
	border-left-width: 0;
	border-top-width: 0;
	transform: rotate(-45deg);
	-webkit-transform: rotate(-45deg);
	-moz-transform: rotate(-45deg);
	-o-transform: rotate(-45deg);
	-ms-transform: rotate(-45deg);
	position: absolute;
	top: 7px;
	right: 7px;
}

.demoSpan1 {
	width: 40px;
	height: 40px;
}

.demoSpan1:before {
	content: '';
	height: 8px;
	width: 8px;
	background: #333;
	border-radius: 6px;
	-webkit-border-radius: 6px;
	-moz-border-radius: 6px;
	display: block;
	position: absolute;
	top: 5px;
	left: 16px;
	box-shadow: 0 12px 0 #333, 0 24px 0 #333;
	-webkit-box-shadow: 0 12px 0 #333, 0 24px 0 #333;
	-moz-box-shadow: 0 12px 0 #333, 0 24px 0 #333;
}

.divide_top {
	width: 100%;
	height: 40px;
	display: block;
}

.divide_top input[type="button"] {
	float: right;
	margin-right: 40px;
}

select.form-control.w200 {
	width: 200px;
	float: left;
}

.plusCircle {
	border-radius: 50px;
	-webkit-border-radius: 50px;
	-moz-border-radius: 50px;
	width: 30px;
	height: 30px;
	background-color: #fff;
	color: #BDBDBD;
}

.plusCircle:before, .plusCircle:after {
	content: '';
	height: 3px;
	width: 20px;
	display: block;
	background: #fff;
	border-radius: 10px;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	position: absolute;
	top: 11px;
	left: 3px;
}

.plusCircle:after {
	height: 20px;
	width: 3px;
	top: 3px;
	left: 11px;
}

.inputNumber {
	width: 60px;
	margin-right: 0;
}

.gradeNum {
	width: 40px;
	padding-top: 2px;
	padding-left: 10px;
	padding-right: 0px;
}

.majorlist {
	height: 259px;
	overflow-y: scroll;
}

/*my page */
select {
	width: 200px;
	height: 40px;
	padding-left: 10px;
	font-size: 18px;
	color: #000000;
	background-color: rgb(255, 255, 255);
	border: 1.3px solid rgb(46, 46, 46);
	border-radius: 10px;
	text-align: center;
}

select option:checked, select option:hover {
	background: rgb(226, 240, 217);
	color: rgb(57, 70, 255);
	font-weight: bold;
}

.divide1 {
	margin-top: -10px;
	margin-left: 60px;
	margin-right: 60px;
	height: 180px;
}

.l_s {
	margin-left: -40px;
	float: left;
	width: 180px;
	height: 180px;
}

.r_s {
	margin-right: 60px;
	float: left;
	width: 800px;
	height: 180px;
}

.a_l {
	margin-top: 10px;
	float: left;
	border: 1.5px solid #8a8a8a;
	width: 160px;
	height: 180px;
}

.alt_l {
	margin-top: 10px;
	float: left;
	border: 2px solid rgb(255, 255, 255);
	width: 700px;
	height: 180px;
}

tabl, td {
	border: 1px solid #8a8a8a;
	text-align: center;
}

th {
	width: 100px;
	border: 1px solid #8a8a8a;
	text-align: center;
	background-color: rgb(226, 240, 217);
}

table {
	width: 100%;
	color: black;
}
</style>
</head>

<body>
	<%@ include file="/WEB-INF/views/include/studentNavibar.jsp"%>

	<div id="breadcrumb">
		<div class="container">
			<div class="breadcrumb">
				<li></li>
				<li style="font-size: 20px; margin-left: -5px;">나의 졸업현황</li>
			</div>
			<hr>
		</div>
	</div>
	<div class="aboutus">
		<div class="container">
			<div style="margin-top: 30px">
				<div class="contents">

					<div class="divide1">
						<div class="l_s">
							<div class="a_l">
								<img src="" width="150px" height="170px">
							</div>
						</div>

						<div class="r_s">
							<div class="alt_l">
								<div class="info">
									<table>
										<tr style="height: 60px;">
											<th>학번</th>
											<td>${ student.id }</td>
											<th>성명</th>
											<td>${ student.name }</td>
										</tr>

										<tr style="height: 60px;">
											<th>학부(과)</th>
											<td>${ student.departmentName }</td>
											<th>학년</th>
											<td>${ student.grade }</td>
										</tr>

										<tr style="height: 60px;">
											<th>입학구분</th>
											<td>${ student.entranceType }</td>
											<th>이수학기</th>
											<td>${ student.completeSemester }학기</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>

				</div>

				<br> <br> <br>

				<div class="form-group"
					style="float: left; margin-right: 20px; margin-bottom: 5px;">
					<p class="font4">${ student.name }님은</p>
					<select name="specialProcess" class="form-controls w200">
						<option value="99">특별과정</option>
						<c:forEach var="specialProcess" items="${specialProcess}">
							<option value="${specialProcess.id}"
								${specialProcessId == specialProcess.id ? "selected" : ""}>${specialProcess.processName}</option>
						</c:forEach>
					</select>을 이수하고 있습니다.
				</div>
				<br> <br>
			</div>
			<div class="col-md-5 wow fadeInDown" data-wow-duration="1000ms"
				data-wow-delay="600ms">
				<div class="skill">
					<div class="progress-wrap">
						<h4>＞총 학점&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp${studentGradefile.totalUnit}/${total}</h4>
						<div class="progress">
							<div class="progress-bar color4" role="progressbar"
								aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"
								style="width: 65%">
								<span class="bar-width">67%</span>
							</div>
						</div>
					</div>
					<br> <br>

					<div class="progress-wrap">
						<h4>＞ 전공&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp${studentGradefile.majorUnit}/34</h4>
						<div class="progress">
							<div class="progress-bar  color1" role="progressbar"
								aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
								style="width: 80%">
								<span class="bar-width">78%</span>
							</div>
						</div>
						<h4>
							<hr>
							&nbsp&nbsp&nbsp- 전공필수
						</h4>
						<div class="t2">
							<table style="width: 870px;">
								<tr style="height: 30px;">
									<th>학년</th>
									<th>학기</th>
									<th colspan="3">과목</th>
								</tr>

								<tr>
									<td rowspan="2">1</td>
									<td>1</td>
									<td><font color="#DB0000">C프로그래밍I (3)</font></td>
									<td colspan="2"><font color="#DB0000">과정지도1 (1)</font></td>
								</tr>

								<tr>
									<td>2</td>
									<td><font color="#DB0000">웹페이지구축I (3)</font></td>
									<td colspan="2"><font color="#DB0000">과정지도2 (1)</font></td>
								</tr>

								<tr>
									<td rowspan="3">2</td>
									<td rowspan="2">1</td>
									<td><font color="#DB0000">컴퓨터구조 (3)</font></td>
									<td colspan="2"><font color="#DB0000">데이터베이스개론 (3)</font></td>
								</tr>

								<tr>
									<td><font color="#DB0000">Java프로그래밍 (3)</font></td>
									<td colspan="2"><font color="#DB0000">과정지도3 (1)</font></td>
								</tr>

								<tr>
									<td>2</td>
									<td><font color="#DB0000">자료구조론 (3)</font></td>
									<td><font color="#DB0000">운영체제론 (3)</font></td>
									<td><font color="#DB0000">과정지도4 (1)</font></td>
								</tr>

								<tr>
									<td rowspan="2">3</td>
									<td>1</td>
									<td><font color="#DB0000">알고리즘3 (3)</font></td>
									<td colspan="2"><font color="#DB0000">과정지도5 (1)</font></td>
								</tr>

								<tr>
									<td>2</td>
									<td colspan="3">과정지도6 (1)</td>
								</tr>

								<tr>
									<td>4</td>
									<td>1,2</td>
									<td colspan="3">졸업지도 (1)</td>

								</tr>

								<tr style="height: 30px;">
									<th colspan="2">학점 계</th>
									<th colspan="3">31</th>
								</tr>
							</table>
						</div>
					</div>
					<br> <br> <br>

					<div class="progress-wrap">
						<h4>＞ 교양&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp${studentGradefile.cultureUnit}/${culture+departmentMajorList.addCulture}</h4>
						<div class="progress">
							<div class="progress-bar color3" role="progressbar"
								aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
								style="width: 90%">
								<span class="bar-width">90%</span>
							</div>
						</div>
						<h4>
							<hr>
							&nbsp&nbsp&nbsp- 교양필수
						</h4>
						<div class="t4">
							<table style="width: 870px;">
								<tr style="height: 30px;">
									<th colspan="2">과목</th>
								</tr>

								<tr>
									<td><font color="#DB0000">기도모임(비아메디아 채플) 2회</font></td>
									<td><font color="#DB0000">사회봉사 그룹(사회봉사I, 해외봉사,
											농촌봉사, CUAC서비스러닝 프로그램 중 택1) (2)</font></td>
								</tr>

								<tr>
									<td><font color="#DB0000">대학생활세미나I (2)</font></td>
									<td><font color="#DB0000">대학생활세미나II (1)</font></td>
								</tr>

								<tr>
									<td><font color="#DB0000">말과글 (2)</font></td>
									<td></td>
								</tr>

								<tr style="height: 30px;">
									<th>학점 계</th>
									<th>7</th>
								</tr>
							</table>
						</div>
					</div>

				</div>
			</div>
		</div>

	</div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

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