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
<title>PortfolioView.jsp</title>
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
a{
text-decoration: none;
}

.intro_title{
    display: block;
    font-size: 40px;
    font-weight: 700;
    line-height: 1.1em;
    letter-spacing: -1.11px;
    text-align: center;
}

.intro_grid{
    display: flex;
    justify-content: space-between;
    margin-top: 6px;
}

.intro_content {
    padding: 100px 52px 0 90px;
}

.intro_point {
    display: block;
    margin-bottom: 28px;
    color: #121212;
    font-size: 24px;
    font-weight: 700;
    line-height: 1.17em;
    letter-spacing: -.67px;
}

.intro_desc {
    font-size: 18px;
    line-height: 1.6em;
    letter-spacing: -.5px;
}

.store-link {
    margin-top: 30px;
}
.store-link {
    display: flex;
    align-items: center;
}

.store-link_link {
    display: flex;
    align-items: center;
    justify-content: center;
    min-width: 85px;
    height: 39px;
    margin-right: 4px;
    padding-right: 16px;
    padding-left: 15px;
    border: 1px solid #000;
    color: #121212;
    font-size: 14px;
    font-weight: 800;
    letter-spacing: -.37px;
    background-color: hsla(0, 0%, 100%, .3);
    border-radius: 39px;
    box-sizing: border-box;
}

.store-link .icon {
    margin-right: 1px;
    margin-left: -4px;
}
.icon--web {
    width: 22px;
    height: 21px;
}

.swiper {
    position: relative;
    flex-shrink: 0;
    width: 538px;
    height: 629px;
    padding-top: 60px;
    background-repeat: no-repeat;
    background-position: 50% 0;
    background-size: 538px 629px;
    box-sizing: border-box;
}

.detail {
    border-top: 4px solid #4f59ca;
    padding: 60px 40px;
    min-height: 100px;
    border-bottom: 4px solid #4f59ca;
}

.detail_title{
	margin-bottom: 22px;
    color: #121213;
    font-size: 24px;
    font-weight: 700;
    line-height: 1.2em;
    letter-spacing: -.64px;
}

.detail_skills {
    margin-bottom: 40px;
}

.list_item {
    position: relative;
    display: flex;
    align-items: center;
    margin-right: 30px;
    margin-bottom: 10px;
    flex-wrap: wrap;
    margin-right: 0;
    padding-left: 80px;
}

.skill-name {
    display: block;
    margin-right: 10px;
    color: #8e8f92;
    font-size: 15px;
    font-weight: 500;
    line-height: 1.2em;
    letter-spacing: -.42px;
    position: absolute;
    top: 0;
    left: 0;
    min-width: 80px;
    height: 36px;
    line-height: 36px;
}

.skill-badge {
    display: inline-flex;
    justify-content: center;
    align-items: center;
    height: 35px;
    margin-right: 4px;
    padding-right: 13px;
    padding-left: 13px;
    color: #121213;
    font-size: 15px;
    line-height: 1.13em;
    letter-spacing: -.4px;
    border-radius: 18px;
    border: 1px solid #d0d1d4;
    background-color: #fff;
    margin-bottom: 5px;
}

.detail_member {
    display: flex;
    align-items: center;
    flex-wrap: wrap;
}

.list_member {
    position: relative;
    display: flex;
    align-items: center;
    flex-wrap: wrap;
    margin-right: 20px;
    margin-bottom: 20px;
}

.member-title {
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
    width: 80px;
    height: 40px;
    margin-right: 10px;
    color: #fff;
    font-size: 13px;
    font-weight: 600;
    line-height: 1.3em;
    background-color: rgba(0, 0, 0, .3);
}

.member-title--type1 {
    background-color: #ff89a7;
    border-radius: 0 20px 20px 20px;
}

.member-title--type2 {
    background-color: #1fc1c0;
    border-radius: 20px;
}

.member-title--type3 {
    background-color: #1eb6f4;
    border-radius: 20px 20px 0 20px;
}

.member-item__name {
    overflow: hidden;
    display: block;
    color: #8e8f92;
    font-size: 14px;
    line-height: 1.42em;
    letter-spacing: -.37px;
    white-space: nowrap;
    text-align: center;
    text-overflow: ellipsis;
}

.project-tag__wrapper {
    display: flex;
    flex-wrap: wrap;
}

