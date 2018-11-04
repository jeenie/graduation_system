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
	      /* Add a black background color to the top navigation */
	      .topnav {
	          background-color: #333;
	          overflow: hidden;
	      }
	
	      /* Style the links inside the navigation bar */
	      .topnav a {
	          float: left;
	          color: #f2f2f2;
	          text-align: center;
	          padding: 14px 16px;
	          text-decoration: none;
	          font-size: 13px;
	      }
	
	      /* Change the color of links on hover */
	      .topnav a:hover {
	          background-color: #ddd;
	          color: black;
	      }
	
	      /* Add a color to the active/current link */
	      .topnav a.active {
	          background-color: #4CAF50;
	          color: white;
	      }
	
	      .body_btn {
	        border: none; /* Remove borders */
	        border-radius:2.5px;
	        color: white; /* Add a text color */
	        padding: 4px 10px; /*14px 28px;  Add some padding */
	        width : 50px;
	        height : 25px;
	        cursor: pointer; /* Add a pointer cursor on mouse-over */
	      }
	
	      .btn-statement1 { /*처리중*/
	        border: none; /* Remove borders */
	        border-radius:2.5px;
	        color: white; /* Add a text color */
	        padding: 4px 10px; /*14px 28px;  Add some padding */
	        width : 80px;
	        height : 25px;
	        cursor: pointer; /* Add a pointer cursor on mouse-over */
	        background-color:#e68a00
	      }
	
	      .btn-statement2 { /*처리완료*/
	        border: none; /* Remove borders */
	        border-radius:2.5px;
	        color: white; /* Add a text color */
	        padding: 4px 10px; /*14px 28px;  Add some padding */
	        width : 80px;
	        height : 25px;
	        cursor: pointer; /* Add a pointer cursor on mouse-over */
	        background-color:#4CAF50
	      }
	
	      .warning {background-color: #ff9800;} /* Orange */
	      .warning:hover {background: #e68a00;}
	
	      /*modal size*/
	      .modal-dialog.modal-size { width: 600px; height: 600px; }
	
	      /*pagination*/
	      .pagination {
	         justify-content: center;
	         text-align:center;
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
	      .pagination a:hover:not(.active) {background-color: #ddd;}
	
	
	      td {
	        text-align: center;
	        vertical-align: middle;
	      }
	
	      .table-info {
	        width:400px;
	
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
		    .btn-submit {
		      padding: 8px 20px;
		      background: rgb(80, 153, 92);
		      color: #fff;
		      border-radius: 4px;
		      border:none;
		      margin-top: 10px;
		      margin-right: 20px;
		    }
		    
		    input.form-control.w300 { 
  				width: 300px; 
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
              <a href="indexForAdmin.html"><h1><span>SKHU</span>졸업관리시스템</h1></a>
            </div>
          </div>

          <div class="navbar-collapse collapse">
            <div class="menu">
              <ul class="nav nav-tabs" role="tablist">
                <li role="presentation"><a href="">졸업요건</a></li>
                <li role="presentation" class="dropdown" ><a href="">졸업관리</a>
                  <div class="dropdown-content">
                      <a href="${R}graduation/deptRuleEdit?departmentId=99&entranceYear=99">학과별 졸업요건 </a>
	                  <a href="${R}graduation/culturalSubject?entranceYear=99">교양 필수 과목 </a>
                      <a href="">대체 과목 리스트 관리</a>
                      <a href="majorAdmitManage.html">전공인정관리</a>
                    </div>
                </li>
                <li role="presentation"><a href="http://www.skhu.ac.kr">학교홈페이지</a></li>
                <li role="presentation"><a href="https://forest.skhu.ac.kr/">종합정보시스템</a></li>
                <li role="presentation" class="dropdown" ><a href="StudentInquiryForAdmin.html">사용자관리</a>
                  <div class="dropdown-content">
                    <a href="professorInquiry.html">교수조회</a>
                    <a href="StudentInquiryForAdmin.html">학생조회</a>

                  </div>
                </li>
                <li role="presentation"><a href="${R}user/logout_processing">Logout</a></li>
                <li>
                  <div style="margin-top:28px; margin-left:1.5px;">
                      <a href="managerInfoEdit.html">
                          <i class="fas fa-user-edit fa-lg"></i>
                      </a>
                  </div>
              </li>

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
                	교수 추가
            </li>
        </div>
        <hr>
    </div>
  </div>
  <div class="aboutus">
        <div class="container">

                        <img src="${R}res/images/abouti/professor-1.png" style="width:250px; height:250px; float:left; border-radius:5px; padding-right:20px;">
                        <div style="margin-left:250px; margin-bottom:50px;">
				            <form:form method="post" modelAttribute="professor">
				    			<div class="form-group">
				      				<label>교번</label>
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
				      				<label>비밀번호</label>
				      				<form:input path="password" type="password" class="form-control w300" />
				    			</div>
				    			<div class="form-group">
				      				<label>이메일</label>
				      				<form:input path="email" type="email" class="form-control w300" />
				    			</div>
				    			<hr />
				    			<div>
				      				<button type="submit" class="btn btn-submit">
				        				<span class="glyphicon glyphicon-ok"></span> 등록
				        			</button>
				        			<a href="index"><button type="button" class="btn btn-primary"><i class="glyphicon glyphicon-remove"> 취소</i></button></a>
				    			</div>
				  			</form:form>
		  		</div>                       
        </div>
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