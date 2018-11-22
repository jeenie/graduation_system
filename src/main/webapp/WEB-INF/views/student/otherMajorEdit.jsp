<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
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

<!-- font awesome-->
<link rel="stylesheet" href="${R}res/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">

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

	.btn-statement3 {
		/*열람가능여부 yes*/
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
		background-color: grey;
	}

	.btn-statement4 {
		/*열람가능여부 no*/
		border: none;
		/* Remove borders */
		border-radius: 2.5px;
		color: white;
		/* Add a text color */
		padding: 4px 5px;
		/*14px 28px;  Add some padding */
		width: 50px;
		cursor: pointer;
		/* Add a pointer cursor on mouse-over */
		background-color: rgb(80, 153, 92);
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
	.pagination
	 
	a
	:hover
	:not
	 
	(
	.active
	 
	)
	{
	background-color
	:
	 
	#ddd
	;
	
	
	}
	td {
		text-align: center;
		vertical-align: middle;
	}
	
	.table-info {
		width: 400px;
	}
	
	.contents {
		margin-top: 5px;
		margin-right: 100px;
		margin-left: 140px;
		margin-bottom: 100px;
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
		height: 35px;
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
		background-color: rgb(22, 105, 22);
		color: white;
		font-weight: normal;
		padding-top: 7px;
		padding-left: 7px;
	}
	
	.btn-submit {
	height: 40px;
	width: 70px;
	padding: 6px 15px;
	background: #1BBD36;
	color: #fff;
	border-radius: 4px;
	border: none;
	margin-top: 0;
	float: right;
	}
	
	/*status 페이지에서 사용할 css*/
	/*font*/
	.boldfont18 {
	font-weight: bold;
	font-size: 18px;
	}
	/*otherMajor 페이지에서 사용할 css*/
	.contents {
	margin-left:auto;
	margin-right:auto;
	width: 600px;
	}
	.inlineinput div {
    display: inline;
}
	
</style>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script> 
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="${R}res/js/zooTree.js"></script> 

<script>
	
</script>
<body>
<%@ include file="/WEB-INF/views/include/studentNavibar.jsp" %>
	<div id="breadcrumb">
		<div class="container">
			<div class="breadcrumb">
				<li></li>
				<li style="font-size: 18px; margin-left: -5px;">타학과 과목 전공 등록</li>
			</div>
			<hr>
		</div>
	</div>
	
	<div class="container">
  	<div class="contents">
  	
    
   
	    	<form action="fillData" method="GET">
		    	<div class="form-group">
		    		
		    		<label>교과목명</label> 
					 	
		    		<select name="subjectId" class="form-control" id="subjectId">
		    		<c:forEach var="anotherMajor" items="${ anotherMajorList }">
		    			<option value="AA00000">타전공 과목</option>
		    			<option value="${anotherMajor.subjectId }"
		    			${subjectId == anotherMajor.subjectId ? "selected" : "" }> ${anotherMajor.subjectName} </option>
		    			
		    		</c:forEach>
		    		</select>
		    		 
		    		 
		    	</div>
	    	
		    	<div class="fillInfo">
		    	<p style="font-size: 11px; float: right; color: #5BC0DE; font-weight: bold; margin-top: 8px;">자동완성 버튼 클릭시 해당 과목에 대한 정보가 아래 채워집니다</p>
		            <button type="submit" class="btn btn-info">자동완성 </button>     
		         <hr>
		    	</div>
		    </form>
	    	<form:form method="post" modelAttribute="otherMajor">
		    	<div class="form-group">
		    		<label>과목코드</label> 
		    		<form:input path="anotherMajorId" class="form-control" />
		    	</div>
		    	
		    	<div class="form-group">
		    		<label>타 학과(공학계)</label> 
		    		<form:input path="departmentName" class="form-control" />
		    	</div>
		    	
			    <div class="form-group">
			    	<label>학점</label> 
			    	<form:input path="score" class="form-control" />
				</div>
				    
			    <div class="form-group">
			    	<label>수강일시</label></br>	
			       	<form:input path="year" class="form-control" style="display: inline; width: 200px;" />년도
			        <form:input path="semester" class="form-control" style="display: inline; width: 200px;" />학기
				</div>
				
				<div class="form-group">
				    <label>희망이수구분</label> 
				    <p style="font-size: 11px; float: right; color: #5BC0DE; font-weight: bold; margin-top: 8px;">본인이 신청하고자 하는 이수구분을 직접 선택하세요</p>
				      <form:select path="type" class="form-control"
			                   itemValue="anotherMajorType" itemLabel="anotherMajorType" items="${ types }" />
				</div>
		      	<button type="submit" class="btn btn-submit">등록</button>
		</form:form>
	 
  	</div> <!-- contents -->  
    </div> <!-- container -->
	  
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>

</body>
</html>