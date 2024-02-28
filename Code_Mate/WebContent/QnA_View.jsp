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
a{
	text-decoration: none;
}

.forum-post-top {
    display: flex;
}

.forum-post-top .forum-post-author .forum-author-meta {
    display: flex;
}

.forum-post-top .forum-post-author .forum-author-meta .author-badge:first-child {
    margin-right: 20px;
}

.forum-post-top .author-avatar img {
    border-radius: 50%;
    margin-right: 15px;
}

.question-icon {
    font-size: 50px;
    margin-right: 15px;
    font-weight: 600;
}

.q-title {
    display: flex;
    padding: 20px 15px 15px 0;
}

.q-title h1 {
    font-size: 24px;
    margin-top: 30px;
}

.forum-post-content .forum-post-btm {
    display: flex;
    justify-content: space-between;
    border-bottom: 1px solid gray;
    padding-bottom: 20px;
    padding-top: 30px;
}

.tagIcon{
	margin-right: 10px;
}

.logos{
	margin-right: 5px;
}

.qustion_wd{
	position: fixed;
	  top: 0;
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
    width: 200px;
    text-align: left;
    padding-left: 30px;
    padding-right: 30px;
    transition: all 300ms linear 0s;
    margin-left: 130px;
    margin-top: 200px;
}

.best-answer {
    background: #f9f9f9;
    padding: 30px 40px 30px 30px;
    margin-top: 60px;
    border-radius: 6px;
}

.best-answer .accepted-ans-mark {
    color: #0abe76;
    font-size: 14px;
    text-align: right;
}

.best-answer .best-ans-content {
    margin-top: 30px;
}

</style>

<style type="text/css">
@import url("https://fonts.googleapis.com/css?family=Montserrat:600&display=swap");
.contentA {
  padding: 13px 16px;
  display: flex;
  border: 2px solid #eae2e1;
  border-radius: 5px;
  cursor: pointer;
}

.contentA.heart-active {
  border-color: #f9b9c4;
  background: #fbd0d8;
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
  content: "12";
  font-size: 21px;
  margin-left: 7px;
  font-weight: 600;
  color: #9C9496;
  font-family: sans-serif;
}

