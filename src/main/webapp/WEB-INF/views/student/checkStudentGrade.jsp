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
th, td {
	text-align: center;
	vertical-align: middle;
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
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/studentNavibar.jsp"%>

	<div id="breadcrumb">
		<div class="container">
			<div class="breadcrumb">
				<li></li>
				<li style="font-size: 18px; margin-left: -5px;">성적 조회</li>
			</div>
			<hr>
		</div>
	</div>
	<br>
	<div style="margin-right: 150px; margin-left: 150px;">
		<div class="privacy">
			<table class="table">
				<tr bgcolor="#E1F5A9">
					<th>학과</th>
					<th>학년</th>
					<th>학번</th>
					<th>이름</th>
				</tr>
				<tr data-url="checkGrades?id=${ student.id }">
					<td>${ student.departmentName }</td>
					<td>${ student.grade }</td>
					<td>${ student.id }</td>
					<td>${ student.name }</td>
				</tr>
			</table>
		</div>
		<hr>
		<div class="gradeCheck">
			<table class="table">
				<tr bgcolor="#E1F5A9">
					<th>년도</th>
					<th>학기</th>
					<th>과목코드</th>
					<th>과목명</th>
					<th>이수구분</th>
					<th>학점</th>
					<th>성적등급</th>
				</tr>
				<c:forEach var="grade" items="${ grades }">
					<tr data-url="checkGrades?id=${ grade.id }">
						<td>${ grade.yearOfClass }</td>
						<td>${ grade.yearOfSemester }</td>
						<td>${ grade.subjectId }</td>
						<td>${ grade.subjectName }</td>
						<td>${ grade.completeType }</td>
						<td>${ grade.subjectScore }</td>
						<td>${ grade.grade }</td>
					</tr>
				</c:forEach>
			</table>
			<table class="table">
				<tr bgcolor="#D5D5D5">
					<th style="width: 500px">전체 취득학점</th>
					<th>전체 평점</th>
				</tr>
				<tr>
					<td>${ totalG.totalUnit }</td>
					<td>${ totalG.totalAvgGrade }</td>
				</tr>
			</table>
			<hr>
			<div class="total">
				<table class="table">
					<tr bgcolor="#E1F5A9">
						<th>전필</th>
						<th>전선</th>
						<th>교필</th>
						<th>교선</th>
						<th>합계</th>
					</tr>
					<tr>
						<td>${ totalRM.totalRequiredMajor }</td>
						<td>${ totalSM.totalSelectedMajor }</td>
						<td>${ totalRC.totalRequiredCulture }</td>
						<td>${ totalSC.totalSelectedCulture }</td>
						<td>${ totalG.totalUnit }</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<br>
	<br>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>