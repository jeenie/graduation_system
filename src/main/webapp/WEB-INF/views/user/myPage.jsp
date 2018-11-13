<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SKHU졸업관리시스템</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/animate.css">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet" />
<!-- =======================================================
    Theme Name: Company
    Theme URL: https://bootstrapmade.com/company-free-html-bootstrap-template/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
  ======================================================= -->

<style>
select {
	width: 200px;
	height: 40px;
	padding-left: 10px;
	font-size: 18px;
	color: #000000;
	background-color: rgb(255, 255, 255);
	border: 1.3px solid rgb(46, 46, 46);
	border-radius: 10px;
	text-align: center;
}

select option:checked, select option:hover {
	background: rgb(226, 240, 217);
	color: rgb(57, 70, 255);
	font-weight: bold;
}

.divide1 {
	margin-top: -10px;
	margin-left: 60px;
	margin-right: 60px;
	height: 180px;
}

.l_s {
	margin-left: -40px;
	float: left;
	width: 180px;
	height: 180px;
}

.r_s {
	margin-right: 60px;
	float: left;
	width: 800px;
	height: 180px;
}

.a_l {
	margin-top: 10px;
	float: left;
	border: 1.5px solid #8a8a8a;
	width: 160px;
	height: 180px;
}

.alt_l {
	margin-top: 10px;
	float: left;
	border: 2px solid rgb(255, 255, 255);
	width: 700px;
	height: 180px;
}

tabl, td {
	border: 1px solid #8a8a8a;
	text-align: center;
}

th {
	width: 100px;
	border: 1px solid #8a8a8a;
	text-align: center;
	background-color: rgb(226, 240, 217);
}

table {
	width: 100%;
	color: black;
}
</style>
</head>

