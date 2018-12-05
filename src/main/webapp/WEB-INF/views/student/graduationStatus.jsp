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

<link rel="stylesheet" href="${R}res/css/prism.css">
<link href="${R}res/css/zooTree.css" rel="stylesheet" />


<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="${R}res/js/zooTree.js"></script>

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

.aboutus {
	margin-right: 30%;
}

/*progress 서식*/
.progressbar {
	width: 600px;
	height: 16px;
	margin: 0 auto 20px auto;
	padding: 0px;
	background: #cfcfcf;
	border-width: 1px;
	border-style: solid;
	border-color: #aaa #bbb #fff #bbb;
	box-shadow: inset 0px 2px 3px #bbb;
}

.progressbar, .progressbar-inner {
	border-radius: 4px;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	-o-border-radius: 4px;
}

.progressbar-inner {
	width: 77%; /* Change to actual percentage */
	height: 100%;
	background: #999;
	background-size: 18px 18px;
	background-color: #ac0;
	background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, .2)
		25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .2) 50%,
		rgba(255, 255, 255, .2) 75%, transparent 75%, transparent);
	box-shadow: inset 0px 2px 8px rgba(255, 255, 255, .5), inset -1px -1px
		0px rgba(0, 0, 0, .2);
}

.progressbar-green .progressbar-inner {
	background-color: #ac0;
}

.selctDept {
	display: none;
}
</style>

<script>
		$(document).ready(function(){
			var departmentId;
			var entranceYear;
			$('#departmentId').on('change', function() {
				departmentId = this.value;
				//alert(departmentId);
			});
			$('#selectProcess').on('change', function() {
				if(this.value == 3){
					$('.selctDept').show();
					alert("함께 복수전공할 학과를 선택한 후, 조회해주세요.");
				} else
					$('.selctDept').hide();
			});
			if(${processId} == 3)
				$('.selctDept').show();
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
			                        "itemId": "c101",
			                        "parentId": "role1",
			                        "children": []
			                    },
			                    {
			                        "label": "생명·평화",
			                        "itemId": "c102",
			                        "parentId": "role1",
			                        "children": []
			                    },
													{
			                        "label": "민주시민",
			                        "itemId": "c103",
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
														"itemId": "c201",
														"parentId": "role1",
														"children": []
												},
												{
														"label": "조사·분석·정보활용",
														"itemId": "c202",
														"parentId": "role1",
														"children": []
												},
												{
														"label": "대안제시·문제해결",
														"itemId": "c203",
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
														"itemId": "c301",
														"parentId": "role1",
														"children": []
												},
												{
														"label": "연대와 공동체적 실천",
														"itemId": "c302",
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
			if(${c1Total} >= 6) {
				$('.role1').css('background-color', '#E1F5A9');
			}
			if(${c2Total} >= 6) {
				$('.role2').css('background-color', '#E1F5A9');
			}
			if(${c3Total} >= 6) {
				$('.role3').css('background-color', '#E1F5A9');
			}
			if(${c101Total} >= 3) 
				$('.c101').css('background-color', '#E1F5A9');
			if(${c102Total} >= 3) 
				$('.c102').css('background-color', '#E1F5A9');
			if(${c103Total} >= 3) 
				$('.c103').css('background-color', '#E1F5A9');
			if(${c201Total} >= 3) 
				$('.c201').css('background-color', '#E1F5A9');
			if(${c202Total} >= 3) 
				$('.c202').css('background-color', '#E1F5A9');
			if(${c203Total} >= 3) 
				$('.c203').css('background-color', '#E1F5A9');
			if(${c301Total} >= 3) 
				$('.c301').css('background-color', '#E1F5A9');
			if(${c302Total} >= 3) {
				$('.c302').css('background-color', '#E1F5A9');
			}
		});
	</script>
</head>

