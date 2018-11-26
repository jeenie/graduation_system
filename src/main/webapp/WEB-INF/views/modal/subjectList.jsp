<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<!-- font awesome-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">

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
	padding: 6px 15px;
	background: #1BBD36;
	color: #fff;
	border-radius: 4px;
	border: none;
	margin-top: 0;
	}
</style>
</head>
<div class="" id="find">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="padding-bottom: 1.5px;">
					<h4>
						<b>과목 찾기</b>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
							</button>
						</h4>
				</div>
				<div class="modal-body">
					<form id="searchSubject">
						<div class="form-group">
							<select class="form-control" name="ss" style="float:left; margin-right:5px; width:110px">
								<option value="0">과목코드</option>
								<option value="1">과목명</option>
							</select>
							<input type="text" name="st" value="${st}" class="form-control w250" style="display:inline; float:left; margin-right:5px" maxlength="20">
						</div>
						<button type="submit" class="btn btn-submit">조회</button>
					</form>
					<c:if test="${subjects.size() == 0}">
						<span>조회 결과가 없습니다.</span>
					</c:if>
					<c:if test="${subjects.size() > 0}">
						<table class="table table-bordered mt5" style="margin-top:10px;">
							<thead>
								<tr>
									<th style="text-align:center;">과목코드</th>
									<th style="text-align:center;">과목명</th>
								</tr>
							</thead>
							<tbody>
									<tr  v-for="subject in subjects">
											<td style="text-align:center;">{{subject.id}}</td>
											<td style="text-align:center;">{{subject.name}}</td>
									</tr>
							</tbody>
						</table>
					</c:if>
				</div>
			</div>
		</div>
	</div>
