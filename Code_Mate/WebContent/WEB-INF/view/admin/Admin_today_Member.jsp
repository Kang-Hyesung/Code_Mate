<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
System.out.println(cp);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin_today_Member.jsp</title>
<!-- BootStrap -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/css/admin_banner_side.css" />
<!-- chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- JQuery -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<!-- ionicons -->
<script type="module"
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script type="module"
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"
	rel="stylesheet" />
<style>
.prjname {
	vertical-align: middle;
}

.prjtitle {
	padding-top: 10px;
	justify-content: space-between;
}

@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}

* {
	font-family: 'Pretendard-Regular';
}
/* 큰 창 */
.skill-progress {
	width: 400px;
	height: 250px;
	padding: 20px;
	color: white;
	background-color: white;
	border-radius: 10px;
	color: black;
	box-shadow: 0 3px 9px rgba(0, 0, 0, 5.16);

	/* 해당요소를 수직,수평중앙정렬 */
	/* position: absolute;
    top : 50%;
    left : 50%;
    transform: translate(-50%, -50%); */ /*translate(-top위치, -left위치)*/
}

.skill-progress h1 {
	text-align: center;
	font-size: 30px;
	box-shadow: 0 20px 50px rgba(0, 0, 0, 0.089);
	background-color: white;
}

.item {
	transition: 0.4s;
}

.item:hover {
	border-radius: 3px;
	box-shadow: 7px 7px 10px rgba(0, 0, 0, 0.753);
	transform: scale(1.05); /*1.05배 커지게함*/
}

/* 간격 줄이기 */
.subject {
	margin: 0 0 0 0;
}

.item p {
	overflow: hidden; /*p태그 높이 회복*/
	margin-bottom: 0; /* p태그 자체가 차지하는 마진을 없애기 */
}

/* p태그안에 있는 span을 왼쪽, 오른쪽 정렬을 시켜야함 */
.item p span:nth-child(1) { /*span:first-child*/
	float: left;
}

.item p span:nth-child(2) { /*span:end-child*/
	float: right;
}

/* 그라데이션 막대를 감싸는 박스 */
.progress {
	border: 1px solid #6cd4c4;
	padding: 0px;
	border-radius: 3px;
}