.numb.heart-active:before {
  content: "13";
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

<script>
      $(document).ready(function(){
        $('.contentA').click(function(){
          $('.contentA').toggleClass("heart-active")
          $('.text').toggleClass("heart-active")
          $('.numb').toggleClass("heart-active")
          $('.heart').toggleClass("heart-active")
        });
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
				<div class="col-lg-9">
                      <div class="forum-post-top">
                          <a class="author-avatar" href="#">
                              <img src="img/profile.png" alt="" style="width: 50px; height: 50px;">
                          </a>
                          <div class="forum-post-author">
                              <a class="author-name" href="#"> 정한울 </a>
                              <div class="forum-author-meta">
                                  <div class="author-badge">
                                      <ion-icon name="briefcase-outline"></ion-icon>
                                      <span>커리어</span>
                                  </div>
                                  <div class="author-badge">
                                      <ion-icon name="calendar-clear-outline"></ion-icon>
                                      2024.01.18
                                  </div>
                              </div>
                          </div>
                      </div>
                      <div class="q-title">
                            <span class="question-icon" title="Question">Q:</span>
                            <h1>구글에 갈까요? 아마존에 갈까요?</h1>
                      </div>
                      
                      <div class="forum-post-content">
                            <div class="content">
                                <p> 가을이 깊어지면 나는 거의 매일 같이 뜰의 낙엽을 긁어모으지 않으면 안 된다. 날마다 하는 일이건만, 낙엽은 어느덧 날고 떨어져서 또 다시 쌓이는 것이다. 낙엽이란 참으로 이 세상 사람의 수효보다도 많은가 보다. 삼십여 평에 차지 못하는 뜰이언만, 날마다 시중이 조련치 않다. 벚나무 능금나무…. 제일 귀찮은 것이 벽의 담쟁이다. 담쟁이란 여름 한철 벽을 온통 둘러싸고 지붕과 연돌(煙突)의 붉은 빛난 남기고 집 안을 통째로 초록의 세상으로 변해 줄 때가 아름다운 것이지, 잎을 다 떨어뜨리고 앙상하게 드러난 벽에 메마른 줄기를 그물같이 둘러칠 때쯤에는 벌써 다시 지릅떠볼 값조차 없는 것이다. 귀찮은 것이 그 낙엽이다. 가령 벚나무 잎같이 신선하게 단풍이 드는 것도 아니요, 처음부터 칙칙한 색으로 물들어 재치 없는 그 넓은 잎이 지름길 위에 떨어져 비라도 맞고 나면 지저분하게 흙 속에 묻히는 까닭에 아무래도 날아 떨어지는 쪽쪽 그 뒷시중을 해야 된다. </p>
                                <p> 벚나무 아래에 긁어모은 낙엽의 산더미를 모으고 불을 붙이면 속의 것부터 푸슥푸슥 타기 시작해서 가는 연기가 피어오르고 바람이나 없는 날이면 그 연기가 낮게 드리워서 어느덧 뜰 안에 가득히 담겨진다. 낙엽 타는 냄새 같이 좋은 것이 있을까. 가제 볶아낸 커피의 냄새가 난다. 잘 익은 개암 냄새가 난다. 갈퀴를 손에 들고는 어느 때까지든지 연기 속에 우뚝 서서 타서 흩어지는 낙엽의 산더미를 바라보며 향기로운 냄새를 맡고 있노라면 별안간 맹렬한 생활의 의욕을 느끼게 된다. 연기는 몸에 배서 어느 결엔지 옷자락과 손등에서도 냄새가 나게 된다.</p>
                            </div>
                            <div class="forum-post-btm">
                                <div class="taxonomy forum-post-tags">
                                    <ion-icon name="pricetag-outline" class="tagIcon"></ion-icon><a href="#">자바</a>, <a href="#">오라클</a>, <a href="#">사이비</a>
                                </div>
                                <div class="taxonomy forum-post-cat">
                                    <img src="img/logs.svg" alt="" style="width: 24px; height: 23px;" class="logos"><a href="#">코드 메이트</a>
                                </div>
                            </div>
                            <div class="action-button-container action-btns">
                            </div>
                      </div>
                      
                      <div class="best-answer">
                            <div class="row">
                                <div class="col-lg-9">
                                    <div class="forum-post-top">
                                        <a class="author-avatar" href="#">
                                            <img src="img/profile2.png" alt="" style="width: 50px; height: 50px;">
                                        </a>
                                        <div class="forum-post-author">
                                            <a class="author-name" href="#"> 김지민 </a>
                                            <div class="forum-author-meta">
                                                <div class="author-badge">
                                                    <ion-icon name="calendar-clear-outline"></ion-icon>
                                                    <a href=""> 2024.01.19</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <p class="accepted-ans-mark">
                                        <ion-icon name="checkmark-circle-outline"></ion-icon> <span>베스트 답변</span>
                                    </p>
                                </div>
                            </div>
                            <div class="best-ans-content d-flex">
                                <span class="question-icon" title="The Best Answer">A:</span>
                                <p>
                                    우선 제일먼저 해야할일은 카레용돼지고기를 후추로 톡톡세번 그리고 자박하게 잠길정도로 우유를 부어줍니다.
우유와 후추가 돼지고기 특유의 잡내를 잡아준답니다.
15분정도 재워둡니다.<br>
                                    양파중간사이즈 2개, 감자큰거 1개,당근1/2개,새송이버섯2개(없으면 패스하셔도무관)
을 먹기 좋은 크기로 잘라서 준비합니다.<br>
                                    카레를 할 냄비를 준비하신후에 버터1스푼과 마늘1스푼을 넣고<br>
                                    양파썰어둔것을 모두 넣어서 볶아줍니다.
버터를 넣으면 고소한맛이 나서 좋더라구요^^<br><br>
                                </p>
                            </div>
                            
                            <div>
                            	<div class="row">
                            		<div class="col-lg-10">
                            			<ion-icon name="chevron-down-outline"></ion-icon>
                            			
                            			<div>
                            				<div class="bg-light p-2" style="margin-left: 70px;">
                    <div class="d-flex flex-row align-items-start"><a class="author-avatar" href="#">
                              						<img src="img/profile.png" alt="" style="width: 50px; height: 50px;">
                          						</a><textarea class="form-control ml-1 shadow-none textarea" style="width: 800px; height: 150px;  margin-left: 20px;"></textarea></div>
                    <div class="mt-2 text-right" style="margin-left: 600px;"><button class="btn btn-primary btn-sm shadow-none" type="button">Post comment</button><button class="btn btn-outline-primary btn-sm ml-1 shadow-none" type="button">Cancel</button></div>
                </div>
                            				<div style="margin-left: 70px;">
                            					<a class="author-avatar" href="#">
                              						<img src="img/profile.png" alt="" style="width: 50px; height: 50px;">
                          						</a>
                          						
                          						<a href="">정한울</a>
                          						<div>
                          							<span>정말 좋은 글입니당</span>
                          						</div>
                            				</div>
                            			</div>
                            			
                            		</div>
                            		<div class="col-lg-2">
                            			<div class="heart-btn" style="background-color: white;">
									      <div class="contentA">
									        <span class="heart"></span>
									        <span class="text">Like</span>
									        <span class="numb"></span>
									      </div>
									    </div>
                            		</div>
                            	</div>
                            </div>
                           
                           	
                           	
                           	
                           
                        </div>
                        
                        <div class="best-answer">
                            <div class="row">
                                <div class="col-lg-9">
                                    <div class="forum-post-top">
                                        <a class="author-avatar" href="#">
                                            <img src="img/profile2.png" alt="" style="width: 50px; height: 50px;">
                                        </a>
                                        <div class="forum-post-author">
                                            <a class="author-name" href="#"> 김지민 </a>
                                            <div class="forum-author-meta">
                                                <div class="author-badge">
                                                    <ion-icon name="calendar-clear-outline"></ion-icon>
                                                    <a href=""> 2024.01.19</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <p class="accepted-ans-mark">
                                    </p>
                                </div>
                            </div>
                            <div class="best-ans-content d-flex">
                                <span class="question-icon" title="The Best Answer">A:</span>
                                <p>
                                    우선 제일먼저 해야할일은 카레용돼지고기를 후추로 톡톡세번 그리고 자박하게 잠길정도로 우유를 부어줍니다.
우유와 후추가 돼지고기 특유의 잡내를 잡아준답니다.
15분정도 재워둡니다.<br>
                                    양파중간사이즈 2개, 감자큰거 1개,당근1/2개,새송이버섯2개(없으면 패스하셔도무관)
을 먹기 좋은 크기로 잘라서 준비합니다.<br>
                                    카레를 할 냄비를 준비하신후에 버터1스푼과 마늘1스푼을 넣고<br>
                                    양파썰어둔것을 모두 넣어서 볶아줍니다.
버터를 넣으면 고소한맛이 나서 좋더라구요^^<br><br>
                                </p>
                            </div>
                            
                            <div>
                            	<div class="row">
                            		<div class="col-lg-10"></div>
                            		<div class="col-lg-2" style="background-color: white;">
                            			<div class="heart-btn">
									      <div class="contentA">
									        <span class="heart"></span>
									        <span class="text">Like</span>
									        <span class="numb"></span>
									      </div>
									    </div>
                            		</div>
                            	</div>
                            </div>
                           
                           	
                           	
                           	
                           
                        </div>
                        
                  </div>
                  
                  
                  
                  <div class="col-lg-3">
                  	<div class="forum_sidebar">
                  		<aside class="r_widget qustion_wd">
                       		<button class="btn" type="button"><img src="img/question-1.png" alt=""> 대답하기<ion-icon name="chevron-forward-outline" class="arrow"></ion-icon></i></button>
                		</aside>
                  	</div>
                  </div>
			</div>
		</div>
		
		


</body>
</html>