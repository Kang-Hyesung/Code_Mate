<%@page import="com.test.mybatis.dto.MemberDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

	String login = "";
	String logout = "";
	String name = "";
	
	if(request.getSession().getAttribute("member") != null)
	{
		login = "";
		logout = "display:none;";
		MemberDTO member = (MemberDTO)request.getSession().getAttribute("member");
		
		name = member.getNickname();
	}
	else
	{
		login = "display:none;";
		logout = "";
	}
		
	
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Portfolio.jsp</title>
<!-- BootStrap -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/banner_side.css" />

<!-- JQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- ionicons -->
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

<style type="text/css">
	.@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
	}
	
	*
	{
		font-family: 'Pretendard-Regular';
	}
	
	.offcanvas.hiding, .offcanvas.show, .offcanvas.showing {
    visibility: visible;
    width: 733px;
    left: 31%;
    border-radius: 13px;
    height: 77px;
}
	
	 .alarm-btn {
    background-color: #f8f9fa;
    border: #f8f9fa;
    color: #4f59ca;
    padding: 0 5px 0 5px;
	transition-property: all;
	transition-duration:0.5s;
	border-radius: 50%;
	font-size: 20px;
	line-height: 30px;
	
}
	.alarm-btn:hover {
    color: var(--bs-btn-hover-color);
    background-color: #4f59ca;
    }
	
</style>

<style type="text/css">

</style>

<style type="text/css">
a{
text-decoration: none;
}

ol, ul {
    list-style: none;
}

.wrapper {
  max-width: 1100px;
  width: 100%;
  position: relative;
}
.wrapper i {
  top: 50%;
  height: 50px;
  width: 50px;
  cursor: pointer;
  font-size: 1.25rem;
  position: absolute;
  text-align: center;
  line-height: 50px;
  background: #fff;
  border-radius: 50%;
  box-shadow: 0 3px 6px rgba(0,0,0,0.23);
  transform: translateY(-50%);
  transition: transform 0.1s linear;
}
.wrapper i:active{
  transform: translateY(-50%) scale(0.85);
}
.wrapper i:first-child{
  left: -23px;
  z-index: 10;
}
.wrapper i:last-child{
  right: -15px;
}
.wrapper .carousel{
  display: grid;
  grid-auto-flow: column;
  grid-auto-columns: calc((100% / 3) - 5px);
  overflow-x: auto;
  scroll-snap-type: x mandatory;
  gap: 16px;
  border-radius: 8px;
  scroll-behavior: smooth;
  scrollbar-width: none;
}
.carousel::-webkit-scrollbar {
  display: none;
}
.carousel.no-transition {
  scroll-behavior: auto;
}
.carousel.dragging {
  scroll-snap-type: none;
  scroll-behavior: auto;
}
.carousel.dragging .card {
  cursor: grab;
  user-select: none;
}
.carousel :where(.card, .img) {
  display: flex;
  justify-content: center;
  align-items: center;
}
.carousel .card {
  scroll-snap-align: start;
  height: 342px;
  list-style: none;
  background: #fff;
  cursor: pointer;
  padding-bottom: 15px;
  flex-direction: column;
  border-radius: 8px;
}
.carousel .card .img {
  background: #4f59ca;
  height: 148px;
  width: 148px;
  border-radius: 50%;
}
.card .img img {
  width: 140px;
  height: 140px;
  border-radius: 50%;
  object-fit: cover;
  border: 4px solid #fff;
}
.carousel .card h2 {
  font-weight: 500;
  font-size: 1.56rem;
  margin: 30px 0 5px;
}
.carousel .card span {
  color: #6A6D78;
  font-size: 1.31rem;
}

.project-all {
    margin-top: 40px;
}

.project-all__head {
    position: relative;
}

h3.project-all__title {
    padding: 8px 0;
}

.project-all__title {
    margin-bottom: 18px;
    color: #121213;
    font-size: 24px;
    font-weight: 600;
    line-height: 1em;
    letter-spacing: -.64px;
}

.sort--right {
    text-align: right;
}

.sort__button {
    padding: 11px 14px;
    display: flex;
    gap: 5px;
    border-radius: 4px;
    border: 1px solid #e8e9eb;
    background: #fff;
    color: #343435;
    font-size: 14px;
}

.sort__button {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    color: #6f6f72;
    font-size: 14px;
    line-height: 1.28em;
    letter-spacing: -.22px;
}

.project-tag {
    margin-bottom: 20px;
}

