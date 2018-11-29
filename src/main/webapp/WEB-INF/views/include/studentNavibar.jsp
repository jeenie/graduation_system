<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	function successLogout() {
		alert("정상적으로 로그아웃되었습니다.");
	}
</script>
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
							<li role="presentation"><a
								href="${R}user/graduationRule">졸업요건</a></li>
							<li role="presentation" class="dropdown"><a href="">졸업관리</a>
								<div class="dropdown-content">
									<a href="${R}student/graduationStatus?processId=0">나의 졸업현황</a> <a
										href="${R}student/checkGrades">성적 조회</a> <a href="${R}student/status">대체/타전공
										현황</a>
								</div></li>
							<li role="presentation"><a href="http://www.skhu.ac.kr">학교홈페이지</a></li>
							<li role="presentation"><a href="https://forest.skhu.ac.kr/">종합정보시스템</a></li>
							<li role="presentation"><a href="${R}user/logout_processing" onclick="successLogout()">Logout</a></li>
							<li>
								<div style="margin-top: 28px; margin-left: 1.5px;">
									<a href="${R}user/studentEdit"> <i
										class="fas fa-user-edit fa-lg"></i>
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