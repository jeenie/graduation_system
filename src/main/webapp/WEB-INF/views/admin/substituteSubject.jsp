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
	
	<script src="https://cdn.jsdelivr.net/npm/vue"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.min.js"></script>
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
	
	.btn-cancel {
	      padding: 6px 15px;
	      background-color: #BDBDBD;
	      border-color: #eea236;
	      color: #fff;
	      border-radius: 4px;
	      border:none;
	      margin-top: 0;
	 }
	 
	 .btn-delete {
	      padding: 6px 15px;
	      background-color: #FA5858;
	      border-color: #eea236;
	      color: #fff;
	      border-radius: 4px;
	      border:none;
	      margin-top: 0;
	 }
</style>
	
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
<div id="app">
	<div class="aboutus">
		<div class="container">
			<div style="margin-top: 30px">
				<div class="contents" style="text-align: center;">
					<div style="text-align: left;">
						<form action="findSubject" autocomplete=off>
							&nbsp; 과목명 :&nbsp;<input type="text" name="subject" value="${subject}">&nbsp;
							<button type="submit" class="inquiry_btn warning">조회</button>
							
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
								<script>
									var id = '';
								</script>
								<tr v-on:click="subjectById('${ substitutionSubject.abolitionSubject}')" data-toggle="modal" data-id="subjectInfo" data-target="#subjectInfo">
									<td>${ substitutionSubject.departmentName }</td>
									<td>${ substitutionSubject.abolitionSubjectName }</td>
									<td>${ substitutionSubject.substitutionSubjectName}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>
	
	<div class="modal fade" id="addSubject" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
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
					<form method="post" action="addSubject" modelAttribute="substitutionSubject">
						<div class="form-group">
							<label>담당학과</label>
							<select name="departmentId" class="form-control w505" id="departmentId">
						<option value="99">선택</option>
						<c:forEach var="department" items="${departments}">
							<option value="${department.id}">${department.departmentName}</option>
						</c:forEach>
					</select>
						</div>
						<div class="form-group">
							<label>폐지과목</label>
							<input type="text" name="abolitionSubject" class="form-control w505" v-model="selectedSubject.id"/>
							<a data-toggle="modal" href="#find" class="btn btn-submit" style="float:right; margin-top:-33px">찾기</a>
						</div>
						<div class="form-group">
							<label>대체과목</label>
							<input type="text" name="substitutionSubject" class="form-control w505" v-model="selectedSubject2.id"/>
							<a data-toggle="modal" href="#find2" class="btn btn-submit" style="float:right; margin-top:-33px">찾기</a>
						</div>
						<button type="submit" class="btn btn-submit" onclick="success()">추가</button>
						<button type="button" class="btn" data-dismiss="modal">취소</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="subjectInfo" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog" style="width:500px">
			<div class="modal-content">
				<div class="modal-header" style="padding-bottom: 1.5px;">
					<h4>
						<b>대체 과목 정보</b>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
							</button>
						</h4>
				</div>
				<div class="modal-body" style="text-align:center">
					<div style="display: inline-block;">
						<div class="form-group">
							<label style="float:left">담당학과</label>
							<br/><br/>
							<input type="text" class="form-control w400" v-model="subjectData.departmentName" style="margin-top:-17px" readonly/>
						</div>
						<div class="form-group">
							<label style="float:left">폐지과목</label>
							<br/><br/>
							<input type="text" class="form-control w400" v-model="subjectData.abolitionSubjectName" style="margin-top:-17px" readonly/>
						</div>
						<div class="form-group">
							<label style="float:left">대체과목</label>
							<br/><br/>
							<input type="text" class="form-control w400" v-model="subjectData.substitutionSubjectName" style="margin-top:-17px" readonly/>
						</div>
						
						<a data-toggle="modal" href="#edit" class="btn btn-submit" data-dismiss="modal" style="float:right; margin-right:60px" v-on:click="editSubject(subjectData.abolitionSubject)">수정</a>
						<a href="#delete" class="btn btn-delete" style="float:right; margin-right:-120px" v-on:click="deleteSubject(subjectData.abolitionSubject)">삭제</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog" style="width:495px;">
			<div class="modal-content">
				<div class="modal-header" style="padding-bottom: 1.5px;">
					<h4>
						<b>대체 과목 수정</b>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
							</button>
						</h4>
				</div>
				<div class="modal-body" style="margin-bottom:30px">
					<form method="post" action="editSubject" modelAttribute="substitutionSubject">
						<div class="form-group">
							<label style="float:left">담당학과</label>
							<br/><br/>
							<input type="text" class="form-control w400" v-model="subjectData.departmentName" style="margin-top:-17px" readonly/>
						</div>
						<div class="form-group">
							<label style="float:left">폐지과목</label>
							<br/><br/>
							<input type="text"  class="form-control w400" v-model="subjectData.abolitionSubjectName" style="margin-top:-17px" readonly/>
						</div>
						<input type="hidden" name="abolitionSubject" v-model="subjectData.abolitionSubject">
						<input type="hidden" name="substitutionSubject" v-model="subjectData.substitutionSubject">
						<div class="form-group">
							<label style="float:left">대체과목</label>
							<br/><br/>
							<input type="text" class="form-control w400" v-model="subjectData.substitutionSubjectName" style="margin-top:-17px"/>
							<a data-toggle="modal" href="#find3" class="btn btn-submit" style="float:right; margin-top:-33px">찾기</a>
						</div>
						
						<button type="submit" class="btn btn-submit" onclick="alert('정상적으로 수정되었습니다.')" style="float:right; margin-right:60px">수정</button>
						<button type="button" class="btn" data-dismiss="modal" style="float:right; margin-right:-120px">취소</button>
						
					</form>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	<div class="modal fade" id="find" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog" role="document">
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
					
					<form id="searchSubject">
						<div class="form-group">
							<select class="form-control" v-model="ss" style="float:left; margin-right:5px; width:110px">
								<option disabled value="">검색조건</option>
								<option value="0">과목코드</option>
								<option value="1">과목명</option>
							</select>
							<input type="text" v-model="st" class="form-control w250" style="display:inline; float:left; margin-right:5px" maxlength="20"/>
						</div>
						<button type="button" class="btn btn-submit" v-on:click="findSubjectData">조회</button>
					</form>
						<table class="table table-bordered mt5" style="margin-top:10px;">
							<thead>
									<tr>
										<th style="text-align:center;">과목코드</th>
										<th style="text-align:center;">과목명</th>
									</tr>
								</thead>
								
								<tbody>
									<tr class="hover" v-for="subject in subjects" v-on:click="selectSubject(subject)"> 
										<td>{{subject.id}}</td> 
										<td>{{subject.name}}</td> 
									</tr>
								</tbody>
						</table>
						<p>영역 대체를 원하는 경우, <b>[과목명] 대체</b>라고 검색해주세요.</p>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="find2" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog" role="document">
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
					
					<form id="searchSubject">
						<div class="form-group">
							<select class="form-control" v-model="ss2" style="float:left; margin-right:5px; width:110px">
								<option disabled value="">검색조건</option>
								<option value="0">과목코드</option>
								<option value="1">과목명</option>
							</select>
							<input type="text" v-model="st2" class="form-control w250" style="display:inline; float:left; margin-right:5px" maxlength="20"/>
						</div>
						<button type="button" class="btn btn-submit" v-on:click="findSubjectData2">조회</button>
					</form>
						<table class="table table-bordered mt5" style="margin-top:10px;">
							<thead>
									<tr>
										<th style="text-align:center;">과목코드</th>
										<th style="text-align:center;">과목명</th>
									</tr>
								</thead>
								
								<tbody>
									<tr class="hover" v-for="subject in subjects2" v-on:click="selectSubject2(subject)"> 
										<td>{{subject.id}}</td> 
										<td>{{subject.name}}</td> 
									</tr>
								</tbody>
						</table>
						<p>영역 대체를 원하는 경우, <b>[과목명] 대체</b>라고 검색해주세요.</p>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="find3" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog" role="document">
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
					
					<form id="searchSubject">
						<div class="form-group">
							<select class="form-control" v-model="ss3" style="float:left; margin-right:5px; width:110px">
								<option disabled value="">검색조건</option>
								<option value="0">과목코드</option>
								<option value="1">과목명</option>
							</select>
							<input type="text" v-model="st3" class="form-control w250" style="display:inline; float:left; margin-right:5px" maxlength="20"/>
						</div>
						<button type="button" class="btn btn-submit" v-on:click="findSubjectData3">조회</button>
					</form>
						<table class="table table-bordered mt5" style="margin-top:10px;">
							<thead>
									<tr>
										<th style="text-align:center;">과목코드</th>
										<th style="text-align:center;">과목명</th>
									</tr>
								</thead>
								
								<tbody>
									<tr class="hover" v-for="subject in subjects3" v-on:click="selectSubject3(subject)"> 
										<td>{{subject.id}}</td> 
										<td>{{subject.name}}</td> 
									</tr>
								</tbody>
						</table>
						<p>영역 대체를 원하는 경우, <b>[과목명] 대체</b>라고 검색해주세요.</p>
				</div>
			</div>
		</div>
	</div>
</div>
	<div style="margin-bottom: 100px;"></div>
	
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
		function success() {
			alert("정상적으로 대체과목이 등록되었습니다.");
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
					$('#find').modal('hide');
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
						location.href="/graduation/SubstitutionSubject";
					}
				}
			}
		});
	</script>
</body>
</html>