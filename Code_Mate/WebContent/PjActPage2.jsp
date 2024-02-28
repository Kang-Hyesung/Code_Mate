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
<title>Template.jsp</title>
<!-- BootStrap -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/banner_side.css" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">

<!-- JQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- ionicons -->
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<style type="text/css">
	.prjname{vertical-align: middle;}
	.prjtitle{padding-top: 10px; justify-content: space-between;}
	
	
	
	@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
	}
	
	@font-face {
    font-family: 'Kimjuim';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/naverfont_07@1.0/Kimjuim.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
	
	/* 큰 창 */
	.skill-progress{
    width: 500px;
    height: 250px;
    padding: 20px;
    color: white;
    background-color: white;
    border-radius: 10px;
    color : black;
    box-shadow: 0 3px 9px rgba(0,0,0,5.16);
	}
	
	h1{
	    text-align: center;
	    font-size: 25px;
	    box-shadow: 0 20px 50px rgba(0, 0, 0, 0.089);
	    border-radius: 10px;
	    font-family: "Yellowtail", cursive;
	}
	.item {
    transition: 0.4s;
    margin-bottom: 0px;
	}
	.item:hover {
	    border-radius: 3px;
	    box-shadow: 7px 7px 10px rgba(0, 0, 0, 0.753);
	    transform: scale(1.05);            /*1.05배 커지게함*/
	}
	
	/* 간격 줄이기 */
	.subject{margin: 0 0 0 0;}
	
	.item p{
    overflow: hidden;       /*p태그 높이 회복*/
    margin-bottom : 0;      /* p태그 자체가 차지하는 마진을 없애기 */

	}
	
	/* p태그안에 있는 span을 왼쪽, 오른쪽 정렬을 시켜야함 */
	.item p span:nth-child(1){  /*span:first-child*/
	    float : left;
	}
	.item p span:nth-child(2){  /*span:end-child*/
	    float: right;
	}
	
	/* 그라데이션 막대를 감싸는 박스 */
	.progress{
	    border : 1px solid #6cd4c4;
	    padding : 0px;
	    border-radius: 3px;
	}
	
	/* 그라데이션 막대 */
	.progress-level{
	    height: 15px;
	    background : linear-gradient(to right, #EED3D9, #EED3D9);   /*방향(deg각도도 가능), 시작색상, 종료색상*/
	    animation: ani;
	    animation-duration: 1s;                               /*1초만에 발생한 애니메이션이 끝나게 함*/
	
	    animation-fill-mode: both; 
	    /*애니메이션이 반복이 끝나면 -> 무조건 keyframe에서 100%구간에 머무르게 해라
	    애니메이션은 기본적으로, 0%->100%->0%로 진행됨. 
	    근데, animation-fill-mode 설정이 없으면 100%구간에서 멈추지 않고 애니메이션이 부자연스러움
	    100%구간에서 멈추게 해서 -> 로딩 후, 바로 꽉찬 막대를 만들기 위해 fill-mode를 사용
	    */
	}
	
	/* 처음 로드될 때, 그라데이션바들이 서서히 차오르는 애니메이션 주기 */
	@keyframes ani{
	    0%{
	        width: 0;   /*시작할 때만 width가 0이게만 하면 됨*/
	    }
	}
	
	
	/* 업무보고서로 넘어가는 검색모양 input */
	.searchInput{border: none; width: 400px; margin: 10px 0 0 22px; background: white;}
	/* searchInput 감싸는 div */
	.searchBar{width: 500px; height: 50px; border: 2px solid gray; float: right; border-radius: 40px;
			   margin-left: auto; background: white; box-shadow: 0 3px 9px rgba(0,0,0,5.16);}
	/* 작성 아이콘 */
	.editicon{float: right; margin: 9px 17px 0 0;}
	
	.first{ display: flex;
    justify-content: flex-start;}
    
    input:focus {outline:none;}
    
    hr{color: #EED3D9; border: 1px solid gray;}

	/* 마일스톤, 팀원 목록 */
	.topsum{display: flex; margin-top: 60px; justify-content: space-between;}	
	
	/* 멤버리스트 */
	.memberlist{width: 700px; height: 105px; overflow: scroll;}
	
	/* 프론트, 백, 리스트 */
	.frontlist, .backlist{display: flex; width: 100%; padding: 7px 0 7px 0;}
	
	/* 멤버리스트 멤버 이름 */
	.member-name{padding: 3px 15px 3px 15px;; display: flex; background-color: #E5E1DA; margin-left: 20px;
				border-radius: 10px; width: fit-content; border: 1px solid gray;}
				
	.memberlist-content {width: max-content;}
	/* 멤버리스트 전체 */
	.memberlistall{padding-left: 130px; width: 700px}
	/* 역할 */
	.job-name{padding: 9px;}
	.member-grade{padding-left: 5px;}
	
	/* 두번째 정리 */
	.second{padding-top: 40px; }
	
	.task-all{width: 450px;}
	/* task 카드 */
	.task-card{margin: 30px 0 0 5px;}
	
	/* 카드안 멤버 박스 */
	.task-date{margin: 0 7px 0 7px; font-size: 12px;}
	
	/* 카드안에 존재하는 닉네임 */
	.card-title{padding-left: 12px; width: 100%;}
	
	/* task 진행 상태 */
	.task-status{float: right; padding-right: 10px; font-size: 14px;}
	.sta-ing{color: orange;}
	.sta-end{color: green;}
}
</style>


<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js'></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth'
    });
    calendar.render();
  });

