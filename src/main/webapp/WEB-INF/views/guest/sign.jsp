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
<link href="${R}res/css/prettyPhoto.css" rel="stylesheet">
<link href="${R}res/css/style.css" rel="stylesheet" />
<link href="${R}res/css/custom.css" rel="stylesheet">

<!--style-->


<style>
.btn-submit {
	padding: 8px 20px;
	background: #1BBD36;
	color: #fff;
	border-radius: 4px;
	border: none;
	margin-top: 10px;
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

.menu li ul {
	background-color: #1BBD36;
	display: none;
	height: auto;
	padding: 0px;
	margin: 0px;
	border: 0px;
	position: absolute;
	list-style: none;
	width: 200px;
	z-index: 200;
}

.menu li:hover ul {
	display: block;
}


input.form-control.w300 {
	width: 300px;
}
</style>
</head>
<body onload="initialize()">
	<%@ include file="/WEB-INF/views/include/guestNavibar.jsp"%>
	
	<c:if test="${pwError}">
		<script>
			alert("비밀번호가 일치하지 않습니다. 다시입력해주세요.");
		</script>
	</c:if>
	<c:if test="${blankError}">
		<script>
			alert("채워지지 않은 항목들이 있습니다. 다시 입력해주세요.");
		</script>
	</c:if>
	<c:if test="${fileError}">
		<script>
			alert("첨부 파일이 존재하지 않습니다. 파일을 첨부해주세요.");
		</script>
	</c:if>
	
	<div id="breadcrumb">
		<div class="container">
			<div class="breadcrumb">
				<li></li>
				<li style="font-size: 20px; margin-left: -5px;">회원가입</li>
			</div>
			<hr>
		</div>
	</div>
	<div class="aboutus">
		<div class="container"
			style="margin-left: 140px; margin-bottom: 150px">
			<img src="${R}res/images/abouti/professor-1.png"
				style="width: 250px; height: 250px; float: left; border-radius: 5px; padding-right: 20px;">
			<div style="margin-left: 250px;">
				<form:form method="post" modelAttribute="student"  id="signForm"  enctype="multipart/form-data">
					<div class="form-group">
						<label>학번</label>
						<form:input path="id" class="form-control w300" />
					</div>
					<div class="form-group">
						<label>이름</label>
						<form:input path="name" class="form-control w300" />
					</div>
					<div class="form-group">
						<label>학과</label>
						<form:select path="departmentId" class="form-control"
							itemValue="id" itemLabel="departmentName"
							items="${ departments }" style="width:230px"/>
					</div>
					<div class="form-group">
						<label>입학구분</label>
						<br/>
						<label class="radio-inline"><form:radiobutton path="entranceType" value="신입학" label="신입학"/></label>
						<label class="radio-inline"><form:radiobutton path="entranceType" value="편입학" label="편입학"/></label>
					</div>
					<div class="form-group">
						<label>학년</label>
						<br/>
						<label class="radio-inline"><form:radiobutton path="grade" value="1" label="1"/></label>
						<label class="radio-inline"><form:radiobutton path="grade" value="2" label="2"/></label>
						<label class="radio-inline"><form:radiobutton path="grade" value="3" label="3"/></label>
						<label class="radio-inline"><form:radiobutton path="grade" value="4" label="4"/></label>
					</div>
					<div class="form-group">
						<label>비밀번호</label>
						<form:input path="password" type="password"
							class="form-control w300" id="password1"/>
					</div>
					<div class="form-group">
						<label>비밀번호 재입력</label>
						<form:input path="password2" type="password"
							class="form-control w300" id="password2"/>
					</div>
					<font name="check" size="2" color="red"></font>
					<div class="form-group">
						<label>비밀번호 찾기 질문</label>
						<form:select path="passwordQuestion" class="form-control w200"
							itemValue="quizCode" itemLabel="quizContent" items="${ quizs }" style="width:300px"/>
					</div>
					<div class="form-group">
						<label>비밀번호 찾기 답변</label>
						<form:input path="passwordAnswer" class="form-control w300" />
					</div>
					<div class="form-group">
						<label>이메일</label>
						<form:input path="email" type="email" class="form-control w300" />
					</div>
					<div class="form-group">
						<label>이수완료학기</label>
						<form:input path="completeSemester" type="number"
							class="form-control w300" />
					</div>
					
					<div class="form-group">
						<label>성적파일 업로드</label>
						<form:input path="file" type="file" class="form-control w300" accept=".xls,xlsx"/>
					</div>
					
					<hr />
					<div>
						<button type="submit" class="btn btn-submit">
							<span class="glyphicon glyphicon-ok"></span> 회원가입
						</button>
						<a href="${R}guest/index" class="btn btn-submit"> <i
							class="glyphicon glyphicon-remove"> 취소</i>
						</a>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<footer>
		<div class="footer">
			<div class="container">
				문의:test123@naver.com<br> 152-716 서울시 구로구 연동로320<br>
				Copyright&copy; 2018SKHU Software Engineering All Rights Reserved<br>


			</div>
		</div>
	</footer>
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