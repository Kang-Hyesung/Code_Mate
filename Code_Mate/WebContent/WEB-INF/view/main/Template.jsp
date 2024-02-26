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
	
	
	
	<div class="flex">
		<div class="col-6 menuArea">
			<div class="leftmenuBarBox">
				<div class="leftmenuBar">
				
					<!--===========[Logo]===========-->
					<a class="navbar-brand mainLogo" href="#">
						<img alt="Logo" class="LogoImage d-inline-block align-text-top" src="img/TestLogo.png" >
					</a>
					<!--===========[Logo]===========-->
					
					
					<div class="menuOptions nav nav-underline" id="nav">
						<ul class="nav-item">
							<a href="#" class="majorTopic nav-link">Menu1<ion-icon class="menuIcon" name="terminal-outline"></ion-icon></a>
							<li>
								<ul>
									<li class="miniMenuOption"><a href="#" class="nav-link">small1</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link">small2</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link">small3</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link">small4</a></li>
								</ul>
							</li>
						</ul>
						<ul class="nav-item">
							<a href="#" class="majorTopic nav-link">Menu2<ion-icon class="menuIcon" name="desktop-outline"></ion-icon></a>
							<li>
								<ul>
									<li class="miniMenuOption"><a href="#" class="nav-link">small1</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link">small2</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link">small3</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link">small4</a></li>
								</ul>
							</li>
						</ul>
						<ul class="nav-item">
							<a href="#" class="majorTopic nav-link">Menu3<ion-icon class="menuIcon" name="reader-outline"></ion-icon></a>
							<li>
								<ul>
									<li class="miniMenuOption"><a href="#" class="nav-link">small1</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link">small2</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link">small3</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link">small4</a></li>
								</ul>
							</li>
						</ul>
						<ul class="nav-item">
							<a href="#" class="majorTopic nav-link">Menu4<ion-icon class="menuIcon" name="person-outline"></ion-icon></a>
							<li>
								<ul>
									<li class="miniMenuOption"><a href="#" class="nav-link">small1</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link">small2</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link">small3</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link">small4</a></li>
								</ul>
							</li>
						</ul>
					</div><!-- end .menuOptions -->
				</div><!-- end .leftmenuBar -->
			</div><!-- end .leftmenuBarBox -->
		</div><!-- end .col-6 .menuArea -->
		
		<!-- 본문 영역 -->
		<div class="row main-text">
			<div class="col-9">본문을 여기에 작성하세요</div>
			<div class="col-3">사이드를 여기에 작성하세요</div>
		</div>
	</div>
</div><!-- end .row -->

</body>
</html>