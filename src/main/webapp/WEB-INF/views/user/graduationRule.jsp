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
<link rel="stylesheet" href="https://icono-49d6.kxcdn.com/icono.min.css">
<link href="${R}res/css/prettyPhoto.css" rel="stylesheet">
<link href="${R}res/css/custom.css" rel="stylesheet">
<link href="${R}res/css/style.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">

<style>


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

.contents {
	margin-top: 5px;
	margin-right: 100px;
	margin-left: 140px;
	margin-bottom: 150px;
}

select.form-control.w200 {
	width: 200px;
	float: left;
}

.font1 {
	margin-top: 6px;
	margin-right: 5px;
	float: left;
	font-weight: bold;
	font-size: 17px;
}

.font2 {
	margin-top: 6px;
	margin-right: 5px;
	float: left;
	font-weight: bold;
	font-size: 14px;
}

.font3 {
	font-weight: bold;
	font-size: 14px;
	margin: 0;
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

	<div id="breadcrumb">
		<div class="container">
			<div class="breadcrumb">
				<li></li>
				<li style="font-size: 18px; margin-left: -5px;">졸업 요건 안내</li>
			</div>
		</div>
	</div>

	<div class="contents">
		<div class="form-group">
			<p class="font2">전체 졸업 학점</p>
			<input type="number" value="${total}" class="form-control"
				style="width: 70px" name="all_grade" value="130" readonly />
		</div>
		<br />
		<form>
			<div>
				<div class="form-group"
					style="float: left; margin-right: 20px; margin-bottom: 5px;">
					<p class="font2">학과</p>
					<select name="departmentId" class="form-control w200">
						<option value="99">선택</option>
						<option value="28" ${departmentId == "28" ? "selected" : ""}>신문방송학과</option>
						<option value="29" ${departmentId == "29" ? "selected" : ""}>경영학부</option>
						<option value="30" ${departmentId == "30" ? "selected" : ""}>디지털컨텐츠학과</option>
						<option value="31" ${departmentId == "31" ? "selected" : ""}>컴퓨터공학과</option>
						<option value="32" ${departmentId == "32" ? "selected" : ""}>소프트웨어공학과</option>
						<option value="33" ${departmentId == "33" ? "selected" : ""}>정보통신공학과</option>
						<option value="34" ${departmentId == "34" ? "selected" : ""}>글로컬IT학과</option>
						<option value="35" ${departmentId == "35" ? "selected" : ""}>인문융합자율학부</option>
						<option value="36" ${departmentId == "36" ? "selected" : ""}>사회융합자율학부</option>
						<option value="37" ${departmentId == "37" ? "selected" : ""}>미디어컨텐츠융합학부</option>
						<option value="38" ${departmentId == "38" ? "selected" : ""}>IT융합자율학부</option>
					</select>
				</div>
				<div class="form-group"
					style="float: left; margin-right: 20px; margin-bottom: 5px;">
					<p class="font2">학번</p>
					<select name="entranceYear" class="form-control w200">
						<option value="99" label="선택" />
						<option value="2010" ${entranceYear == "2010" ? "selected" : ""}>
							2010학번</option>
						<option value="2011" ${entranceYear == "2011" ? "selected" : ""}>
							2011학번</option>
						<option value="2012" ${entranceYear == "2012" ? "selected" : ""}>
							2012학번</option>
						<option value="2013" ${entranceYear == "2013" ? "selected" : ""}>
							2013학번</option>
						<option value="2014" ${entranceYear == "2014" ? "selected" : ""}>
							2014학번</option>
						<option value="2015" ${entranceYear == "2015" ? "selected" : ""}>
							2015학번</option>
						<option value="2016" ${entranceYear == "2016" ? "selected" : ""}>
							2016학번</option>
						<option value="2017" ${entranceYear == "2017" ? "selected" : ""}>
							2017학번</option>
						<option value="2018" ${entranceYear == "2018" ? "selected" : ""}>
							2018학번</option>
					</select>
				</div>
				<button type="submit" class="btn-submit"
					style="margin-left: 0; margin-top: 0; padding: 5px 20px; float: left;">조회</button>
			</div>
		</form>
		<br /> <br />
		<c:if test="${departmentId == 32}">
			<div style="margin-top: 10px; margin-left: 20px;">
				<p style="">
				<div class="form-group" style="float: left; margin-bottom: 0px;">
					<p class="font2">전필</p>
					<input type="number" value="${firstRule.mustMajor}"
						class="form-control"
						style="width: 40px; padding-top: 2px; padding-left: 10px; padding-right: 0px;"
						readonly />
				</div>
				<div class="form-group" style="float: left; margin-bottom: 0px;">
					<p class="font2">학점을 포함하여 전공</p>
					<input type="number" value="${firstRule.mustPlusChoice}"
						class="form-control"
						style="width: 45px; padding-top: 2px; padding-left: 10px; padding-right: 0px; margin-right: 0;"
						readonly />
				</div>
				<div class="form-group" style="float: left; margin-bottom: 0px;">
					<p class="font2" style="margin-bottom: 0px;">학점</p>
				</div>
				</p>
				<br /> <br />
				<div>
					<div class="form-group" style="float: left">
						<div style="width: 330px;">
							<p class="font3">
								전공필수과목 <a data-toggle="modal" href="#addMajorSubject"><span
									style="float: right; font-size: 25px; font-weight: bold; margin-right: 20px">+</span></a>
							</p>
						</div>
						<div class="list-group"
							style="width: 330px; margin-top: 10px; margin-left: -5px;">
							<a href="#" class="list-group-item list-group-item-action">
								C프로그래밍1 <span style="float: right;">&times;</span>
							</a> <a href="#" class="list-group-item list-group-item-action">웹페이지구축1
								<span style="float: right;">&times;</span>
							</a> <a href="#" class="list-group-item list-group-item-action">컴퓨터
								구조 <span style="float: right;">&times;</span>
							</a> <a href="#" class="list-group-item list-group-item-action">자바프로그래밍
								<span style="float: right;">&times;</span>
							</a> <a href="#" class="list-group-item list-group-item-action">자료구조
								<span style="float: right;">&times;</span>
							</a> <a href="#" class="list-group-item list-group-item-action">운영체제론
								<span style="float: right;">&times;</span>
							</a>
						</div>
					</div>
					<div class="form-group" style="float: left; margin-left: 50px;">
						<div style="width: 330px;">
							<p class="font3">
								학과지정교양 <a data-toggle="modal" href="#addMajorLiberal"><span
									style="float: right; font-size: 25px; font-weight: bold; margin-right: 20px">+</span></a>
							</p>
						</div>
						<div class="list-group"
							style="width: 330px; margin-top: 10px; margin-left: -5px;">
							<a href="#" class="list-group-item list-group-item-action">
								이산수학 <span style="float: right;">&times;</span>
							</a> <a href="#" class="list-group-item list-group-item-action">정보사회론
								<span style="float: right;">&times;</span>
							</a> <a href="#" class="list-group-item list-group-item-action">대학수학
								<span style="float: right;">&times;</span>
							</a> <a href="#" class="list-group-item list-group-item-action">컴퓨터활용
								<span style="float: right;">&times;</span>
							</a>
						</div>
					</div>
				</div>
			</div>
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<div style="margin-top: 0px; margin-left: 20px;">
				<p style="">
				<div class="form-group" style="float: left; margin-bottom: 0px;">
					<p class="font2">교필</p>
					<input type="number" class="form-control"
						style="width: 60px; margin-right: 0;" name="major_necessary"
						value="10" />
				</div>
				<div class="form-group" style="float: left; margin-bottom: 0px;">
					<p class="font2">학점을 포함하여 교양</p>
					<input type="number" class="form-control"
						style="width: 60px; margin-right: 0;" name="major_total"
						value="31" />
				</div>
				<div class="form-group" style="float: left; margin-bottom: 0px;">
					<p class="font2" style="margin-bottom: 0px;">학점</p>
				</div>
				</p>
				<br /> <br />
				<p>
				<div class="form-group" style="">
					<div style="width: 330px;">
						<p class="font3">
							교양필수과목 <a data-toggle="modal" href="#addSubject"><span
								style="float: right; font-size: 25px; font-weight: bold; margin-right: 20px">+</span></a>
						</p>
					</div>
					<div class="list-group"
						style="width: 330px; margin-top: 10px; margin-left: -5px;">
						<a href="#" class="list-group-item list-group-item-action">
							대학생활세미나1 <span style="float: right;">&times;</span>
						</a> <a href="#" class="list-group-item list-group-item-action">대학생활세미나2
							<span style="float: right;">&times;</span>
						</a> <a href="#" class="list-group-item list-group-item-action">말과
							글 <span style="float: right;">&times;</span>
						</a> <a href="#" class="list-group-item list-group-item-action">사회봉사1
							<span style="float: right;">&times;</span>
						</a> <a href="#" class="list-group-item list-group-item-action">기도모임
							<span style="float: right;">&times;</span>
						</a> <a href="#" class="list-group-item list-group-item-action">기도모임
							<span style="float: right;">&times;</span>
						</a>
					</div>
				</div>
				</p>
			</div>
			<br />
			<div style="margin-left: 20px">
				<p>
				<div class="form-group" style="float: left; margin-bottom: 0px;">
					<p class="font2">전공과정</p>
				</div>
				</p>
				<br /> <br />
				<c:forEach var="departmentMajorRule" items="${departmentMajorRules}">
					<div style="margin-left: 40px">
						<p class="font3">▶${departmentMajorRule.processName}</p>
						<div style="margin-left: 30px">
							<div class="form-group" style="float: left; margin-bottom: 0px;">
								<p class="font2">전필</p>
								<input type="number" value="${departmentMajorRule.mustMajor}"
									class="form-control"
									style="width: 45px; padding-top: 2px; padding-left: 10px; padding-right: 0px;"
									readonly />
							</div>
							<div class="form-group" style="float: left; margin-bottom: 0px;">
								<p class="font2">학점과 전선</p>
								<input type="number" value="${departmentMajorRule.choiceMajor}"
									class="form-control"
									style="width: 45px; padding-top: 2px; padding-left: 10px; padding-right: 0px; margin-right: 0;"
									readonly />
							</div>
							<div class="form-group" style="float: left; margin-bottom: 0px;">
								<p class="font2">학점을 포함하여 전공</p>
								<input type="number"
									value="${departmentMajorRule.mustPlusChoice}"
									class="form-control"
									style="width: 45px; padding-top: 2px; padding-left: 10px; padding-right: 0px; margin-right: 0;"
									readonly />
							</div>
							<div class="form-group" style="float: left; margin-bottom: 0px;">
								<p class="font2" style="margin-bottom: 0px;">학점</p>
							</div>
						</div>
					</div>
					<br />
					<br />
				</c:forEach>
			</div>
		</c:if>

	</div>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>