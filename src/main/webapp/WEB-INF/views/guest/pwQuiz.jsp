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
		background-color: #4CAF50;
		min-width: 140px;
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
	
    input.form-control.w300 { 
  		width: 300px; 
  	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/guestNavibar.jsp"%>
	<div id="breadcrumb">
    	<div class="container">
        	<div class="breadcrumb">
            	<li>
            	</li>
            	<li style="font-size: 20px; margin-left: -5px;">
                	비밀번호 찾기
            	</li>
        	</div>
        	<hr>
    	</div>
	</div>
	<c:if test="${!error}">
		<script>
			alert("정상적으로 인증되었습니다.");
		</script>
	</c:if>
	<c:if test="${error}">
		<script>
			alert("작성하신 답이 틀렸습니다. 다시 입력해주세요.")
		</script>
	</c:if>
	<div class="aboutus">
        <div class="container" style="margin-left:230px; margin-top:50px; margin-bottom:70px">
            <div style="width:132px; height:158px;margin-right:0; border-radius:5px; padding-right:20px; font-size: 150px;"><i class="fas fa-user-graduate"></i></div>
	            <div style="float:right;margin-left:140px; margin-right:300px; margin-top:-150px">
		            <form method="post" style="margin-right:350px;">
		            	<div>
			    			<div class="form-group">
			      				<label>질문</label>
			      				<input type="text" value="${student.quizContent}" class="form-control w300" readonly/>
			    			</div>
			    			<div class="form-group">
			      				<label>답</label>
			      				<input type="text" name="answer" value="" class="form-control w300" />
			    			</div>
			    			<div class="form-group" style="display:none">
			    				<input name="id" value="${student.id}" readonly/>
			    			</div>
			    		</div>
		    			<hr />
		    			<div>
		      				<button type="submit" class="btn btn-submit" style="float:right; margin-top:-10px">
		        				<span class="glyphicon glyphicon-ok"></span> 인증
		        			</button>
		    			</div>
		  			</form>
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