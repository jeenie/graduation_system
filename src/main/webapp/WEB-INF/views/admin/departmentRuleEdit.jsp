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
<link rel="stylesheet" href="${R}res/css/custom.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.min.js"></script>

<style>
.contents {
	margin-top: 5px;
	margin-right: 100px;
	margin-left: 140px;
	margin-bottom: 90px;
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

.majorlist {
	height: 259px;
	overflow-y: scroll;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/adminNavibar.jsp"%>

	<div id="breadcrumb">
		<div class="container">
			<div class="breadcrumb">
				<li></li>
				<li style="font-size: 18px; margin-left: -5px;">학과별 졸업 요건 관리</li>
			</div>
		</div>
	</div>
	<div id="app">
		<div class="contents">
			<form>
				<div>
					<div class="form-group"
						style="float: left; margin-right: 20px; margin-bottom: 5px;">
						<p class="font4">학과</p>
						<select name="departmentId" class="form-controls w200">
							<option value="99">선택</option>
							<c:forEach var="department" items="${departments}">
								<option value="${department.id}"
									${departmentId == department.id ? "selected" : ""}>${department.departmentName}</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group"
						style="float: left; margin-right: 20px; margin-bottom: 5px;">
						<p class="font4">학번</p>
						<select name="entranceYear" class="form-controls w200">
							<option value="99">선택</option>
							<c:forEach var="year" items="${years}">
								<option value="${year.year}"
									${entranceYear == year.year ? "selected" : ""}>${year.year}</option>
							</c:forEach>
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
							style="width: 40px; padding-top: 2px; padding-left: 10px; padding-right: 0px;" />
					</div>
					<div class="form-group" style="float: left; margin-bottom: 0px;">
						<p class="font2">학점을 포함하여 전공</p>
						<input type="number" value="${firstRule.mustPlusChoice}"
							class="form-control"
							style="width: 45px; padding-top: 2px; padding-left: 10px; padding-right: 0px; margin-right: 0;" />
					</div>
					<div class="form-group" style="float: left; margin-bottom: 0px;">
						<p class="font2" style="margin-bottom: 0px;">학점</p>
					</div>
					</p>
					<br /> <br />
					<div>
						<div class="form-group" style="float: left">
							<div style="width: 330px;">
								<p class="font5">
									전공필수과목 <a data-toggle="modal" href="#addMajorSubject"><span
										style="float: right; font-size: 25px; font-weight: bold; margin-right: 20px">+</span></a>
								</p>
							</div>
							<div class="list-group majorlist"
								style="width: 330px; margin-top: 10px; margin-left: -5px;">
								<c:forEach var="major" items="${majors}">
									<a
										href="deleteMajor?departmentId=${major.departmentId}&majorSubjectId=${major.majorSubjectId}&entranceYear=${major.entranceYear}"
										class="list-group-item list-group-item-action"
										data-confirm-delete>${major.majorName} <span
										style="float: right;">&times;</span>
									</a>
								</c:forEach>
							</div>
						</div>
						<div class="form-group" style="float: left; margin-left: 50px;">
							<div style="width: 330px;">
								<p class="font5">
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
				<div style="margin-left: 20px; margin-top: -40px">
					<p>
					<div class="form-group" style="float: left; margin-bottom: 0px;">
						<p class="font5">전공과정</p>
					</div>
					</p>
					<br />
					<br />
					<form:form method="post">
						<c:forEach var="departmentMajorRule"
							items="${departmentMajorRules}">
							<div style="margin-left: 40px;">
								<p class="font6">▶${departmentMajorRule.processName}</p>
								<div style="margin-left: 30px">
									<div class="form-group"
										style="float: left; margin-bottom: 0px;">
										<p class="font2">전필</p>
										<input type="number" name="mustMajor"
											value="${departmentMajorRule.mustMajor}" class="form-control"
											style="width: 45px; padding-top: 2px; padding-left: 10px; padding-right: 0px;" />
									</div>
									<div class="form-group"
										style="float: left; margin-bottom: 0px;">
										<p class="font2">학점과 전선</p>
										<input type="number" name="choiceMajor"
											value="${departmentMajorRule.choiceMajor}"
											class="form-control"
											style="width: 45px; padding-top: 2px; padding-left: 10px; padding-right: 0px; margin-right: 0;" />
									</div>
									<div class="form-group"
										style="float: left; margin-bottom: 0px;">
										<p class="font2">학점을 포함하여 전공</p>
										<input type="number" name="mustPlusChoice"
											value="${departmentMajorRule.mustPlusChoice}"
											class="form-control"
											style="width: 45px; padding-top: 2px; padding-left: 10px; padding-right: 0px; margin-right: 0;" />
									</div>
									<div class="form-group"
										style="float: left; margin-bottom: 0px;">
										<p class="font2" style="margin-bottom: 0px;">학점</p>
									</div>
								</div>
							</div>
							<br />
							<br />
						</c:forEach>
						<button type="submit" class="btn btn-submit"
							style="float: right; margin-right: 380px">
							<span class="glyphicon glyphicon-ok"></span> 저장
						</button>
						<a
							href="deptRuleEdit?departmentId=${departmentId}&entranceYear=${entranceYear}"
							class="btn btn-cancle" style="float: right; margin-right: -170px">원래대로</a>
					</form:form>
				</div>
			</c:if>
			<c:if test="${departmentId == 99}">
				<div class="blank" style="margin-bottom: 410px"></div>
			</c:if>

		</div>
		<div class="modal fade" id="addMajorSubject" tabindex="-1"
			role="dialog" aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header" style="padding-bottom: 1.5px;">
						<h4>
							<b>전공 필수 과목 추가</b>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
							</button>
						</h4>
					</div>
					<div class="modal-body">

						<form id="searchSubject">
							<div class="form-group">
								<select class="form-control" v-model="ss"
									style="float: left; margin-right: 5px; width: 110px">
									<option disabled value="">검색조건</option>
									<option value="0">과목코드</option>
									<option value="1">과목명</option>
								</select> <input type="text" v-model="st" class="form-control w250"
									style="display: inline; float: left; margin-right: 5px"
									maxlength="20" />
							</div>
							<button type="button" class="btn btn-submit"
								v-on:click="findSubjectData">조회</button>
						</form>
						<table class="table table-bordered mt5" style="margin-top: 10px;">
							<thead>
								<tr>
									<th style="text-align: center;">과목코드</th>
									<th style="text-align: center;">과목명</th>
								</tr>
							</thead>

							<tbody>
								<tr class="hover" v-for="subject in subjects"
									v-on:click="selectSubject(subject)">
									<td>{{subject.id}}</td>
									<td>{{subject.name}}</td>
								</tr>
							</tbody>
						</table>
					</div>
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
	<script src="${R}res/js/common.js"></script>

	<script>
		function deleteSubject() {
			confirm("과목을 삭제하시겠습니까?");
		}
	</script>
	<script type="text/javascript">
	var app = new Vue({
		el: '#app',
		data: {
			ss: '',
			st: '',
			ss2: '',
			st2: '',
			ss3: '',
			st3: '',
			subjects: [],
			subjects2: [],
			subjects3: [],
			selectedSubject: {},
			selectedSubjectId: '',
			selectedSubjectName: '',
			selectedSubject2: {},
			selectedSubject3: {},
			subjectData: {},
			subjectDeptId: '',
		},
		methods: {
			findSubjectData: function() {
				let url = '/findSubject?ss='+ this.ss +'&st=' + this.st;
				axios.get(url).then(response => {
						this.subjects = response.data;
					});
			},
			findSubjectData2: function() {
				let url = '/findSubject2?ss2='+ this.ss2 +'&st2=' + this.st2;
				axios.get(url).then(response => {
						this.subjects2 = response.data;
					});
			},
			findSubjectData3: function() {
				let url = '/findSubject3?ss3='+ this.ss3 +'&st3=' + this.st3;
				axios.get(url).then(response => {
						this.subjects3 = response.data;
					});
			},
			selectSubject: function(subject) {
				
				this.selectedSubject = subject;
				this.selectedSubjectId = this.selectedSubject.id;
				this.selectedSubjectName = this.selectedSubject.name;
				var ok = confirm(this.selectedSubjectName + "을 전공 필수 과목으로 등록하시겠습니까?");
				if(ok) {
					let url = '/addMajorSubject?subjectId=' + this.selectedSubjectId + '&departmentId=' + ${departmentId} + '&entranceYear=' + ${entranceYear};
					axios.get(url).then();
					alert("정상적으로 등록되었습니다.");
					location.reload();
				}
			},
			selectSubject2: function(subject) {
				this.selectedSubject2 = subject;
				$('#find2').modal('hide');
			},
			selectSubject3: function(subject) {
				this.subjectData.substitutionSubject = subject.id;
				this.subjectData.substitutionSubjectName = subject.name;
				$('#find3').modal('hide');
			},
			subjectById: function(subject) {
				console.log(subject);
				let url = '/subjectData?subjectId=' + subject;
				axios.get(url).then(response => {
					this.subjectData = response.data;
				});
			}, 
			editSubject: function(subject) {
				console.log(subject);
				let url = '/subjectData?subjectId=' + subject;
				axios.get(url).then(response => {
					this.subjectData = response.data;
				});
			}, 
			deleteSubject:function(subject) {
				let url = '/deleteSubject?subjectId=' + subject;
				var ok = confirm("선택한 폐지과목에 대한 정보를 삭제하시겠습니까?");
				console.log(ok);
				if(ok) {
					axios.get(url).then();
					alert("정상적으로 삭제되었습니다.");
					location.href = 'SubstitutionSubject';
				}
			}
		}
	});
	</script>
</body>
</html>