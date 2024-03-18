<%@page import="com.test.mybatis.MyPageMethod"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.test.mybatis.dao.IMemberDAO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
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

<script type="text/javascript">
const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
const popoverList = [popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
	
	  $( function () {
	    $( '[data-bs-toggle="popover"]' ).popover()
	  } );
	  
	var myModal = document.getElementById('myModal')
	var myInput = document.getElementById('myInput')
	
	myModal.addEventListener('shown.bs.modal', function () {
	  myInput.focus()
	})
</script>

<script type="text/javascript">
	$(function(){
		$(".report").css('display', 'none');
		
		$(".open").click(function()
		{
			var id = $(this).val();
			$("#" + id).show();
			
		})
		
		$(".btn-close").click(function()
		{
			var id = $(this).val();
			$("#" + id).hide();
		})
		
		$("#reportSave").click(function()
		{
			$("#insertReport").submit();
		})
		
		$("#task_code").click(function()
		{
			var code = $("#task_code").val();
			$("#place").val(code);
			
		})
	});
	
</script>

<style type="text/css">
.page-todo .tasks {
    background: #fff;
    padding: 0;
    border-right: 1px solid #d1d4d7;
    margin: -30px 15px -30px -15px
}

.report{display: none;}

.page-todo .task-list {
    padding: 30px 15px;
    height: 100%
}

.page-todo .graph {
    height: 100%
}

.page-todo .priority.high {
    background: #fffdfd;
    margin-bottom: 1px
}

.page-todo .priority.high span {
    background: #f86c6b;
    padding: 2px 10px;
    color: #fff;
    display: inline-block;
    font-size: 12px
}

.page-todo .priority.medium {
    background: #fff0ab;
    margin-bottom: 1px
}

.page-todo .priority.medium span {
    background: #f8cb00;
    padding: 2px 10px;
    color: #fff;
    display: inline-block;
    font-size: 12px
}

.page-todo .priority.low {
    background: #cfedda;
    margin-bottom: 1px
}

.page-todo .priority.low span {
    background: #4dbd74;
    padding: 2px 10px;
    color: #fff;
    display: inline-block;
    font-size: 12px
}

.page-todo .task {
    border-bottom: 1px solid #e4e5e6;
    margin-bottom: 1px;
    position: relative
}

.page-todo .task .desc {
    display: inline-block;
    width: 75%;
    padding: 10px 10px;
    font-size: 12px
}

.page-todo .task .desc .title {
    font-size: 18px;
    margin-bottom: 5px
}

.page-todo .task .time {
    display: inline-block;
    width: 15%;
    padding: 10px 10px 10px 0;
    font-size: 12px;
    text-align: right;
    position: absolute;
    top: 0;
    right: 0
}

.page-todo .task .time .date {
    font-size: 15px;
    margin-bottom: 5px;
    width: 170px;
    position: relative;
    right: 63px;
}

.page-todo .task.last {
    border-bottom: 1px solid transparent
}

.page-todo .task.high {
    border-left: 2px solid #f86c6b
}

.page-todo .task.medium {
    border-left: 2px solid #f8cb00
}

.page-todo .task.low {
    border-left: 2px solid #4dbd74
}

.page-todo .timeline {
    width: auto;
    height: 100%;
    margin: 20px auto;
    position: relative
}

.page-todo .timeline:before {
    position: absolute;
    content: '';
    height: 100%;
    width: 4px;
    background: #d1d4d7;
    left: 50%;
    margin-left: -2px
}

.page-todo .timeslot {
    display: inline-block;
    position: relative;
    width: 100%;
    margin: 5px 0
}

.page-todo .timeslot .task {
    position: relative;
    width: 44%;
    display: block;
    border: none;
    -webkit-box-sizing: content-box;
    -moz-box-sizing: content-box;
    box-sizing: content-box
}

.page-todo .timeslot .task span {
    border: 2px solid #63c2de;
    background: #e1f3f9;
    padding: 5px;
    display: block;
    font-size: 11px
}

.page-todo .timeslot .task span span.details {
    font-size: 16px;
    margin-bottom: 10px
}

.page-todo .timeslot .task span span.remaining {
    font-size: 14px
}

.page-todo .timeslot .task span span {
    border: 0;
    background: 0 0;
    padding: 0
}

.page-todo .timeslot .task .arrow {
    position: absolute;
    top: 6px;
    right: 0;
    height: 20px;
    width: 20px;
    border-left: 12px solid #63c2de;
    border-top: 12px solid transparent;
    border-bottom: 12px solid transparent;
    margin-right: -18px
}

.page-todo .timeslot .task .arrow:after {
    position: absolute;
    content: '';
    top: -12px;
    right: 3px;
    height: 20px;
    width: 20px;
    border-left: 12px solid #e1f3f9;
    border-top: 12px solid transparent;
    border-bottom: 12px solid transparent
}

.page-todo .timeslot .icon {
    position: absolute;
    border: 2px solid #d1d4d7;
    background: #2a2c36;
    -webkit-border-radius: 50em;
    -moz-border-radius: 50em;
    border-radius: 50em;
    height: 30px;
    width: 30px;
    top: 0;
    left: 50%;
    margin-left: -17px;
    color: #fff;
    font-size: 14px;
    line-height: 30px;
    text-align: center;
    text-shadow: none;
    z-index: 2;
    -webkit-box-sizing: content-box;
    -moz-box-sizing: content-box;
    box-sizing: content-box
}

.page-todo .timeslot .time {
    background: #d1d4d7;
    position: absolute;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    border-radius: 4px;
    top: 1px;
    left: 50%;
    padding: 5px 10px 5px 40px;
    z-index: 1;
    margin-top: 1px
}

.page-todo .timeslot.alt .task {
    margin-left: 56%;
    -webkit-box-sizing: content-box;
    -moz-box-sizing: content-box;
    box-sizing: content-box
}

.page-todo .timeslot.alt .task .arrow {
    position: absolute;
    top: 6px;
    left: 0;
    height: 20px;
    width: 20px;
    border-left: none;
    border-right: 12px solid #63c2de;
    border-top: 12px solid transparent;
    border-bottom: 12px solid transparent;
    margin-left: -18px
}

.page-todo .timeslot.alt .task .arrow:after {
    top: -12px;
    left: 3px;
    height: 20px;
    width: 20px;
    border-left: none;
    border-right: 12px solid #e1f3f9;
    border-top: 12px solid transparent;
    border-bottom: 12px solid transparent
}

.page-todo .timeslot.alt .time {
    top: 1px;
    left: auto;
    right: 50%;
    padding: 5px 40px 5px 10px
}
	.priority.medium, .priority.low{width: 656px;}

.taskContent{
	font-size: 15px;
}
	.bootdeys{margin-top: 90px;}
	.task{height: 120px;}
	.time{float: right;}
	/* 멤버 프로필 이미지 */
	.memberimg{width: 20px; border-radius: 15px;}
	
	/* 업무보고서 열기 버튼 */
	.open{border: 0px; background: white; float: right;}
	/* 업무보고서 div */
	.report {
    width: 630px;
    height: 300px;
    position: absolute;
    left: 700px;
    top: -14px;
}
	.reportAll{margin: 15px;}
	.btn-close {
    width: 7px;
    float: right;
    position: relative;
    bottom: 5px;
}
	.form-control{border: 1px solid #d5d5d5;}
	.modal-content {top: 150px;}
	td{ text-overflow:ellipsis; overflow:hidden; white-space:nowrap;}
	.text1, .text2{width: 100px; min-width: 100px; max-width: 100px;}
	th { 		vertical-align: middle; 		padding:5px;	overflow:hidden;		white-space : nowrap;		text-overflow: ellipsis;	 }

</style>

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
						<img class="memberImg" src="img/profileImg_1.png">
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
									<li class="miniMenuOption"><a href="#" class="nav-link link">결산보고서 작성</a></li>
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
			<div class="col-10">
				<h1>내 업무 보기</h1>
				<div class="container page-todo bootstrap snippets bootdeys">
					<div class="col-sm-7 tasks">
						<div class="task-list">
							<h4>${member.nickname } 님의 업무입니다.</h4>
							<div class="priority high"><span>진행 중</span></div>
								<c:forEach items="${getMyIng }" var="item" varStatus="status">
									<c:choose> 
										<c:when test="${status.index < getWeek.size()-1}">
											<div class="task high">
										</c:when>  
										<c:otherwise>
											<div class="task high last">
										</c:otherwise> 
									</c:choose> 
								
										<div class="desc">
											<div class="title">${item.title }</div>
											<div class="taskContent">${item.content }</div>
										</div>
										<div class="time">
											<div class="date">시작일 : ${item.startDate }</div>
											<div class="date">마감일 : ${item.endDate }</div>
										</div>
										<div class="name">
											<div class="membername">
													<img src="<%=cp %>/img/pompomLove.png" class="memberimg"/>
													<span class="member-name">${item.nickname }</span>
													<button class="open" value="${item.task_code }" name="taskCode">업무보고서 열기</button>
													
														<div class="report" id="${item.task_code }">
																<h4>
																	${item.title }의 업무보고서
																	<button type="button" class="btn-close" aria-label="Close" value="${item.task_code }"></button>
																</h4>
																<div class="reportAll">
																	
																	<table class="table">
																		<tr>
																			<th class="text1">업무명</th>
																			<th class="text2">보고서 내용</th>
																			<th>보고서 요약</th>
																			<th>작성일자</th>
																			<th>제출 결과</th>
																		</tr>
																		
																		<c:forEach items="${reportList }" var="report">
																				<c:if test="${item.task_code eq report.task_code }">
																					<tr>
																						<td>${report.title }</td>
																						<td>${report.content }</td>
																						<td>${report.summary }</td>
																						<td>${report.kdate }</td>
																						<td>${report.state }</td>
																					</tr>
																				</c:if>
																		</c:forEach>
																	
																	</table>
																	
																	<button id="task_code" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" value="${report.task_code }">
																	  작성하기
																	</button>
																</div>
														</div>
											</div>
										</div>
									</div><!-- close. task high / last -->
									
								</c:forEach>
							
							<div class="priority medium"><span>진행 예정</span></div>
							
								<c:forEach items="${getMyWill }" var="item" varStatus="status2">
									<c:choose> 
										<c:when test="${status2.index < getIng.size()-1}">
											<div class="task medium">
										</c:when>  
										<c:otherwise>
											<div class="task medium last">
										</c:otherwise> 
									</c:choose>
								
										<div class="desc">
											<div class="title">${item.title }</div>
											<div class="taskContent">${item.content }</div>
										</div>
										<div class="time">
											<div class="date">시작일 : ${item.startDate }</div>
											<div class="date">마감일 : ${item.endDate }</div>
										</div>
										<div class="name">
											<div class="membername">
													<img src="<%=cp %>/img/pompomLove.png" class="memberimg"/>
													<span class="member-name">${item.nickname }</span>
											</div>
										</div>
									</div><!-- close. task medium / last -->
								</c:forEach>
					
							<div class="priority low"><span>완료한 업무</span></div>
							
								<c:forEach items="${getMyEnd }" var="item" varStatus="status2">
									<div class="task low">
										<div class="desc">
											<div class="title">${item.title }</div>
											<div class="taskContent">${item.content }</div>
										</div>
										<div class="time">
											<div class="date">시작일 : ${item.startDate }</div>
											<div class="date">마감일 : ${item.endDate }</div>
										</div>
										<div class="name">
											<div class="membername">
													<img src="<%=cp %>/img/pompomLove.png" class="memberimg"/>
													<span class="member-name">${item.nickname }</span>
													<button class="open" value="${item.task_code }" name="taskCode">업무보고서 열기</button>
													
														<div class="report" id="${item.task_code }">
																<h4>
																	${item.title }의 업무보고서
																	<button type="button" class="btn-close" aria-label="Close" value="${item.task_code }"></button>
																</h4>
																<div class="reportAll">
																	
																	<table class="table">
																		<tr>
																			<th class="text1">업무명</th>
																			<th class="text2">보고서 내용</th>
																			<th>보고서 요약</th>
																			<th>작성일자</th>
																			<th>제출 결과</th>
																		</tr>
																		
																		<c:forEach items="${reportList }" var="report">
																				<c:if test="${item.task_code eq report.task_code }">
																					<tr>
																						<td>${report.title }</td>
																						<td>${report.content }</td>
																						<td>${report.summary }</td>
																						<td>${report.kdate }</td>
																						<td>${report.state }</td>
																					</tr>
																				</c:if>
																		</c:forEach>
																	
																	</table>
																	
																	<button id="task_code" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" value="${report.task_code }">
																	  작성하기
																	</button>
																</div>
														</div>
											</div>
										</div>
									</div>
								</c:forEach>
							<div class="clearfix"></div>		
						</div>	
				
			</div>
		</div>
		
</div><!-- end .row -->

<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">업무 보고서 작성</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form action="insertReport.action" id="insertReport" method="post" enctype="multipart/form-data">
      	<div class="modal-body">
      
			<div class="mb-3">
			  <label for="exampleFormControlTextarea1" class="form-label"><span class="dateText">진행 내용</span></label>
			  <textarea class="form-control" name="content" rows="3"></textarea>
			</div>
	        <div class="mb-3">
			  <label for="exampleFormControlInput1" class="form-label"><span class="dateText">요약</span></label>
			  <input type="text" class="form-control" name="summary">
			</div>
		    <div class="mb-3">
			  <label for="formFile" class="form-label">첨부 파일</label>
			  <input class="form-control" type="file" id="file"  name="file">
		    </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary" id="reportSave">저장</button>
	      </div>
	      <input type="hidden" id="place" name="task_code" value=""/>
      </form>
    </div>
  </div>
</div>




</body>
</html>