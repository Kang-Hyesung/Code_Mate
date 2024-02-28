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

<!-- JQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- ionicons -->
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

<style type="text/css">
.summary-infomation{
	padding-left: 30px;
	margin-top: 10px;
}

.summary-infomation__name {
    display: block;
    max-width: 70%;
    font-weight: 900;
    font-size: 30px;
    line-height: normal;
    letter-spacing: .6px;
    color: #4f59ca;
}

.summary-infomation__role {
    position: relative;
    top: 12px;
    font-style: normal;
    font-weight: 700;
    font-size: 16px;
    letter-spacing: .6px;
    color: #6f6f72;
}

.profile-id {
    margin-top: 15px;
    font-style: normal;
    font-weight: 400;
    font-size: 14px;
    letter-spacing: .6px;
    color: #acacae;
}

.profile-section {
    margin: 26px;
    border-top: 4px solid #4f59ca;
    min-height: 100px;
}

.profile-section-title {
    padding: 16px 4px;
    display: inline-block;
    font-size: 18px;
    font-weight: 700;
    letter-spacing: .6px;
    color: #4f59ca;
}



.col header.title {
    color: #4f59ca;
    padding: 0px 0px 20px 30px;
}

.col .contents {
    padding: 0px 30px;
    border-left: 2px solid #bababa;
}

.col .contents .box{
	position: relative;
	padding: 20px;
	border: 1px solid #eaeaea;
	background-color: #ffffff;
	cursor: pointer;
	transition: all 0.4s;
	margin-bottom: 20px;
}
.col .contents .box:hover{
	box-shadow: 0px 3px 12px 0px #ccc;
	border: 1px solid transparent;
}
.col .contents .box::before{
	content: '';
	position: absolute;
	width: 16px;
	height: 16px;
	border-radius: 50%;
	right: calc(100% + 22px);
	top: 0;
	background-color: #4f59ca;
	border: 2px solid white;
}

.box h4 {
    position: relative;
    color: #4f59ca;
}

.box h3 {
    font-size: 19px;
    padding: 10px 0px 6px;
    color: #444;
}

.box p {
    line-height: 1.2;
    color: #666;
    font-size: 17px;
}

.iTitle{
	font-size: 25px;
	font-weight: bold;
	color: #4f59ca;
}

.iContent{
	margin-top: 20px;
	font-size: 16px;
	color: #6f6f72;
	font-style: normal;
    font-weight: 700;
}

.profile-experience .profile-section-content li {
    display: inline-block;
    background: #fff;
    border: 1px solid #dcdef4;
    border-radius: 200px;
    margin-top: 8px;
    margin-right: 4px;
    height: 34px;
}

.profile-experience .profile-section-content li>span {
    padding: 8px 14px;
    font-style: normal;
    font-weight: 500;
    font-size: 15px;
    line-height: normal;
    font-size: 14px;
    display: inline-flex;
    align-items: center;
    color: #38383a;
}

.separator {
    color: #d0d1d4;
    margin-left: 6px;
    margin-right: 6px;
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
		
		<!-- 본문 영역 -->
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-2"></div>
				<div class="col-lg-8">
					<div class="profile-summary" style="display: flex;">
						<img class="rounded-circle" src="img/profile.png" alt="" style="width: 125px; height: 125px;">
						
						<div class="summary-infomation" style="width: 100%;">
							<div class="primary-info">
								<span class="summary-infomation__name">강혜성</span>
								<div class="summary-infomation__role">백엔드 개발자</div>
							</div>
							
							<div class="profile-id">
								@ <span class="summary-infomation__id">Organ</span>
							</div>
						</div>
						
					</div>
					
					<div class="profile-section profile-bside">
						<div class="profile-section-header">
							<h5 class="profile-section-title"> 자기소개 </h5>
						</div>
						
						<div class="profile-section-content" style="background: #f9f9f9;">
							<div class="iTitle">
								데이터로 일하는 개발자
							</div>
							<div class="iContent">
								<p>check check 내이름은 강혜성 I'm the korean top class
								Hiphop 모범 nobless
								fabulous turbulence
								Gorgeous but dangerous
								난 비트를 비틀어 제껴버리는
								서브미션 챔피온
								똑바로 눈떠라 떠나면 잡지못할 버스
								불을 지폈어
								Scene의 흐름에 부름에 답해
								Put it back 킬리만자로의 표범
								거만해 계속해 말해 나만의 기술
								계속 개발해냈어</p>
							</div>
						</div>
					</div>
					
					<div class="profile-section profile-careers">
						<div class="profile-section-header">
							<h5 class="profile-section-title"> 경력 <span class="profile-section-description"><span class="separator">|</span><span>총</span>&nbsp; <span class="accent">5년 1개월</span></span></h5>
						</div>
						
						<div class="row">
							<div class="col-lg-6">
								<section class="col">
			
								<header class="title">
									<h2>EDUCATION</h2>
								</header>
					
								<div class="contents">
									
									<div class="box">
										<h4>2018 - 2022</h4>
										<h3>High School Degree</h3>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
									</div>
					
									<div class="box">
										<h4>2018 - 2022</h4>
										<h3>Bachelor's Degree</h3>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
									</div>
					
									<div class="box">
										<h4>2018 - 2022</h4>
										<h3>Master Degree</h3>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
									</div>
					
								</div>
							</section>
							</div>
							
							<div class="col-lg-6">
								<section class="col">
								<header class="title">
									<h2>EXPERIENCE</h2>
								</header>
					
								<div class="contents">
									
									<div class="box">
										<h4>2018 - 2022</h4>
										<h3>UI/UX Designer</h3>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
									</div>
					
									<div class="box">
										<h4>2018 - 2022</h4>
										<h3>Full-Stack Developer</h3>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
									</div>
					
									<div class="box">
										<h4>2018 - 2022</h4>
										<h3>Frontend Developer</h3>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
									</div>
					
								</div>
							</section>
							</div>
						</div>
						
						
						
					</div>
					
					<div class="profile-section profile-experience">
						<div class="profile-section-header">
							<div class="profile-section-title">
								스킬
							</div>
						</div>
						
						<div class="profile-section-content">
							<ul>
								<li class="hasnt-level"><span class="skill-item-name">발라드</span></li>
								<li class="hasnt-level"><span class="skill-item-name">락</span></li>
								<li class="hasnt-level"><span class="skill-item-name">랩</span></li>
								<li class="hasnt-level"><span class="skill-item-name">힙합</span></li>
								<li class="hasnt-level"><span class="skill-item-name">R&B</span></li>
							</ul>
						</div>
					</div>
					
					<div class="profile-section profile-bside">
						<div class="profile-section-header">
							<div class="profile-section-title">
								프로젝트 <span class="profile-section-description"><span class="separator">|</span><span ">총</span>&nbsp; <span " class="accent">2개 프로젝트</span></span>
							</div>
						</div>
					</div>
					
				</div>
				<div class="col-lg-2"></div>
			</div>
		</div>
		


</body>
</html>