<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
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

<script type="text/javascript">
	function button_event(value) {
		location.href="sublist?subjectId="+value;
	}

</script>
<!-- 
<script type="text/javascript" src="substituteEdit.js"></script>
 -->

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

/* Add a grey background color on mouse-over */
.pagination

	 
	
a

	
:hover

	
:not

	 
	
(
.active

	 
	
)
{
background-color

	
:

	 
	
#ddd

	
;
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
	height: 40px;
	width: 70px;
	padding: 6px 15px;
	background: #1BBD36;
	color: #fff;
	border-radius: 4px;
	border: none;
	margin-top: 0;
	float: right;
	margin-right: 120px;
}

/*status 페이지에서 사용할 css*/
/*font*/
.boldfont18 {
	font-weight: bold;
	font-size: 18px;
}
/*substitute 페이지에서 사용할 css*/
.contents {
	margin-top: 5px;
	margin-right: 100px;
	margin-left: 90px;
	height: 650px;
}

.divide {
	margin-top: 20px;
	margin-left: 60px;
	margin-right: 60px;
	height: 520px;
}

.left_sec {
	margin-left: 0px;
	float: left;
	width: 300px;
	height: 520px;
}

.abolish_list {
	margin-top: 40px;
	float: left;
	border: 2px solid #1BBD36;
	width: 400px;
	height: 400px;
}

.right_sec {
	margin-right: 0px;
	float: right;
	width: 300px;
	height: 520px;
}

.alternative_list {
	margin-top: 40px;
	float: right;
	border: 2px solid #1BBD36;
	width: 420px;
	height: 400px;
}

.myLavel {
	margin-left: 100px;
	font-weight: bold;
	font-size: 22px;
}

.myLavel2 {
	margin-right: 100px;
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

.
{
float
 
:
 
right
;

      
margin-top
:
 
-50
px
;

      
margin-right
:
 
60
px
;

    
}
th {
	text-align: center;
}
</style>
<body>
	<%@ include file="/WEB-INF/views/include/studentNavibar.jsp"%>
	<div id="breadcrumb">
		<div class="container">
			<div class="breadcrumb">
				<li></li>
				<li style="font-size: 18px; margin-left: -5px;">대체 과목 등록</li>
			</div>
			<hr>
		</div>
	</div>

	<div class="contents">
		<div class="divide">
			<div class="left_sec">
				<p class="myLavel">C+ 이하 폐지 과목</p>
				<div class="abolish_list">
					<table class="table table-hover">
						<thead>
							<th>과목코드</th>
							<th>폐지과목명</th>
							<th>학점</th>
							<th>개설학과</th>
						</thead>
						<tbody>
							<c:forEach var="substitutionSubject" items="${ abolitionList }">
								<tr
									data-url="sublist?abolitionId=${ substitutionSubject.abolitionSubject }"
									style=${abolitionId == substitutionSubject.abolitionSubject ? "background-color:#ffe" : ""}>
									<td>${ substitutionSubject.abolitionSubject }</td>
									<td>${ substitutionSubject.abolitionSubjectName }</td>
									<td>${ substitutionSubject.grade }</td>
									<td>${ substitutionSubject.departmentName }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div style="float: left; width: 178px; height: 565px">
				<span class="selectSpan"
					style="margin-top: 250px; margin-left: 150px; height: 40px; width: 40px; display: block; position: relative;"></span>
			</div>
			<div class="right_sec">
				<p class="myLavel2">대체 과목 목록</p>
				<div class="alternative_list">
					<table class="table table-hover">
						<thead>
							<th>과목코드</th>
							<th>대체과목명</th>
							<th>개설학과</th>
						</thead>
						<tbody>
							<c:forEach var="subSubject" items="${ substitutionList }">
								<c:set var="loop_flag" value="false" />
								<c:forEach var="studentSubject" items="${ studentSubjectList }">
									<c:if test="${not loop_flag }">
										<c:set var="color" value="#FFFFFF" />
										<c:if
											test="${ subSubject.substitutionSubject == studentSubject.subjectId}">
											<c:set var="color" value="#E1F5A9" />
											<c:set var="loop_flag" value="true" />

										</c:if>
									</c:if>
								</c:forEach>
								<tr
									data-url="insert?abolitionId=${ abolitionId }&substitutionId=${ subSubject.substitutionSubject}"
									style="background-color:${color}"
									onclick="confirm('해당 과목으로 대체하시겠습니까?')">
									<td>${ subSubject.substitutionSubject }</td>
									<td>${ subSubject.substitutionSubjectName }</td>
									<td>${ subSubject.departmentName }</td>
								</tr>

							</c:forEach>
						</tbody>
					</table>

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
	<script src="${R}res/js/StudentSubstitution.js"></script>

</body>
</html>