.project-tag__wrapper {
    display: flex;
    flex-wrap: wrap;
    width: 100%;
}

.badge-tag {
    border: 1px solid #e8e9eb;
}

.project-tag .badge-tag {
    margin-right: 4px;
    margin-bottom: 5px;
    flex-shrink: 0;
}
.badge-tag {
    display: flex;
    align-items: center;
    justify-content: center;
    min-width: 70px;
    height: 35px;
    padding-right: 17px;
    padding-left: 17px;
    border: 1px solid #d0d1d4;
    background-color: #fff;
    border-radius: 35px;
    color: #38383a;
    font-size: 15px;
    line-height: 1.13em;
    letter-spacing: -.4px;
    text-align: center;
    box-sizing: border-box;
}
.project-all__list {
    display: flex;
    flex-wrap: wrap;
    margin-right: -14px;
    margin-left: -14px;
}

.project-all__list .list__item {
    width: 25%;
    padding: 0 14px 30px;
    box-sizing: border-box;
}

.project-card {
    width: 100%;
    text-align: left;
}

.project-card__image{
	width: 259px;
	height: 259px;
}

.project-card__content {
    position: relative;
    padding: 41px 25px 23px;
    height: 77px;
}

.project-card__name {
    margin-bottom: 4px;
    font-size: 20px;
}

.project-card__desc, .project-card__name {
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}
</style>

<style type="text/css">
@import url("https://fonts.googleapis.com/css?family=Montserrat:600&display=swap");
.contentA {
  margin-left: 90px;
  display: flex;
  cursor: pointer;
}

.heart {
  position: absolute;
  background: url("img/heart.png") no-repeat;
  background-position: left;
  background-size: 2900%;
  height: 90px;
  width: 90px;
  transform: translate(-50%, -50%);
  margin-top: 15px;
  margin-left: 10px;
}

.text {
  font-size: 21px;
  margin-left: 30px;
  color: grey;
  font-family: "Montserrat", sans-serif;
}

.numb:before {
  font-size: 21px;
  margin-left: 7px;
  font-weight: 600;
  color: #9C9496;
  font-family: sans-serif;
}

.numb.heart-active:before {
  color: #000;
}

.text.heart-active {
  color: #000;
}

.heart.heart-active {
  animation: animate 0.8s steps(28) 1;
  background-position: right;
}

@keyframes animate {
  0% {
    background-position: left;
  }
  100% {
    background-position: right;
  }
}

</style>

<script src="script.js" defer></script>

<script type="text/javascript">
const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
	
	  $( function () {
	    $( '[data-bs-toggle="popover"]' ).popover()
	  } );
</script>

<script type="text/javascript">
	function test()
	{
		$('.contentA').toggleClass("heart-active")
        $('.text').toggleClass("heart-active")
        $('.numb').toggleClass("heart-active")
        $('.heart').toggleClass("heart-active")
	}
</script>

</head>
<body onload="test()">