</script>


</head>
<body>

<div class="row mainArea">

	<div class="col-12 bannerMain">
		<div class="row bannerArea">
			<nav class="navbar bg-body-tertiary">
			  <div class="container-fluid nav nav-underline bannerMainBox">
			    
			 	<!--===========[Logo]===========-->
				<a class="navbar-brand bannerLogo link" href="#">
					<img alt="Logo" class="bannerLogoImage d-inline-block align-text-top lastchange" src="img/TestLogo.png" >
				</a>
				<!--===========[Logo]===========-->
				
				<span class="nav-link"><a href="#" class="link">프로젝트 게시판</a></span>
				<span class="nav-link"><a href="#" class="link">커리어 게시판</a></span>
				<span class="nav-link"><a href="#" class="link">포트폴리오 게시판</a></span>
			
			    
			    <!--=======[ member Icon ]=======-->
			    <div class="oneMember">
					<div class="buttonBox">
						<!--======[ search Button ]======-->
						<button id="searchButton" class="btn banner-btn search-btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop" aria-controls="offcanvasTop">
							<ion-icon name="search-outline"></ion-icon>
						</button>
						<!--======[ search Button ]======-->
		
						<!--======[ alarmButton ]======-->
						<button id="alarmButton" class="btn banner-btn alarm-btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop" aria-controls="offcanvasTop">
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
	</div><!-- close.bannerMain -->

	
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
					<a class="navbar-brand mainLogo link" href="#">
						<img alt="Logo" class="LogoImageBanner d-inline-block align-text-top" src="img/TestLogo.png" >
					</a>
					<!--===========[Logo]===========-->
					
					
					<div class="menuOptions nav nav-underline" id="nav">
						<ul class="nav-item">
							<a href="#" class="majorTopic nav-link link">프로젝트12345123<ion-icon class="menuIcon" name="terminal-outline"></ion-icon></a>
							<li class="miniMenuOption">
								<ul>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
								</ul>
							</li>
						</ul>
						<ul class="nav-item ">
							<a href="#" class="majorTopic nav-link link">프로젝345<ion-icon class="menuIcon" name="desktop-outline"></ion-icon></a>
							<li  class="miniMenuOption">
								<ul>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
								</ul>
							</li>
						</ul>
						<ul class="nav-item">
							<a href="#" class="majorTopic nav-link link">프로젝트123415<ion-icon class="menuIcon" name="reader-outline"></ion-icon></a>
							<li class="miniMenuOption">
								<ul>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
								</ul>
							</li>
						</ul>
						<ul class="nav-item">
							<a href="#" class="majorTopic nav-link link">프로젝2345<ion-icon class="menuIcon" name="person-outline"></ion-icon></a>
							<li class="miniMenuOption">
								<ul>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
								</ul>
							</li>
						</ul>
						<ul class="nav-item">
							<a href="#" class="majorTopic nav-link link">프로젝2345<ion-icon class="menuIcon" name="person-outline"></ion-icon></a>
							<li class="miniMenuOption">
								<ul>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트121231345</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
								</ul>
							</li>
						</ul>
						
					</div><!-- end .menuOptions -->
				</div><!-- end .leftmenuBar -->
			</div><!-- end .leftmenuBarBox -->
		</div><!-- end .col-6 .menuArea -->
		
		<!-- 본문 영역 -->
		<div class="row main-text">
			<div class="col-11">
				
				<!-- 프로젝트 설명 -->
				<div class="row prjtitle">
					<div class="col-4">
						<h2>러블리볶이</h2>
					</div>
					<div class="col-4" style="padding-top: 5px;">
						<h3>떡볶이 맛집 추천 프로젝트</h3>
					</div>
					<div class="col-3" style="padding-top: 12px;">
						<h5>2023년 1월 15일 ~ 2027년 4월 12일</h5>
					</div>
					
					<hr>
				</div><!-- close row prjtitle -->
				
				<!-- 각종 요약 -->
				<div class="row first" style="padding-top: 30px;">
					<div class="searchBar">
							<input type="text" placeholder="밀린 업무 보고서가 있진 않으신가요?" class="searchInput" disabled="disabled"/>
							<span class="material-symbols-outlined editicon">edit</span>
					</div>
				
					<div class="col-10 topsum">
						<div class="skill-progress">
						        <h1>MILESTONE</h1>
						        <div class="item">
						            <p class="subject">
						                <span>기획</span>
						                <span>90%</span>
						            </p>
						            <div class="progress">
						                <div class="progress-level" style="width:90%"></div>
						            </div>
						        </div>
						
						        <div class="item">
						            <p class="subject">
						                <span>설계</span>
						                <span>60%</span>
						            </p>
						            <div class="progress">
						                <div class="progress-level" style="width:60%"></div>
						            </div>
						        </div>
						
						        <div class="item">
						            <p class="subject">
						                <span>구현</span>
						                <span>70%</span>
						            </p>
						            <div class="progress">
						                <div class="progress-level" style="width:70%"></div>
						            </div>
						        </div>
						
						
						        <div class="item">
						            <p class="subject">
						                <span>결산</span>
						                <span>70%</span>
						            </p>
						            <div class="progress">
						                <div class="progress-level" style="width:70%"></div>>
						            </div>
						        </div>
						        
						    </div><!-- close.skill-progress -->
						
						<div class="memberlistall">
							<h1>MEMBERLIST</h1>
							<div style="display: flex;">
								
								<div>
									<div class="job-name">FRONTEND</div>
									<div class="job-name">BACKNAME</div>
								</div>
								<div class="memberlist">
								
									<div class="memberlist-content">
										
										<div class="frontlist">
											<div class="member-name">
												<div class="mamber-nickname">이윤수근육빵빵몬123123</div>
												<div class="member-grade">🌱</div>
											</div>
											<div class="member-name">
												<div class="mamber-nickname">이윤수</div>
												<div class="member-grade">🌱</div>
											</div>
											<div class="member-name">
												<div class="mamber-nickname">이윤수</div>
												<div class="member-grade">🌱</div>
											</div>
											<div class="member-name">
												<div class="mamber-nickname">이윤수</div>
												<div class="member-grade">🌱</div>
											</div>
											
										</div><!-- close.frontlist -->
										
										<div class="backlist">
											<div class="member-name">
												<div class="mamber-nickname">김지민금손의보유자</div>
												<div class="member-grade">☀️</div>
											</div>
											<div class="member-name">
												<div class="mamber-nickname">김지민</div>
												<div class="member-grade">☀️</div>
											</div>
											<div class="member-name">
												<div class="mamber-nickname">김지민</div>
												<div class="member-grade">☀️</div>
											</div>
											<div class="member-name">
												<div class="mamber-nickname">김지민</div>
												<div class="member-grade">☀️</div>
											</div>
											<div class="member-name">
												<div class="mamber-nickname">김지민</div>
												<div class="member-grade">☀️</div>
											</div>
											<div class="member-name">
												<div class="mamber-nickname">김지민</div>
												<div class="member-grade">☀️</div>
											</div>
											<div class="member-name">
												<div class="mamber-nickname">김지민</div>
												<div class="member-grade">☀️</div>
											</div>
										</div><!-- close.backlist -->
									</div><!-- close .memberlist-content -->
										
								</div><!-- close.memberlist -->
							</div>
						</div>
					</div><!-- close.topsum -->
				</div><!-- close.first -->
				
				<div class="row second">
					<div class="task-all" style="padding: 20px;">
						<div class="tasktitle"><h1>TASK</h1></div>
						
						<div class="task">
							<div id="carouselExample" class="carousel slide">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <div class="task">
							<div class="card task-card">
								 <p class="card-text">백엔드마스터김지민트색이좋아 <span class="task-status sta-ing"></p>
	   							 <h6 class="card-subtitle mb-2 text-body-secondary task-date">2024년 2월 15일 ~ 2030년 10월 15일</h6>
	   							 <p class="card-text">뷰페이지 만들기</p>
	   							 <div class="task-date"">
	   							 	<span>부여일</span>
	   							 	<span style="float: right;">2028년 12월 1일</span>
								</div>
							</div><!-- close.card -->
							<div class="card task-card">
								 <h5 class="card-title">백엔드마스터김지민트색이좋아 <span class="task-status sta-ing">진행 중</span></h5>
	   							 <h6 class="card-subtitle mb-2 text-body-secondary task-date">2024년 2월 15일 ~ 2030년 10월 15일</h6>
	   							 <p class="card-text">뷰페이지 만들기</p>
	   							 <div class="task-date"">
	   							 	<span>부여일</span>
	   							 	<span style="float: right;">2028년 12월 1일</span>
								</div>
							</div><!-- close.card -->
							<div class="card task-card">
								 <h5 class="card-title">백엔드마스터김지민트색이좋아 <span class="task-status sta-end">완료</span></h5>
	   							 <h6 class="card-subtitle mb-2 text-body-secondary task-date">2024년 2월 15일 ~ 2030년 10월 15일</h6>
	   							 <p class="card-text">뷰페이지 만들기</p>
	   							 <div class="task-date"">
	   							 	<span>부여일</span>
	   							 	<span style="float: right;">2028년 12월 1일</span>
								</div>
							</div><!-- close.card -->
						</div><!-- close.task -->
    </div>
    <div class="carousel-item">
      <div class="task">
							<div class="card task-card">
								 <h5 class="card-title">백엔드마스터김지민트색이좋아</h5>
	   							 <h6 class="card-subtitle mb-2 text-body-secondary">2024년 2월 15일 ~ 2030년 10월 15일</h6>
	   							 <div class="member-info-box"">
	   							 	<span class="card-menu">업무수행</span>
								</div>
							</div><!-- close.card -->
							<div class="card task-card">
								 <h5 class="card-title">백엔드마스터김지민트색이좋아</h5>
	   							 <h6 class="card-subtitle mb-2 text-body-secondary">2024년 2월 15일 ~ 2030년 10월 15일</h6>
	   							 <div class="member-info-box"">
	   							 	<span class="card-menu">업무수행</span>
								</div>
							</div><!-- close.card -->
							<div class="card task-card">
								 <h5 class="card-title">백엔드마스터김지민트색이좋아</h5>
	   							 <h6 class="card-subtitle mb-2 text-body-secondary">2024년 2월 15일 ~ 2030년 10월 15일</h6>
	   							 <div class="member-info-box"">
	   							 	<span class="card-menu">업무수행</span>
								</div>
							</div><!-- close.card -->
						</div><!-- close.task -->
    </div>
    <div class="carousel-item">
      <div class="task">
							<div class="card task-card">
								 <h5 class="card-title">백엔드마스터김지민트색이좋아</h5>
	   							 <h6 class="card-subtitle mb-2 text-body-secondary">2024년 2월 15일 ~ 2030년 10월 15일</h6>
	   							 <div class="member-info-box"">
	   							 	<span class="card-menu">업무수행</span>
								</div>
							</div><!-- close.card -->
							<div class="card task-card">
								 <h5 class="card-title">백엔드마스터김지민트색이좋아</h5>
	   							 <h6 class="card-subtitle mb-2 text-body-secondary">2024년 2월 15일 ~ 2030년 10월 15일</h6>
	   							 <div class="member-info-box"">
	   							 	<span class="card-menu">업무수행</span>
								</div>
							</div><!-- close.card -->
							<div class="card task-card">
								 <h5 class="card-title">백엔드마스터김지민트색이좋아</h5>
	   							 <h6 class="card-subtitle mb-2 text-body-secondary">2024년 2월 15일 ~ 2030년 10월 15일</h6>
	   							 <div class="member-info-box"">
	   							 	<span class="card-menu">업무수행</span>
								</div>
							</div><!-- close.card -->
						</div><!-- close.task -->
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
						</div><!-- close.task -->
					</div><!-- close.task-all -->
				</div>
				
				
			</div>
		</div>
		
</div><!-- end .row -->



</body>
</html>