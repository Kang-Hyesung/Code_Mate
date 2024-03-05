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
	.searchbar
	{
		font-weight: bold;
	}
	.leftmenuBarBox
	{
	   /*  position: relative;
	    bottom: 30px;
	    width: 300px; */
	}
	.sermenu
	{
		padding-left: 300px;
	}
	.ulul
	{
		display: flex;
		margin-block: 0px;
    	margin-inline: 0px;
    	padding-inline-start: 0px;
    	/* -webkit-margin-block-end: 0;
    	-webkit-margin-block-start: 0;
    	-webkit-margin-inline-start: 0;
    	-webkit-margin-inline-end: 0;
    	-webkit-padding-inline-start: 0; */
    	position: relative;
    	box-sizing: border-box;
    	width: auto;
   		max-width: 1320px;
    	height: 50px;
    	padding: 0px 15px;
    	border-bottom: 1px solid rgb(228, 228, 228);
	}
	.lili
	{
		display: flex;
	    /* -webkit-box-pack: center; */
	    justify-content: center;
	    /* -webkit-box-align: center; */
	    align-items: center;
	    background-color: rgb(255, 255, 255);
	    color: rgb(116, 116, 123);
	    font-size: 15px;
	    font-weight: 400;
	    letter-spacing: -0.3px;
	    line-height: 22.2px;
	    box-sizing: border-box;
	    height: 100%;
	    padding-top: 3px;
	    padding-right: 17.5px;
	    padding-left: 17.5px;
	    border-bottom: 2px solid rgba(255, 255, 255, 0);
	    cursor: pointer;
	    user-select: none;
	}
	/* ul 눌렀을때 */
	.liview
	{
		display: flex;
		
	    /* -webkit-box-pack: center; */
	    justify-content: center;
	    /* -webkit-box-align: center; */
	    align-items: center;
	    background-color: rgb(255, 255, 255);
	    color: rgb(41, 42, 50);
	    font-size: 15px;
	    font-weight: 400;
	    letter-spacing: -0.3px;
	    line-height: 22.2px;
	    box-sizing: border-box;
	    height: 100%;
	    padding-top: 3px;
	    padding-right: 17.5px;
	    padding-left: 17.5px;
	    border-bottom: 2px solid rgb(41, 42, 50);
	    cursor: pointer;
	    user-select: none;
		list-style-type:none;
	    
	}
	.sotitle
	{
		font-size: 25px;
		font-weight: bold;
		display: flex;
		justify-content: space-between;
	}
	.aa
	{
		text-decoration-line: none;
		color: gray;
		font-size: 20px;
		padding-right: 30px;
	}
	div
	{
		/* border: 1px solid gray; */
	}
	.san
	{
		/* color: #3e86f5; */
		border-radius: 10px;
		margin: 0px;
		padding: 3px;
		list-style-type:none;
		padding: 3px 10px;
	    grid-gap: 5px;
	    gap: 5px;
	    height: 22px;
	    background: #f2f4f8;
	    border-radius: 15px;
	    font-weight: 700;
	    font-size: 13px;
	    line-height: 16px;
	    border: 1px solid #3e86f5;
	    
	}
	.box
	{
	    width: 100px;
	    height: 100px; 
	    border-radius: 70%;
	    overflow: hidden;
	    margin: 5px;
	    
	}
	.searchImg
	{
		width: 105%;
    	height: 105%;
    	object-fit: cover;
    	margin-bottom: 10px;
	}
	.spans
	{
		padding-left: 15px;
	}
	.btnbox
	{
		
		width: 100%;
		height: 100%;
		margin: auto;
	}
	.btn1
	{
		color:white;
		background-color: #0e0f37;
		width: 80px;
		height: 30px;
		font-size: 15px;
		font-weight: bold;
		margin-inline: auto;
		margin-top: 30px;
		padding: 5px;
		display: table;
	}
	.btnspan
	{
		margin-inline: auto;
	}
	.topspan
	{
		font-size: 20px;
		white-space : nowrap;
		overflow: hidden;
  		text-overflow: ellipsis;
  		font-weight: bold;
  		margin-bottom: 10px;
	}
	.middlespan
	{
		font-size: 15px;
		overflow: hidden;
  		text-overflow: ellipsis;
  		display: -webkit-box;
  		-webkit-line-clamp: 3;
  		-webkit-box-orient: vertical;
  		margin-bottom: 10px;
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
	.mojip
	{
		color: green;
		font-weight: bold; 
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
	}
	.new
	{
		color: #4D4DFF;
		font-weight: bold;
		font-size: 20px;
		padding-left: 5px;
	}
	.mojipContent
	{
		font-size: 15px;
		color: black;
		font-weight: bold;
		overflow: hidden;
  		text-overflow: ellipsis;
  		display: -webkit-box;
  		-webkit-line-clamp: 3;
  		-webkit-box-orient: vertical;
	}
	.good
	{
		
		font-size: 12px;
		margin: 0;
	}
	.comment
	{
		font-size: 12px;
		margin-left: 20px;
		overflow: hidden;
  		text-overflow: ellipsis;
  		display: -webkit-box;
  		-webkit-line-clamp: 3;
  		-webkit-box-orient: vertical;
  		margin-bottom: 10px;
	}
	.rank
	{
		margin-left: 30px;
		margin-bottom: 30px;
	}
	h3
	{
		font-size: 20px;
		font-weight: bold;
	}
	.ranktop
	{
		font-size: 15px;
		font-weight: bold;
		margin: 5px;
	}
	.imgbox
	{
		width: 20px;
	    height: 20px; 
	    border-radius: 70%;
	    overflow: hidden;
	}
	.rankimg
	{
		width: 110%;
    	height: 110%;
    	object-fit: cover;
	}
	.rankcontent
	{
		font-size: 15px;
		font-weight: bold;
		margin: 5px;
		margin-left: 20px;
	}
	.a1
	{
		width: 100%;
		height: 100%;
		text-decoration-line: none;
		color: black;
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
	<div class="col-12" style="background-color: #f1f3f5; height: 30px; display: flex;">
		<div class="" style="width: 300px;"></div>
		<div class="searchbar">"가물치 검색 결과"</div>
	</div>
	
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
	<!-- 
		<div class="col-6" style="height: 1000px;">
			<div class="">
				<div class="">
				
					===========[Logo]===========
					<a class="navbar-brand mainLogo link" href="#">
						<img alt="Logo" class="LogoImageBanner d-inline-block align-text-top lastchange" src="img/TestLogo.png" >
					</a>
					===========[Logo]===========
					
					
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
						
					</div>end .menuOptions
				</div>end .leftmenuBar
			</div>end .leftmenuBarBox
		</div>end .col-6 .menuArea
		 -->
		
		<!-- 본문 영역 -->
		<div class="row main-text">
			<div class="col-9 sermenu">
				<ul class="col-12 ulul" style="">
					<li class="liview">전체(3)</li>
					<li class="lili">프로젝트(1)</li>
					<li class="lili">Q&A(1)</li>
					<li class="lili">이력서(1)</li>
				</ul>
				<div style="display: flex; padding:15px;">
					<div class="col-9">
						<!-- 
						<span class="sotitle">프로젝트<a href="" class="aa">모두 보기></a></span><br>
						<a href="" class="aa">
							<div style="display: flex;">
								<div class="col-10" style="border-bottom: 1px solid #f1f3f5;">
									<div>
										<div class="topspan">
											가물치시장
										</div>
										<div class="middlespan">
											가물치 시장에 가보자!
										</div>
										<div style="font-size: 15px;">쫀도기</div>
									</div>
								</div>
								<div class="col-2"  style="border-bottom: 1px solid #f1f3f5; height: 100px;">
									<div class="btnbox">
										<button type="button" class="btn btn1"><span class="btnspan">참여하기</span></button>
									</div>
								</div>
							</div>
						</a>
						 -->
						<span class="sotitle">프로젝트<a href="" class="aa">모두 보기></a></span><br>
						<a href="" class="aa">
							<div class="col-11" style="border-bottom: 1px solid #f1f3f5;">
								<div>
									<p class="ptag">📁프로젝트</p>
								</div>
								<div class="col-10" style="display: flex; flex-wrap: wrap;">
									<span class="mojip">모집중</span><span>｜</span>
									<p class="mojipTitle">프로젝트 모집중~!!프로젝트 모집중~!!프로젝트 모집중~!!</p>
									<span class="new">new</span>
								</div>
								<div>
									<p class="mojipContent">프로젝트 내용내용프로젝트 내용내용프로젝트내용내용프로젝트내용내용프로젝트내용내용프로젝트내용내용프로젝트내용내용프로젝트내용내용프로젝트내용내용프로젝트내용내용프로젝트내용내용프로젝트내용내용프로젝트내용내용프로젝트내용내용프로젝트내용내용프로젝트내용내용프로젝트내용내용프로젝트내용내용프로젝트내용내용프로젝트내용내용프로젝트내용내용프로젝트내용내용프로젝트내용내용프로젝트내용내용프로젝트내용내용프로젝트내용내용프로젝트내용내용프로젝트내용내용프로젝트내용내용프로젝트내용내용프로젝트내용내용프로젝트 내용내용프로젝트 내용내용프로젝트 내용내용프로젝트 내용내용프로젝트 내용내용프로젝트 내용내용프로젝트 내용내용프로젝트 내용내용프로젝트 내용내용</p>
								</div>
								<div style="margin-top: 30px;">
									<ul style="display: flex;">
										<li class="litag">java</li>
										<li class="litag">java</li>
										<li class="litag">java</li>
										<li class="litag">java</li>
									</ul>
								</div>
								<div>
								<p class="good" style="margin-top: 30px;">마감일 : 2024.02.29</p>
								<p class="good">작성자😊 : 치약</p>
								</div>
								<div style="display: flex; justify-content: space-between;">
									<div style="display: flex;">
									<p class="good">댓글💬 : 5</p>
									<p class="comment">조회수👁️ : 1000</p>
									</div>
									<p class="comment">작성일 : 2024.02.28</p>
								</div>
							</div>
						</a>
						<span class="sotitle">Q&A<a href="" class="aa">모두 보기></a></span><br>
						<a href="" class="aa">
							<div style="display: flex;">
								<div class="col-12" style="border-bottom: 1px solid #f1f3f5; display: flex; height: 100%;">
									<div class="col-3 box">
										<img alt="html" src="img/poby.png" class="searchImg">
									</div>
									<div class="col-9 spans">
										<div class="topspan">
											가물치
										</div>
										<div class="middlespan">
											가물가물가물치~
										</div>
										<div class="good">작성자😊 : 마이쮸</div>
										<div style="display: flex; justify-content: space-between;">
											<div style="display: flex;">
											<p class="good">댓글💬 : 5</p>
											<p class="comment">조회수👁️ : 1000</p>
											</div>
											<p class="comment">작성일 : 2024.02.28</p>
										</div>
									</div>
								</div>
							</div>
						</a>
						<span class="sotitle">이력서<a href="" class="aa">모두 보기></a></span><br>
						<a href="" class="aa">
							<div style="display: flex;">
								<div class="col-12" style="border-bottom: 1px solid #f1f3f5; display: flex; height: 100%;">
									<div class="col-3 box">
										<img alt="html" src="img/poby.png" class="searchImg">
									</div>
									<div class="col-9 spans">
										<div class="topspan">
											과거로 돌아가는 꿈과거로 돌아가는 꿈과거로 돌아가는 꿈과거로 돌아가는 꿈과거로 돌아가는 꿈과거로 돌아가는 꿈과거로 돌아가는 꿈과거로 돌아가는 꿈과거로 돌아가는 꿈
										</div>
										<div class="middlespan">
											꿈에서는 평범하게 일상생활 하다가 갑자기 2년전쯤 과거로 돌아가졌어요
그 꿈에서 저랑 같이 과거로 돌아가진 친구가 저포함 3명 있었고 그 상황은 학교의 모든사람들이 강당 체육관에 모여서 축제같은걸 하는상황이였어요. 원하는사람들끼리 그룹을만들어 수다를 떨고있었고, 과거로 돌아온 3명끼리 모여서 우리는 어떻게해야 미래로 돌아갈수있을까에 대한걸 막 얘기하다가 엄마한테 카톡이 왔는데, 엄마가 너 갑자기 어디로 사라진거냐고 문자를 보냈길래 저는 과거로 돌아온거같다며 카톡을 보내고, 뜬금없지만 제 옆에 학교 체육관 구석에서 인형뽑기를 하던 어떤친구에게 너 인형 이거 뽑은거야? 라고 물어봤고 그 친구는 어 나 이거 뽑았는데? 하며 인형뽑기 기계를 마구 흔들며 인형을 뽑아댔어요..그 이후에 다시 과거로 돌아온 3명의 친구와 이야기를 나누고있었는데 어떤 여자애가 다가오더니 너 잠깐 이리와보라고하며 저를 어떤 구멍쪽으로 데리고가더니 그 구멍으로 들어갔고, 저도 따라서 들어갔어요. 그 구멍으로 들어가니 동굴같은곳으로 이동해져있었고 그 안에 3마리의 머리만 있는 뱀이 있었어요. 그 여자애는 이 뱀에게 팔을 물리고 버텨보라고 했고 저는 팔을 내주고 물렸고, 그 물린 팔을 여자애 에게 보여주자 그 여자애가 갑자기 독사다! 라고 소리치며 동굴 안쪽으로 들어갔어요..저는 무슨상황인지 몰라서 다시 구멍이 있던쪽으로 갔는데 체육관으로 장소가 이동되어있었고 과거로 같이 돌아온 나머지 2명의 친구들은 없어져있었고, 주위를 한번더 둘러보자 장소가 불이 다 꺼진 밤의 어두운 저희집 거실로 바뀌어있었어요. 제 팔에 뱀에 물린 자국과 초록색의 독이 번진것 처럼보이는 상처가나있었고,집 거실에서 이상한 소리가 들리더니 집 문을 여는 도어락소리가 천천히 들렸고, 왠지 느낌이 이상했던 저는 이거 친구들이 아니겠구나 라고생각하며 긴장하고있었는데 눈을 한번 감았다 뜨는순간 꿈에서 깨버렸습니다...


글이 너무 길어져버리긴 했는데 꿈해몽 부탁드립니다
그리고 마지막 부분의 도어락소리가 들릴때 제가 꿈속에서 자의로 생각을 해서(자각몽) 꿈이 깨어난거인가요? 그거에 대한것도 답변 남겨주시면 감사하겠습니다
										</div>
										<div class="good">작성자😊 : 멘토스</div>
										<div style="display: flex; justify-content: space-between;">
											<div style="display: flex;">
												<p class="good">댓글💬 : 5</p>
												<p class="comment">조회수👁️ : 1000</p>
											</div>
											<p class="comment">작성일 : 2024.02.28</p>
										</div>
									</div>
								</div>
							</div>
						</a>
					</div>
					<div class="col-3" style="border-left: 2px solid #f1f3f5;">
						<div class="rank">
						<a href="" class="a1">
							<h3>주간 인기 TOP 10</h3><br>
							<div style="display: flex;">
								<div><span class="ranktop">1</span></div>
								<div class="imgbox">
									<img class="rankimg" src="img/poby.png" alt="html" />
								</div>
								<div>
									<span class="ranktop">이윤수</span>
								</div>
							</div>					
							<div class="rankcontent">
								어라랍스타!?어라랍스타!?어라랍스타!?어라랍스타!?어라랍스타!?어라랍스타!?
							</div>
						</a>
						</div>
						<div class="rank">
						<a href="" class="a1">
							<div style="display: flex;">
								<div><span class="ranktop">2</span></div>
								<div class="imgbox">
									<img class="rankimg" src="img/poby.png" alt="html" />
								</div>
								<div>
									<span class="ranktop">이윤수</span>
								</div>
							</div>					
							<div class="rankcontent">
								어라랍스타!?어라랍스타!?어라랍스타!?어라랍스타!?어라랍스타!?어라랍스타!?
							</div>
						</a>
						</div>
						<div class="rank">
						<a href="" class="a1">
							<div style="display: flex;">
								<div><span class="ranktop">3</span></div>
								<div class="imgbox">
									<img class="rankimg" src="img/poby.png" alt="html" />
								</div>
								<div>
									<span class="ranktop">이윤수</span>
								</div>
							</div>					
							<div class="rankcontent">
								어라랍스타!?어라랍스타!?어라랍스타!?어라랍스타!?어라랍스타!?어라랍스타!?
							</div>
						</a>
						</div>
						<div class="rank">
						<a href="" class="a1">
							<div style="display: flex;">
								<div><span class="ranktop">4</span></div>
								<div class="imgbox">
									<img class="rankimg" src="img/poby.png" alt="html" />
								</div>
								<div>
									<span class="ranktop">이윤수</span>
								</div>
							</div>					
							<div class="rankcontent">
								어라랍스타!?어라랍스타!?어라랍스타!?어라랍스타!?어라랍스타!?어라랍스타!?
							</div>
						</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-3">
				
			</div>
		</div>
	</div>
</div><!-- end .row -->


</body>
</html>