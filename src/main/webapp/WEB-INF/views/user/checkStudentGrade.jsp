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
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">

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

	tabl,
    th,
    td {
      border: 1px solid #bcbcbc;
      text-align: center;
      }

    table {
      width: 100%;
      color: black;
      }
      
</style>
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
							<a href="${R}user/index"><h1>
									<span>SKHU</span>졸업관리시스템
								</h1></a>
						</div>
					</div>

					<div class="navbar-collapse collapse">
						<div class="menu">
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation"><a href="${R}user/graduationRule?departmentId=99&entranceYear=99">졸업요건</a></li>
								<li role="presentation" class="dropdown"><a href="">졸업관리</a>
									<div class="dropdown-content">
										<a href="about.html">마이페이지</a> <a href="${R}user/checkStudentGrade">성적조회</a>
										<a href="">대체/타전공 현황</a>
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
          <li>
          </li>
          <li style="font-size: 20px; margin-left: -5px;">
              성적조회
          </li>
        </div>
        <hr>
      </div>
    </div>
  <div class="feature">
  
        <div class="privacy">
          <table>
            <tr bgcolor="#BCE55C">
              <th>학과</th>
              <th>학년</th>
              <th>학번</th>
              <th>이름</th>
            </tr>
      
        <tr data-url="checkGrades?id=${ student.id }">
          <td>${ student.departmentName }</td>
          <td>${ student.grade }</td>
          <td>${ student.id }</td>
          <td>${ student.name }</td>
        </tr>
		
          </table>
        </div>
        <hr>
       
        <div class="gradeCheck">
        <table>
            <tr bgcolor="#BCE55C">
              <th>년도</th>
              <th>학기</th>
              <th>과목코드</th>
              <th>과목명</th>
              <th>이수구분</th>
              <th>학점</th>
              <th>성적등급</th>
            </tr>
         
        <c:forEach var="grade" items="${ grades }">
        <tr data-url="checkGrades?id=${ grade.id }">
          <td>${ grade.yearOfClass }</td>
          <td>${ grade.yearOfSemester }</td>
          <td>${ grade.subjectId }</td>
          <td>${ grade.subjectName }</td>
          <td>${ grade.completeType }</td>
          <td>${ grade.subjectScore }</td>
          <td>${ grade.grade }</td>
        </tr>
        </c:forEach>
		 
        </table>
        
        <table>
           <tr bgcolor="#A6A6A6">
           		<th>전체 취득학점</th>
                <th>전체 평점</th>   
           </tr>
           
           <tr>
           		<td>${ totalG.totalUnit }</td>
                <td>${ totalG.totalAvgGrade }</td>   
           </tr>
        </table>
        <hr>
         
        <div class="total"> 
        <table>
        	 
              <tr bgcolor="#BCE55C">
              	<th>전필</th>
                <th>전선</th>
                <th>교필</th>
                <th>교선</th>
                <th>합계</th>
              </tr>
              
              <tr>
                <td>${ totalRM.totalRequiredMajor }</td>
                <td>${ totalSM.totalSelectedMajor }</td>
                <td>${ totalRC.totalRequiredCulture }</td>
                <td>${ totalSC.totalSelectedCulture }</td>
                <td>${ totalG.totalUnit }</td>
              </tr>
              </table>  
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
  
</body>
</html>