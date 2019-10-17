<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
							<a href="${R}"><h1>
									<span>SKKU</span>졸업관리시스템
								</h1></a>
						</div>
					</div>

					<div class="navbar-collapse collapse">
						<div class="menu">
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation"><a href="${R}guest/graduationRule">졸업요건</a></li>
								<li role="presentation" class="dropdown"><a
									href="${R}guest/login">졸업관리</a>
									<div class="dropdown-content">
										<a href="${R}guest/login" onclick="alertGuest()">나의 졸업현황</a> <a
											href="${R}guest/login" onclick="alertGuest()">성적조회</a> <a
											href="${R}guest/login" onclick="alertGuest()">대체/타전공 현황</a>
									</div></li>
								<li role="presentation"><a href="http://www.skhu.ac.kr">학교홈페이지</a></li>
								<li role="presentation"><a
									href="https://forest.skhu.ac.kr/">종합정보시스템</a></li>
								<li role="presentation"><a href="${R}guest/login">Login</a></li>
								<li role="presentation" style="display: none"><a
									data-toggle="modal" href="#loginModal">LoginModal</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</nav>
	</header>