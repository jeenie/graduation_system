<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
	  
	  <style>
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
	          background-color :  #4CAF50;
	          min-width: 160px;
	          box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
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
	      .dropdown-content a:hover {background-color: rgb(96, 185, 96)}
	
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
	    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
	    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
	
	    }

	    .form-group {
	      margin-bottom: 0;
	    }
	
	    .btn-submit {
	      padding: 6px 15px;
	      background: #1BBD36;
	      color: #fff;
	      border-radius: 4px;
	      border:none;
	      margin-top: 0;
	    }
	    .btn-warning {
	      padding: 6px 15px;
	      background-color: #f0ad4e;
	      border-color: #eea236;
	      color: #fff;
	      border-radius: 4px;
	      border:none;
	      margin-top: 0;
	    }
	    .btn-cancle {
	      padding: 6px 15px;
	      background-color: #BDBDBD;
	      border-color: #eea236;
	      color: #fff;
	      border-radius: 4px;
	      border:none;
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
	      overflow:  scroll;
	    }
	
	    .contents {
	      margin-top: 5px;
	      margin-right: 100px;
	      margin-left: 140px;
	      margin-bottom: 150px;
	    }
	
	    .divide {
	      margin-top: 20px;
	      margin-left: 60px;
	      margin-right: 60px;
	      height: 520px;
	
	    }
	    .left_sec {
	      margin-left: 60px;
	      float: left;
	      width: 300px;
	      height: 520px;
	    }
	
	    .abolish_list {
	      margin-top: 40px;
	      float: left;
	      border: 2px solid #1BBD36;
	      width: 300px;
	      height: 400px;
	    }
	
	    .right_sec {
	      margin-right: 60px;
	      float: right;
	      width: 300px;
	      height: 520px;
	    }
	
	    .alternative_list {
	      margin-top: 40px;
	      float: right;
	      border: 2px solid #1BBD36;
	      width: 300px;
	      height: 400px;
	    }
	
	    .myLavel {
	      margin: 0;
	      font-weight: bold;
	      font-size: 22px;
	    }
	
	    .selectSpan{
	      overflow:hidden;
	      width:25px;
	    }
	
	    .selectSpan:before{
	      content:'';
	      height:20px;
	      width:20px;
	      display:block;
	      border:5px solid #333;
	      border-left-width:0;
	      border-top-width:0;
	      transform:rotate(-45deg);
	      -webkit-transform:rotate(-45deg);
	      -moz-transform:rotate(-45deg);
	      -o-transform:rotate(-45deg);
	      -ms-transform:rotate(-45deg);
	      position:absolute;
	      top:7px;
	      right:7px;
	    }
	
	    .demoSpan1 {
	      width:40px;
	      height:40px;
	    }
	
	    .demoSpan1:before{
	      content:'';
	      height:8px;
	      width:8px;
	      background:#333;
	      border-radius:6px;
	      -webkit-border-radius:6px;
	      -moz-border-radius:6px;
	      display:block;
	      position:absolute;
	      top:5px;
	      left:16px;
	      box-shadow:0 12px 0 #333, 0 24px 0 #333;
	      -webkit-box-shadow:0 12px 0 #333, 0 24px 0 #333;
	      -moz-box-shadow:0 12px 0 #333, 0 24px 0 #333;
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
	      margin-top : 6px;
	      margin-right: 5px;
	      float: left;
	      font-weight: bold;
	      font-size:17px;
	    }
	
	    .font2 {
	      margin-top : 6px;
	      margin-right: 5px;
	      float: left;
	      font-weight: bold;
	      font-size:14px;
	    }
	    .font3 {
	      font-weight: bold;
	      font-size:14px;
	      margin: 0;
	    }
	
	    .plusCircle{
	      border-radius:50px;
	      -webkit-border-radius:50px;
	      -moz-border-radius:50px;
	      width:30px;
	      height:30px;
	      background-color: #fff;
	      color: #BDBDBD;
	    }
	
	    .plusCircle:before, .plusCircle:after{
	      content:'';
	      height:3px;
	      width:20px;
	      display:block;
	      background:#fff;
	      border-radius:10px;
	      -webkit-border-radius:10px;
	      -moz-border-radius:10px;
	      position:absolute;
	      top:11px;
	      left:3px;
	    }
	
	    .plusCircle:after{
	      height:20px; width:3px; top:3px; left:11px;
	    }
	    
	    .inputNumber {
	    	width:60px; 
	    	margin-right:0;
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
              <a href="index.html"><h1><span>SKHU</span>졸업관리시스템</h1></a>
            </div>
          </div>

          <div class="navbar-collapse collapse">
            <div class="menu">
              <ul class="nav nav-tabs" role="tablist">
              	<sec:authorize access="hasRole('ROLE_ADMIN')">
              		<li role="presentation"><a href="graduation/graduationRule">졸업요건</a></li>
	                <li role="presentation" class="dropdown" ><a href="">졸업관리</a>
	                  <div class="dropdown-content">
	                      <a href="">졸업요건 관리</a>
	                      <a href="">대체 과목 리스트 관리</a>
	                      <a href="majorAdmitManage.html">전공인정관리</a>
	                    </div>
	                </li>
              	</sec:authorize>
              	<sec:authorize access="hasRole('ROLE_PROFESSOR')">
              		<li role="presentation"><a href="">졸업요건</a></li>
                	<li role="presentation" class="dropdown"><a href="studentInquiryForProfessor.html">학생조회</a></li>
              	</sec:authorize>
              	<sec:authorize access="hasRole('ROLE_STUDENT')">
	                <li role="presentation"><a href="graduation_Guide.html">졸업요건</a></li>
	                <li role="presentation" class="dropdown"><a href="">졸업관리</a>
	                    <div class="dropdown-content">
	                      <a href="about.html">마이페이지</a>
	                      <a href="checkGrades.html">성적조회</a>
	                      <a href="">대체/타전공 현황</a>
	                    </div>
	                </li>
                </sec:authorize>
                <li role="presentation"><a href="http://www.skhu.ac.kr">학교홈페이지</a></li>
                <li role="presentation"><a href="https://forest.skhu.ac.kr/">종합정보시스템</a></li>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                	<li role="presentation" class="dropdown" ><a href="StudentInquiryForAdmin.html">사용자관리</a>
                  <div class="dropdown-content">
                    <a href="professorInquiry">교수조회</a>
                    <a href="graduation/studentListForAdmin">학생조회</a>
                  </div>
                </li>
                </sec:authorize>
                <li role="presentation"><a href="logout_processing">Logout</a></li>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                	<li>
	                  <div style="margin-top:28px; margin-left:1.5px;">
	                      <a href="adminEdit">
	                          <i class="fas fa-user-edit fa-lg"></i>
	                      </a>
	                  </div>
	                </li>
	            </sec:authorize>
                <sec:authorize access="hasRole('ROLE_PROFESSOR')">
                	<li>
	                  <div style="margin-top:28px; margin-left:1.5px;">
	                      <a href="professorEdit">
	                          <i class="fas fa-user-edit fa-lg"></i>
	                      </a>
	                  </div>
	                </li>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_STUDENT')">
	                <li>
	                  <div style="margin-top:28px; margin-left:1.5px;">
	                      <a href="studentEdit">
	                          <i class="fas fa-user-edit fa-lg"></i>
	                      </a>
	                  </div>
	                </li>
	            </sec:authorize>
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
        		<li style="font-size: 18px; margin-left: -5px;">
            		졸업 요건 안내
        		</li>
      		</div>
    	</div>
  	</div>

  	<div class="contents">
    	<form:form method="post" modelAttribute="departments">
      		<div>
		        <div class="form-group" style="float:left; margin-right: 20px; margin-bottom:5px;">
		            <p class="font2">학과</p>
		            <form:select path="departmentId" class="form-control w200" itemValue="id" itemLabel="departmentName" items="${departments}"/>
		        </div>
	        	<div class="form-group" style="float:left; margin-right: 20px; margin-bottom:5px;">
	          		<p class="font2">학번</p>
	          		<form:select path="entranceYear" class="form-control w200">
	          			<form:option value="0" label="전체" /> 
						<form:option value="2010" label="2010학번" />
						<form:option value="2011" label="2011학번" />
						<form:option value="2012" label="2012학번" />
						<form:option value="2013" label="2013학번" />
						<form:option value="2014" label="2014학번" />
						<form:option value="2015" label="2015학번" />
						<form:option value="2016" label="2016학번" />
						<form:option value="2017" label="2017학번" />
						<form:option value="2018" label="2018학번" /> 
	          		</form:select>
	        	</div>
        		<button type="submit" class="btn-submit" style="margin-left: 0; margin-top:0; padding: 5px 20px; float:left;">조회</button>
      		</div>
      	</form:form>
      <br/>
      <br/>

	  
  </div>


  <footer>
      <div class="footer">
        <div class="container">
          문의:test123@naver.com<br>
          152-716 서울시 구로구 연동로320<br>
          Copyright&copy; 2018SKHU Software Engineering All Rights Reserved<br>
        </div>
      </div>
  </footer>
</body>
</html>