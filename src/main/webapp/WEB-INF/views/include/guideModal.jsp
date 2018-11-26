<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="modal fade" id="guide" tabindex="-1" role="dialog"
	aria-labelledby="modal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" style="padding-bottom: 1.5px;">
				<h4>
					<b>SKHU졸업관리시스템 이용안내</b>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
					</button>
				</h4>
			</div>
			<div class="modal-body">
				<p style="font-size: 16px; font-weight: bold;">성공회대 학생들을 위해 보다
					편리한 졸업관리시스템</p>
				<p style="font-size: 14px; font-weight: bold;">&nbsp - &nbsp자신의
					학과에 맞는 졸업 요건을 알아보고, 나의 졸업 현황을 한 눈에 확인하세요.</p>
				<hr>
				<p style="font-size: 14px; font-weight: bold;">성적파일 업로드 준비과정</p>
				<p>① 성공회대학교 종합정보시스템 https://forest.skhu.ac.kr/ 접속하기</p>
				<img src="${R}res/img/guide1.png" width="550px" height="400px">
				<br> <br>
				<p>② 성적관리 - 학내 제출용 성적증명서 출력</p>
				<img src="${R}res/img/guide2.png" width="550px" height="400px">
				<br> <br>
				<p>③ 자신의 성적을 맨 위에 행부터 쫘악 드래그하기</p>
				<img src="${R}res/img/guide3.png" width="550px" height="400px">
				<br> <br>
				<p>④ Excel에 붙여넣기 한 후 과목에 해당하는 행 이외에는 모두 지우기</p>
				<img src="${R}res/img/guide4.png" width="550px" height="300px">
				<br> <br>
				<p>⑤ 수강년도 학기 과목코드 과목명 이수구분 학점 성적등급 순으로 엑셀파일 저장하기</p>
				<img src="${R}res/img/guide5.png" width="550px" height="300px">
				<br> <br>
				<p>그럼 성적파일 완사앙 - ☆ - ☆ - ☆ - ☆ - ☆</p>
				<p style="color: red; font-size: 12px;">※ Excel에 불필요한 내용이나 빈 셀이
					포함된 경우 올바른 결과가 나오지 않을 수 있습니다.</p>
			</div>
		</div>
	</div>
</div>