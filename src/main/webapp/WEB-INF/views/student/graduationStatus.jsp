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

<!-- font awesome-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">

<style>
.inquiry_btn {
	border: none;
	/* Remove borders */
	border-radius: 2.5px;
	color: white;
	/* Add a text color */
	padding: 4px 10px;
	/*14px 28px;  Add some padding */
	width: 50px;
	height: 30px;
	cursor: pointer;
	/* Add a pointer cursor on mouse-over */
}

.body_btn {
	border: none;
	/* Remove borders */
	border-radius: 2.5px;
	color: white;
	/* Add a text color */
	padding: 4px 10px;
	/*14px 28px;  Add some padding */
	width: 50px;
	height: 25px;
	cursor: pointer;
	/* Add a pointer cursor on mouse-over */
}

.btn-statement3 {
	/*열람가능여부 yes*/
	border: none;
	/* Remove borders */
	border-radius: 2.5px;
	color: white;
	/* Add a text color */
	padding: 4px 5px;
	/*14px 28px;  Add some padding */
	width: 50px;
	height: 25px;
	cursor: pointer;
	/* Add a pointer cursor on mouse-over */
	background-color: grey;
}

.btn-statement4 {
	/*열람가능여부 no*/
	border: none;
	/* Remove borders */
	border-radius: 2.5px;
	color: white;
	/* Add a text color */
	padding: 4px 5px;
	/*14px 28px;  Add some padding */
	width: 50px;
	cursor: pointer;
	/* Add a pointer cursor on mouse-over */
	background-color: rgb(80, 153, 92);
}

.warning {
	background-color: #ff9800;
}

/* Orange */
.warning:hover {
	background: #e68a00;
}

/*pagination*/
.pagination {
	justify-content: center;
	text-align: center;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
}

.pagination a.active {
	background-color: dodgerblue;
	color: white;
}

td {
	text-align: center;
	vertical-align: middle;
}

.table-info {
	width: 400px;
}

.contents {
	margin-top: 5px;
	margin-right: 100px;
	margin-left: 140px;
	margin-bottom: 100px;
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

.modalGreen {
	width: 100%;
	height: 35px;
	background-color: rgb(22, 105, 22);
	color: white;
	font-weight: normal;
	padding-top: 7px;
	padding-left: 7px;
}

.btn-submit {
	padding: 6px 15px;
	background: #1BBD36;
	color: #fff;
	border-radius: 4px;
	border: none;
	margin-top: 0;
}

.aboutus {
	margin-right: 30%;
}

/*progress 서식*/
.progressbar {
	width: 600px;
	height: 16px;
	margin: 0 auto 20px auto;
	padding: 0px;
	background: #cfcfcf;
	border-width: 1px;
	border-style: solid;
	border-color: #aaa #bbb #fff #bbb;
	box-shadow: inset 0px 2px 3px #bbb;
}

.progressbar, .progressbar-inner {
	border-radius: 4px;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	-o-border-radius: 4px;
}

.progressbar-inner {
	width: 77%; /* Change to actual percentage */
	height: 100%;
	background: #999;
	background-size: 18px 18px;
	background-color: #ac0;
	background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, .2)
		25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .2) 50%,
		rgba(255, 255, 255, .2) 75%, transparent 75%, transparent);
	box-shadow: inset 0px 2px 8px rgba(255, 255, 255, .5), inset -1px -1px
		0px rgba(0, 0, 0, .2);
}

.progressbar-green .progressbar-inner {
	background-color: #ac0;
}
</style>
</head>

