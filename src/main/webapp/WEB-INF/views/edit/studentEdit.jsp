<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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


  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
  <!--style-->
  <style>
	select option:checked, select option:hover {     
      background: rgb(226, 240, 217);
      color: rgb(88, 88, 88); 
    }
    
    .contents{
      width: 1000px;
      margin-left: 100px;
      margin-right: 100px;
    }

    .btn-submit {
      padding: 8px 20px;
      background: #1BBD36;
      color: #fff;
      border-radius: 4px;
      border:none;
      margin-top: 10px;
    }
    .group{
      margin-top: -10px;
      margin-left: 60px;
      margin-right: 60px;
      height: 180px;

    }
    .edit{
        margin-top: -50px;
      margin-left: 80px;
      margin-right: 80px;
    }
  </style>
</head>
<body>
	<header>
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
          <div class="navigation">
            <div class="container">
              <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse.collapse">
                  <span class="sr-only">Toggle navigation</span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                </button>
                <div class="navbar-brand">
                  <a href="index"><h1><span>SKHU</span>졸업관리시스템</h1></a>
                </div>
              </div>

              <div class="navbar-collapse collapse">
                <div class="menu">
                  <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation"><a href="graduation_Guide.html">졸업요건</a></li>
	                <li role="presentation" class="dropdown"><a href="">졸업관리</a>
	                    <div class="dropdown-content">
	                      <a href="about.html">마이페이지</a>
	                      <a href="checkGrades.html">성적조회</a>
	                      <a href="">대체/타전공 현황</a>
	                    </div>
	                </li>
	                <li role="presentation"><a href="http://www.skhu.ac.kr">학교홈페이지</a></li>
	                <li role="presentation"><a href="https://forest.skhu.ac.kr/">종합정보시스템</a></li>
                    <li role="presentation"><a href="${R}user/logout_processing">Logout</a></li>
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
            <li>
            </li>
            <li style="font-size: 20px; margin-left: -5px;">
                개인정보수정
            </li>
          </div>
          <hr>
        </div>
      </div>

        <div class="contents">
        	<form:form method="post" modelAttribute="student">
	            <div class="group">
	                <h4><img src="${R}res/images/abouti/student.png" width="80px">&nbsp&nbsp&nbsp<font color="#41AF39">${student.getName()}</font> 님은 [<b> 학생 </b>] 회원입니다.</h4>
	                <hr>
	            </div>
            <div class="edit">
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
		    				<form:select path="departmentId" class="form-control w300" itemValue="id" itemLabel="departmentName" items="${ departments }" /> 
		    			</div>
		    			<div class="form-group">
		      				<label>학년</label>
		      				<form:input path="grade" type="number" class="form-control w300" />
		    			</div>
		    			<div class="form-group">
		      				<label>비밀번호</label>
		      				<form:input path="password" type="password" class="form-control w300" />
		    			</div>
		    			<div class="form-group">
		      				<label>비밀번호 재입력</label>
		      				<form:input path="password2" type="password" class="form-control w300" />
		    			</div>
		    			<div class="form-group"> 
		    				<label>비밀번호 찾기 질문</label> 
		    				<form:select path="passwordQuestion" class="form-control w200" itemValue="quizCode" itemLabel="quizContent" items="${ quizs }" /> 
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
		      				<form:input path="completeSemester" type="number" class="form-control w300" />
		    			</div>
                    <br>
                    
                    <p>
                        <input type="submit" class="btn-submit" value="저장" style="float: right;">    
                    </p>
            </div>
            </form:form>
        </div>
  

  </div>

  <br>
  <br>
  <br>

  <footer>
      <div class="footer">
          <div class="container">
            문의:test123@naver.com<br>
            152-716 서울시 구로구 연동로320<br>
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