.badge-tag {
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

.more {
    padding: 47px 40px 0;
}

.more_title {
    margin-bottom: 20px;
    color: #121213;
    font-size: 24px;
    font-weight: 700;
    line-height: 1.2em;
    letter-spacing: -.64px;
}

.more__list {
    display: inline-block;
    font-size: 0;
    white-space: nowrap;
    vertical-align: top;
}

.project-card {
    position: relative;
    width: 180px;
    cursor: pointer;
}

.project-card__image {
    display: block;
    -o-object-fit: cover;
    object-fit: cover;
    border-radius: 4px;
}

.project-card__name {
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}

.project-card__name {
    display: block;
    margin-top: 8px;
    margin-bottom: 2px;
    color: #121213;
    font-size: 16px;
    font-weight: 500;
    line-height: 1.37em;
    letter-spacing: -.32px;
}

.project-card__desc {
    color: #8e8f92;
    font-size: 14px;
    line-height: 1.57em;
    letter-spacing: -.28px;
}

.project-card__desc{
    overflow: hidden;
     white-space: nowrap;
    text-overflow: ellipsis;
}

.list__item:first-child {
    margin-left: 0;
}
.list__item {
    display: inline-block;
    margin-left: 16px;
    white-space: normal;
    vertical-align: top;
}
</style>

<style type="text/css">
.slider {
    position: relative;
    width: 60%;
    overflow: hidden;
}
.images {
    display: flex;
    width: 100%;
}
.images img {
    height: 400px;
    width: 100%;
    transition: all 0.15s ease;
}
.images input {
    display: none;
}
.dots {
    display: flex;
    justify-content: center;
    margin: 5px;
}
.dots label {
    height: 20px;
    width: 20px;
    border-radius: 50%;
    border: solid #4f59ca; 3px;
    cursor: pointer;
    transition: all 0.15s ease;
    margin: 5px;
}
.dots label:hover {background: #fff;}
#img1:checked ~ .m1 {
    margin-left: 0;
}
#img2:checked ~ .m2 {
    margin-left: -100%;
}
#img3:checked ~ .m3 {
    margin-left: -200%;
}
#img4:checked ~ .m4 {
    margin-left: -300%;
}
</style>

