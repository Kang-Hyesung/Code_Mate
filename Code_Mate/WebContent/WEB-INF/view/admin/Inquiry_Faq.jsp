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
<title>1대1 문의</title>
<!-- BootStrap -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/admin_banner_side.css" />

<!-- JQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- ionicons -->
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />


    <script>
        function collapse(btn) {
            var content = btn.nextElementSibling;
            btn.classList.toggle('active'); // 버튼에 active 클래스를 토글하여 아이콘 모양 변경
            content.style.maxHeight = content.style.maxHeight ? null : content.scrollHeight + "px";
        }

</script>

</head>
<body>

	<div class="row mainArea">
		<div class="col-12 bannerMain">
			<div class="row bannerArea">
				<nav class="navbar bg-body-tertiary">
					<div class="container-fluid nav nav-underline bannerMainBox">

						<!--===========[Logo]===========-->
						<a class="navbar-brand bannerLogo link" href="#"> <img
							alt="Logo" class="LogoImage d-inline-block align-text-top"
							src="img/TestLogo.png">
						</a>
						<!--===========[Logo]===========-->

						<span class="nav-link"><a href="#" class="link">프로젝트
								게시판</a></span> <span class="nav-link"><a href="#" class="link">커리어
								게시판</a></span> <span class="nav-link"><a href="#" class="link">포트폴리오
								게시판</a></span>


						<!--=======[ member Icon ]=======-->
						<div class="oneMember">
							<div class="buttonBox">
								<!--======[ search Button ]======-->
								<button id="searchButton" class="btn btn-primary" type="button"
									data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop"
									aria-controls="offcanvasTop">
									<ion-icon name="search-outline"></ion-icon>
								</button>
								<!--======[ search Button ]======-->

								<!--======[ chat Button ]======-->
								<button id="chatButton" class="btn btn-primary" type="button"
									data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop"
									aria-controls="offcanvasTop">
									<ion-icon name="chatbubble-outline"></ion-icon>
								</button>
								<!--======[ chat Button ]======-->

								<!--======[ alarmButton ]======-->
								<button id="alarmButton" class="btn btn-primary" type="button"
									data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop"
									aria-controls="offcanvasTop">
									<ion-icon name="notifications"></ion-icon>
								</button>
								<!--======[ alarmButton ]======-->
							</div>
							<!-- end .buttonBox -->
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
							<span class="nav-link log"><a href="Login.action"
								class="link">로그인/회원가입</a></span>
						</div>
						<!-- end .oneMember -->
						<!--=======[ member Icon ]=======-->
					</div>
			</div>
			<!-- end .container-fluid -->
			</nav>
		</div>
		<!-- end .row .bannerArea  -->
	</div>


	<!--===========[offCanvas]===========-->
	<div class="col-12">


		<div class="offcanvas offcanvas-top" tabindex="-1" id="offcanvasTop"
			aria-labelledby="offcanvasTopLabel">


			<!--[ 검색창을 열었을 때 보여지는 내용 ]-->
			<div class="offcanvas-body">

				<div class="row searchFormArea align-self-center">

					<div class="col-2">
						<ion-icon name="search-circle"></ion-icon>
					</div>
					<!-- end .col-1 -->

					<div class="col-8">
						<!--===========[searchForm]===========-->
						<form class="d-flex" role="search">
							<input class="form-control me-2 searchTextForm" type="search"
								placeholder="검색어를 입력하세요." aria-label="Search">
							<button class="btn btn-outline-success" type="submit">Search</button>
						</form>
						<!--===========[searchForm]===========-->
					</div>
					<!-- end .col-8 -->

				</div>
				<!-- end .row -->

			</div>
			<!-- end .offcanvas-body -->
		</div>
	</div>
	<!--===========[offCanvas]===========-->



	<div class="flex">
		<div class="col-6 menuArea">
			<div class="leftmenuBarBox">
				<div class="leftmenuBar">

					<!--===========[Logo]===========-->
					<a class="navbar-brand mainLogo link" href="#"> <img alt="Logo"
						class="LogoImageBanner d-inline-block align-text-top"
						src="img/TestLogo.png">
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
					</div>
					<!-- end .menuOptions -->
				</div>
				<!-- end .leftmenuBar -->
			</div>
			<!-- end .leftmenuBarBox -->
		</div>
		<!-- end .col-6 .menuArea -->

		<!-- 본문 영역 -->
		<div class="row main-text">
			<form action="" method="post">
			<div class="col-10">
				<div class="container-inquery">
					<img class="inquerypicture" src="img/talkballon.png"
						alt="Talk Ballon">
				</div>
				<div class="container-inquery">
					<h2>
						<strong>『자주 하시는 질문』</strong>
					</h2>
				</div>
				<!-- 등록/수정/삭제 버튼 -->
				<div class="container-inquery">
					<div>
						<div class="edit-inquiry">
							<button class="edit-inquiry-btn">등록</button>
							<button class="edit-inquiry-btn">수정</button>
							<button class="edit-inquiry-btn">삭제</button>
						</div>
					</div>
				</div>
				<!-- 자주 받는 질문 리스트 -->
				<c:forEach var="list" items="${list }" varStatus="loop">
					<c:if test="${loop.index < 5 }">
						<div class="container-inquery" id="faq-1">
							<div>
							    <button type="button" class="collapsible" onclick="collapse(this);">
							    	<p class="inquery-detail"
							    	style="margin: 0 0 0 20px;">${list. tilte }</p>
							    </button>
							    <div class="inquiry-content">
							        <p class="Inquery-detail"
							        style="margin-top: 5px;">${list. content }</p>
							    </div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
			</form>
		</div>
	
		<!-- end .row -->
	</div>


</body>
</html>