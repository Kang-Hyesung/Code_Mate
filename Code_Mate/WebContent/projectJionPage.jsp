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
<title>게시판</title>
<!-- BootStrap -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/Code_Mate/css/banner_side.css" />

<!-- JQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- ionicons -->
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

<style type="text/css">

.w_tag_list {
    display: flex;
    flex-wrap: wrap;
    margin: -5px;
}

.l_widget {
    margin-bottom: 45px;
}

.tag{
	color : #425466;
    padding: 2px 18px;
    display: inline-block;
    background: #F0F2F5;
    font-size: 14px;
    border-radius: 4px;
    transition: all 0.2s linear;
    margin: 1px; 
}

.qustion_wd button {
    background: #4C4CF1;
    border: none;
    border-radius: 40px !important;
    height: 80px;
    line-height: 80px;
    outline: none !important;
    box-shadow: none !important;
    font-size: 20px;
    font-weight: 500;
    color: #fff;
    padding: 0;
    width: 100%;
    text-align: left;
    padding-left: 30px;
    padding-right: 30px;
    transition: all 300ms linear 0s;
}

.r_widget {
    margin-bottom: 50px;
}

.media {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: start;
    align-items: flex-start;
}

.media-body {
    -ms-flex: 1;
    flex: 1;
}

a{
	text-decoration:none;
	color: cornflowerblue;
}

.heart {
	color: red;
}

.r_heading {
    background: rgba(76, 76, 241, 0.05);
    border-bottom: 1px solid rgba(76, 76, 241, 0.05);
    padding-left: 20px;
    padding-right: 20px;
}

.comment_list .navbar-nav li:first-child {
    padding-top: 0;
}
.comment_list .navbar-nav li {
    border-bottom: 1px solid #e6edf0;
    padding: 10px 0;
}

.user_list_wd {
    border: 1px solid #eaeeef;
    border-radius: 6px;
    margin-top: 30px;
}

.nav-bar:last-child
{
	background-color: green;
}

.user_list_wd .navbar-nav li:not(:last-child) {
    border-bottom: 1px solid #425466;
}

.user_list_wd .navbar-nav li {
    padding: 11px 0 8px;
}

.question_list_wd .navbar-nav {
    padding: 7px 20px 18px;
}

.question_list_wd .navbar-nav li a {
    font-size: 14px;
    font-weight: 400;
    color: #54595d;
    position: relative;
    padding-left: 45px;
    display: inline-block;
    line-height: 1.5;
}

.question_list_wd .navbar-nav li a span {
    top: 2px;
}
.question_list_wd .navbar-nav li a span {
    height: 30px;
    width: 30px;
    border: 1px solid #e6edf0;
    text-align: center;
    line-height: 28px;
    color: var(--p_color);
    font-size: 14px;
    font-weight: 500;
    display: inline-block;
    border-radius: 50%;
    margin-right: 9px;
    position: absolute;
    left: 0;
    top: 0;
}

.question_list_wd .navbar-nav li {
    padding: 15px 0 15px;
}

.arrow {
    float: right;
    margin-top: 32px;
}

.forum_l_inner .forum_head {
    background: rgba(76, 76, 241, 0.05);
    padding-left: 20px;
    padding-right: 20px;
    border-bottom: 1px solid rgba(76, 76, 241, 0.05);
}

.forum_body
{
    /* padding-right: 50px; */
    transition: all 300ms linear 0s;
}

.postLi:not(:last-child){
	border-bottom: 1px solid gray;
}

.tagList{
list-style-type: none;
}


