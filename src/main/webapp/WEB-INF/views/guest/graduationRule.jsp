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
	margin-left: 225px;
	margin-bottom: 100px;
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
			var departmentId = $('#departmentId option:selected').val();
			var entranceYear;
			$('#departmentId').on('change', function() {
				departmentId = this.value;
				//alert(departmentId);
			});
			$('#departmentId').on('change', function() {
				if(this.value >= 35) {
					$('.selectMajor').show();
				} else
					$('.selectMajor').hide();
			})
			$('#entranceYear').on('change', function() {
				if(this.value == 2018){
					alert("18학번은 학부로 조회해주시기 바랍니다.");
				}
			});
			if(departmentId >= 35) {
				$('.selectMajor').show();
			}
			$(".verticalTree").zooTree([
			    {
			        "label": "핵심역량",
			        "itemId": "root",
			        "parentId": "999",
			        "children": [
			            {
			                "label": "가치역량",
			                "itemId": "role1",
			                "parentId": "root",
			                "children": [
			                    {
			                        "label": "인간·인권",
			                        "itemId": "role11",
			                        "parentId": "role1",
			                        "children": []
			                    },
			                    {
			                        "label": "생명·평화",
			                        "itemId": "role12",
			                        "parentId": "role1",
			                        "children": []
			                    },
													{
			                        "label": "민주시민",
			                        "itemId": "role11",
			                        "parentId": "role1",
			                        "children": []
			                    }
			                ]
			            },
			            {
			                "label": "대안역량",
			                "itemId": "role2",
			                "parentId": "root",
			                "children": [
												{
														"label": "융·복합적 사고",
														"itemId": "role11",
														"parentId": "role1",
														"children": []
												},
												{
														"label": "조사·분석·정보활용",
														"itemId": "role12",
														"parentId": "role1",
														"children": []
												},
												{
														"label": "대안제시·문제해결",
														"itemId": "role11",
														"parentId": "role1",
														"children": []
												}
											]
			            },
			            {
			                "label": "실천역량",
			                "itemId": "role3",
			                "parentId": "root",
			                "children": [
												{
														"label": "민주적 소통",
														"itemId": "role12",
														"parentId": "role1",
														"children": []
												},
												{
														"label": "연대와 공동체적 실천",
														"itemId": "role11",
														"parentId": "role1",
														"children": []
												}
											]
			            }
			        ]
			    }
			], {
				forceCreate: true,
				render: function(data) {
					var $a = $("<a>").addClass(data.itemId).append(data.label);
					return $a;
				}
			});
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
				<c:if test="${departmentId >= 35 }">
					<div class="form-group selectMajor"
						style="float: left; margin-right: 20px; margin-bottom: 5px;">
						<p class="font4">전공 선택</p>
						<select v-model="majorId" class="form-controls w200">
							<option disabled value="">선택</option>
							<option value="99">전체 조회</option>
							<option v-for="major in majorList" v-bind:value="major.majorId">
								{{ major.majorName }}
							</option>
						</select>
					</div>
				</c:if>
				
				
				
				<button type="submit" class="btn-submit" id="selectRule"
					style="margin-left: 0; margin-top: 0; padding: 5px 20px; float: left;" onclick="">조회</button>
			</div>
		</form>
		<c:if test="${departmentId == 99}">
			<div class="blank" style="margin-bottom:400px"></div>
		</c:if>
		<c:if test="${departmentId < 99 && entranceYear >= 2016}">
			<div style="margin-top: 0px; margin-left: 40px;">
				<br /> <br />
				<p>
				<div class="form-group" style="">
					<div style="width: 330px;">
						<p class="font5">교양필수과목</p>
					</div>
					<div class="list-group"
						style="width: 330px; margin-top: 10px; margin-left: -5px;">
						<c:forEach var="requiredCultureSubject"
							items="${requiredCultureSubjects}">
							<a href="#" class="list-group-item list-group-item-action">
								${requiredCultureSubject.subjectName}</a>
						</c:forEach>
					</div>
				</div>
				</p>
			</div>
		</c:if>
		<c:if test="${entranceYear == 2018}">
			<div class="form-group" style="margin-left: 40px;">
				<div class="form-group" style="float: left; margin-bottom: 0px;">
					<p class="font25">역량 필수</p>
					<input type="number" value="18"
						class="form-control"
						style="width: 43px; padding-top: 2px; padding-left: 10px; padding-right: 0px;"
						readonly />
				</div>
				<div class="form-group" style="float: left; margin-bottom: 0px;">
					<p class="font2" style="margin-bottom: 0px;">학점 이상 이수</p>
				</div>
				
				<br/><br/>
				<div class="form-group" style="margin-left:20px;margin-bottom: 0px;">
					<p class="font2" style="margin-bottom: 0px;"><small>- 각 역량에서 6학점 이상 이수</small></p>
				</div>
				<br/><br/>
				<div class="verticalTree"></div>
			</div>
			<br/>
			<div class="form-group" style="margin-left: 40px;">
				<div class="form-group" style="float: left; margin-bottom: 0px;">
					<p class="font25" style="margin-bottom: 0px;">전공 탐색</p>
				</div>
				<div class="form-group" style="float: left; margin-bottom: 0px;">
					<p class="font2">총</p>
					<input type="number" value="7"
						class="form-control"
						style="width: 43px; padding-top: 2px; padding-left: 10px; padding-right: 0px;"
						readonly />
				</div>
				<div class="form-group" style="float: left; margin-bottom: 0px;">
					<p class="font2">과목</p>
					<input type="number" value="19"
						class="form-control"
						style="width: 43px; padding-top: 2px; padding-left: 10px; padding-right: 0px;"
						readonly />
				</div>
				<div class="form-group" style="float: left; margin-bottom: 0px;">
					<p class="font2" style="margin-bottom: 0px;">학점 이상 이수</p>
				</div>
				<br/><br/>
				<div class="form-group" style="margin-left:20px;margin-bottom: 0px;">
					<p class="font2" style="margin-bottom: 0px;">▶ 1학기(1과목) : 소속 학부 내에서 1과목 이상 이수</p>
				</div>
				<br/><br/>
				<div class="form-group" style="margin-left:20px;margin-bottom: 0px;">
					<p class="font2" style="margin-bottom: 0px;">▶ 2학기~3학기(5과목) : 반드시 타 학부 전탐 1과목 포함 총 5 과목 이상 이수</p>
				</div>
				<br/><br/>
				<div class="form-group" style="margin-left:20px;margin-bottom: 0px;">
					<p class="font2" style="margin-bottom: 0px;">▶ 전공탐색세미나 : 3학기 이후부터 신청 가능</p>
				</div>
				<br/><br/>
			</div>
		</c:if>
		<c:if test="${departmentId < 99 && entranceYear < 2016}">
			<div style="margin-top: 90px"></div>
		</c:if>
		<c:if test="${departmentId <= 32}">

			<div style="margin-top: 20px; margin-left: 40px;">
				<p style="">
				<div class="form-group" style="float: left; margin-bottom: 0px;">
					<p class="font2">전필</p>
					<input type="number" value="${firstRule.mustMajor}"
						class="form-control"
						style="width: 43px; padding-top: 2px; padding-left: 10px; padding-right: 0px;"
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
							<p class="font5">전공필수과목</p>
						</div>
						<div class="list-group majorlist"
							style="width: 330px; margin-top: 10px; margin-left: -5px;">
							<c:forEach var="major" items="${majors}">
								<a href="#" class="list-group-item list-group-item-action">${major.majorName}</a>
							</c:forEach>
						</div>
					</div>
					<div class="form-group" style="float: left; margin-left: 50px;">
						<div style="width: 330px;">
							<p class="font5">학과지정교양</p>
						</div>
						<div class="list-group"
							style="width: 330px; margin-top: 10px; margin-left: -5px;">
							<c:forEach var="departmentCulture" items="${departmentCultures}">
								<a href="#" class="list-group-item list-group-item-action">
									${departmentCulture.subjectName}</a>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>


			<br />
			<div style="margin-top: 300px; margin-left: 40px">

				<div class="form-group" style="float: left; margin-bottom: 0px;">
					<p class="font5">전공과정</p>
				</div>

				<br /> <br />
				<c:forEach var="departmentMajorRule" items="${departmentMajorRules}">
					<div style="margin-left: 40px">
						<p class="font6">▶${departmentMajorRule.processName}</p>
						<c:if test="${ departmentMajorRule.processId == 6 && departmentId == 31}">
							<div style="margin-left: 30px">
								<div class="form-group" style="float: left; margin-bottom: 0px;">
									<p class="font2">전필 포함</p>
									<input type="number"
										value="${departmentMajorRule.mustPlusChoice}"
										class="form-control"
										style="width: 45px; padding-top: 2px; padding-left: 10px; padding-right: 0px; margin-right: 0;"
										readonly />
								</div>
								<div class="form-group" style="float: left; margin-bottom: 0px;">
									<p class="font2" style="margin-bottom: 0px;">학점 이수</p>
								</div>
							</div>
						</c:if>
						<c:if test="${ departmentMajorRule.processId == 6 && departmentId == 32}">
								<div style="margin-left: 30px">
									<div class="form-group" style="float: left; margin-bottom: 0px;">
										<p class="font2">지도 과목 제외하고 전필</p>
										<input type="number"
											value="${departmentMajorRule.mustMajor}"
											class="form-control"
											style="width: 45px; padding-top: 2px; padding-left: 10px; padding-right: 0px; margin-right: 0;"
											readonly />
									</div>
									<div class="form-group" style="float: left; margin-bottom: 0px;">
										<p class="font2">학점 포함하여 전공</p>
										<input type="number"
											value="${departmentMajorRule.mustMajor}"
											class="form-control"
											style="width: 45px; padding-top: 2px; padding-left: 10px; padding-right: 0px; margin-right: 0;"
											readonly />
									</div>
									<div class="form-group" style="float: left; margin-bottom: 0px;">
										<p class="font2" style="margin-bottom: 0px;">학점 이상 이수(지도 과목은 선택)</p>
									</div>
								</div>
						</c:if>
						<c:if test="${ departmentMajorRule.processId == 7}">
							<div style="margin-left: 30px">
								<div class="form-group" style="float: left; margin-bottom: 0px;">
									<p class="font2">전필, 전선 관계없이</p>
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
						</c:if>
						<c:if test="${ departmentMajorRule.processId < 6}">
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
						</c:if>
					</div>
					<br />
					<br />
				</c:forEach>
			</div>
		</c:if>
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
  			majorId: '',
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
  			},
  			getParam(param) {
  				var params = location.search.substr(location.search.indexOf("?") + 1);
  				var sval = "";

  			    params = params.split("&");

  			    for (var i = 0; i < params.length; i++) {
  			        temp = params[i].split("=");
  			        if ([temp[0]] == param) { sval = temp[1]; }
  			    }

  			    return sval;
  			}
  		},
  		mounted() {
			let url = '/findAllDepartment';
			axios.get(url).then(response => {
				this.departments = response.data;
	 			console.log(this.departments);
	 			this.deptId = this.getParam("departmentId")
	 			console.log("파라미터값" + this.deptId);
			})
  		}
  	})
  </script>
</body>
</html>