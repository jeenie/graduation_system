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
	    
	    .font4 {
			margin-top: 6px;
			margin-right: 5px;
			float: left;
			font-weight: bold;
			font-size: 16px;
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
	    .majorlist {
			height: 259px;
			overflow-y: scroll;
		}
	  </style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/adminNavibar.jsp" %>
  	
  	<div id="breadcrumb">
    	<div class="container">
      		<div class="breadcrumb">
        		<li></li>
        		<li style="font-size: 18px; margin-left: -5px;">
            		학과별 졸업 요건 관리
        		</li>
      		</div>
    	</div>
  	</div>

  	<div class="contents">
    	<form>
      		<div>
		        <div class="form-group"
					style="float: left; margin-right: 20px; margin-bottom: 5px;">
					<p class="font4">학과</p>
					<select name="departmentId" class="form-controls w200">
						<option value="99">선택</option>
						<c:forEach var="department" items="${departments}">
							<option value="${department.id}"
								${departmentId == department.id ? "selected" : ""}>${department.departmentName}</option>
						</c:forEach>
					</select>
				</div>
	        	<div class="form-group"
					style="float: left; margin-right: 20px; margin-bottom: 5px;">
					<p class="font4">학번</p>
					<select name="entranceYear" class="form-controls w200">
						<option value="99">선택</option>
						<c:forEach var="year" items="${years}">
							<option value="${year.year}"
								${entranceYear == year.year ? "selected" : ""}>${year.year}</option>
						</c:forEach>
					</select>
				</div>
        		<button type="submit" class="btn-submit" style="margin-left: 0; margin-top:0; padding: 5px 20px; float:left;">조회</button>
      		</div>
      	</form>
      <br/>
      <br/>
	  <c:if test="${departmentId == 32}">
	  	<div style="margin-top:10px; margin-left:20px;">
	  		<p style="">
	            <div class="form-group" style="float:left; margin-bottom:0px;">
	                <p class="font2">전필</p>
	                <input type="number" value="${firstRule.mustMajor}" class="form-control" style="width: 40px; padding-top: 2px; padding-left: 10px; padding-right: 0px;"/>
	            </div>
	            <div class="form-group" style="float:left; margin-bottom:0px;">
	                <p class="font2">학점을 포함하여 전공</p>
	                <input type="number" value="${firstRule.mustPlusChoice}" class="form-control" style="width: 45px; padding-top: 2px; padding-left: 10px; padding-right: 0px; margin-right:0;"
	                 />
	            </div>
	            <div class="form-group" style="float:left; margin-bottom:0px;">
	                <p class="font2" style="margin-bottom:0px;">학점</p>
	            </div>
            </p>
            <br/>
         	<br/>
         	<div>
            <div class="form-group" style="float:left">
                <div style="width:330px;">
                  <p class="font3">전공필수과목 <a data-toggle="modal" href="#addMajorSubject"><span style="float:right; font-size: 25px; font-weight:bold; margin-right:20px">+</span></a></p>
                </div>
                <div class="list-group majorlist"
							style="width: 330px; margin-top: 10px; margin-left: -5px;">
							<c:forEach var="major" items="${majors}">
								<a href="#" class="list-group-item list-group-item-action">${major.majorName}
								<span style="float:right;">&times;</span>
								</a>
							</c:forEach>
						</div>
            </div>
            <div class="form-group" style="float:left; margin-left:50px;">
                <div style="width:330px;">
                  <p class="font3">학과지정교양 <a data-toggle="modal" href="#addMajorLiberal"><span style="float:right; font-size: 25px; font-weight:bold; margin-right:20px">+</span></a></p>
                </div>
                <div class="list-group" style="width:330px; margin-top: 10px; margin-left:-5px;">
                  <a href="#" class="list-group-item list-group-item-action">
                    이산수학 <span style="float:right;">&times;</span>
                  </a>
                  <a href="#" class="list-group-item list-group-item-action">정보사회론 <span style="float:right;">&times;</span></a>
                  <a href="#" class="list-group-item list-group-item-action">대학수학 <span style="float:right;">&times;</span></a>
                  <a href="#" class="list-group-item list-group-item-action">컴퓨터활용 <span style="float:right;">&times;</span></a>
                </div>
            </div>
          </div>
	  	</div>
	  	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
        <div style="margin-left:20px">
        	<p>
              <div class="form-group" style="float:left; margin-bottom:0px;">
                  <p class="font2">전공과정</p>
              </div>
            </p>
            <br/><br/>
            <form:form method="post">
	            <c:forEach var="departmentMajorRule" items="${departmentMajorRules}">
	            	<div style="margin-left:40px">
		            	<p class="font3">▶${departmentMajorRule.processName} </p>
		                	<div style="margin-left:30px">
		                  		<div class="form-group" style="float:left; margin-bottom:0px;">
		                			<p class="font2">전필</p>
		                			<input type="number" name="mustMajor" value="${departmentMajorRule.mustMajor}" class="form-control" style="width: 45px; padding-top: 2px; padding-left: 10px; padding-right: 0px;"/>
		            	  		</div>
		            	  		<div class="form-group" style="float:left; margin-bottom:0px;">
		                			<p class="font2">학점과 전선</p>
		               				<input type="number" name="choiceMajor" value="${departmentMajorRule.choiceMajor}" class="form-control" style="width: 45px; padding-top: 2px; padding-left: 10px; padding-right: 0px; margin-right:0;"/>
		            	  		</div>
		            	  		<div class="form-group" style="float:left; margin-bottom:0px;">
		                			<p class="font2">학점을 포함하여 전공</p>
		               				<input type="number" name="mustPlusChoice" value="${departmentMajorRule.mustPlusChoice}" class="form-control" style="width: 45px; padding-top: 2px; padding-left: 10px; padding-right: 0px; margin-right:0;"/>
		            	  		</div>
			              		<div class="form-group" style="float:left; margin-bottom:0px;">
			                		<p class="font2" style="margin-bottom:0px;">학점</p>
			              		</div>
		                	</div>
		            </div>
		              <br/>
		              <br/>
		        </c:forEach>
		        <button type="submit" class="btn btn-submit">
				    <span class="glyphicon glyphicon-ok"></span> 저장
				</button>
	        </form:form>
        </div>
	  </c:if>
	  
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