<body>
	<%@ include file="/WEB-INF/views/include/studentNavibar.jsp"%>

	<div id="breadcrumb">
		<div class="container">
			<div class="breadcrumb">
				<li></li>
				<li style="font-size: 18px; margin-left: -5px;">나의 졸업현황</li>
			</div>
			<hr>
		</div>
	</div>
	<p style="float: right; margin-right: 200px; margin-bottom: 20px;">
		<a style="color: #ac0; font-weight: bold; text-decoration: underline;"
			href="${R}user/select?departmentId=${ student.departmentId }&entranceYear=${ entranceYear }">콕
			! 내게 맞는 졸업요건</a>
	</p>
	<div class="contents">
		<div
			style="float: left; margin-left: 70px; margin-right: 100px; margin-top: 30px;">
			<img src="${R}res/images/abouti/student1.png" width="150px"
				height="170px">
		</div>

		<div style="float: left; width: 600px;">
			<table class="table">
				<tr style="height: 60px;">
					<th>학번</th>
					<td>${ student.id }</td>
					<th>성명</th>
					<td>${ student.name }</td>
				</tr>

				<tr style="height: 60px;">
					<th>학부(과)</th>
					<td>${ student.departmentName }</td>
					<th>학년</th>
					<td>${ student.grade }</td>
				</tr>

				<tr style="height: 60px;">
					<th>입학구분</th>
					<td>${ student.entranceType }</td>
					<th>이수학기</th>
					<td>${ student.completeSemester }학기</td>
				</tr>
			</table>
		</div>
	</div>

	<div
		style="margin-right: 100px; margin-left: 100px; margin-top: 300px;">
		<form>
			<div>
				<div style="float: left">
					<p style="font-size: 18px; font-weight: bold;">
						>&nbsp ${ student.name }님에 맞는 &nbsp <select name="processId"
							class="form-controls w200" id="selectProcess">
							<option value="0">특별과정</option>
							<c:forEach var="specialProcess" items="${specialProcess}">
								<option value="${specialProcess.id}"
									${processId == specialProcess.id ? "selected" : ""}>${specialProcess.processName}</option>
							</c:forEach>
						</select>&nbsp <select name="deptId" class="form-controls w200 selctDept">
							<option value="0">학과 선택</option>
							<c:forEach var="department" items="${depts}">
								<option value="${department.id}"
									${deptId == department.id ? "selected" : ""}>${department.departmentName}</option>
							</c:forEach>
						</select>

						<button type="submit" class="btn-submit"
							style="margin-left: 0; margin-top: 0; padding: 5px 20px; font-size: 16px;">조회</button>
					</p>

				</div>
			</div>
		</form>
		<br> <br> <br> <br>

		<div style="float: left;">
			<p style="font-size: 18px; font-weight: bold;">>&nbsp 총 학점
				${studentGradefile.totalUnit}/${total}</p>
			<div class="progressbar progressbar-green">
				<div class="progressbar-inner"
					style="width:${((studentGradefile.totalUnit/total)*100)>100 ? "100" : (studentGradefile.totalUnit/total)*100}%"></div>
			</div>
		</div>
		<br> <br> <br> <br>

		<div class="progress-wrap">
			<p style="font-size: 18px; font-weight: bold;">
				>&nbsp 전공
				${studentGradefile.majorUnit}/${departmentMajorRule.mustPlusChoice}
				<c:if test="${processId == 3}">
					<small><${ student.departmentName }></small>
				</c:if>
			</p>
			<div class="progressbar progressbar-green" style="float: left">
				<div class="progressbar-inner"
					style="width:${((studentGradefile.majorUnit/departmentMajorRule.mustPlusChoice)*100)>100 ? "100" : (studentGradefile.majorUnit/departmentMajorRule.mustPlusChoice)*100}%"></div>
			</div>
		</div>

		<c:if test="${entranceYear == 2018}">
			<br>
			<br>
			<div class="progress-wrap">
				<p style="font-size: 18px; font-weight: bold;">>&nbsp 전탐
					${studentGradefile.majorexUnit}/${explorationGrade}</p>
				<div class="progressbar progressbar-green" style="float: left">
					<div class="progressbar-inner"
						style="width:${((studentGradefile.majorexUnit/explorationGrade)*100)>100 ? "100" : (studentGradefile.majorexUnit/explorationGrade)*100}%"></div>
				</div>
			</div>
		</c:if>
		<br> <br>
		<c:if test="${entranceYear != 2018}">
			<p style="font-size: 16px; font-weight: bold;">＊ 전공 필수</p>
			<p
				style="font-size: 12px; float: right; margin-right: 200px; color: #ac0; font-weight: bold;">수강한
				과목은 색으로 표시됩니다</p>
			<div style="margin-right: 200px">
				<table class="table">
					<thead>
						<tr style="height: 30px;">
							<th scope="col" class="text-center">과목명</th>
							<th scope="col" class="text-center">학점</th>
							<th scope="col" class="text-center">성적</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="major" items="${ mustmajor2 }">
							<c:set var="loop_flag" value="false" />
							<c:set var="check" value="false" />
							<c:forEach var="studentSubjectGrade" items="${ mustMajor }">
								<c:if test="${not loop_flag }">
									<c:set var="color" value="#FFFFFF" />
									<c:if
										test="${ major.majorSubjectId == studentSubjectGrade.subjectId}">
										<c:set var="color" value="#E1F5A9" />
										<c:set var="loop_flag" value="true" />
										<c:set var="check" value="true" />
										<c:set var="grade" value="${ studentSubjectGrade.grade }" />
									</c:if>
								</c:if>
							</c:forEach>
							<tr style="background-color:${color}">
								<td>${ major.majorName }</td>
								<td>${ major.subjectScore }</td>
								<td>${ check.equals("true") ? grade : "" }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</c:if>

		<c:if test="${processId == 3}">
			<div class="progress-wrap">
				<p style="font-size: 18px; font-weight: bold;">
					>&nbsp 전공 ${anotherTotal}/${anotherProcess.mustPlusChoice} <small><${
						anotherDept.departmentName }></small>
				</p>
				<div class="progressbar progressbar-green" style="float: left">
					<div class="progressbar-inner"
						style="width:${((anotherTotal/anotherProcess.mustPlusChoice)*100)>100 ? "100" : (anotherTotal/anotherProcess.mustPlusChoice)*100}%"></div>
				</div>
			</div>
			<br />
			<br />
			<p style="font-size: 16px; font-weight: bold;">＊ 전공 필수</p>
			<p
				style="font-size: 12px; float: right; margin-right: 200px; color: #ac0; font-weight: bold;">수강한
				과목은 색으로 표시됩니다</p>
			<div style="margin-right: 200px">
				<table class="table">
					<thead>
						<tr style="height: 30px;">
							<th scope="col" class="text-center">과목명</th>
							<th scope="col" class="text-center">학점</th>
							<th scope="col" class="text-center">성적</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="major" items="${ anotherMajorSubjects }">
							<c:set var="loop_flag" value="false" />
							<c:set var="check" value="false" />
							<c:forEach var="studentSubjectGrade"
								items="${ anoterMustMajorList }">
								<c:if test="${not loop_flag }">
									<c:set var="color" value="#FFFFFF" />
									<c:if
										test="${ major.majorSubjectId == studentSubjectGrade.subjectId}">
										<c:set var="color" value="#E1F5A9" />
										<c:set var="loop_flag" value="true" />
										<c:set var="check" value="true" />
										<c:set var="grade" value="${ studentSubjectGrade.grade }" />
									</c:if>
								</c:if>
							</c:forEach>
							<tr style="background-color:${color}">
								<td>${ major.majorName }</td>
								<td>${ major.subjectScore }</td>
								<td>${ check.equals("true") ? grade : "" }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</c:if>
		<c:if test="${entranceYear == 2018}">
			<p style="font-size: 16px; font-weight: bold;">＊ 전공 탐색</p>
			<div style="margin-right: 200px">
				<table class="table">
					<thead>
						<tr style="height: 30px;">
							<th scope="col" class="text-center">과목명</th>
							<th scope="col" class="text-center">학점</th>
							<th scope="col" class="text-center">성적</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="major" items="${ major2018 }">
							<tr style="background-color:${color}">
								<td>${ major.majorName }</td>
								<td>${ major.subjectScore }</td>
								<td>${ major.grade }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</c:if>

		<br> <br>

		<div>
			<p style="font-size: 18px; font-weight: bold;">>&nbsp 교양
				${studentGradefile.cultureUnit}/${culture+departmentMajorRule.addCulture}</p>
			<div class="progressbar progressbar-green" style="float: left">
				<div class="progressbar-inner"
					style="width:${((studentGradefile.cultureUnit/(culture+departmentMajorRule.addCulture))*100)>100 ? "100" : (studentGradefile.cultureUnit/(culture+departmentMajorRule.addCulture))*100}%"></div>
			</div>
			<br> <br>
			<p style="font-size: 16px; font-weight: bold; float: left;">＊ 교양
				필수 :&nbsp</p>
			<p style="font-size: 16px; float: left;">기도모임(비아메디아채플)
			<p
				style="color: Green; font-size: 16px; font-weight: bold; float: left;">&nbsp
				${chapelSubject}</p>
			<p style="float: left; font-size: 16px;">&nbsp/
				${requiredCultureCount.chapelCount} 회, 사회봉사
			<p
				style="color: Green; font-size: 16px; font-weight: bold; float: left;">&nbsp
				${serveSubject}</p>
			<p style="float: left; font-size: 16px;">&nbsp/
				${requiredCultureCount.serveCount} 회</p>
			<br> <br>

			<div style="margin-right: 200px">
				<p
					style="font-size: 14px; color: #ac0; font-weight: bold; float: left;">
					&nbsp&nbsp
					<수강 과목>
				</p>
				<table class="table">
					<thead>
						<tr style="height: 30px;">
							<th scope="col" class="text-center">과목명</th>
							<th scope="col" class="text-center">학점</th>
							<th scope="col" class="text-center">성적</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="studentSubjectGrade" items="${ mustCulture }">
							<tr>
								<td style="width: 500px;">${ studentSubjectGrade.subjectName }</td>
								<td>${ studentSubjectGrade.subjectScore }</td>
								<td>${ studentSubjectGrade.grade }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<c:if test="${ entranceYear >= 2016 }">
					<p
						style="font-size: 14px; color: #ac0; font-weight: bold; float: left;">
						&nbsp&nbsp
						<미수강 과목>
					</p>
					<table class="table">
						<thead>
							<tr style="height: 30px;">
								<th scope="col" class="text-center">과목코드</th>
								<th scope="col" class="text-center">과목명</th>
								<th scope="col" class="text-center">학점</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="requiredCultureSubject"
								items="${ requiredCultureSubject }">
								<c:set var="loop_flag" value="false" />
								<c:forEach var="studentSubjectGrade" items="${ mustCulture }">
									<c:if test="${not loop_flag }">
										<c:if
											test="${ requiredCultureSubject.subjectId == studentSubjectGrade.subjectId}">
											<c:set var="loop_flag" value="true" />
										</c:if>
									</c:if>
								</c:forEach>
								<tr>
									<c:if test="${loop_flag == false}">
										<td style="width: 200px;">${ requiredCultureSubject.subjectId }</td>
										<td style="width: 500px;">${ requiredCultureSubject.subjectName }</td>
										<td style="width: 200px;">${ requiredCultureSubject.subjectScore }</td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:if>
			</div>
			<c:if test="${ entranceYear == 2018 }">
				<p style="font-size: 18px; font-weight: bold;">>&nbsp 핵심역량
					${coreTotal}/18</p>
				<div class="verticalTree"></div>
			</c:if>
		</div>
	</div>
	<br>
	<br>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>

</html>