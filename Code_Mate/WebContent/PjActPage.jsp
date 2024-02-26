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
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<style type="text/css">
	.prjname{vertical-align: middle;}
	.prjtitle{padding-top: 10px; justify-content: space-between;}
	hr{border: 3px solid gray;}
	
	@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
	}
	
	*
	{
		font-family: 'Pretendard-Regular';
	}
	/* 큰 창 */
	.skill-progress{
    width: 400px;
    height: 250px;
    padding: 20px;
    color: white;
    background-color: #C7C8CC;
    border-radius: 10px;
    color : #fff;
    box-shadow: 0 20px 50px rgba(0, 0, 0, 0.089);

    /* 해당요소를 수직,수평중앙정렬 */
    position: absolute;
    top : 50%;
    left : 50%;
    transform: translate(-50%, -50%);      /*translate(-top위치, -left위치)*/
	}
	
	.skill-progress h1{
	    text-align: center;
	    font-size: 30px;
	}
	.item {
    transition: 0.4s;
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
	    background : linear-gradient(to right, red, black);   /*방향(deg각도도 가능), 시작색상, 종료색상*/
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
	div{border: 1px solid black;}
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
					<a class="navbar-brand mainLogo link" href="#">
						<img alt="Logo" class="LogoImage d-inline-block align-text-top" src="img/TestLogo.png" >
					</a>
					<!--===========[Logo]===========-->
					
					
					<div class="menuOptions nav nav-underline" id="nav">
						<ul class="nav-item">
							<a href="#" class="majorTopic nav-link link">Menu1<ion-icon class="menuIcon" name="terminal-outline"></ion-icon></a>
							<li class="miniMenuOption">
								<ul>
									<li class="miniMenuOption"><a href="#" class="nav-link link">small1</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">small2</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">small3</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">small4</a></li>
								</ul>
							</li>
						</ul>
						<ul class="nav-item ">
							<a href="#" class="majorTopic nav-link link">Menu2<ion-icon class="menuIcon" name="desktop-outline"></ion-icon></a>
							<li  class="miniMenuOption">
								<ul>
									<li class="miniMenuOption"><a href="#" class="nav-link link">small1</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">small2</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">small3</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">small4</a></li>
								</ul>
							</li>
						</ul>
						<ul class="nav-item">
							<a href="#" class="majorTopic nav-link link">Menu3<ion-icon class="menuIcon" name="reader-outline"></ion-icon></a>
							<li class="miniMenuOption">
								<ul>
									<li class="miniMenuOption"><a href="#" class="nav-link link">small1</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">small2</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">small3</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">small4</a></li>
								</ul>
							</li>
						</ul>
						<ul class="nav-item">
							<a href="#" class="majorTopic nav-link link">Menu4<ion-icon class="menuIcon" name="person-outline"></ion-icon></a>
							<li class="miniMenuOption">
								<ul>
									<li class="miniMenuOption"><a href="#" class="nav-link link">small1</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">small2</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">small3</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">small4</a></li>
								</ul>
							</li>
						</ul>
					</div><!-- end .menuOptions -->
				</div><!-- end .leftmenuBar -->
			</div><!-- end .leftmenuBarBox -->
		</div><!-- end .col-6 .menuArea -->
		
		<!-- 본문 영역 -->
		<div class="row main-text">
			<div class="col-10">
				
				
				<div class="row prjtitle">
					<div class="col-4">
						<h2>러블리볶이</h2>
						
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
					                <div class="progress-level" style="width:70%"></div>
					            </div>
					        </div>
					    </div>
					</div>
					<div class="col-4" style="padding-top: 5px;">
						<h3>떡볶이 맛집 추천 프로젝트</h3>
					</div>
					<div class="col-3" style="padding-top: 12px;">
						<h5>2023년 1월 15일 ~ 2027년 4월 12일</h5>
					</div>
					
					
					<hr>
				</div>
				
				<!-- <div class="row">
					<div class="col-6">
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
					                <div class="progress-level" style="width:70%"></div>
					            </div>
					        </div>
					    </div>
				    </div>
				</div> -->
				
			</div>
		</div>
		
	</div>
</div><!-- end .row -->


</body>
</html>