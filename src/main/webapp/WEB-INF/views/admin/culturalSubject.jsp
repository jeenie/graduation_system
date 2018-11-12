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
	  <link rel="stylesheet" href="${R}res/css/custom.css">
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
	    .btn-cancel {
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
	      margin-bottom: 350px;
	    }
	
	    .divide {
	      margin-top: 20px;
	      margin-left: 60px;
	      margin-right: 60px;
	      height: 520px;
	
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
	<%@ include file="/WEB-INF/views/include/adminNavibar.jsp" %>
  	
  	<div id="breadcrumb">
    	<div class="container">
      		<div class="breadcrumb">
        		<li></li>
        		<li style="font-size: 18px; margin-left: -5px;">
            		교양 필수 과목 관리
        		</li>
      		</div>
    	</div>
  	</div>

  	<div class="contents">
  		<form:form method="post" modelAttribute="requiredCultureCount"  style="">
		  	<div class="form-group">
		          <p class="font2">전체 학생</p>
		          <br/><br/>
					<div style="margin-left: 30px">
						<div class="form-group" style="float: left; margin-bottom: 0px;">
							<p class="font2">기도모임(비아메디아채플)</p>
							<form:input type="number" path="chapelCount" class="form-control" style="width: 45px; padding-top: 2px; padding-left: 10px; padding-right: 0px;"/>
						</div>
						<div class="form-group" style="float: left; margin-bottom: 0px;">
							<p class="font2" style="margin-bottom: 0px;">회,</p>
						</div>
					</div>
					<div style="margin-left: 30px">
						<div class="form-group" style="float: left; margin-bottom: 0px;">
							<p class="font2">사회봉사</p>
							<form:input type="number" path="serveCount"
								class="form-control"
								style="width: 45px; padding-top: 2px; padding-left: 10px; padding-right: 0px;"
							 />
						</div>
						<div class="form-group" style="float: left; margin-bottom: 0px;">
							<p class="font2" style="margin-bottom: 0px;">회</p>
						</div>
					</div>
				</div>
				  <div style="margin-top:0; margin-right:550px">
		        	<button type="submit" class="btn btn-submit" style="float:right" onClick="saveCount()">
						    <span class="glyphicon glyphicon-ok"></span> 저장
					</button>
				  </div>
		</form:form>
	  <br/><br/>
	    <div style="">
	  	<div style="margin-top:0px; margin-left:30px;">
          <p>
            <div class="form-group" style="float:left">
                <div style="width:330px;">
                  <p class="font3">2016, 2017학번 교양필수과목 <a data-toggle="modal" href="#addSubject"><span style="float:right; font-size: 25px; font-weight:bold; margin-right:20px">+</span></a></p>
                </div>
                <div class="list-group" style="width:330px; margin-top: 10px; margin-left:-5px;">
                	<c:forEach var="requiredCultureSubject" items="${requiredCultureSubjects}">
	                  <a href="deleteCulture?subjectId=${requiredCultureSubject.subjectId}&entranceYear=${requiredCultureSubject.entranceYear}" class="list-group-item list-group-item-action" onclick="deleteSubject()">
	                    ${requiredCultureSubject.subjectName} <span style="float:right;">&times;</span>
	                  </a>
                	</c:forEach>
                </div>
            </div>
          </p>
        </div>
        <br/>
        <div style="margin-top:0px; margin-left:30px;">
          <p>
            <div class="form-group" style="float:left; margin-left:50px; margin-top:-30px">
                <div style="width:330px;">
                  <p class="font3">2018학번 교양필수과목 <a data-toggle="modal" href="#addSubject18"><span style="float:right; font-size: 25px; font-weight:bold; margin-right:20px">+</span></a></p>
                </div>
                <div class="list-group" style="width:330px; margin-top: 10px; margin-left:-5px;">
                  	<c:forEach var="requiredCultureSubject" items="${requiredCultureSubjects2018}">
	                  <a href="deleteCulture?subjectId=${requiredCultureSubject.subjectId}&entranceYear=${requiredCultureSubject.entranceYear}" class="list-group-item list-group-item-action" onclick="deleteSubject()">
	                    ${requiredCultureSubject.subjectName} <span style="float:right;">&times;</span>
	                  </a>
	                 
	                 </c:forEach> 
                </div>
            </div>
          </p>
        </div>
        </div>
		
  </div>
  <%@ include file="/WEB-INF/views/include/footer.jsp" %>
  
  <div class="modal fade" id="addSubject" tabinex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="padding-bottom: 1.5px;">
					<h4>
						<b>과목 추가</b>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
							</button>
						</h4>
				</div>
				<div class="modal-body">
					<form:form method="post" action="addSubject1617" modelAttribute="cultureMust"  style="margin-bottom:40px">
						<div class="form-group">
							<label>입학년도</label>
							<input value="2016, 2017" class="form-control w505" readonly/>
						</div>
						<div class="form-group">
							<label>과목코드</label>
							<form:input path="subjectId" class="form-control w505"/>
							<a data-toggle="modal" href="#find" class="btn btn-submit" style="float:right; margin-top:-33px">찾기</a>
						</div>
						<div style="float:right; margin-top:10px;">
							<button type="submit" class="btn btn-submit" onclick="success()"">추가</button>
							<button type="button" class="btn" data-dismiss="modal" >취소</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="addSubject18" tabinex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="padding-bottom: 1.5px;">
					<h4>
						<b>과목 추가</b>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
							</button>
						</h4>
				</div>
				<div class="modal-body">
					<form:form method="post" action="addSubject18" modelAttribute="cultureMust">
						<div class="form-group">
							<label>입학년도</label>
							<input value="2018" class="form-control w505" readonly/>
						</div>
						<div class="form-group">
							<label>과목코드</label>
							<form:input path="subjectId" class="form-control w505"/>
							<a data-toggle="modal" href="#find" class="btn btn-submit" style="float:right; margin-top:-33px">찾기</a>
						</div>
						<button type="submit" class="btn btn-submit" onclick="success()">추가</button>
						<button type="button" class="btn btn-cancel" data-dismiss="modal">취소</button>
					</form:form>
				</div>
			</div>
		</div>
	</div>
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="${R}res/js/jquery-2.1.1.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="${R}res/js/bootstrap.min.js"></script>
  <script src="${R}res/js/jquery.prettyPhoto.js"></script>
  <script src="${R}res/js/jquery.isotope.min.js"></script>
  <script src="${R}res/js/wow.min.js"></script>
  <script src="${R}res/js/functions.js"></script>
  
  <script>
		function success() {
			alert("정상적으로 교양 필수 과목이 등록되었습니다.");
		}
		function deleteSubject() {
			confirm("과목을 삭제하시겠습니까?");
		}
		function saveCount() {
			alert("정상적으로 교양 필수 항목이 저장되었습니다.");
		}
	</script>
</body>
</html>