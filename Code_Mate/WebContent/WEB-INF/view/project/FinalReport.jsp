<%@page import="com.test.mybatis.MyPageMethod"%>
<%@page import="com.test.mybatis.dto.FinalReport_ReportDTO"%>
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
			System.out.println("1");
			gradeIconUrlTxtArr = mpm.skillGradeIcon(cp, backScore);
			iconUrlStr = gradeIconUrlTxtArr[0];
			System.out.println("뷰다음?");
		}
		else if (backScore < frontScore)
		{
			System.out.println("프론트엔드 점수가 더 높습니다.");
			
			gradeIconUrlTxtArr = mpm.skillGradeIcon(cp, frontScore);
			iconUrlStr = gradeIconUrlTxtArr[0];
		}
	}
	

	
	String isReportExist = (String) request.getAttribute("isFinalFinalReportExist");
	System.out.println("[결산 보고서 페이지] - 결산 보고서 완료 여부 문자열 확인 : " + isReportExist);
	
	String memberRole = (String) request.getAttribute("memberRole"); 
	System.out.println("[결산 보고서 페이지] - 접근한 멤버 직위 확인 : " + memberRole);
	
	FinalReport_ReportDTO finalReport = (FinalReport_ReportDTO) request.getAttribute("finalReport");

	String frCode = finalReport.getFr_code(); 
	

	if (frCode == null)
	{
		System.out.println("[결산 보고서 페이지] 결산 보고서가 존재하지 않습니다.");
	}
	else
	{
		System.out.println("[결산 보고서 페이지] 결산 보고서가 이미 존재합니다.");
	}
	
	String cp_code = (String)request.getAttribute("cp_code");
	
	System.out.println("cp_code : "  + cp_code);
		
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

<!-- FinalReport Style -->
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/finalReport_style.css" />


<!-- tag -->
<link href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>

<script src="https://tistory4.daumcdn.net/tistory/3134841/skin/images/confetti_v2.js"></script>

<style>
	canvas{z-index:10;pointer-events: none;position: fixed;top: 0;transform: scale(1.1);}
</style>

