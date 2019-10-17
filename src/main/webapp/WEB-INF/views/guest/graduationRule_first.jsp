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
<link rel="stylesheet" href="${R}res/css/custom.css">
<link rel="stylesheet" href="https://icono-49d6.kxcdn.com/icono.min.css">
<link href="${R}res/css/prettyPhoto.css" rel="stylesheet">
<link href="${R}res/css/style.css" rel="stylesheet" />
<link rel="stylesheet" href="${R}res/css/prism.css">
<link href="${R}res/css/zooTree.css" rel="stylesheet" />
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


.contents {
	margin-top: 5px;
	margin-right: 100px;
	margin-left: 225px;
	margin-bottom: 250px;
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

.font25 {
	margin-top: 6px;
	margin-right: 5px;
	float: left;
	font-weight: bold;
	font-size: 15px;
}


.font3 {
	font-weight: bold;
	font-size: 16px;
}

.font4 {
	margin-top: 6px;
	margin-right: 5px;
	float: left;
	font-weight: bold;
	font-size: 16px;
}

.font5 {
	font-weight: bold;
	font-size: 15px;
}

.font6 {
	font-weight: bold;
	font-size: 14px;
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

.selectMajor {
	display: none;
}
</style>
  <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
  <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
  <script src="${R}res/js/zooTree.js"></script>
  <script>
		function alertGuest() {
			alert("로그인 후 이용해주세요.");
		}
	</script>
	<script>
		$(document).ready(function(){
			var departmentId;
			var entranceYear;
			$('#departmentId').on('change', function() {
				departmentId = this.value;
				//alert(departmentId);
			});
			$('#entranceYear').on('change', function() {
				if(this.value == 2018){
					alert("18학번은 학부로 조회해주시기 바랍니다.");
				}
			});
			$('#departmentId').on('change', function() {
				if(this.value >= 35) {
					$('.selectMajor').show();
				} else
					$('.selectMajor').hide();
			})
		});
	</script>
</head>
<body>
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
							<a href="${R}"><h1>
									<span>SKHU</span>졸업관리시스템
								</h1></a>
						</div>
					</div>

					<div class="navbar-collapse collapse">
						<div class="menu">
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation"><a
									href="${R}guest/graduationRule">졸업요건</a></li>
								<li role="presentation" class="dropdown"><a
									href="${R}guest/login">졸업관리</a>
									<div class="dropdown-content">
										<a href="${R}guest/login" onclick="alertGuest()">나의 졸업현황</a> <a
											href="${R}guest/login" onclick="alertGuest()">성적조회</a> <a
											href="${R}guest/login" onclick="alertGuest()">대체/타전공 현황</a>
									</div></li>
								<li role="presentation"><a href="http://www.skhu.ac.kr">학교홈페이지</a></li>
								<li role="presentation"><a
									href="https://forest.skhu.ac.kr/">종합정보시스템</a></li>
								<li role="presentation"><a href="${R}guest/login">Login</a></li>
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
				<li style="font-size: 18px; margin-left: -5px;">졸업 요건 안내</li>
			</div>
		</div>
	</div>

	<div class="contents" id="app">

		<p class="font3">전체 학생</p>
		<div class="form-group" style="margin-left: 20px;">
			<p class="font2">총 졸업 학점</p>
			<input type="number" value="${total}" class="form-control"
				style="width: 70px" name="all_grade" value="130" readonly />
		</div>
		<div class="form-group" style="margin-top: -18px">
			<br />
			<div style="margin-left: 20px;">
				<div class="form-group" style="float: left; margin-bottom: 0px;">
					<p class="font2">기도모임(비아메디아채플)</p>
					<input type="number" name="chapelCount" value="${chapelCount}"
						class="form-control"
						style="width: 45px; padding-top: 2px; padding-left: 10px; padding-right: 0px;"
						readonly />
				</div>
				<div class="form-group" style="float: left; margin-bottom: 0px;">
					<p class="font2" style="margin-bottom: 0px;">회,</p>
				</div>
			</div>
			<div style="margin-left: 30px">
				<div class="form-group" style="float: left; margin-bottom: 0px;">
					<p class="font2">사회봉사</p>
					<input type="number" name="serveCount" value="${serveCount}"
						class="form-control"
						style="width: 45px; padding-top: 2px; padding-left: 10px; padding-right: 0px;"
						readonly />
				</div>
				<div class="form-group" style="float: left; margin-bottom: 0px;">
					<p class="font2" style="margin-bottom: 0px;">회</p>
				</div>
			</div>
		</div>
		<form action="select">
			<div style="margin-top: 40px">
				<div class="form-group"
					style="float: left; margin-right: 20px; margin-bottom: 5px;">
					<p class="font4">학번</p>
					<select name="entranceYear" class="form-controls w200" id="entranceYear">
						<option value="99">선택</option>
						<c:forEach var="year" items="${years}">
							<option value="${year.year}"
								${entranceYear == year.year ? "selected" : ""}>${year.year}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group"
					style="float: left; margin-right: 20px; margin-bottom: 5px;">
					<p class="font4">학과 및 학부</p>
					<select v-model="deptId" @change="onChangeDeptId($event)" name="departmentId" class="form-controls w200" id="departmentId">
						<option disabled value="">선택</option>
						<option v-for="dept in departments" v-bind:value="dept.id">
							{{ dept.departmentName }} 
						</option>
					</select>
				</div>
				
				<!-- (18학번 이후 적용) 전공 선택 -->
				<div class="form-group  selectMajor"
					style="float: left; margin-right: 20px; margin-bottom: 5px;">
					<p class="font4">전공 선택</p>
					<select class="form-controls w200">
						<option disabled value="">선택</option>
						<option value="99">전체 조회</option>
						<option v-for="major in majorList" v-bind:value="major.majorId">
							{{ major.majorName }}
						</option>
					</select>
				</div>
				
				<button type="submit" class="btn-submit" id="selectRule"
					style="margin-left: 0; margin-top: 0; padding: 5px 20px; float: left;" onclick="">조회</button>
			</div>
		</form>
		<div class="blank" style="margin-bottom:400px"></div>
	</div>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	
	
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="${R}res/js/bootstrap.min.js"></script>
  <script src="${R}res/js/jquery.prettyPhoto.js"></script>
  <script src="${R}res/js/jquery.isotope.min.js"></script>
  <script src="${R}res/js/wow.min.js"></script>
  <script src="${R}res/js/functions.js"></script>
  <script src="${R}res/js/prism.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/vue"></script> 
  <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.min.js"></script>
  <script type="text/javascript">
  	var app = new Vue({
  		el: '#app',
  		data: {
  			deptId: '',
  			departments: [],
  			majorList: []
  		},
  		methods: {
  			onChangeDeptId(event) {
  				console.log(event.target.value);
  				let url = '/findMajorListByDeptId?deptId=' + Number(event.target.value);
  				axios.get(url).then(response => {
  					this.majorList = response.data;
  				})
  			}
  		},
  		mounted() {
			let url = '/findAllDepartment';
			let url2 = '/findMajorListByDeptId?deptId=' + Number(this.deptId);
			axios.get(url).then(response => {
				this.departments = response.data;
	 			console.log(this.departments);
			})
			axios.get(url2).then(response => {
				this.majorList = response.data; 
				console.log(this.majorList);
			})
  		}
  	})
  </script>
</body>
</html>