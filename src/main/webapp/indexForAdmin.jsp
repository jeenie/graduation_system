<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>SKHU졸업관리시스템</title>

  <!-- Bootstrap -->
  <link href="res/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="res/css/font-awesome.min.css">
  <link rel="stylesheet" href="res/css/animate.css">
  <link rel="stylesheet" href="https://icono-49d6.kxcdn.com/icono.min.css">
  <link href="res/css/prettyPhoto.css" rel="stylesheet">
  <link href="res/css/style.css" rel="stylesheet" />
  
  <!-- font awesome-->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
  
  <!-- =======================================================
    Theme Name: Company
    Theme URL: https://bootstrapmade.com/company-free-html-bootstrap-template/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
  ======================================================= -->

  <!--style-->


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

      /*admin modal - 대체과목리스트 추가, 수정, 삭제*/
      .contents {
        margin-top: 5px;
        margin-right: 20px;
        margin-left: 90px;
        height: 630px;
      }

      .divide {
        margin-top: 20px;
        height: 450px;

      }

      .myLavel {
        margin: 0;
        font-weight: bold;
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


      tr:hover td {
        background-color: #ffe; cursor: pointer;
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
  </style>
</head>

<body  onload="initialize()">
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
                      <a href="">졸업요건 관리</a>
                      <a href="">대체 과목 리스트 관리</a>
                      <a href="majorAdmitManage.html">전공인정관리</a>
                    </div>
                </li>
                <li role="presentation"><a href="http://www.skhu.ac.kr">학교홈페이지</a></li>
                <li role="presentation"><a href="https://forest.skhu.ac.kr/">종합정보시스템</a></li>
                <li role="presentation" class="dropdown" ><a href="StudentInquiryForAdmin.html">사용자관리</a>
                  <div class="dropdown-content">
                    <a href="professorInquiry.html">교수조회</a>
                    <a href="studentListForAdmin.jsp">학생조회</a>

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

  <section id="main-slider" class="no-margin">
    <div class="carousel slide">
      <div class="carousel-inner">
        <div class="item active" style="background-image: url(res/img/graduation-3.jpg)">
          <div class="container">
            <div class="row slide-margin">
              <div class="col-sm-6">
                <div class="carousel-content">
                  <h2 class="animation animated-item-1">&nbsp;Welcome <span>SKHU</span></h2>
                  <p class="animation animated-item-2"></p>&nbsp;&nbsp;
                  <a class="btn-slide animation animated-item-3" href="#">이용안내</a>
                </div>
              </div>

              <div class="col-sm-6 hidden-xs animation animated-item-4">
                <div class="slider-img">
                  <!--<img src="images/slider/img3.png" class="img-responsive"> -->
                </div>
              </div>

            </div>
          </div>
        </div>
        <!--/.item-->
      </div>
      <!--/.carousel-inner-->
    </div>
    <!--/.carousel-->
  </section>
  <!--/#main-slider-->

  <div class="feature">
    <div class="container">
      <div class="text-center">
        <div class="col-md-3">
          <div class="hi-icon-wrap hi-icon-effect wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
            <a href=""><i class="fa fa-book"></i></a>
            <h2>졸업요건 수정</h2>
            <p></p>
          </div>
        </div>
        <div class="col-md-3">
          <div class="hi-icon-wrap hi-icon-effect wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
            <a href=""><i class="fa fa-laptop"></i></a>
            <h2>대체리스트 수정</h2>
            <p></p>

          </div>
        </div>
        <div class="col-md-3">
          <div class="hi-icon-wrap hi-icon-effect wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="900ms">
            <a href="majorAdmitManage.html"><i class="fas fa-book-reader"></i></a>
            <h2>전공인정관리</h2>
            <p></p>
          </div>
        </div>
        <div class="col-md-3">
          <div class="hi-icon-wrap hi-icon-effect wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="1200ms">
            <a href="adminAdd.html"><i class="far fa-address-card"></i></a>
            <h2>교수 추가</h2>
            <p></p>
          </div>
        </div>
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

  <div class="modal fade" id="loginModal" tabinex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
      <div class="modal-dialog">
          <div class="modal-content">
              <div class="modal-header" style="padding-bottom:1.5px;">

                  <h4><b>로그인</b>
                      <button type="button" class="close" data-dismiss="modal">
                      <span aria-hidden="true">×</span>
                      <span class="sr-only">Close</span>
                      </button>
                  </h4>

              </div>
              <div class="modal-body">
                <form>
                    <div class="from-group">
                      <label>ID</label>
                      <input type="text" name="id" class="form-control" maxlength="20">
                    </div>
                    <br>
                    <div class="from-group">
                      <label>Password</label>
                      <input type="password" name="password" class="form-control" maxlength="20">
                    </div>
                    <div class="modal-footer">
                       <a class="btn btn-line" data-dismiss="modal" data-toggle="modal" href="#registerModal">회원가입</a>
                       <button type="submit" class="btn btn-submit">로그인</button>
                    </div>
                </form>
              </div>
          </div>
      </div>
  </div>

  <div class="modal fade" id="registerModal" tabinex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
      <div class="modal-dialog">
          <div class="modal-content">
              <div class="modal-header" style="padding-bottom:1.5px;">

                  <h4><b>회원가입</b>
                      <button type="button" class="close" data-dismiss="modal">
                      <span aria-hidden="true">×</span>
                      <span class="sr-only">Close</span>
                      </button>
                  </h4>

              </div>
              <div class="modal-body">
                <form>
                    <div class="from-group">
                      <label class="label-modal">이름</label>
                      <input type="text" name="studentName" class="form-control" maxlength="20">
                    </div>
                    
                    <div class="from-group">
                      <label class="label-modal">학번</label>
                      <input type="text" name="studentNumber" class="form-control" maxlength="20">
                    </div>
                  
                    <div class="from-group">
                      <label class="label-modal">학과</label>
                      <input type="text" name="studentMajor" class="form-control" maxlength="20">
                    </div>
                    
                    <div class="from-group">
                      <label class="label-modal">학년</label>
                      <input type="text" name="studentYear" class="form-control" maxlength="1">
                    </div>
                    
                    <div class="from-group">
                      <label>비밀번호</label>
                      <input type="password" name="password" class="form-control" maxlength="20">
                    </div>
                    
                    <div class="from-group">
                      <label>비밀번호 확인</label>
                      <input type="password" name="password" class="form-control" maxlength="20">
                    </div>
                    <div class="form-group">
                      <label>비밀번호 찾기 질문</label>
                      <select class="form-control" name="findPassword">
                          <option>내 보물 1호는?</option>
                          <option>내 초등학교 별명은?</option>
                          <option>내 남자(여자)친구 이름은?</option>
                          <option>내 강아지 이름은?</option>
                      </select>
                    </div>
                    
                    <div class="from-group">
                      <label class="label-modal">비밀번호 찾기 답변</label>
                      <input type="text" name="passwordAnswer" class="form-control" maxlength="20">
                    </div>
                    
                    <div class="from-group">
                      <label class="label-modal">OTP</label>
                      <input type="text" name="studentOTP" class="form-control" style="width: 350px; margin: 0;" maxlength="20">
                      <input type="button" class="btn btn-line" style="margin-left: 0px; font-size: 14px; height:34px;" value="OTP 확인">
                    </div>
                    
                    <div class="from-group">
                      <label class="label-modal">이수 과목 목록 첨부</label>
                      <input type="file" name="studentDB" class="form-control" maxlength="20">
                    </div>
                    
                    <div class="modal-footer">
                       <button type="submit" class="btn btn-submit">회원가입</button>
                    </div>
                    
                </form>
              </div>
          </div>
      </div>
  </div>



  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="/res/js/jquery-2.1.1.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="res/js/bootstrap.min.js"></script>
  <script src="res/js/jquery.prettyPhoto.js"></script>
  <script src="res/js/jquery.isotope.min.js"></script>
  <script src="res/js/wow.min.js"></script>
  <script src="res/js/functions.js"></script>
  
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  <script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
  <script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->

</body>

</html>