<body>
	<%@ include file="/WEB-INF/views/include/studentNavibar.jsp"%>

	<div id="breadcrumb">
		<div class="container">
			<div class="breadcrumb">
				<li></li>
				<li style="font-size: 18px; margin-left: -5px;">나의 졸업현황</li>
			</div>
			<hr>
		</div>
	</div>

	<div class="contents">
		<div style="float: left; margin-left: 70px; margin-right: 100px;">
			<img src="${R}res/images/abouti/student.png" width="150px"
				height="170px">
		</div>

		<div style="float: left; width: 600px;">
			<table class="table">
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

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div style="margin-right: 100px; margin-left: 100px;">
		<form>
			<div>
				<div style="float: left">
					<p style="font-size: 18px; font-weight: bold;">
						>&nbsp ${ student.name }님에 맞는 &nbsp <select name="processId"
							class="form-controls w200">
							<option value="0">특별과정</option>
							<c:forEach var="specialProcess" items="${specialProcess}">
								<option value="${specialProcess.id}"
									${processId == specialProcess.id ? "selected" : ""}>${specialProcess.processName}</option>
							</c:forEach>
						</select>&nbsp &nbsp &nbsp
						<button type="submit" class="btn-submit"
							style="margin-left: 0; margin-top: 0; padding: 5px 20px; font-size: 16px;">조회</button>
					</p>

				</div>
			</div>
		</form>
		<br> <br> <br> <br>

		<div style="float: left;">
			<p style="font-size: 18px; font-weight: bold;">>&nbsp 총 학점
				${studentGradefile.totalUnit}/${total}</p>
			<div class="progressbar progressbar-green">
				<div class="progressbar-inner"
					style="width:${((studentGradefile.totalUnit/total)*100)>100 ? "100" : (studentGradefile.totalUnit/total)*100}%"></div>
			</div>
		</div>
		<br> <br> <br> <br> <br>

		<div class="progress-wrap">
			<p style="font-size: 18px; font-weight: bold;">>&nbsp 전공
				${studentGradefile.majorUnit}/${departmentMajorRule.mustPlusChoice}</p>
			<div class="progressbar progressbar-green" style="float: left">
				<div class="progressbar-inner"
					style="width:${((studentGradefile.majorUnit/departmentMajorRule.mustPlusChoice)*100)>100 ? "100" : (studentGradefile.majorUnit/departmentMajorRule.mustPlusChoice)*100}%"></div>
			</div>
			<br> <br>
			<p style="font-size: 16px; font-weight: bold;">＊ 전공 필수</p>
			<p
				style="font-size: 12px; float: right; margin-right: 200px; color: #ac0; font-weight: bold;">수강한
				과목은 색으로 표시됩니다</p>
			<div style="margin-right: 200px">
				<table class="table">
					<thead>
						<tr style="height: 30px;">
							<th scope="col" class="text-center">과목이름</th>
							<th scope="col" class="text-center">학점</th>
							<th scope="col" class="text-center">성적</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="major" items="${ mustmajor2 }">
							<c:set var="loop_flag" value="false" />
							<c:set var="check" value="false" />
							<c:forEach var="studentSubjectGrade" items="${ mustMajor }">
								<c:if test="${not loop_flag }">
									<c:set var="color" value="#FFFFFF" />
									<c:if
										test="${ major.majorSubjectId == studentSubjectGrade.subjectId}">
										<c:set var="color" value="#E1F5A9" />
										<c:set var="loop_flag" value="true" />
										<c:set var="check" value="true" />
										<c:set var="grade" value="${ studentSubjectGrade.grade }" />
									</c:if>
								</c:if>
							</c:forEach>
							<tr style="background-color:${color}">
								<td>${ major.majorName }</td>
								<td>${ major.subjectScore }</td>
								<td>${ check.equals("true") ? grade : "" }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<br> <br>

		<div>
			<p style="font-size: 18px; font-weight: bold;">>&nbsp 교양
				${studentGradefile.cultureUnit}/${culture+departmentMajorRule.addCulture}</p>
			<div class="progressbar progressbar-green" style="float: left">
				<div class="progressbar-inner"
					style="width:${((studentGradefile.cultureUnit/(culture+departmentMajorRule.addCulture))*100)>100 ? "100" : (studentGradefile.cultureUnit/(culture+departmentMajorRule.addCulture))*100}%"></div>
			</div>
			<br> <br>
			<p style="font-size: 16px; font-weight: bold; float: left;">＊ 교양
				필수 :&nbsp</p>
			<p style="font-size: 16px; float: left;">기도모임(비아메디아채플)
			<p
				style="color: Green; font-size: 16px; font-weight: bold; float: left;">&nbsp
				${chapelSubject}</p>
			<p style="float: left; font-size: 16px;">&nbsp/
				${requiredCultureCount.chapelCount} 회, 사회봉사
			<p
				style="color: Green; font-size: 16px; font-weight: bold; float: left;">&nbsp
				${serveSubject}</p>
			<p style="float: left; font-size: 16px;">&nbsp/
				${requiredCultureCount.serveCount} 회</p>

			<div style="margin-right: 200px">
				<table class="table">
					<thead>
						<tr style="height: 30px;">
							<th scope="col" class="text-center">과목이름</th>
							<th scope="col" class="text-center">학점</th>
							<th scope="col" class="text-center">성적</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="studentSubjectGrade" items="${ mustCulture }">
							<tr>
								<td style="width: 500px;">${ studentSubjectGrade.subjectName }</td>
								<td>${ studentSubjectGrade.subjectScore }</td>
								<td>${ studentSubjectGrade.grade }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
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
</body>

</html>