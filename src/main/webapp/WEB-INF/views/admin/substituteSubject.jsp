<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
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
	
	.btn-submit {
	padding: 6px 15px;
	background: #1BBD36;
	color: #fff;
	border-radius: 4px;
	border: none;
	margin-top: 0;
	}
</style>
	<script type="text/javascript" language="javascript">
		var params = { st: $("input[name=st]").val(), ss: $("select > option:selected").val()};
		var url = 'popup?ss=' + params.ss + '&st=' + params.st;
		var auto_refresh = setInterval(
				function() {
					$('#result').load(url).fadeIn('slow');
				}, 5000		
		);
		
		$(document).ready(function(){
	        $.ajax({
	             
	            type : "GET",
	            url : "popup?ss=0&st=",
	            dataType : "text",
	            error : function(){
	                alert('통신실패!!');
	            },
	            success : function(data){
	                $("#result").html(data) ;
	            }
	             
	        });
	    });
	</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/adminNavibar.jsp" %>

	<div id="breadcrumb">
		<div class="container">
			<div class="breadcrumb">
				<li></li>
				<li style="font-size: 20px; margin-left: -5px;">대체과목 관리</li>
			</div>
			<hr>
		</div>
	</div>
	<div class="aboutus">
		<div class="container">
			<div style="margin-top: 30px">
				<div class="contents" style="text-align: center;">
					<div style="text-align: left;">
						<form action="findSubject" autocomplete=off>
							&nbsp; 과목명 :&nbsp;<input type="text" name="subject" value="${subject}">&nbsp;
							<button type="submit" class="inquiry_btn warning">조회</button>
							<!--<a data-toggle="modal" href="#professorAdd"><button type="button" class="btn-statement4">추가</button></a>-->
							<a data-toggle="modal" href="#addSubject" class="btn btn-submit">추가</a>

						</form>

					</div>

					<br>
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col" class="text-center">담당 학과</th>
								<th scope="col" class="text-center">폐지과목명</th>
								<th scope="col" class="text-center">대체과목명</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="substitutionSubject" items="${ substitutionSubjectList }">

								<!--<tr data-toggle="modal" data-id="professorDelete" data-target="#professorDelete">-->
								<tr>
									<td>${ substitutionSubject.departmentName }</td>
									<td>${ substitutionSubject.abolitionSubjectName }</td>
									<td>${ substitutionSubject.substitutionSubjectName}</td>
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
	
	<div class="modal fade" id="addSubject" tabinex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="padding-bottom: 1.5px;">
					<h4>
						<b>대체 과목 추가</b>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
							</button>
						</h4>
				</div>
				<div class="modal-body">
					<form:form method="post" modelAttribute="substitutionSubject">
						<div class="form-group">
							<label>담당학과</label>
							<form:select path="departmentId" class="form-control w200" itemValue="id" itemLabel="departmentName" items="${departments}"/>
						</div>
						<div class="form-group">
							<label>폐지과목</label>
							<form:input path="abolitionSubject" class="form-control w505"/>
							<a data-toggle="modal" href="#find" class="btn btn-submit" style="float:right; margin-top:-33px">찾기</a>
						</div>
						<div class="form-group">
							<label>대체과목</label>
							<form:input path="substitutionSubject" class="form-control w505"/>
							<a data-toggle="modal" href="#find" class="btn btn-submit" style="float:right; margin-top:-33px">찾기</a>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="find" tabinex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="padding-bottom: 1.5px;">
					<h4>
						<b>과목 찾기</b>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
							</button>
						</h4>
				</div>
				<div class="modal-body">
					<form action="SubstitutionSubject/popup" id="searchSubject">
						<div class="form-group">
							<select class="form-control" name="ss" style="float:left; margin-right:5px; width:110px">
								<option value="0">과목코드</option>
								<option value="1">과목명</option>
							</select>
							<input type="text" name="st" value="${st}" class="form-control w250" style="display:inline; float:left; margin-right:5px" maxlength="20">
						</div>
						<button type="submit" class="btn btn-submit" onclick="searchSubject();">조회</button>
					</form>
					<div id="result">
					</div>
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

	<script>
	//	function searchSubject() {
			//alert("함수실행ok");
	//		var params = { st: $("input[name=st]").val(), ss: $("select > option:selected").val()};
	//		console.log(params);
	//		$("#result").load("searchSubject", params);
	//	}
	</script>

</body>
</html>