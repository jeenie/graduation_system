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
	
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$('#btn-delete-row').click(function() {
    $('#mytable > tbody:last > tr:last').remove();
    $
  });


function rowDelete(value){
	location.href="substidelete?abolitionId="+value;
}
</script>

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
	padding: 6px 15px;
	background: #1BBD36;
	color: #fff;
	border-radius: 4px;
	border: none;
	margin-top: 0;
}

/*status 페이지에서 사용할 css*/
/*font*/
.boldfont18 {
	font-weight: bold;
	font-size: 18px;
}
</style>
<body>
	<%@ include file="/WEB-INF/views/include/studentNavibar.jsp"%>
	<div id="breadcrumb">
		<div class="container">
			<div class="breadcrumb">
				<li></li>
				<li style="font-size: 18px; margin-left: -5px;">대체 과목/타전공 인정 현황</li>
			</div>
			<hr>
		</div>
	</div>

	<div class="contents">
		<p class="boldfont18">
			대체 과목 현황 <a href="${R}student/substitute/abolition"> <span
				style="float: right; font-size: 25px; font-weight: bold; margin-right: 20px">+</span>
			</a>
		</p> 
		<table class="table table-hover" id="mytable">
			<thead>
				<tr>
					
					<th scope="col" class="text-center">담당 학과</th>
					<th scope="col" class="text-center">폐지과목명</th>
					<th scope="col" class="text-center">대체과목명</th>
					<th scope="col" class="text-center"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="substitutionStatus" items="${ substiStatus }">
					<tr>
						<td>${ substitutionStatus.departmentName }</td>
						<td>${ substitutionStatus.abolitionSubjectName }</td>
						<td>${ substitutionStatus.substitutionSubjectName }</td>
						<td><a href="<c:url value="substidelete?abolitionId=${substitutionStatus.abolitionSubject}" />" 
				onclick="if(!confirm('삭제 하시겠습니까?')){return false;}">x</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br /> <br />
		<p class="boldfont18">
			타전공 인정 현황 <a href="${R}student/otherMajor"> <span
				style="float: right; font-size: 25px; font-weight: bold; margin-right: 20px">+</span>
			</a>
		</p>
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col" class="text-center">타학과</th>
					<th scope="col" class="text-center">과목코드</th>
					<th scope="col" class="text-center">전공과목명</th>
					<th scope="col" class="text-center">학점</th>
					<th scope="col" class="text-center">수강일시</th>
					<th scope="col" class="text-center">이수구분</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="otherMajorStatus" items="${ majorStatus }">
					<tr>
						<td>${ otherMajorStatus.departmentName }</td>
						<td>${ otherMajorStatus.anotherMajorId }</td>
						<td>${ otherMajorStatus.otherMajorName }</td>
						<td>${ otherMajorStatus.score }</td>
						<td>${ otherMajorStatus.year }년${ otherMajorStatus.semester }학기</td>
						<td>${ otherMajorStatus.type }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>