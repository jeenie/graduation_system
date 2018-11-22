<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<link href="${R}res/css/style.css" rel="stylesheet" />

<!-- font awesome-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">

<script type="text/javascript">
	function button_event(value) {
		if(confirm("해당 교수의 정보를 삭제하시겠습니까?")==true) {
			location.href="professorDelete?id="+value;
		}else{
			return;
		}
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
	width: 1000px;
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
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/adminNavibar.jsp" %>

	<div id="breadcrumb">
		<div class="container">
			<div class="breadcrumb">
				<li></li>
				<li style="font-size: 20px; margin-left: -5px;">교수 조회</li>
			</div>
			<hr>
		</div>
	</div>
	<div class="aboutus">
		<div class="container">
			<div style="margin-top: 30px">
				<div class="contents" style="text-align: center;">
					<div style="text-align: left;">
						<form action="professorSearch" autocomplete=off>
							&nbsp; 이름 :&nbsp;<input type="text" name="name" value="${name}">
							&nbsp; 사번 :&nbsp;<input type="text" name="id" value="${id }">
							&nbsp; 소속학과 :&nbsp;<input type="text" name="departmentName" value="${departmentName }"> &nbsp;
							<button type="submit" class="inquiry_btn warning">조회</button>
							<!--<a data-toggle="modal" href="#professorAdd"><button type="button" class="btn-statement4">추가</button></a>-->
							<a href="professorAdd"><button type="button"
									class="btn-statement4">추가</button></a>

						</form>

					</div>

					<br>
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col" class="text-center">사번</th>
								<th scope="col" class="text-center">이름</th>
								<th scope="col" class="text-center">소속학과</th>
								<th scope="col" class="text-center">이메일</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="professor" items="${ professors }">

								<!--<tr data-toggle="modal" data-id="professorDelete" data-target="#professorDelete">-->
								<tr onclick="button_event(${professor.id});">
									<td>${ professor.id }</td>
									<td>${ professor.name }</td>
									<td>${ professor.departmentName }</td>
									<td>${ professor.email }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<!--pagination-->
					<div class="pagination">
						<a href="#">&laquo;</a> <a href="#">1</a> <a href="#">2</a> <a
							href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">&raquo;</a>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div class="modal fade" id="professorAdd" tabinex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="padding-bottom: 1.5px;">

					<h4>
						<b>교수추가</b>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
						</button>
					</h4>

				</div>
				<div class="modal-body">
					<img src="images/abouti/professor-1.png"
						style="width: 180px; height: 200px; float: left; border-radius: 5px; padding-right: 20px;">

					<p>
						사번<input type="text" class="form-control" name="professorNum"
							style="width: 250px">
					</p>
					<p>
						이름<input type="text" class="form-control" style="width: 250px">
					</p>
					<p>
						소속 학과 <select name="department" class="form-control"
							style="width: 250px">
							<option>소프트웨어공학과</option>
							<option>컴퓨터공학과</option>
							<option>IT융합자율학부</option>
						</select>
					</p>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="alert('해당교수에 대한 정보를 추가하시겠습니까?')">추가</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="professorDelete" tabinex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="padding-bottom: 1.5px;">

					<h4>
						<b>교수삭제</b>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
						</button>
					</h4>

				</div>
				<div class="modal-body">
					<img src="images/abouti/professor-1.png"
						style="width: 180px; height: 200px; float: left; border-radius: 5px; padding-right: 20px;">

					<p>
						사번<input type="text" class="form-control" value="20100000"
							name="professorNum" style="width: 250px">
					</p>
					<p>
						이름<input type="text" class="form-control" value="홍은지"
							style="width: 250px">
					</p>
					<p>
						소속 학과 <select name="department" class="form-control"
							style="width: 250px">
							<option>소프트웨어공학과</option>
							<option>컴퓨터공학과</option>
							<option>IT융합자율학부</option>
						</select>
					</p>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="alert('해당교수에 대한 정보를 삭제하시겠습니까?')">삭제</button>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/include/footer.jsp" %>

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