<body>
	<%@ include file="/WEB-INF/views/include/studentNavibar.jsp"%>

	<div id="breadcrumb">
		<div class="container">
			<div class="breadcrumb">
				<li></li>
				<li style="font-size: 20px; margin-left: -5px;">나의 졸업요건</li>
			</div>
			<hr>
		</div>
	</div>
	<div class="aboutus">
		<div class="container">
			<div style="margin-top: 30px">
				<div class="contents">

					<div class="divide1">
						<div class="l_s">
							<div class="a_l">
								<img src="" width="150px" height="170px">
							</div>
						</div>

						<div class="r_s">
							<div class="alt_l">
								<div class="info">
									<table>
										<tr style="height: 60px;">
											<th>학번</th>
											<td>201632000</td>
											<th>성명</th>
											<td>이ㅇㅇ</td>
										</tr>

										<tr style="height: 60px;">
											<th>학부(과)</th>
											<td>소프트웨어공학과</td>
											<th>학년</th>
											<td>3학년</td>
										</tr>

										<tr style="height: 60px;">
											<th>입학구분</th>
											<td>신입학(2016.02.29)</td>
											<th>이수학기</th>
											<td>3학년2학기</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>

				</div>

				<br> <br> <br>

				<h4>
					&nbsp&nbsp&nbsp ○○○님은&nbsp <img src="images/abouti/lock.png"
						width="15px">&nbsp <select name="special course">
						<option value="">특별과정선택</option>
						<option value="전공기초과정" selected="selected">전공기초과정</option>
						<option value="전공심화과정">전공심화과정</option>
						<option value="타과복수전공과정">타과복수전공과정</option>
						<option value="타과부전공과정">타과부전공과정</option>
					</select> &nbsp을 이수하고 있습니다.
				</h4>
				<br> <br>
			</div>
			<div class="col-md-5 wow fadeInDown" data-wow-duration="1000ms"
				data-wow-delay="600ms">
				<div class="skill">
					<div class="progress-wrap">
						<h4>＞총 학점&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp88/130</h4>
						<div class="progress">
							<div class="progress-bar color4" role="progressbar"
								aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"
								style="width: 65%">
								<span class="bar-width">67%</span>
							</div>
						</div>
					</div>
					<br> <br>

					<div class="progress-wrap">
						<h4>＞ 전공&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp47/60</h4>
						<div class="progress">
							<div class="progress-bar  color1" role="progressbar"
								aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
								style="width: 80%">
								<span class="bar-width">78%</span>
							</div>
						</div>
						<h4>
							<hr>
							&nbsp&nbsp&nbsp- 전공필수
						</h4>
						<div class="t2">
							<table style="width: 870px;">
								<tr style="height: 30px;">
									<th>학년</th>
									<th>학기</th>
									<th colspan="3">과목</th>
								</tr>

								<tr>
									<td rowspan="2">1</td>
									<td>1</td>
									<td><font color="#DB0000">C프로그래밍I (3)</font></td>
									<td colspan="2"><font color="#DB0000">과정지도1 (1)</font></td>
								</tr>

								<tr>
									<td>2</td>
									<td><font color="#DB0000">웹페이지구축I (3)</font></td>
									<td colspan="2"><font color="#DB0000">과정지도2 (1)</font></td>
								</tr>

								<tr>
									<td rowspan="3">2</td>
									<td rowspan="2">1</td>
									<td><font color="#DB0000">컴퓨터구조 (3)</font></td>
									<td colspan="2"><font color="#DB0000">데이터베이스개론 (3)</font></td>
								</tr>

								<tr>
									<td><font color="#DB0000">Java프로그래밍 (3)</font></td>
									<td colspan="2"><font color="#DB0000">과정지도3 (1)</font></td>
								</tr>

								<tr>
									<td>2</td>
									<td><font color="#DB0000">자료구조론 (3)</font></td>
									<td><font color="#DB0000">운영체제론 (3)</font></td>
									<td><font color="#DB0000">과정지도4 (1)</font></td>
								</tr>

								<tr>
									<td rowspan="2">3</td>
									<td>1</td>
									<td><font color="#DB0000">알고리즘3 (3)</font></td>
									<td colspan="2"><font color="#DB0000">과정지도5 (1)</font></td>
								</tr>

								<tr>
									<td>2</td>
									<td colspan="3">과정지도6 (1)</td>
								</tr>

								<tr>
									<td>4</td>
									<td>1,2</td>
									<td colspan="3">졸업지도 (1)</td>

								</tr>

								<tr style="height: 30px;">
									<th colspan="2">학점 계</th>
									<th colspan="3">31</th>
								</tr>
							</table>
						</div>
					</div>
					<br> <br> <br>

					<div class="progress-wrap">
						<h4>＞ 교양&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp41/47</h4>
						<div class="progress">
							<div class="progress-bar color3" role="progressbar"
								aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
								style="width: 90%">
								<span class="bar-width">90%</span>
							</div>
						</div>
						<h4>
							<hr>
							&nbsp&nbsp&nbsp- 교양필수
						</h4>
						<div class="t4">
							<table style="width: 870px;">
								<tr style="height: 30px;">
									<th colspan="2">과목</th>
								</tr>

								<tr>
									<td><font color="#DB0000">기도모임(비아메디아 채플) 2회</font></td>
									<td><font color="#DB0000">사회봉사 그룹(사회봉사I, 해외봉사,
											농촌봉사, CUAC서비스러닝 프로그램 중 택1) (2)</font></td>
								</tr>

								<tr>
									<td><font color="#DB0000">대학생활세미나I (2)</font></td>
									<td><font color="#DB0000">대학생활세미나II (1)</font></td>
								</tr>

								<tr>
									<td><font color="#DB0000">말과글 (2)</font></td>
									<td></td>
								</tr>

								<tr style="height: 30px;">
									<th>학점 계</th>
									<th>7</th>
								</tr>
							</table>
						</div>
					</div>

				</div>
			</div>
		</div>

	</div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
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