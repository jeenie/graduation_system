<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
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
  
  <!-- font awesome-->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
  
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

        .btn-m1 {
            /*전공,교양,전공탐색 충족*/
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
            background-color:rgb(46, 110, 46);
        }

        .btn-m2 {
            /*전공,교양, 전공탐색 미충족*/
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
            background-color: rgb(179, 179, 179);
        }

        .btn-delete {
            border: none;
            /* Remove borders */
            border-radius: 2.5px;
            color: white;
            /* Add a text color */
            padding: 4px 5px;
            /*14px 28px;  Add some padding */
            width: 60px;
            height: 33px;
            cursor: pointer;
            /* Add a pointer cursor on mouse-over */
            background-color:rgb(19, 160, 216);
        }


        .warning {
            background-color: #ff9800;
        }

        /* Orange */

        .warning:hover {
            background: #e68a00;
        }

        /*pagination*/

        .pagination {
            justify-content: center;
            text-align: center;
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

        .pagination a:hover:not(.active) {
            background-color: #ddd;
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

        /*input class 변경*/

        .form-controls {
            width: 160px;
            height: 30px;
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
            background-color: whitesmoke;
            color:black;
            font-weight: normal;
            padding-top: 7px;
            padding-left: 7px;
        }

        input[type="submit"] {
            width: 60px;
            height: 35px;
            border:none;
            background-color: grey;
            color : white;
            font-weight: bold;

        }

        /*학생정보*/
        
        .td-s{
            border: 1px solid #8a8a8a;
            text-align: center;
            }
    
        .th-s{
        width:100px;
        height:36px;
        border: 1px solid #8a8a8a;
        text-align: center;
        background-color: rgb(226, 240, 217);
        }

        .table-s {
        width: 100%;
        color: black;
        border: 1px solid #8a8a8a;
        }

        textarea {
        width: 100%;
        height: 100px;
        padding: 10px 10px;
        font-size: 13px;
        border-radius:1px;
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
              <a href="indexForAdmin.jsp"><h1><span>SKHU</span>졸업관리시스템</h1></a>
            </div>
          </div>

          <div class="navbar-collapse collapse">
            <div class="menu">
              <ul class="nav nav-tabs" role="tablist">
                <li role="presentation"><a href="">졸업요건</a></li>
                <li role="presentation" class="dropdown" ><a href="">졸업관리</a>
                  <div class="dropdown-content">
                      <a href="">졸업요건 관리</a>
                      <a href="">대체 과목 리스트 관리</a>
                      <a href="majorAdmitManage.html">전공인정관리</a>
                    </div>
                </li>
                <li role="presentation"><a href="http://www.skhu.ac.kr">학교홈페이지</a></li>
                <li role="presentation"><a href="https://forest.skhu.ac.kr/">종합정보시스템</a></li>
                <li role="presentation" class="dropdown" ><a href="StudentInquiryForAdmin.html">사용자관리</a>
                  <div class="dropdown-content">
                    <a href="graduation/professorInquiry">교수조회</a>
                    <a href="graduation/studentListForAdmin">학생조회</a>

                  </div>
                </li>
                <li role="presentation"><a href="">Logout</a></li>
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
                    	학생 조회
                </li>
            </div>
            <hr>
        </div>
    </div>
    <div class="aboutus">
        <div class="container">
            <div style="margin-top: 30px">
                <div class="contents" style="text-align:center;">
                    <div>
                    <form>
                        <input type="text" class="form-controls btn-m1" name="inputsearch" style="width:665px;">
                        &nbsp;<input type="submit" value="검색">
                    
                    <a data-toggle="modal" href="#search">
                        <h5 style="color:rgb(104, 97, 97)">
                            <b>
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                <u>검색대상설정</u>
                                <i class="fas fa-angle-down fa-lg"></i>
                            </b>
                        </h5>
                    </a>
                    </form>
                    </div>
                    <br>
                    <br>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col" class="text-center">학과</th>
                                <th scope="col" class="text-center">이름</th>
                                <th scope="col" class="text-center">학번</th>
                                <th scope="col" class="text-center">이수학기</th>
                                <th scope="col" class="text-center">졸업요건충족여부</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach var="student" items="${students}">
                            	<tr data-toggle="modal" data-id="studentInfo" data-target="#studentInfo">
                                	<td>${ student.departmentName }</td>
                                	<td>${ student.name }</td>
                                	<td>${ student.id }</td>
                                	<td>${ student.completeSemester}학기</td>
                                	<td>
                                    	<button type="button" class="btn-m2">전공</button>
                                    	<button type="button" class="btn-m2">교양</button>
                                	</td>
                            	</tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <!--pagination-->
                    <div class="pagination">
                        <a href="#">&laquo;</a>
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                        <a href="#">&raquo;</a>
                    </div>
                </div>

            </div>

        </div>

    </div>
    <div class="modal fade" id="search" tabinex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="padding-bottom:1.5px;">

                    <h4><b>검색대상설정</b>
                        <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span>
                        <span class="sr-only">Close</span>
                        </button>
                    </h4>

                </div>
                <div class="modal-body">
                    <form>
                        <div class="modalGreen">
                            <i class="fas fa-caret-right"></i>&nbsp;학과
                        </div>
                        <div style="padding-top:15px; padding-bottom:15px;">
                            &nbsp;
                            <input type="checkbox"> 소프트웨어공학과 &nbsp;&nbsp;
                            <input type="checkbox"> 정보통신공학과 &nbsp;&nbsp;
                            <input type="checkbox"> 컴퓨터공학과
                            <br> &nbsp;
                            <input type="checkbox"> 글로컬IT학과 &nbsp;&nbsp;
                            <input type="checkbox"> IT융합학부
                        </div>
                        <div class="modalGreen">
                            <i class="fas fa-caret-right"></i>&nbsp;학년
                        </div>
                        <div style="padding-top:15px; padding-bottom:15px;">
                            &nbsp;
                            <input type="checkbox"> 1학년 &nbsp;&nbsp;
                            <input type="checkbox"> 2학년 &nbsp;&nbsp;
                            <input type="checkbox"> 3학년 &nbsp;&nbsp;
                            <input type="checkbox"> 4학년
                        </div>
                        <div class="modalGreen">
                            <i class="fas fa-caret-right"></i>&nbsp;학번&nbsp;
                            <select class="form-controls" style="width:100px; height:30.5px;">
                                <option selected> =학번=</option>
                                <option>2018학번</option>
                                <option>2017학번</option>
                                <option>2016학번</option>
                                <option>2015학번</option>
                                <option>2014학번</option>
                                <option>2013학번</option>
                                <option>2012학번</option>
                                <option>2011학번</option>
                                <option>2010학번</option>
                            </select>
                        </div>
                       
                        <div class="modalGreen">
                            <i class="fas fa-caret-right"></i>&nbsp;수강과목&nbsp;
                            <input type="text" class="form-controls" value="데이터베이스 캡스톤"  >
                        </div>
                        
                        <div class="modalGreen">
                            <i class="fas fa-caret-right"></i>&nbsp;이름
                            &nbsp;
                            <input type="text" class="form-controls" value="홍길동" style="width:100px;">
                        </div>
                        
                        <div class="modalGreen">
                            <i class="fas fa-caret-right"></i>&nbsp;학번
                            &nbsp;
                            <input type="text" class="form-controls" value="20160000" style="width:100px;">
                        </div>
                        
                        <div class="modalGreen">
                            <i class="fas fa-caret-right"></i>&nbsp;졸업요건 미충족&nbsp;
                            <input type="checkbox">&nbsp;&nbsp;
                        </div>
                        


                    </form>




                </div>
                <div class="modal-footer">
                   
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="studentInfo" tabinex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="padding-bottom:1.5px;">
    
                        <h4><b>학생정보</b>
                        <button type="button" class="close" data-dismiss="modal">
                            <span aria-hidden="true">×</span>
                            <span class="sr-only">Close</span>
                        </button>
                        </h4>
    
                    </div>
                    <div class="modal-body">
                        <div>
                            <table class="table-s">
                                <tr>
                                    <th class="th-s">학번</th>
                                    <td class="td-s">20101010</td>
                                    <th class="th-s">성명</th>
                                    <td class="td-s">오지현</td>
                                </tr>
                                <tr>
                                    <th class="th-s">학부(과)</th>
                                    <td class="td-s">소프트웨어공학과</td>
                                    <th class="th-s">학년</th>
                                    <td class="td-s">3</td>

                                </tr>
                                <tr>
                                    <th class="th-s">입학구분</th>
                                    <td class="td-s">신입학</td>
                                    <th class="th-s">이수학기</th>
                                    <td class="td-s">3학년-2학기</td>
                                </tr>
                            </table>
                            <div>
                                <br>
                                &nbsp;OOO 학생은 <i class="fas fa-lock"></i>&nbsp;
                                <select name="special course">
                                    <option value="">특별과정선택</option>
                                    <option value="전공기초과정" selected="selected">전공기초과정</option>
                                    <option value="전공심화과정">전공심화과정</option>
                                    <option value="타과복수전공과정">타과복수전공과정</option>
                                    <option value="타과부전공과정">타과부전공과정</option>
                                </select>&nbsp을 이수하고 있습니다.
                                       
                            </div> 
                        </div>
                        <div>
                            <div class="skill">
                                <div class="progress-wrap" style="width:350px;">
                                    <br>
                                    <b>＞총 학점</b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp88/130</h4>
                                    <div class="progress">
                                        <div class="progress-bar color4" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 65%">
                                            <span class="bar-width">67%</span>
                                        </div>
                                    </div>
                                </div> 
                                <div class="progress-wrap" style="width:350px;">
                                    <b>＞전공</b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp88/130
                                    <div class="progress">
                                        <div class="progress-bar  color1" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                            <span class="bar-width">78%</span>
                                        </div>
                                    </div>
                                    
                                </div>
                                <img src="images/abouti/maj.png" width="100%">
                                <div class="progress-wrap" style="width:350px;">
                                    <b>＞ 교양</b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp41/47
                                    <div class="progress">
                                        <div class="progress-bar color3" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 90%">
                                            <span class="bar-width">90%</span>
                                        </div>
                                    </div>
                                    
                                </div>
                                <img src="images/abouti/ref.png" width="100%">
                            </div>
                            

                        </div>
                        
                           
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" onclick="alert('해당학생의 정보를 정말 삭제하시겠습니까?')">삭제</button>
                    </div>
                </div>
            </div>
        </div>

    <footer>
        <div class="footer">
            <div class="container">
                문의:test123@naver.com
                <br> 152-716 서울시 구로구 연동로320
                <br> Copyright&copy; 2018SKHU Software Engineering All Rights Reserved
                <br>


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