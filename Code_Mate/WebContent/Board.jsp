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
</style>

</head>
<body>

<div class="row mainArea">

	<div class="col-12 bannerMain">
		<div class="row bannerArea">
			<nav class="navbar bg-body-tertiary">
			  <div class="container-fluid nav nav-underline">
			    
			 	<!--===========[Logo]===========-->
				<a class="navbar-brand bannerLogo" href="#">
					<img alt="Logo" class="bannerLogoImage d-inline-block align-text-top" src="img/TestLogo.png" >
				</a>
				<!--===========[Logo]===========-->
				
				<span class="nav-link"><a href="#">프로젝트 게시판</a></span>
				<span class="nav-link"><a href="#">커리어 게시판</a></span>
				<span class="nav-link"><a href="#">포트폴리오 게시판</a></span>
			
			    
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
					<span class="nav-link log" ><a href="Login.action">로그인/회원가입</a></span>
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
                                <h3 class="wd_title">카테고리</h3>
                                <ul class="navbar-nav ">
                                    <li class="active nav-item">
                                        <a href="#"><i class="social_tumbleupon"></i>전체 보기</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#"><i class="icon_lightbulb_alt"></i>기술</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#"><i class="icon_lightbulb_alt"></i>커리어</a>
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
                                                <i class="icon_chat_alt"></i>
                                            </div>
                                            <div class="media-body">
                                                <a href="#">
                                                    <h4>A회사 갈까요? by</h4>
                                                </a>
                                                <a href="#">
                                                    <h5><img src="img/forum/r-topic-user.png" alt=""> 정한울</h5>
                                                </a>
                                                <p>4일전</p>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="media">
                                            <div class="d-flex">
                                                <i class="icon_chat_alt"></i>
                                            </div>
                                            <div class="media-body">
                                                <a href="#">
                                                    <h4>어떻게 해요? by</h4>
                                                </a>
                                                <a href="#">
                                                    <h5><img src="img/forum/r-topic-user.png" alt=""> 이윤수</h5>
                                                </a>
                                                <p>1주일 전</p>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </aside>
			</div>
			<div class="col-md-7" style="padding-left: 50px;">
				
			</div>
			<div class="col-md-3" style="padding-left: 50px; padding-right: 70px;">
				<aside class="r_widget qustion_wd">
                       	<button class="btn" type="button"><img src="img/question-1.png" alt=""> 질문하기<i class="arrow_carrot-right"></i></button>
                </aside>
                
                <aside class="r_widget user_list_wd">
                                <div class="r_heading d-flex justify-content-between">
                                    <h3>Most Helpful</h3>
                                    <h5>Last 30 days</h5>
                                </div>
                                <ul class="navbar-nav">
                                    <li>
                                        <a href="#">
                                            <div class="media">
                                                <div class="d-flex">
                                                    <img class="rounded-circle" src="img/forum/helpful-user/h-user-1.png" alt="">
                                                </div>
                                                <div class="media-body">
                                                    <h4>cleo-parra</h4>
                                                </div>
                                                <div class="media-right">
                                                    <div class="count">
                                                        10
                                                    </div>
                                                    <i class="icon_check_alt"></i>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="media">
                                                <div class="d-flex">
                                                    <img class="rounded-circle" src="img/forum/helpful-user/h-user-2.png" alt="">
                                                </div>
                                                <div class="media-body">
                                                    <h4>roy_marin</h4>
                                                </div>
                                                <div class="media-right">
                                                    <div class="count">
                                                        08
                                                    </div>
                                                    <i class="icon_check_alt"></i>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="media">
                                                <div class="d-flex">
                                                    <img class="rounded-circle" src="img/forum/helpful-user/h-user-3.png" alt="">
                                                </div>
                                                <div class="media-body">
                                                    <h4>hellen.austin</h4>
                                                </div>
                                                <div class="media-right">
                                                    <div class="count">
                                                        05
                                                    </div>
                                                    <i class="icon_check_alt"></i>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="media">
                                                <div class="d-flex">
                                                    <img class="rounded-circle" src="img/forum/helpful-user/h-user-4.png" alt="">
                                                </div>
                                                <div class="media-body">
                                                    <h4>erna.may</h4>
                                                </div>
                                                <div class="media-right">
                                                    <div class="count">
                                                        03
                                                    </div>
                                                    <i class="icon_check_alt"></i>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="media">
                                                <div class="d-flex">
                                                    <img class="rounded-circle" src="img/forum/helpful-user/h-user-5.png" alt="">
                                                </div>
                                                <div class="media-body">
                                                    <h4>jacobson</h4>
                                                </div>
                                                <div class="media-right">
                                                    <div class="count">
                                                        02
                                                    </div>
                                                    <i class="icon_check_alt"></i>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="media">
                                                <div class="d-flex">
                                                    <img class="rounded-circle" src="img/forum/helpful-user/h-user-6.png" alt="">
                                                </div>
                                                <div class="media-body">
                                                    <h4>van.mays</h4>
                                                </div>
                                                <div class="media-right">
                                                    <div class="count">
                                                        01
                                                    </div>
                                                    <i class="icon_check_alt"></i>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="media">
                                                <div class="d-flex">
                                                    <img class="rounded-circle" src="img/forum/helpful-user/h-user-7.png" alt="">
                                                </div>
                                                <div class="media-body">
                                                    <h4>steve_barr</h4>
                                                </div>
                                                <div class="media-right">
                                                    <div class="count">
                                                        01
                                                    </div>
                                                    <i class="icon_check_alt"></i>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </aside>
			</div>
			
		</div>
	</div>
	

</body>
</html>