/* 그라데이션 막대 */
.progress-level {
	height: 15px;
	background: linear-gradient(to right, #EED3D9, #EED3D9);
	/*방향(deg각도도 가능), 시작색상, 종료색상*/
	animation: ani;
	animation-duration: 1s; /*1초만에 발생한 애니메이션이 끝나게 함*/
	animation-fill-mode: both;
	/*애니메이션이 반복이 끝나면 -> 무조건 keyframe에서 100%구간에 머무르게 해라
	    애니메이션은 기본적으로, 0%->100%->0%로 진행됨. 
	    근데, animation-fill-mode 설정이 없으면 100%구간에서 멈추지 않고 애니메이션이 부자연스러움
	    100%구간에서 멈추게 해서 -> 로딩 후, 바로 꽉찬 막대를 만들기 위해 fill-mode를 사용
	    */
}

/* 처음 로드될 때, 그라데이션바들이 서서히 차오르는 애니메이션 주기 */
@
keyframes ani { 0%{
	width: 0; /*시작할 때만 width가 0이게만 하면 됨*/
}

}
/* div{border: 1px solid black;} */
.meeting-list {
	list-style-type: none;
	padding: 0;
	box-shadow: 0 3px 6px rgba(0, 0, 0, 8.16);
}

.meeting-list li {
	background-color: #fff;
	padding: 10px;
	margin: 5px 0;
	border-radius: 5px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.meeting-date {
	font-weight: bold;
	margin-right: 10px;
}

.meeting-author {
	margin-right: 10px;
}

.meeting-title {
	font-style: italic;
}

.report-list {
	list-style-type: none;
	padding: 0;
}

.report-list li {
	background-color: #fff;
	padding: 15px;
	margin: 10px 0;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.report-author {
	font-weight: bold;
	margin-bottom: 5px;
	display: block;
}

.report-title {
	font-size: 1.1em;
	color: #333;
}

.task-container {
	max-width: 600px;
	margin: 20px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.task-list {
	list-style-type: none;
	padding: 0;
}

.task-list li {
	padding: 15px;
	margin: 10px 0;
	border-bottom: 1px solid #ccc;
}

.task-assignee {
	font-weight: bold;
	margin-bottom: 5px;
	display: block;
}

.task-title {
	color: #333;
}

.task-date {
	color: #666;
}

/* 업무보고서로 넘어가는 검색모양 input */
.searchInput {
	border: none;
	width: 400px;
	margin: 10px 0 0 22px;
	background: white;
}
/* searchInput 감싸는 div */
.searchBar {
	width: 500px;
	height: 50px;
	border: 2px solid gray;
	float: right;
	border-radius: 40px;
	margin-left: auto;
	background: white;
	box-shadow: 0 3px 9px rgba(0, 0, 0, 5.16);
}
/* 작성 아이콘 */
.editicon {
	float: right;
	margin: 9px 17px 0 0;
}

.first {
	display: flex;
	justify-content: flex-start;
}

input:focus {
	outline: none;
}

hr {
	color: #EED3D9;
	border: 1px solid gray;
}

.table {
	margin: 0 0 40px 0;
	width: 100%;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
	display: table;
}

@media screen and (max-width: 580px) {
	.table {
		display: block;
	}
}

.tablerow {
	display: table-row;
	background: #f6f6f6;
}

.tablerow:nth-of-type(odd) {
	background: #e9e9e9;
}

.tablerow.header {
	font-weight: 900;
	color: #ffffff;
	background: #ea6153;
}

.tablerow.green {
	background: #27ae60;
}

.tablerow.blue {
	background: #2980b9;
}

@media screen and (max-width: 580px) {
	.tablerow {
		padding: 14px 0 7px;
		display: block;
	}
	.tablerow.header {
		padding: 0;
		height: 6px;
	}
	.tablerow.header .cell {
		display: none;
	}
	.tablerow .cell {
		margin-bottom: 10px;
	}
	.tablerow .cell:before {
		margin-bottom: 3px;
		content: attr(data-title);
		min-width: 98px;
		font-size: 10px;
		line-height: 10px;
		font-weight: bold;
		text-transform: uppercase;
		color: #969696;
		display: block;
	}
}

.cell {
	padding: 6px 12px;
	display: table-cell;
}

@media screen and (max-width: 580px) {
	.cell {
		padding: 2px 16px;
		display: block;
	}
}

/* 요악 시작 */
.second {
	display: flex;
}

.meeting {
	margin-left: 60px;
	background-color: white;
	box-shadow: 0 3px 9px rgba(0, 0, 0, 5.16);
	height: 258px;
	border-radius: 10px;
	padding: 15px;
}
/* 회의록 그림 */
img {
	width: 108px;
	height: 40px;
}

.lastchange {
	margin-top: 40px;
}

.dot {
	background-color: gray;
	width: 30px;
	height: 30px;
	border-radius: 20px;
}

.meetingTitle {
	display: flex;
}

tr {
	text-align: center;
}

.row-space {
	margin-right: 20px;
	margin-bottom: 0px;
	justify-content: flex-start;
	flex-flow: row nowrap;
	display: flex;
}

.bordered-div {
	border: 1px solid #d9d9d9;
	padding: 18px;
	margin-right: 10px;
	margin-bottom: 13px;
	height: 110px;
	border-radius: 6px;
	
}

.material-symbols-outlined {
	font-family: 'Material Symbols Outlined';
	font-weight: normal;
	font-style: normal;
	font-size: 39px;
	line-height: 1;
	letter-spacing: normal;
	text-transform: none;
	display: inline-block;
	white-space: nowrap;
	word-wrap: normal;
	direction: ltr;
	-webkit-font-feature-settings: 'liga';
	-webkit-font-smoothing: antialiased;
}

ul.pagination2 {
	display: inline;
}

li.pagination2 {
	display: inline;
}

nav.pagination2 {
	display: inline;
}

.pagination {
	justify-content: center;
}

.spanicon {
	position: relative;
	bottom: 4px;
}

.btn {
	line-height: 0px;
	height: 30px;
}

h5 {

    font-size: 1.25rem;
    font-weight: bolder;
    color: #546071;
}

</style>
</head>
<body>
<div class="row mainArea">

	<div class="col-12 bannerMain">
		<div class="row bannerArea">
			<nav class="navbar bg-body-tertiary">
			  <div class="container-fluid nav nav-underline bannerMainBox">
			    
			 	<!--===========[Logo]===========-->
				<a class="navbar-brand bannerLogo link" href="#">
					<img alt="Logo" class="bannerLogoImage d-inline-block align-text-top" src="img/TestLogo.png" >
				</a>
				<!--===========[Logo]===========-->
				
				<span class="nav-link"><a href="#" class="link">프로젝트 게시판</a></span>
				<span class="nav-link"><a href="#" class="link">커리어 게시판</a></span>
				<span class="nav-link"><a href="#" class="link">포트폴리오 게시판</a></span>
			
			    
			    <!--=======[ member Icon ]=======-->
			    <div class="oneMember">
					<div class="buttonBox">
						<!--======[ search Button ]======-->
						<button id="searchButton" class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop" aria-controls="offcanvasTop">
							<ion-icon name="search-outline"></ion-icon>
						</button>
						<!--======[ search Button ]======-->
		
						<!--======[ chat Button ]======-->
						<button id="chatButton" class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop" aria-controls="offcanvasTop">
							<ion-icon name="chatbubble-outline"></ion-icon>
						</button>
						<!--======[ chat Button ]======-->
		
						<!--======[ alarmButton ]======-->
						<button id="alarmButton" class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop" aria-controls="offcanvasTop">
							<ion-icon name="notifications"></ion-icon>
						</button>				
						<!--======[ alarmButton ]======-->
				    </div><!-- end .buttonBox -->
				    <!-- 
					<div id="profile">
						<img class="memberImg" src="img/profileImg_1.png">
					</div>
					<span class="nickname" id="mem1">강구가구가구가</span>
					<div class="gradeIcon">
						🌱
					</div>
					 -->
					 <!-- 로그인/회원가입으로 이동 -->
					<span class="nav-link log" ><a href="Login.action" class="link">로그인/회원가입</a></span>
				</div><!-- end .oneMember -->
			    <!--=======[ member Icon ]=======-->
			    </div>
			  	</div><!-- end .container-fluid -->
			</nav>
		</div><!-- end .row .bannerArea  -->
	</div>

	
	<!--===========[offCanvas]===========-->
	<div class="col-12">
		
		
		<div class="offcanvas offcanvas-top" tabindex="-1" id="offcanvasTop" aria-labelledby="offcanvasTopLabel">
		  
		  
		  <!--[ 검색창을 열었을 때 보여지는 내용 ]-->
		  <div class="offcanvas-body">
		  
		  	<div class="row searchFormArea align-self-center">
		  	
				<div class="col-2">
					<ion-icon name="search-circle"></ion-icon>
				</div><!-- end .col-1 -->
				
				<div class="col-8">
				    <!--===========[searchForm]===========-->
				    <form class="d-flex" role="search">
				      <input class="form-control me-2 searchTextForm" type="search" placeholder="검색어를 입력하세요." aria-label="Search">
				      <button class="btn btn-outline-success" type="submit">Search</button>
				    </form>
				    <!--===========[searchForm]===========-->
			    </div><!-- end .col-8 -->
			    
		    </div><!-- end .row -->
		    
		  </div><!-- end .offcanvas-body -->
		</div>
	</div>
	<!--===========[offCanvas]===========-->
	
	
	
	<div class="flex">
		<div class="col-6 menuArea">
			<div class="leftmenuBarBox">
				<div class="leftmenuBar">
				
					<!--===========[Logo]===========-->
					<a class="navbar-brand mainLogo link" href="Code_Mate_admin.action">
						<img alt="Logo" class="LogoImageBanner d-inline-block align-text-top" src="img/TestLogo.png" >
					</a>
					<!--===========[Logo]===========-->
					
					
					<div class="menuOptions nav nav-underline lastchange" id="nav">
						<ul class="nav-item">
							<a href="Member.action" class="majorTopic nav-link link">회원조회<ion-icon
									class="menuIcon" name="terminal-outline"></ion-icon></a>
							<li class="miniMenuOption">
								<ul>
									<li class="miniMenuOption"><a href="Member.action"
										class="nav-link link">전체회원</a></li>
									<li class="miniMenuOption"><a href="Member_penalty.action"
										class="nav-link link">패널티 당한 회원</a></li>
									<li class="miniMenuOption"><a href="Member_close.action"
										class="nav-link link">탈퇴한회원</a></li>
								</ul>
							</li>
						</ul>
						<ul class="nav-item ">
							<a href="Member_report.action" class="majorTopic nav-link link">신고처리<ion-icon
									class="menuIcon" name="desktop-outline"></ion-icon></a>
							<li class="miniMenuOption">
								<ul>
									<li class="miniMenuOption"><a href="Member_report.action"
										class="nav-link link">들어온 내용</a></li>
									<li class="miniMenuOption"><a href="Member_report_process.action"class="nav-link link">처리한 내용</a></li>
								</ul>
							</li>
						</ul>
						<ul class="nav-item">
							<a href="Inquiry_Faq.action" class="majorTopic nav-link link">문의사항<ion-icon class="menuIcon" name="reader-outline"></ion-icon></a>
							<li class="miniMenuOption">
								<ul>
									<li class="miniMenuOption"><a href="Inquiry_1v1.action" class="nav-link link">1대1문의</a></li>
									<li class="miniMenuOption"><a href="Inquiry_Faq.action" class="nav-link link">FAQ</a></li>
									<li class="miniMenuOption"><a href="Inquiry_Report.action" class="nav-link link">신고 관련 문의</a></li>
								</ul>
							</li>
						</ul>
						<ul class="nav-item">
							<a href="Admin_Communiity.action" class="majorTopic nav-link link">커뮤니티<ion-icon class="menuIcon" name="person-outline"></ion-icon></a>
							<li class="miniMenuOption">
								<ul>
									<li class="miniMenuOption"><a href="Admin_Communiity.action"class="nav-link link">게시판</a></li>
									<li class="miniMenuOption"><a href="Admin_Project.action"class="nav-link link">프로젝트</a></li>
								</ul>
							</li>
						</ul>
					</div><!-- end .menuOptions -->
				</div><!-- end .leftmenuBar -->
			</div><!-- end .leftmenuBarBox -->
		</div><!-- end .col-6 .menuArea -->		<!-- 본문 영역 -->
		<div class="row main-text">
			<div class="row-space">
				<div class="col-lg-3 col-md-10 bordered-div">
					<h5>전체 회원 수</h5>
					<div>
						<span class="material-symbols-outlined" style="color: #7ace4c;">group</span>
						<span
							style="float: right; margin-right: 1px; font-size: 25px; color: #7ace4c">${all_count }</span>
					</div>
				</div>
				<div class="col-lg-3 col-md-10 bordered-div">
					<h5>진행중인 프로젝트 수</h5>
					<div>
						<span class="material-symbols-outlined" style="color: #e996e9;">nature_people</span>
						<span
							style="float: right; margin-right: 1px; font-size: 25px; color: #e996e9">${project_count }</span>
					</div>
				</div>
				<div class="col-lg-3 col-md-10 bordered-div">
					<h5>전체 신고 수</h5>
					<div>
						<span class="material-symbols-outlined" style="color: #93b8f1;">supervised_user_circle</span>
						<span
							style="float: right; margin-right: 1px; font-size: 25px; color: #93b8f1">${report_count }</span>
					</div>
				</div>
			</div>
			<div class="col-md-9 col-lg-9 col-sm-9 col-xs-9 bordered-div"
				style="width: 76.3%; height: 84%;">
				<h5>오늘 접속한 회원</h5>
				<div class="table-responsive">
					<table class="table no-wrap">
						<thead>
							<tr class="text-center">
								<th class="border-top-0">#</th>
								<th class="border-top-0">이름</th>
								<th class="border-top-0">아이디</th>
								<th class="border-top-0">가입일</th>
								<th class="border-top-0">글 수</th>
								<th class="border-top-0">댓글 수</th>
								<th class="border-top-0">문의사항 수</th>
								<th class="border-top-0">메모</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="text-center">1</td>
								<td class="text-center">윤수 짱짱</td>
								<td class="text-center">ys0106</td>
								<td class="text-center">2024-02-26</td>
								<td class="text-center">10</td>
								<td class="text-center">100</td>
								<td class="text-center">1</td>
								<td class="text-center">없음</td>

							</tr>
							<tr>
								<td class="text-center">2</td>
								<td class="text-center">한울 짱짱</td>
								<td class="text-center">ys0106</td>
								<td class="text-center">2024-02-26</td>
								<td class="text-center">10</td>
								<td class="text-center">100</td>
								<td class="text-center">1</td>
								<td class="text-center">없음</td>

							</tr>
							<tr>
								<td class="text-center">3</td>
								<td class="text-center">혜성 짱짱</td>
								<td class="text-center">hy0106</td>
								<td class="text-center">2024-02-26</td>
								<td class="text-center">10</td>
								<td class="text-center">100</td>
								<td class="text-center">1</td>
								<td class="text-center">없음</td>

							</tr>
							<tr>
								<td class="text-center">4</td>
								<td class="text-center">지민 짱짱</td>
								<td class="text-center">jm0106</td>
								<td class="text-center">2024-02-26</td>
								<td class="text-center">10</td>
								<td class="text-center">100</td>
								<td class="text-center">1</td>
								<td class="text-center">없음</td>

							</tr>
							<tr>
								<td class="text-center">5</td>
								<td class="text-center">범구 짱짱</td>
								<td class="text-center">bg0106</td>
								<td class="text-center">2024-02-26</td>
								<td class="text-center">10</td>
								<td class="text-center">100</td>
								<td class="text-center">1</td>
								<td class="text-center">없음</td>

							</tr>
							<tr>
								<td class="text-center">6</td>
								<td class="text-center">현욱 짱짱</td>
								<td class="text-center">hw0106</td>
								<td class="text-center">2024-02-26</td>
								<td class="text-center">10</td>
								<td class="text-center">100</td>
								<td class="text-center">1</td>
								<td class="text-center">없음</td>

							</tr>
							<tr>
								<td class="text-center">7</td>
								<td class="text-center">현욱 짱짱</td>
								<td class="text-center">hw0106</td>
								<td class="text-center">2024-02-26</td>
								<td class="text-center">10</td>
								<td class="text-center">100</td>
								<td class="text-center">1</td>
								<td class="text-center">없음</td>

							</tr>
							<tr>
								<td class="text-center">8</td>
								<td class="text-center">현욱 짱짱</td>
								<td class="text-center">hw0106</td>
								<td class="text-center">2024-02-26</td>
								<td class="text-center">10</td>
								<td class="text-center">100</td>
								<td class="text-center">1</td>
								<td class="text-center">없음</td>

							</tr>
							<tr>
								<td class="text-center">9</td>
								<td class="text-center">현욱 짱짱</td>
								<td class="text-center">hw0106</td>
								<td class="text-center">2024-02-26</td>
								<td class="text-center">10</td>
								<td class="text-center">100</td>
								<td class="text-center">1</td>
								<td class="text-center">없음</td>

							</tr>
							<tr>
								<td class="text-center">10</td>
								<td class="text-center">현욱 짱짱</td>
								<td class="text-center">hw0106</td>
								<td class="text-center">2024-02-26</td>
								<td class="text-center">10</td>
								<td class="text-center">100</td>
								<td class="text-center">1</td>
								<td class="text-center">없음</td>

							</tr>
						</tbody>
					</table>
				</div>
				<nav aria-label="...">
					<ul class="pagination">
						<li class="page-item pagination2"><a class="page-link">Previous</a></li>
						<li class="page-item pagination2"><a class="page-link"
							href="#">1</a></li>
						<li class="page-item pagination2"><a class="page-link"
							href="#">2</a></li>
						<li class="page-item pagination2"><a class="page-link"
							href="#">3</a></li>
						<li class="page-item pagination2"><a class="page-link"
							href="#">Next</a></li>
					</ul>
				</nav>
			</div>
			<!-- <div class="col-3">사이드를 여기에 작성하세요</div> -->
		</div>
	</div>
	</div>
	<!-- end .row -->
</body>
</html>