/* 여기부터 내꺼 */

	.mojip
	{
		color: #1fc1c0;
		font-weight: bold;
		font-size: 30px;
		/* overflow: wrap; */
		/* white-space:nowrap; */
		flex-wrap: nowrap;
	}
	.mojipTitle
	{
		font-weight: bold;
		overflow: hidden;
  		text-overflow: ellipsis;
  		display: -webkit-box;
  		-webkit-line-clamp: 2;
  		-webkit-box-orient: vertical;
  		margin-bottom: 10px;
  		color: black;
  		font-size: 30px;
  		word-wrap:break-word;
  		overflow: wrap;
	}
	.new
	{
		color: #4f59ca;
		font-weight: bold;
		font-size: 20px;
		padding-left: 5px;
		padding-top: 5px;
		/* overflow: wrap; */
		flex-wrap: nowrap;
	}
	ul
	{
		list-style: none;
    	margin: 0;
    	padding: 0;
	}
	.ptag
	{
		background-color: #dee2e6;
		color: #495057;
		font-size: 11px;
		font-weight: bold;
		width: 60px;
		border-radius: 10px;
	}
	.input-group>.form-control
	{
		border: 1px solid black;
		border-radius: 5px;
	}
	.input-group:not(.has-validation)>:not(:last-child):not(.dropdown-toggle):not(.dropdown-menu):not(.form-floating) {
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
	}
	a
	{
		color: black;
	}
	.activenav-item > .anav-item
	{
		font-weight: bold;
		border-bottom: 1px solid #e9ecef;
		font-size: 20px;
	}
	.anav-item
	{
		font-size: 20px;
	}
	.wd_title
	{
		font-weight: bold;
		padding-bottom: 10px;
	}
	.forum_l_inner
	{
		padding-top: 30px;
		display: flex;
	}
	.viewnum
	{
		font-size: 13px;
		overflow: hidden;
  		text-overflow: ellipsis;
  		display: -webkit-box;
  		-webkit-line-clamp: 3;
  		-webkit-box-orient: vertical;
  		margin: 10px;
  		color: black;
	}
	.detail
	{
		font-weight: bold;
		font-size: 20px;
		margin: 30px 0 30px;
	}
	.d_content
	{
		font-weight: bold;
		font-size: 15px;
		
	}
	.imgbox
	{
		width: 20px;
	    height: 20px; 
	    border-radius: 70%;
	    overflow: hidden;
	    
	}
	.mojipimg
	{
		width: 100%;
    	height: 100%;
    	object-fit: cover;
	}
	ul
	{
		list-style: none;
    	margin: 0;
    	padding: 0;
	}
	.litag
	{
		padding: 3px 10px;
		width: fit-content;
	    grid-gap: 5px;
	    gap: 5px;
	    height: 22px;
	    background: #f2f4f8;
	    border-radius: 15px;
	    font-weight: 700;
	    font-size: 13px;
	    line-height: 16px;
	    color: #3e86f5;
	}
	.imgboxx
	{
		width: 100px;
	    height: 100px; 
	    border-radius: 70%;
	    overflow: hidden;
	    margin: auto;
	    
	   
	}
	.contentimg
	{
		width: 100%;
    	height: 100%;
    	object-fit: cover;
    	
	}
	.pic
	{
		width: 250px;
		height: 250px;
		background-color: #f1f3f5;
		margin: auto;
		padding-top: 40px;
	}
	.ppp
	{
		margin: 10px;
		text-align: center;
		font-size: 15px;
		font-weight: bold;
	}
	.btn-group-lg>.btn, .btn-lg
	{
	    padding: 0.6875rem 1.4375rem;
	    font-size: 1rem;
	    line-height: 1.5;
	    border-radius: 0.3rem;
    }
    .btn-coral-600, .btn-coral-600:hover
    {
	    color: #fff;
	    background-color: #1fc1c0;
	    border-color: #1fc1c0;
    }
    .tw-w-full
    {
    	margin-top:10px;
    	width: 250px;
    }
    .adiv
    {
    	margin: auto;
    }
    .memberdiv
    {
    	text-align: center;
    }
    .momcom
    {
    	padding-bottom: 20px;
    	border-bottom: 1px solid #f1f3f5;
    	margin-bottom: 20px;
    	padding-top: 30px;
    	border-top: 1px solid #f1f3f5;
    }
    .comment
    {
    	height: auto;
    	background-color: #f1f3f5;
    	border-radius: 15px;
    	
    }
    .topcomment
    {
    	/* display: flex; */
    	height: 200px;
    }
    .comimgbox
    {
    	width: 30px;
	    height: 30px; 
	    border-radius: 70%;
	    overflow: hidden;
    }
    .comimg
    {
    	width: 100%;
    	height: 100%;
    	object-fit: cover;
    }
    textarea
    {
    width: 95%;
    height: 60%;
    border: none;
    resize: none;
    background-color:transparent;
    margin: 20px 20px 0 20px;
    }
    textarea:focus
    {
    	outline: none;
    }
    .ion-icon1
    {
    	width: 50px;
    	height: 50px;
    }
    .comcom
    {
    	display: flex;
    	justify-content: flex-start;
    	margin-top: 15px;
    	
    }
    .coma
    {
    	font-size: 15px;
    	font-weight: bold;
    }
    .comday
    {
    	font-size: 10px;
    	color: gray;
    }
    .comcontent
    {
    	font-size: 15px;
    	font-weight: bold;
    	padding-top: 20px;
    	padding-left: 40px;
    	border-left: 1px solid #f1f3f5;
    	
    }
	div
	{
		/* border: 1px solid gray; */
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
						<button id="alarmButton" class="btn banner-btn alarm-btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop" aria-controls="offcanvasTop">
							<ion-icon name="notifications" class="banner-btn-icon"></ion-icon>
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
	
	<div class="main">
		
		<div class="row">
			<div class="col-md-2" style="padding-left: 50px;">
				<aside class="l_widget forum_list">
                               <h3 class="wd_title">프로젝트 게시판</h3>
                               <ul class="navbar-nav ">
                                   <li class="nav-item">
                                       <a class="anav-item" href="#"><i class="social_tumbleupon"></i>전체 보기</a>
                                   </li>
                                   <li class="activenav-item">
                                       <a class="anav-item" href="#"><i class="icon_lightbulb_alt"></i>모집 중</a>
                                   </li>
                                   <li class="nav-item">
                                       <a class="anav-item" href="#"><i class="icon_lightbulb_alt"></i>모집 완료</a>
                                   </li>
                                   <li class="nav-item">
                                       <a class="anav-item" href="#"><i class="icon_lightbulb_alt"></i>추가 모집</a>
                                   </li>
                               </ul>
                </aside>
                
                <aside class="l_widget l_tags_wd">
                                <h3 class="wd_title">태그</h3>
                                <ul class="list-unstyled w_tag_list style-light">
                                    <li><a href="#" class="tag">자바</a></li>
                                    <li><a href="#" class="tag">오라클</a></li>
                                    <li><a href="#" class="tag">금융</a></li>
                                    <li><a href="#" class="tag">중고거래</a></li>
                                    <li><a href="#" class="tag">쇼핑몰</a></li>
                                    <li><a href="#" class="tag">리액트</a></li>
                                </ul>
               </aside>
               <aside class="l_widget comment_list">
                                <h3 class="wd_title">최근 올라온 글</h3>
                                <ul class="navbar-nav">
                                    <li>
                                        <div class="media">
                                            <div class="d-flex">
                                                <ion-icon name="chatbubbles-outline"></ion-icon>
                                            </div>
                                            <div class="media-body">
                                                <a href="#">
                                                    A프로젝트모집 by
                                                </a>
                                                <a href="#">
                                                    <img class="rounded-circle" src="img/poby.png" alt="" style="width: 21px; height: 20px;"> 정한울
                                                </a>
                                                <p>4일전</p>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="media">
                                            <div class="d-flex">
                                                <ion-icon name="chatbubbles-outline"></ion-icon>
                                            </div>
                                            <div class="media-body">
                                                <a href="#">
                                                    B프로젝트 모집 by
                                                </a>
                                                <a href="#">
                                                    <img class="rounded-circle" src="img/poby.png" alt="" style="width: 21px; height: 20px;"> 이윤수
                                                </a>
                                                <p>1주일 전</p>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </aside>
			</div>
			<div class="col-md-7" style="padding-left: 50px;">
				<div class="forum_topic_list_inner">
	                <div class="forum_l_inner">
	                	<div class="col-8">
	                		<div>
								<p class="ptag">📁프로젝트</p>
							</div>
	                		<div class="one-mojip-box" style="display: flex; flex-wrap: wrap;">
	                		
								<span class="mojip">모집중</span>
								<span style="color: black; font-size: 30px;">｜</span>
								<span class="mojipTitle">프로젝트 모집중~!!프로젝트 모집중~!!프로젝트 모집중~!!</span>
								<span class="new">new</span>
							</div>
							<div>
								<p class="viewnum">
								5시간전
								·조회수 : <span>1000</span>
								·댓글 : <span>50</span>
								</p>
							</div>
							<div>
								<h2 class="detail">요 약</h2>
								<p class="d_content">요약이다~요약이다~요약이다~요약이다~요약이다~요약이다~요약이다~요약이다~요약이다~요약이다~요약이다~요약이다~요약이다~요약이다~요약이다~</p>
							</div>
							<div>
								<h2 class="detail">모집 역할</h2>
								<div style="display: flex; gap: 5px;">
									<div style="display: flex; gap: 5px;">
										<div class="imgbox">
											<img class="mojipimg" src="img/poby.png" alt="html" />
										</div>
										<p class="d_content">백엔드</p>
									</div>
									<div style="display: flex; gap: 5px;">
										<div class="imgbox">
											<img class="mojipimg" src="img/poby.png" alt="html" />
										</div>
										<p class="d_content">프론트</p>
									</div>
								</div>
							</div>
							<div>
								<h2 class="detail">태 그</h2>
								<div style="margin-top: 30px;">
									<ul style="display: flex;">
										<li class="litag">java</li>
										<li class="litag">java</li>
										<li class="litag">java</li>
										<li class="litag">java</li>
									</ul>
								</div>
							</div>
							<div style="padding-bottom: 30px;">
								<h2 class="detail">상세 내용</h2>
								<span class="d_content">
									실제 근무 환경입니다! (첫번째 사진은 2023.12.29) 촬영했습니다!!

홈페이지
★우리는 현재 모든 사항을 공유 드립니다.★

사무실은 조금 무리해서 창가뷰이며, 최고의 시설이 다 갖춰져 있습니다.

본사 : 서울 강남구 테헤란로2길 27 패스트파이브 빌딩 13층 (역삼동, 비전타워)

지사 : 서울특별시 성북구 삼선교로 18나길 5 (상상밸리 II) B101호

연봉은 현재 최저 수준입니다. 하지만 성장에는 직급과 급여는 확실히 보장드립니다.

 (현재 정규 팀원 6명 - 모두 남성)

수상 : 2023 벤처기업협회 예창패 선정, 사회적기업진흥원 선정, 한성대학교 창업대회 선정, TMC 기술 창업 경진대회 선정, 경기대학교 SW중심대학 선정, 올해의 2023올해의 벤처상 수상 (주)에잇블룸, SW페스타 1위 최우수상 수상 (주관 : 과학기술정보통신부, 경기대학교 소프트웨어사업단, 정보통신기획평가원) 

인증 : ISO9001 국제기구 품질경영인증 평가 인증완료, 벤처기업인증 진행 중

분위기 : 모두가 직무와 관계없이 자유롭게 의사를 제시하고 수용하는 스타트업입니다. 새롭고 창의적인 시도가 늘 존재합니다. 함께 만들어 나가는 회사를 그립니다.

 

"도전과 실패로 최고의 화훼산업의 성장을 이룰 주식회사 에잇블룸입니다."

서비스 1차 업데이트를 시작으로 정식 출시 후 투자 유치와 함께 성장해 나갈 팀원은 언제든지 환영 입니다.

[우리는 대한민국 찍고 글로벌로!]

데이터로 바꾸는 국내 3조의 화훼산업, 우리는 앞으로 대한민국 최고를 찍고, 글로벌 시장을 목표하고 있습니다.

모든 서비스들이 디지털전환되는 시점에 ‘꽃'은 아직도 아날로그 방식에 머물러 있습니다.
변화에 시작에는 늘 ‘데이터'가 필요하지만, ‘꽃'은 아직도 마땅한 데이터가 존재하지 않습니다.
‘데이터’는 산업을 바꾸는 핵심 동력입니다. 그 ‘시작'에 (주)에잇블룸은 있을 것입니다.

모두가 함께하는 일상 속 꽃 문화 프로젝트 ‘플룸(Floom)’을 소개드립니다.

								</span>
							</div>
							
							
							<!-- 댓글 -->
							<div class="momcom">
								<div class="comment">
									<div class="col-12 topcomment">
										<textarea rows="10" cols="80"></textarea>
										<div style="display: flex; justify-content: flex-end;">
											<a href="">
											<ion-icon class="ion-icon1" name="arrow-down-circle"></ion-icon>
											</a>
										</div>
									</div>
								</div>
								<div class="col-12 comcom">
									<div class="comimgbox">
										<img src="img/pompomLove.png" alt="html" class="comimg"/>
									</div>
									<div style="margin-left: 10px;">
										<a href="" class="coma">퐁퐁부인</a>
										<div class="comday">
										2024.03.03 12:00
										<a href="" style="color: gray">신고</a>
										</div>
									</div>
								</div>
								<div class="comcontent">
									내용내용아아아아아아앙아아아아ㅏㅇ아아
								</div>
							</div>
							
							
							<!-- 댓글 끝 -->
						</div>
	                	
	                	<div class="col-4">
	                		<div class="memberdiv">
	                			<a href="" style="cursor: pointer;">
	                				<div class="pic">
	                					<div class="imgboxx">
	                						<img class="contentimg" src="img/poby.png" alt="html" />
	                					</div>
	                					<div class="ppp">
		                					<p class="ppp">이윤수</p>
		                					<p class="ppp">🌱새싹</p>
	                					</div>
	                				</div>
	                			</a>
                				<div class="adiv">
	                			<a role="presentation" class=" btn btn-lg btn-coral-600 tw-w-full ">
                					지원하기
               					</a>
                				</div>
	                		</div>
	                	</div>
	                </div>
                </div>                
			</div>
	
		<div class="col-md-3" style="padding-left: 50px; padding-right: 70px;">
               
               <aside class="r_widget user_list_wd">
                     <div class="r_heading d-flex justify-content-between">
                         <h3 style="margin-top: 5px;">뜨거운 프로젝트🔥</h3>
                         <h5 style="font-size: 15px; margin-top: 10px;">지난 30일</h5>
                     </div>
                     <!-- 랭킹 -->
                     <aside class="r_widget question_list_wd">
	                     <div class="tab-content" id="myTabContent">
	                         <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
	                             <ul class="navbar-nav">
	                                 <li><a href="#"><span>01</span>A프로젝트</a></li>
	                                 <li><a href="#"><span>02</span>B프로젝트</a></li>
	                                 <li><a href="#"><span>03</span>C프로젝트</a></li>
	                                 <li><a href="#"><span>04</span>D프로젝트</a></li>
	                                 <li><a href="#"><span>05</span>E프로젝트</a></li>
	                                 <li><a href="#"><span>06</span>F프로젝트</a></li>
	                             </ul>
	                         </div>
	                     </div>
                	 </aside>
                     <!-- 랭킹 끝 -->
               </aside>
			</div>
		</div>
	</div>
	
	

</body>
</html>


