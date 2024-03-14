<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
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
	/* 업무보고서로 넘어가는 검색모양 input */
	.searchInput{border: none; width: 400px; margin: 10px 0 0 22px; background: white;}
	/* searchInput 감싸는 div */
	.searchBar{width: 500px; height: 50px; border: 1px solid gray; float: right; border-radius: 40px;
			   margin-left: auto; background: white; box-shadow: 0px 3px 5px 0px #919191;}
	h2,h3,h5{color: black;}
	.content-first, .content-second{display: flex;}
	
	.part1, .part2, .part3{width: 30%; margin: 20px; height: 500px;
							 border-radius: 15px; background-color: white;
							 box-shadow: 0px 3px 5px 0px #919191;}
	.part4{width: 63%; margin: 20px; height: 500px;	
							box-shadow: 0px 3px 5px 0px #919191; border-radius: 15px; background-color: white;}
	
	h1 {
    font-size: 24px;
    font-weight: bold;
    color: #ffffff;
    line-height: 44px;
    text-align: left;
    margin-left: 25px;
    text-shadow: 0 2px #3b9197;
}
	hr {
    margin: 1rem 0;
    color: #4f59ca;
    border: 3px solid #4f49ca;
    border-top: var(--bs-border-width) solid;
    opacity: 1.25;
	}
	
	/* 진행바 */
	/* 큰 창 */
	.skill-progress{
    width: 100%;
    height: 100%;
    padding: 20px;
    color: white;
    border-radius: 10px;
    color : black;
	}
	
	.item {
    transition: 0.4s;
    margin: 10px 0 20px 0;
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
	    background: linear-gradient(to right, #ffe8f7, #99daff);
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
	
	/* 왕관이미지 */
	.leadericon{width: 20px; position: relative; border: 6px;}
	/* 멤버 프로필 이미지 */
	.memberimg{width: 20px; border-radius: 15px;}
	
	.leader{    display: flex;
    font-size: 20px;
    border-bottom: 1px solid black;
    width: 98%;}
	.front-back {
    display: flex;
    margin-top: 20px;
	}
	.front, .back{width: 100%; height: 90px; overflow-y: scroll;}
	
	.front-all, .back-all{width: 49%; height: 100%; padding: 3px 0 4px 0; border-bottom: 1px solid black;}
	.membernum {
    background-color: #e1a74f;
    border-radius: 22px;
    padding: 3px 12px 3px 12px;
    float: right;
    margin-right: 15px;
    font-size: 12px;
    position: relative;
    bottom: 2px;
    color: azure;
	}
	
	.memberlistall, .calall, .meetall, .reportall{padding: 20px;}
	
	.editicon {
    position: relative;
    top: 5px;
}
	
	/* 달력 일수 크기 작게(10, 11) */
	.fc .fc-daygrid-day-number {
    padding: 4px;
    position: relative;
    z-index: 4;
    font-size: small;
	}
	
	/* 일요일 날짜 빨간색 */
	.fc-day-sun a {
	  color: red;
	  text-decoration: none;
	}
	
	/* 토요일 날짜 파란색 */
	.fc-day-sat a {
	  color: blue;
	  text-decoration: none;
	}
	a{color:black; text-decoration: unset;}
	
	
	/* task 진행 상태 */
	.task-status{float: right; padding-right: 10px; font-size: 14px;
	background-color: #E5E1DA; padding: 0 10px 0 10px;
				border-radius: 10px; width: fit-content; border: 1px solid gray;}
	
	
	.milestone-content, .memberlist, .slide, .calendar, .table
	{margin-top: 30px;}
	
	.rank, .report{height: 400px;}
	
	.caltitle, .ranktitle, .protitle, .memtitle, .tasktitle {
    border-top-left-radius: 15px;
    background: #1fc1c0;
    display: -webkit-box;
    position: relative;
    width: 110%;
    right: 20px;
    height: 47px;
    bottom: 20px;
    border-top-right-radius: 15px;
}

	.meettitle, .reporttitle{
		border-top-left-radius: 15px;
	    background: #1fc1c0;
	    display: -webkit-box;
	    position: relative;
	    width: 926px;
	    right: 20px;
	    height: 47px;
	    bottom: 20px;
	    padding-left: -1px;
	    border-top-right-radius: 15px;
	}
	
	.task-card{height: 120px;}
</style>


<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js'></script>

 <script>
	  /* task 리스트를 자바스크립트로 가져온다. */	  
	  
	  
 
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        , selectable: true
        , editable: true
        , footerToolbar: true
        , customButtons: {
        	editButton: {
        		text: '수정하기'
        	},
        	deleteButton: {
        		text: '삭제하기',
        		click : function()
				{
        			
				}

        	}
        }
        /* , headerToolbar: {
            left: 'prev,next',
            center: 'title'
        } */
		,dayMaxEvents: true // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
        ,select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
            var title = prompt('Event Title:');
            if (title) {
              calendar.addEvent({
                title: title,
                start: arg.start,
                end: arg.end,
                allDay: arg.allDay
              })
            }
            calendar.unselect()
          },
          eventClick: function(arg) {
              if (confirm('이 일정을 삭제하시겠습니까?')) {
                arg.event.remove();
              }
          },
          events: ${data}
          
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
							<a href="projectProgress.action" class="majorTopic nav-link link">프로젝트 메인<ion-icon class="menuIcon" name="terminal-outline"></ion-icon></a>
						</ul>
						<ul class="nav-item ">
							<a href="Milestone.action" class="majorTopic nav-link link">마일스톤<ion-icon class="menuIcon" name="desktop-outline"></ion-icon></a>
							<li  class="miniMenuOption">
								<ul>
									<li class="miniMenuOption"><a href="#" class="nav-link link">결산보고서 작성</a></li>
								</ul>
							</li>
						</ul>
						<ul class="nav-item">
							<a href="taskCal.action" class="majorTopic nav-link link">업무<ion-icon class="menuIcon" name="reader-outline"></ion-icon></a>
							<li class="miniMenuOption">
								<ul>
									<li class="miniMenuOption"><a href="taskView.action" class="nav-link link">업무목록 조회</a></li>
									<li class="miniMenuOption"><a href="myTask.action" class="nav-link link">내 업무 보기</a></li>
									<li class="miniMenuOption"><a href="reportView.action" class="nav-link link">업무보고서 조회</a></li>
								</ul>
							</li>
						</ul>
						<ul class="nav-item">
							<a href="#" class="majorTopic nav-link link">프로젝트 관리 페이지<ion-icon class="menuIcon" name="person-outline"></ion-icon></a>
							<li class="miniMenuOption">
								<ul>
									<li class="miniMenuOption"><a href="#" class="nav-link link">팀원 관리</a></li>
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
				</div><!-- close.first -->
			</div>
			<div class="col-11 content-first">
				<div class="part1">
					<div class="skill-progress">
					<div class="protitle">
				        <h1>MILESTONE</h1>
				    </div>
				        <div class="milestone-content">
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
						</div>				        
				    </div><!-- close.skill-progress -->
				</div>
				
				<div class="part2">
					<!-- 멤버리스트 -->
					<div class="memberlistall">
						<div class="memtitle">
							<h1>MEMBERLIST</h1>
						</div>
						<div class="memberlist">
							<div class="leader">
								<c:forEach items="${leader }" var="item">
							      	<span><img src="<%=cp %>/img/crown.png" class="leadericon"/> Leader : </span>
									<div class="membername">
											<img src="<%=cp %>/img/pompomLove.png" class="memberimg"/>
											<span class="member-name">${item.nickname }</span>
									</div>
							    </c:forEach>
							</div>
							
							<div class="front-back">
								<div class="front-all">
									<h5 class="job-type">FRONT-END <span class="membernum">${frontList.size() }명</span></h5>
									<div class="front">
										<c:forEach items="${frontList }" var="item">
											<div class="membername">
													<img src="<%=cp %>/img/pompomLove.png" class="memberimg"/>
													<span class="member-name">${item.nickname }</span>
											</div>
									    </c:forEach>
									</div>
									
								</div>
								<div class="back-all">
									<h5 class="job-type">BACK-END <span class="membernum">${backList.size() }명</span></h5>
									<div class="back">
										<c:forEach items="${backList }" var="item">
											<div class="membername">
													<img src="<%=cp %>/img/pompomLove.png" class="memberimg"/>
													<span class="member-name">${item.nickname }</span>
											</div>
									    </c:forEach>
									</div>
								</div>
							</div><!-- close.front-back -->
						</div><!-- close.memberlist -->
					</div><!-- close.memberlistall -->
				</div>
					
				<div class="part3">
					<div class="task-all" style="padding: 20px;">
						<div class="tasktitle"><h1>TASK</h1></div>
						
						<div id="carouselExampleIndicators" class="carousel slide">
						  <div class="carousel-indicators">
						    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
						    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
						    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
						  </div>
						  <div class="carousel-inner">
						    <c:forEach var="i" begin="0" end="2" step="1">
								
								<c:if test="${i eq 0}">
								    <div class="carousel-item active">
								</c:if>
								<c:if test="${i > 0}">
								    <div class="carousel-item">
								</c:if>
									<c:forEach var="j" begin="0" end="2" step="1">
										<!-- 반복문 종료하는 처리 해야 함 -->
								      	<div class="task">
									      	
											<div class="card task-card">
												 <h5 class="card-title">${taskList[3 * i + j].nickname } <span class="task-status sta-ing"> 진행중</span></h5>
												 <h6 class="card-subtitle mb-2 text-body-secondary task-date">${taskList[3 * i + j].startDate } ~ ${taskList[3 * i + j].endDate }</h6>
												 <p class="card-text">${taskList[3 * i + j].title }</p>
												 <div class="task-date"">
												 	<span>부여일</span>
												 	<span style="float: right;">${taskList[3 * i + j].kdate }</span>
												</div><br>
											</div><%-- close.card --%>
										</div><!-- close.task -->
										
									 </c:forEach>
								    </div>
						    </c:forEach>
						  </div>
						  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
						    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
						    <span class="visually-hidden">Previous</span>
						  </button>
						  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
						    <span class="carousel-control-next-icon" aria-hidden="true"></span>
						    <span class="visually-hidden">Next</span>
						  </button>
						</div><!-- close.slide -->					
						
						
					</div><!-- close.task-all -->
				</div>
			</div>
			
			<div class="col-11 content-second">
				
				<div class="part1">
					<div class="calall">
						<div class="caltitle"><h1>CALENDAR</h1></div>
						<div id="calendar" class="calendar"></div>
					</div>
				</div>
				<div class="part4">
					<div class="meetall">
						<div class="meettitle"><h1>MEETING</h1></div>
						<table class="table">
							<tr>
								<th>제목</th>
								<th>작성일자</th>
								<th>작성자</th>
							</tr>
							<c:forEach var="i" begin="0" end="${meetingList.size()-1 }" step="1">
								<tr>
									<td>${meetingList[i].title }</td>
									<td>${meetingList[i].kdate }</td>
									<td>
										<div class="membername">
											<img src="<%=cp %>/img/pompomLove.png" class="memberimg"/>
											<span class="member-name">${meetingList[i].nickname }</span>
										</div>
									</td>
								</tr>
							</c:forEach>
						</table>
						
					</div>
				</div>
				
			</div>
			
			<div class="col-11 content-second">
			
				<div class="part1 rank">
					<div class="active-rank-all" style="padding: 20px;">
						<div class="ranktitle"><h1>RANK</h1></div>
						<table class="table">
							<tr>
								<th>순위</th>
								<th>닉네임</th>
								<th>활동량</th>
							</tr>
							<c:forEach var="i" begin="0" end="${rank.size()-1 }" step="1">
								<tr>
									<td>${i + 1}위</td>
									<td>
										<div class="membername">
											<img src="<%=cp %>/img/pompomLove.png" class="memberimg"/>
											<span class="member-name">${rank[i].nickname }</span>
										</div>
									</td>
									<td>${rank[i].num }회</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				
				</div>
				<div class="part4 report">
					<div class="reportall">
						<div class="reporttitle"><h1>TASK REPORT</h1></div>
						<table class="table">
							<tr>
								<th>작성자</th>
								<th>작성일</th>
								<th>업무</th>
								<th>보고서 제목</th>
								<th>승인 여부</th>
							</tr>
							<c:forEach var="i" begin="0" end="${reportList.size()-1 }" step="1">
								<tr>
									<td>
										<div class="membername">
											<img src="<%=cp %>/img/pompomLove.png" class="memberimg"/>
											<span class="member-name">${reportList[i].nickname }</span>
										</div>
									</td>
									<td>${reportList[i].kdate }</td>
									<td>${reportList[i].title }</td>
									<td>${reportList[i].summary }</td>
									<td>${reportList[i].state }</td>
								</tr>
							</c:forEach>
							
						</table>
					</div><!-- close.</div> -->
				</div>
			
		</div> <!-- close.main-text -->
		
</div><!-- end .row -->


					
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />

</body>
</html>