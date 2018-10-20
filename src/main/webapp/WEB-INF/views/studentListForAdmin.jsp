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
                    <a href="StudentInquiryForAdmin.html">학생조회</a>

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
    
</body>
</html>