<script type="text/javascript">
const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
const popoverList = [popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
	
	  $( function () {
	    $( '[data-bs-toggle="popover"]' ).popover()
	  } );
	  
</script>
<script>
$(document).ready(function(){  
  function reAction(){
  	$("#startButton").trigger("click");
  	setTimeout(function(){
  		$("#stopButton").trigger("click");
  	}, 100000);
  }
  reAction();
  $("#startButton").on('click', function(){
      reAction();
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
			
			<%--[로그인한 회원의 직위 반환]--%>
			<c:set var="memberRole" value="<%=memberRole %>"/>
			
			<%--[결산 보고서가 작성되었는지의 여부 반환]--%>
			<c:set var="isReportExist" value="<%=isReportExist %>" />
		
		
		<div class="row main-text">

			<div class="FinalReport-is-complete">
				<span class="isReportExist-text">
					${isReportExist }
				</span>
			</div>
			<div class="col-12 main-FinalReport-Info-Parent-Area">
			
				
				<div class="FinalReport-total-Parent-Area">
					<div class="FinalReport-header-Area">
						
						<div class="FinalReport-title-Box">
							<span class="FinalReport-title-text">
								<span class="FinalReport-Project-title">
									<span class="FinalReport-title-icon material-symbols-outlined">social_leaderboard</span>
									${finalReport.project_name }
								</span>
								<span class="desc-title-text FinalReport-project-name-text">
									결산 보고서
								</span>
							</span>
						</div><!-- close .FinalReport-title-Box -->
					</div><!-- close .FinalReport-header-Area -->
					
					<div class="FinalReport-Body-Area">
					
						<form action="finalReport_write.action" method="get">
							<div class="FinalReport-report-title-Area">
								
								<div class="desc-title-box FinalReport-report-title-desc">
									<span class="desc-title-text FinalReport-report-title-text">
										결산 보고서 제목
									</span>
								</div>
								
								<input type="hidden" name="cp_code" value="${cp_code }"/>
								
								<c:choose>
								
									<%--[결산보고서 미작성일 경우, 입력창 보이기]--%>
									<c:when test="${isReportExist == '미작성' && memberRole == '팀장' }">
										<div class="report-content-box FinalReport-report-main-title">
											<input name="report_title" class="FinalReport-report-main-title-text"></input>
										</div>
									</c:when>
									
									<%--[결산보고서가 작성됐을 경우, 작성된 제목 보여주기] --%>
									<c:otherwise>
										<div class="report-content-box FinalReport-report-main-title">
											<input name="report_title" class="FinalReport-report-main-title-text"
											 disabled="disabled"
											 value="${finalReport.report_title }"/>
										</div>
									</c:otherwise>
								</c:choose>
								
								
							</div><!-- close .FinalReport-report-title-Area -->
							
							
							<div class="FinalReport-report-content-Area">
								
								<div class="desc-title-box FinalReport-report-content-desc">
									<span class="desc-title-text FinalReport-report-content-text">
										결산 보고서 내용
									</span>
								</div>
								
								
								<c:choose>
									<c:when test="${isReportExist == '미작성' && memberRole == '팀장' }">
										<div class="report-content-box FinalReport-report-main-content">
											<textarea name="report_content" class="report-content-text FinalReport-report-content"></textarea>
										</div>
									</c:when>
								
									<c:otherwise>
										<div class="report-content-box FinalReport-report-main-content">
											<textarea name="report_content" class="report-content-text FinalReport-report-content" 
											 disabled="disabled">${finalReport.report_content }</textarea>
										</div>
									</c:otherwise>
								</c:choose>
								
								
							</div><!-- close .FinalReport-report-content-Area -->
						
							<!-- 
							<div class="FinalReport-report-tag-write-Area">
								<span class="desc-title-text FinalReport-report-tag-write-text">
									프로젝트에서 사용한 스킬 태그를 입력해 주세요.
								</span>
								<div class="report-tag-write-box">
								</div>
							</div>
 							-->
 							
 		
 				
 							
							<div class="FinalReport-report-tag-Area">
							
								<div class="desc-title-box FinalReport-report-tag-desc">
									<span class="desc-title-text FinalReport-report-tag-text">
										사용한 스킬 태그들
									</span>
									
								</div>
								
								<div class="report-content-box FinalReport-report-main-skill-tagList">
									
									<div class="form-group FinalReport-skill-tag-Parent-Box">
										
										<div class="FinalReport-skill-tag">
										
											<c:choose>
												<c:when test="${isReportExist == '미작성' && memberRole == '팀장' }">
													<input id="all_skill_tagList" name='all_skill_tagList' placeholder="태그를 입력해주세요">
														
														<script>
														    const input = document.querySelector('input[name=all_skill_tagList]');
														    let tagify = new Tagify(input, 
														    {
														        delimiters: ", ", // 태그 구분자 설정
														        dropdown: 
														        {
														            enabled: 0, // 태그 입력시 드롭다운 사용 여부 설정
														        }
														    
														    });
															
														    /*
														    // 태그가 추가되면 이벤트 발생
														    tagify.on('add', function() 
														    {
														    	//console.log(tagify.value); // 입력된 태그 정보 객체
														    	
														    	//alert("테스트 : " + tagify.value[0].value);
														    	//test = tagify.value;
														    	
															    //var keys =  Object.keys(tagify.value);
														    	//alert("제이슨 객체 길이 : " + keys.length);
														    	
														    })
														    */
														    
														</script>
															
														
												</c:when>
												
												<c:otherwise>

													
														<c:forEach var="pTag" items="${pTagList }">
															<span class="portFolio-skill-tag-Text">
																${pTag.tag_name }
															</span>
														</c:forEach>
													
													
												</c:otherwise>
											</c:choose>
								
										
										</div><!-- close .FinalReport-skill-tag -->
										
									</div><!-- close .form-group FinalReport-skill-tag-Parent-Box -->
								
								</div><!-- close .report-content-box .Finalreport-repot-main-skill-tagList -->
								
								
							</div><!-- close .FinalReport-report-content-Area -->
						
							
							<c:choose>
								<c:when test="${isReportExist == '미작성' && memberRole == '팀장' }">
									<div class="FinalReport-report-button-Area">
								
										<div class="FinalReport-report-submit-btn-Box">
											<button type="submit" class="report-submit-btn btn btn-success">작성 완료</button>
										</div>
									
									</div><!-- close .FinalReport-report-button-Area -->
								
								</c:when>
								<c:when test="${isReportExist == '미작성' && memberRole != '팀장' }">
									* 팀장 외에는 결산 보고서를 작성할 수 없습니다!
								</c:when>
								
							</c:choose>
							
						
						</form><!-- close form action="finalReport_write.action" -->

					</div><!-- close .FinalReport-Body-Area -->
					
		
					<canvas id="canvas"></canvas>	
				
					<div class="buttonContainer">
						<button class="canvasBtn" id="stopButton">Stop Confetti</button>
						<button class="canvasBtn" id="startButton">Drop Confetti</button>	
					</div>
					
				 
				</div>
		
				
			</div>
		</div>
		
</div><!-- end .row -->

</body>
</html>