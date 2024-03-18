<%@page import="com.test.mybatis.MyPageMethod"%>
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

	
	MyPageMethod mpm = new MyPageMethod();
	
	String[] gradeIconUrlTxtArr;
	String iconUrlStr = "";
	
	/*[배너에 뿌려질 닉네임 옆 아이콘 변경하기]*/
	if (request.getAttribute("backendScore") != null && request.getAttribute("frontendScore") != null)
	{
		int backScore = (Integer)request.getAttribute("backendScore");
		int frontScore = (Integer)request.getAttribute("frontendScore");
		System.out.println("백엔드 점수 수신 : " + backScore);
		System.out.println("프론트엔드 점수 수신 : " + frontScore);
		
		if (backScore >= frontScore)
		{
			System.out.println("백엔드 점수가 더 높거나 같습니다.");
			
			//===================================================================================
			// 『skillGradeIcon』 - String[] 반환
			//===================================================================================
			//  String[0] : 스킬 등급 아이콘 Url	(*ex : "/CodeMate/img/grade_icon/1_seed.png")
			//  String[1] : 스킬 등급 텍스트 반환	(*ex : "씨앗")
			//===================================================================================
			
			gradeIconUrlTxtArr = mpm.skillGradeIcon(cp, backScore);
			iconUrlStr = gradeIconUrlTxtArr[0];
			
		}
		else if (backScore < frontScore)
		{
			System.out.println("프론트엔드 점수가 더 높습니다.");
			
			gradeIconUrlTxtArr = mpm.skillGradeIcon(cp, frontScore);
			iconUrlStr = gradeIconUrlTxtArr[0];
		}
	}
	
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

<script type="text/javascript">
		$(function()
		{
			  $(".memberImg").click(function()
			{
				$(".logout").show();
			})
			
			$(".logout").click(function()
			{
				$(location).attr("href", "logout.action");
			});
			
		})
</script>

<style type="text/css">

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
	
	.offcanvas.hiding, .offcanvas.show, .offcanvas.showing {
    visibility: visible;
    width: 733px;
    left: 31%;
    border-radius: 13px;
    height: 77px;
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
	
	/* 왕관이미지 */
	.leadericon{width: 20px; position: relative; border: 6px;}
	/* 멤버 프로필 이미지 */
	.memberimg{width: 20px; border-radius: 15px;}
	
	.leader{    display: flex;
    font-size: 20px;
    border-bottom: 1px solid black;
    width: 50%;}
	.front-back {
    margin-top: 3px;
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
	
	.memberlistall {
    width: 600px;
    position: absolute;
    bottom: 400px;
    left: 1250px;
	}
	.calall{margin-left: 120px; width: 800px;}
}
	
	
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
				<a class="navbar-brand bannerLogo link" href="Code_Mate.action">
					<img alt="Logo" class="LogoImage d-inline-block align-text-top" src="img/TestLogo.png" >
				</a>
				<!--===========[Logo]===========-->
				
				<span class="nav-link"><a href="ProjectList.action" class="link">프로젝트 게시판</a></span>
				<span class="nav-link"><a href="boardlist.action" class="link">Q&A 게시판</a></span>
				<span class="nav-link"><a href="portfoliolist.action" class="link">포트폴리오 게시판</a></span>
			
			    
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
				    
					<div id="profile" style="<%=login%>">
						<img class="memberImg" src="<%=cp %>${member.path }">
					</div>
					<span class="nickname" id="mem1" style="<%=login%>"><a href="mypage.action" class="nicknamelink">${member.nickname }</a></span>
					<div class="gradeIcon" style="<%=login%>">
						<img src="<%=iconUrlStr %>"  class="skillGradeIconImg" />
					</div>
					 
					 <div class="logout">
					 	<span class="logouttext">로그아웃</span>
					 </div>
					 
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
							<a href="projectProgress.action??cp_code=${cp_code }&ap_code=${ap_code}" class="majorTopic nav-link link">프로젝트 메인<ion-icon class="menuIcon" name="terminal-outline"></ion-icon></a>
						</ul>
						<ul class="nav-item ">
							<a href="Milestone.action?cp_code=${cp_code }&ap_code=${ap_code}" class="majorTopic nav-link link">마일스톤<ion-icon class="menuIcon" name="desktop-outline"></ion-icon></a>
							<li  class="miniMenuOption">
								<ul>
									<li class="miniMenuOption"><a href="finalReportPage.action?cp_code=${cp_code }&ap_code=${ap_code}" class="nav-link link">결산보고서 작성</a></li>
								</ul>
							</li>
						</ul>
						<ul class="nav-item">
							<a href="taskCal.action?cp_code=${cp_code }&ap_code=${ap_code}" class="majorTopic nav-link link">업무<ion-icon class="menuIcon" name="reader-outline"></ion-icon></a>
							<li class="miniMenuOption">
								<ul>
									<li class="miniMenuOption"><a href="taskView.action?cp_code=${cp_code }&ap_code=${ap_code}" class="nav-link link">업무목록 조회</a></li>
									<li class="miniMenuOption"><a href="myTask.action?cp_code=${cp_code }&ap_code=${ap_code}" class="nav-link link">내 업무 보기</a></li>
									<li class="miniMenuOption"><a href="reportView.action?cp_code=${cp_code }&ap_code=${ap_code}" class="nav-link link">업무보고서 조회</a></li>
								</ul>
							</li>
						</ul>
						<ul class="nav-item">
							<a href="#" class="majorTopic nav-link link">프로젝트 관리 페이지<ion-icon class="menuIcon" name="person-outline"></ion-icon></a>
							<li class="miniMenuOption">
								<ul>
									<li class="miniMenuOption"><a href="#" class="nav-link link">팀원 관리</a></li>
								</ul>
							</li>
						</ul>
			
						
					</div><!-- end .menuOptions -->
				</div><!-- end .leftmenuBar -->
			</div><!-- end .leftmenuBarBox -->
		</div><!-- end .col-6 .menuArea -->
		
		<!-- 본문 영역 -->
		<div class="row main-text">
			<div class="col-9">
				<div class="calall">
					<h1>캘린더 & 업무할당</h1>
					<div class="calendar">
						<div id="calendar"></div>
					</div>
				</div>
			</div>
			<div class="col-3" style="margin-top: 12%;">
				<div class="memberlistall">
						<h4>MEMBERLIST</h4>
						<div class="memberlist">
							<div class="leader">
								<c:forEach items="${leader }" var="item">
							      	<span><img src="<%=cp %>/img/crown.png" class="leadericon"/> Leader : </span>
									<div class="membername">
											<img src="<%=cp %>${member.path }" class="memberimg"/>
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
													<img src="<%=cp %>${member.path }" class="memberimg"/>
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
													<img src="<%=cp %>${member.path }" class="memberimg"/>
													<span class="member-name">${item.nickname }</span>
											</div>
									    </c:forEach>
									</div>
								</div>
							</div><!-- close.front-back -->
						</div><!-- close.memberlist -->
					</div><!-- close.memberlistall -->
			</div>
		</div>
		
</div><!-- end .row -->

</body>
</html>