<style type="text/css">
@import url("https://fonts.googleapis.com/css?family=Montserrat:600&display=swap");
.contentA {
  padding: 13px 16px;
  display: flex;
  cursor: pointer;
  margin-left: 900px;
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
  color: #000;
  font-family: "Montserrat", sans-serif;
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

<script type="text/javascript">
const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
	
	  $( function () {
	    $( '[data-bs-toggle="popover"]' ).popover()
	  } );
</script>

<script type="text/javascript">
	function test1()
	{	
		/* alert("${member.mem_code}"); */
		/* alert("${param.article}"); */
		
		if ("${member}" != "")
		{
			var flag = parseInt("${heartsFlag}");
			
			if (flag > 0)
			{
				$(document).ready(function(){
			        
			         $('.heart').addClass("heart-active")
			    });
			}
		}  
	}
	
	function test()
	{	
		var heartButton = $('.heart');
		
		if ("${member}" == "")
		{
			if(confirm("로그인이 필요합니다. 로그인하시겠습니까?"))
			{
				location.href="Login.action";
			}
		}
		
		else
		{
			if (heartButton.hasClass('heart-active'))
			{	
				$.ajax({
					type:"GET",
					url:"likeDown.action?p_code="+"${param.article}"+"&mem_code="+"${member.mem_code}",
					success:function(data){
						$('.text').html("Like " + data);
						$('.heart').removeClass("heart-active");
					}
				})
								
			}
			else
			{					
				$.ajax({
					type:"GET",
					url:"likeUp.action?p_code="+"${param.article}"+"&mem_code="+"${member.mem_code}",
					success:function(data){
						$('.text').html("Like " + data);
						$('.heart').addClass("heart-active");
					}
				})
				
			}
		}
	}
	
	

</script>



</head>
<body onload="test1()">

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
					<div class="heart-btn">
					      <div class="contentA" onclick="test()">
					        <span class="heart"></span>
					        <span class="text">Like ${list.hearts}</span>
					        <span class="numb"></span>
					      </div>
					</div>
					<div class="content">
						<div class="intro">
							<div class="intro_head">
								<h2 class="intro_title"> ${list.prj_name}</h2>
							</div>
							
							<div class="intro_grid">
								<div class="intro_content">
									<span class="intro_point">${list.title}</span>
									
									<p class="intro_desc">
										${list.content}<br>
									</p>
									
									<div class="store-link">
										<a href="" class="store-link_link"><ion-icon name="globe-outline" class="icon icon--web"></ion-icon>Web </a>
									</div>
								</div>
								
								<div style="position: relative;">
									<div class="swiper">
										<div class="slider">
									        <div class="images">
									            <input type="radio" name="slide" id="img1" checked>
									            <input type="radio" name="slide" id="img2">
									            <input type="radio" name="slide" id="img3">
									            <input type="radio" name="slide" id="img4">
									
									            <img src="img/portfolio01.png" class="m1" alt="img1">
									            <img src="img/portfolio02.png" class="m2" alt="img2">
									            <img src="img/portfolio03.png" class="m3" alt="img3">
									            <img src="img/portfolio04.png" class="m4" alt="img4">
									        </div>
									        <div class="dots">
									            <label for="img1"></label>
									            <label for="img2"></label>
									            <label for="img3"></label>
									            <label for="img4"></label>
									        </div>
									    </div>
									</div>
								</div>
								
							</div>	
							
							
						</div>
						
						<div class="detail">
							<h3 class="detail_title">이런 스킬을 사용했어요.</h3>
							
							<ul class="detail_skills">
								<li class="list_item">
									<strong class="skill-name">개발</strong>
														
									<c:forEach var="i" begin = "0" end = "${skillTagList.size()-1}" step="1">
										<span class="skill-badge">${skillTagList.get(i).get("SKILL_TAG")}</span>
									</c:forEach>
									
									<%-- 
									<c:forEach var="i" begin = "0" end = "${skillTagList.size()-1 }" step="1">
										<span class="skill-badge">${skillTagList.get[i].get(skill_tag)}</span>
									</c:forEach>
									 --%>
									<!-- 
									<span class="skill-badge">Java</span>
									<span class="skill-badge">Oracle</span>
									<span class="skill-badge">Spring</span>
									<span class="skill-badge">MyBatis</span>
									 -->
								</li>
							</ul>
							
							<h3 class="detail_title">우리 팀원을 소개할게요.<span style="opacity: 0.3;"> · </span><span style="opacity: 0.4;">그루어리</span></h3>
							
							<ul class="detail_member">
								<li class="list_member">
									<strong class="member-title member-title--type1">팀장</strong>
									<div class="member-item">
										<img src="img/profile.png" alt=""  class="member-item__image" style="width: 70px;"/>
										<span class="member-item__name">${leader}</span>
									</div>
								</li>
								<li class="list_member">
									<strong class="member-title member-title--type2">프론트엔드</strong>
									 <c:forEach var="i" begin = "0" end = "${frontList.size()-1}" step="1">
								 		<div class="member-item" style="margin-left: 5px;">
										 	<img src="img/profile.png" alt=""  class="member-item__image" style="width: 70px;"/>
											<span class="member-item__name">${frontList.get(i).get("NICKNAME")}</span>
										</div>
									 </c:forEach>
								</li>
								<li class="list_member">
									<strong class="member-title member-title--type3">백엔드</strong>
									<c:forEach var="i" begin = "0" end = "${backList.size()-1}" step="1">
								 		<div class="member-item" style="margin-left: 5px;">
										 	<img src="img/profile.png" alt=""  class="member-item__image" style="width: 70px;"/>
											<span class="member-item__name">${backList.get(i).get("NICKNAME")}</span>
										</div>
									 </c:forEach>
								</li>
							</ul>
							
							<h3 class="detail_title">태그</h3>
							<div class="detail_tag">
								<div class="project-tag__wrapper">
									<button type="button" class="badge-tag" style="cursor: auto;"> #습관형성 </button>
									<button type="button" class="badge-tag" style="cursor: auto;"> #습관형성 </button>
									<button type="button" class="badge-tag" style="cursor: auto;"> #습관형성 </button>
								</div>
							</div>
						</div>
						
						<div class="more">
							<h3 class="more_title">어떤 프로젝트가 궁금하세요?</h3>
							
							<div class="more__wrapper">
								<ul class="more__list" style="display: flex;">
									<li class="list__item"><div class="project-card"><img width="180" src="img/portfolio02.png" alt="" class="project-card__image"><strong class="project-card__name">이냥저냥</strong><p class="project-card__desc">내용내용내용내용내용내용내용내용내용내용내용내용내용내용</p></div></li>
									<li class="list__item"><div class="project-card"><img width="180" src="img/portfolio02.png" alt="" class="project-card__image"><strong class="project-card__name">이냥저냥</strong><p class="project-card__desc">내용내용내용내용내용내용내용내용내용내용내용내용내용내용</p></div></li>
									<li class="list__item"><div class="project-card"><img width="180" src="img/portfolio02.png" alt="" class="project-card__image"><strong class="project-card__name">이냥저냥</strong><p class="project-card__desc">내용내용내용내용내용내용내용내용내용내용내용내용내용내용</p></div></li>
									<li class="list__item"><div class="project-card"><img width="180" src="img/portfolio02.png" alt="" class="project-card__image"><strong class="project-card__name">이냥저냥</strong><p class="project-card__desc">내용내용내용내용내용내용내용내용내용내용내용내용내용내용</p></div></li>
									<li class="list__item"><div class="project-card"><img width="180" src="img/portfolio02.png" alt="" class="project-card__image"><strong class="project-card__name">이냥저냥</strong><p class="project-card__desc">내용내용내용내용내용내용내용내용내용내용내용내용내용내용</p></div></li>
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