<div class="row mainArea">

	<div class="col-12 bannerMain">
		<div class="row bannerArea">
			<nav class="navbar bg-body-tertiary">
			  <div class="container-fluid nav nav-underline bannerMainBox">
			    
			 	<!--===========[Logo]===========-->
				<a class="navbar-brand bannerLogo link" href="Code_Mate.action">
					<img alt="Logo" class="LogoImage d-inline-block align-text-top" src="img/TestLogo.png" >
				</a>
				<!--===========[Logo]===========-->
				
				<span class="nav-link"><a href="#" class="link">프로젝트 게시판</a></span>
				<span class="nav-link"><a href="#" class="link">커리어 게시판</a></span>
				<span class="nav-link"><a href="#" class="link">포트폴리오 게시판</a></span>
			
			    
			    <!--=======[ member Icon ]=======-->
			    <div class="oneMember">
					<div class="buttonBox">
						<!--======[ search Button ]======-->
						<button id="searchButton" class="btn banner-btn search-btn " type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop" aria-controls="offcanvasTop">
							<ion-icon name="search-outline" class="banner-btn-icon"></ion-icon>
						</button>
						<!--======[ search Button ]======-->
		
						<!--======[ alarmButton ]======-->
						<button type="button" class="btn btn-secondary alarm-btn" data-bs-container="body" data-bs-toggle="popover" data-bs-placement="bottom" data-bs-content="Bottom popover" style="<%=login%>">
						  <ion-icon name="notifications" class="banner-btn-icon"></ion-icon>
						</button>			
						<!--======[ alarmButton ]======-->

				    </div><!-- end .buttonBox -->
				    <a href="mypage.action">
						<div id="profile" style="<%=login%>">
							<img class="memberImg" src="img/profileImg_1.png">
						</div>
						<span class="nickname" id="mem1" style="<%=login%>">${member.nickname}</span>
						<div class="gradeIcon" style="<%=login%>">
							🌱
						</div>
					</a>
					 <!-- 로그인/회원가입으로 이동 -->
					<span class="nav-link log" ><a href="Login.action" class="link upside" style="<%=logout%>">로그인/회원가입</a></span>
				</div><!-- end .oneMember -->
			    <!--=======[ member Icon ]=======-->
			    </div>
			  	</div><!-- end .container-fluid -->
			</nav>
		</div><!-- end .row .bannerArea  -->
	</div>

	
	<!--===========[offCanvas]===========-->
	<div class="col-12">
		
		
		<div class="offcanvas offcanvas-top topoff" tabindex="-1" id="offcanvasTop" aria-labelledby="offcanvasTopLabel">
		  
		  
		  <!--[ 검색창을 열었을 때 보여지는 내용 ]-->
		  <div class="offcanvas-body ">
		  
		  	<div class="searchFormArea">
		  	
				<div class="search-Area">
					<ion-icon name="search-circle"></ion-icon>
				</div><!-- end .col-1 -->
				
				<div style="width: 100%">
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
					<div class="project-primary" style="display: flex;">
						<div class="wrapper">
						      <i id="left" class="fa-solid fa-angle-left"></i>
						      <ul class="carousel">
						        <li class="card">
						          <div class="img"><img src="img/portfolio01.png" alt="img" draggable="false"></div>
						          <h2>그루어리</h2>
						          <span>일기에 답장을 적어주는 회고 다이어리</span>
						        </li>
						        <li class="card">
						          <div class="img"><img src="img/portfolio02.png" alt="img" draggable="false"></div>
						          <h2>이냥저냥</h2>
						          <span>올바른 돌봄 문화의 시작	</span>
						        </li>
						        <li class="card">
						          <div class="img"><img src="img/portfolio03.png" alt="img" draggable="false"></div>
						          <h2>리쿠르탐</h2>
						          <span>AI 맞춤형 커리어 추천</span>
						        </li>
						        <li class="card">
						          <div class="img"><img src="img/portfolio04.png" alt="img" draggable="false"></div>
						          <h2>코띠</h2>
						          <span>한국인 유학생을 위한 커피챗 서비스</span>
						        </li>
						        <li class="card">
						          <div class="img"><img src="img/portfolio05.png" alt="img" draggable="false"></div>
						          <h2>Bee Happy</h2>
						          <span>행복을 담는 공간</span>
						        </li>
						        <li class="card">
						          <div class="img"><img src="img/portfolio06.png" alt="img" draggable="false"></div>
						          <h2>푸딧</h2>
						          <span>식재료 쉐어 구매를 도와주는 서비스</span>
						        </li>
						      </ul>
						      <i id="right" class="fa-solid fa-angle-right"></i>
						    </div>
					</div>
					
					<div class="project-all">
						<div class="project-all__head">
							<h3 class="project-all__title">포트 폴리오</h3>
							
								<div class="sort sort--right">
								<button type="button" class="sort__button"><ion-icon name="funnel-outline"></ion-icon> 정렬</button>
							</div>
							
							<div class="project-tag">
								<div class="project-tag__wrapper">
									<button type="button" class="badge-tag">#챌린지</button>
									<button type="button" class="badge-tag">#동네</button>
									<button type="button" class="badge-tag">#기록</button>
									<button type="button" class="badge-tag">#Java</button>
									<button type="button" class="badge-tag">#React</button>
									<button type="button" class="badge-tag">#Oracle</button>
								</div>
							</div>
						</div>
						
						<div class="project-all__content">
							<div class="q-infinite-scroll">
								<ul class="project-all__list">
									
									<c:forEach var="item" items="${list}">
										<li class="list__item">
										 	<div class="project-card">
										 		<a href="portfolioview.action?article=${item.p_code}">
										 			<img alt="" src="img/portfolio01.png" class="project-card__image">
										 		</a>
										 		
										 		<div class="project-card__content">
										 			<a href="portfolioview.action?article=${item.p_code}" style="color: black;">
										 				<strong class="project-card__name">${item.prj_name}</strong>
										 			</a>
										 			
										 				<p class="project-card__desc">
										 					${item.title}
										 				</p>
										 					
									 					<div class="heart-btn">
													      <div class="contentA">
													        <span class="heart"></span>
													        <span class="text">Like ${item.hearts}</span>
													        <span class="numb"></span>
													      </div>
														</div>
										 		</div>
										 	</div>
										 	
									 	</li>
									</c:forEach>
									
									<!-- 
									 <li class="list__item">
									 	<a href="" class="list__link">
									 	</a>
									 	<div class="project-card">
									 		<img alt="" src="img/portfolio01.png" class="project-card__image">
									 		
									 		<div class="project-card__content">
									 			<strong class="project-card__name">인툰포켓</strong>
									 			
									 			<p class="project-card__desc">
									 				내가 쓴 일기에 답장을 보내주는 회고 다이어리
									 			</p>
									 		</div>
									 	</div>
									 </li>
									 
									 <li class="list__item">
									 	<a href="" class="list__link">
									 	</a>
									 	<div class="project-card">
									 		<img alt="" src="img/portfolio01.png" class="project-card__image">
									 		
									 		<div class="project-card__content">
									 			<strong class="project-card__name">인툰포켓</strong>
									 			
									 			<p class="project-card__desc">
									 				내가 쓴 일기에 답장을 보내주는 회고 다이어리
									 			</p>
									 		</div>
									 	</div>
									 </li>
									 
									 <li class="list__item">
									 	<a href="" class="list__link">
									 	</a>
									 	<div class="project-card">
									 		<img alt="" src="img/portfolio01.png" class="project-card__image">
									 		
									 		<div class="project-card__content">
									 			<strong class="project-card__name">인툰포켓</strong>
									 			
									 			<p class="project-card__desc">
									 				내가 쓴 일기에 답장을 보내주는 회고 다이어리
									 			</p>
									 		</div>
									 	</div>
									 </li>
									 
									 <li class="list__item">
									 	<a href="" class="list__link">
									 	</a>
									 	<div class="project-card">
									 		<img alt="" src="img/portfolio01.png" class="project-card__image">
									 		
									 		<div class="project-card__content">
									 			<strong class="project-card__name">인툰포켓</strong>
									 			
									 			<p class="project-card__desc">
									 				내가 쓴 일기에 답장을 보내주는 회고 다이어리
									 			</p>
									 		</div>
									 	</div>
									 </li>
									 
									 <li class="list__item">
									 	<a href="" class="list__link">
									 	</a>
									 	<div class="project-card">
									 		<img alt="" src="img/portfolio01.png" class="project-card__image">
									 		
									 		<div class="project-card__content">
									 			<strong class="project-card__name">인툰포켓</strong>
									 			
									 			<p class="project-card__desc">
									 				내가 쓴 일기에 답장을 보내주는 회고 다이어리
									 			</p>
									 		</div>
									 	</div>
									 </li>
									 
									 <li class="list__item">
									 	<a href="" class="list__link">
									 	</a>
									 	<div class="project-card">
									 		<img alt="" src="img/portfolio01.png" class="project-card__image">
									 		
									 		<div class="project-card__content">
									 			<strong class="project-card__name">인툰포켓</strong>
									 			
									 			<p class="project-card__desc">
									 				내가 쓴 일기에 답장을 보내주는 회고 다이어리
									 			</p>
									 		</div>
									 	</div>
									 </li>
									 
									 <li class="list__item">
									 	<a href="" class="list__link">
									 	</a>
									 	<div class="project-card">
									 		<img alt="" src="img/portfolio01.png" class="project-card__image">
									 		
									 		<div class="project-card__content">
									 			<strong class="project-card__name">인툰포켓</strong>
									 			
									 			<p class="project-card__desc">
									 				내가 쓴 일기에 답장을 보내주는 회고 다이어리
									 			</p>
									 		</div>
									 	</div>
									 </li>
									 
									 <li class="list__item">
									 	<a href="" class="list__link">
									 	</a>
									 	<div class="project-card">
									 		<img alt="" src="img/portfolio01.png" class="project-card__image">
									 		
									 		<div class="project-card__content">
									 			<strong class="project-card__name">인툰포켓</strong>
									 			
									 			<p class="project-card__desc">
									 				내가 쓴 일기에 답장을 보내주는 회고 다이어리
									 			</p>
									 		</div>
									 	</div>
									 </li>
									  -->
								</ul>
							</div>
						</div>
					
					</div>
				</div>
				<div class="col-lg-2"></div>
			</div>
		</div>
		
		


</body>
</html>


