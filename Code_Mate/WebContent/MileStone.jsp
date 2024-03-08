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
		
	
	

		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Template.jsp</title>

<!-- BootStrap -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<!-- Banner Style -->
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/banner_side.css" />

<!-- JQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- ionicons -->
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

<!-- Milestone Style -->
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/milestone_style.css" />

<!-- Google Fonts Icons -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />


<script type="text/javascript">

 	const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
	const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
	
	$( function ()
	{
    	$( '[data-bs-toggle="popover"]' ).popover();
    	
    }); 
 	
 	
 	$(function()
	{
 		// span 클릭시 전체 내용보기 모달창이 뜨도록 한다.
	 	$(".milestone-checkbox-content").click(function()
		{
	 		var checkbox_content = $(this).html();
	 		
	 		$(".checkbox-modal-content").html(checkbox_content);
	 		$("#more-check-content").modal("show");
	 		
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
						<img class="memberImg" src="img/profileImg_1.png">
					</div>
					<span class="nickname" id="mem1" style="<%=login%>">${member.nickname }</span>
					<div class="gradeIcon" style="<%=login%>">
						🌱
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
						<img alt="Logo" class="LogoImageBanner d-inline-block align-text-top lastchange" src="img/TestLogo.png" >
					</a>
					<!--===========[Logo]===========-->
					
					
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
						
					</div><!-- end .menuOptions -->
				</div><!-- end .leftmenuBar -->
			</div><!-- end .leftmenuBarBox -->
		</div><!-- end .col-6 .menuArea -->
		

		<!-- 본문 영역 -->
		<div class="row main-text">
		
			<div class="col-10 milestone-main-Parent-Area">
				<div class="row milestone-mainBox-Area">

					<%--▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ --%>
					<%--▩▩▩▩▩▩[기획 마일스톤 전체 영역]▩▩▩▩▩▩--%>
					<%--▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ --%>
					<div class="col-6 one-milestone-Parent-Area">
						<div class="one-milestone-main-box">
							<div class="milestone-progress-Area plan">

								  <div class="progress-bar-percent-Box">
								  	
								  	<div class="milestone-progress-all-area">
									  	<%-- Progress-bar 트랙 영역 --%>
										<div class="progress milestone-progress-box plan-progress-box plan" role="progressbar" aria-label="Info example" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
										  	
										  	<%-- Progress-bar 칠해지는 영역 --%>
										  	<div class="progress-bar milestone-progress-bar plan text-dark">
										  	</div><!-- close .progress-bar milestone-progress-bar plan text-dark -->
										  	
										</div><!-- close .progress milestone-progress-box plan-progress-box plan -->
									</div><!-- close .milestone-progress-all-area -->
								  	
								  	<div class="progress-bar-percent-miniBox">
								  		<span class="progress-bar-percent-content">50%</span>	
								  	</div><!-- close .progress-bar-percent-miniBox -->
								  	
								  </div><!-- close .progress-bar-percent-Box -->
							  
							</div>
							
							<div class="milestone-step-numberBox">
								<span class="milestone-step-number">STEP 1</span>
							</div>
						
							<div class="one-milestone-Parent-Box">
								<div class="one-milestone-mainCategory-box plan-category-box plan">
									<h3 class="milestone-mainCategory-text plan-category-text plan">기획</h3>
								</div><!-- close .one-milestone-mainCategory-box -->
								
								<div class="checkbox-title-Area">
									<div class="checkbox-title">
										<span class="checklist-title-all-element-box">
											<span class="checklist-title-icon material-symbols-outlined">check_box</span>
											<span class="checklist-title-txt plan-check-title">CheckList</span>
										</span>
									</div>
								</div>
								
								<div class="all-milestone-Content-and-btn-box">
									<div class="one-milestone-mainContent-box plan-mainContent-box plan">
										<div class="milestone-checkList-box plan-checkList plan">
											
											
											
											
											<%-- CheckBox 목록 하나 --%>
											<div class="one-milestone-checkbox plan-check plan">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan">
													<%-- Edit --%>
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													<%-- Delete --%>
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											<%-- CheckBox 목록 하나 --%>
											<div class="one-milestone-checkbox plan-check plan">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan">
													<%-- Edit --%>
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													<%-- Delete --%>
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											<%-- CheckBox 목록 하나 --%>
											<div class="one-milestone-checkbox plan-check plan">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan">
													<%-- Edit --%>
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													<%-- Delete --%>
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											
											<%-- CheckBox 목록 하나 --%>
											<div class="one-milestone-checkbox plan-check plan">

												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox">

													<span class="milestone-checkbox-content">
														무엇무엇을 해야함!
													</span>
												</form>
												
												<div class="checkbox-all-btn-box plan">
													<%-- Edit --%>
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													<%-- Delete --%>
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											<%-- CheckBox 목록 하나 --%>
											<div class="one-milestone-checkbox plan-check plan">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox">
													<span class="milestone-checkbox-content">
													일이삼사오육칠팔구십일이삼사오육칠팔
													</span>
												</form>
												
												<div class="checkbox-all-btn-box plan">
													<%-- Edit --%>
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													<%-- Delete --%>
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											<%-- CheckBox 목록 하나 --%>
											<div class="one-milestone-checkbox plan-check plan">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox">

													<span class="milestone-checkbox-content">
														이것은 테스트를 위해 상당히 길게 쓰는 목표입니다. 글자가 오버플로우 됐을 때만 툴팁이 나타나게 하고 싶은데 잘 안 되네요...
													</span>
													
												</form>
												
												<div class="checkbox-all-btn-box plan">
													<%-- Edit --%>
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													<%-- Delete --%>
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->



											
		
										</div><!-- close .milestone-checkList-box .plan-checkList .plan -->
									</div><!-- close .one-milestone-mainContent-box .plan-mainContent-box .plan -->
									
									
									<div class="milestone-add-list-btn-Area">
										
										<div class="milestone-add-list-btn-box">
											<button type="button" class="milestone-add-list-btn btn btn-light plan-list-add-btn">
												<span class="milestone-add-btn-icon material-symbols-outlined">add</span>
											</button>
										</div><!-- close .milestone-add-list-btn-box -->
									
									</div><!-- close .milestone-add-list-btn-Area -->
									
								</div><!-- close .all-milestone-Content-and-btn-box -->
								
								
							</div><!-- close .one-milestone-Parent-Box -->
						</div><!-- close .one-milestone-main-box -->
					</div><!-- close .col-6 .one-milestone-Parent-Area [기획 마일스톤 영역 종료] -->
					
					


					<%--▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ --%>
					<%--▩▩▩▩▩▩[설계 마일스톤 전체 영역]▩▩▩▩▩▩--%>
					<%--▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ --%>
					<div class="col-6 one-milestone-Parent-Area design">
						<div class="one-milestone-main-box design">
							<div class="milestone-progress-Area plan design">

								  <div class="progress-bar-percent-Box">
								  	
								  	<div class="milestone-progress-all-area">
									  	<%-- Progress-bar 트랙 영역 --%>
										<div class="progress milestone-progress-box plan-progress-box plan design" role="progressbar" aria-label="Info example" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
										  	
										  	<%-- Progress-bar 칠해지는 영역 --%>
										  	<div class="progress-bar milestone-progress-bar plan text-dark  design">
										  	</div><!-- close .progress-bar milestone-progress-bar plan text-dark -->
										  	
										</div><!-- close .progress milestone-progress-box plan-progress-box plan -->
									</div><!-- close .milestone-progress-all-area -->
								  	
								  	<div class="progress-bar-percent-miniBox design">
								  		<span class="progress-bar-percent-content design">50%</span>	
								  	</div><!-- close .progress-bar-percent-miniBox -->
								  	
								  </div><!-- close .progress-bar-percent-Box -->
							  
							</div>
							
							<div class="milestone-step-numberBox design">
								<span class="milestone-step-number design">STEP 2</span>
							</div>
						
							<div class="one-milestone-Parent-Box">
								<div class="one-milestone-mainCategory-box plan-category-box plan  design">
									<h3 class="milestone-mainCategory-text plan-category-text plan design">설계</h3>
								</div><!-- close .one-milestone-mainCategory-box -->
								
								<div class="checkbox-title-Area design">
									<div class="checkbox-title design">
										<span class="checklist-title-all-element-box design">
											<span class="checklist-title-icon material-symbols-outlined design">check_box</span>
											<span class="checklist-title-txt plan-check-title design">CheckList</span>
										</span>
									</div>
								</div>
								
								<div class="all-milestone-Content-and-btn-box">
									<div class="one-milestone-mainContent-box plan-mainContent-box plan design">
										<div class="milestone-checkList-box plan-checkList plan design">
											
											
											
											
											<%-- CheckBox 목록 하나 --%>
											<div class="one-milestone-checkbox plan-check plan design">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox design">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan">
													<%-- Edit --%>
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													<%-- Delete --%>
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->

											
											<%-- CheckBox 목록 하나 --%>
											<div class="one-milestone-checkbox plan-check plan design">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox design">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan design">
													<%-- Edit --%>
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info design" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													<%-- Delete --%>
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											<%-- CheckBox 목록 하나 --%>
											<div class="one-milestone-checkbox plan-check plan design">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox design">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan design">
													<%-- Edit --%>
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info design" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													<%-- Delete --%>
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											<%-- CheckBox 목록 하나 --%>
											<div class="one-milestone-checkbox plan-check plan design">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox design">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan design">
													<%-- Edit --%>
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info design" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													<%-- Delete --%>
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											<%-- CheckBox 목록 하나 --%>
											<div class="one-milestone-checkbox plan-check plan design">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox design">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan design">
													<%-- Edit --%>
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info design" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													<%-- Delete --%>
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											<%-- CheckBox 목록 하나 --%>
											<div class="one-milestone-checkbox plan-check plan design">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox design">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan design">
													<%-- Edit --%>
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info design" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													<%-- Delete --%>
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											<%-- CheckBox 목록 하나 --%>
											<div class="one-milestone-checkbox plan-check plan design">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox design">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan design">
													<%-- Edit --%>
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info design" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													<%-- Delete --%>
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											
											



											
		
										</div><!-- close .milestone-checkList-box .plan-checkList .plan -->
									</div><!-- close .one-milestone-mainContent-box .plan-mainContent-box .plan -->
									
									
									<div class="milestone-add-list-btn-Area">
										
										<div class="milestone-add-list-btn-box design">
											<button type="button" class="milestone-add-list-btn btn btn-light plan-list-add-btn design">
												<span class="milestone-add-btn-icon material-symbols-outlined design">add</span>
											</button>
										</div><!-- close .milestone-add-list-btn-box -->
									
									</div><!-- close .milestone-add-list-btn-Area -->
									
								</div><!-- close .all-milestone-Content-and-btn-box -->
								
								
							</div><!-- close .one-milestone-Parent-Box -->
						</div><!-- close .one-milestone-main-box -->
					</div><!-- close .col-6 .one-milestone-Parent-Area [기획 마일스톤 영역 종료] -->
					
					

					<%--▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ --%>
					<%--▩▩▩▩▩▩[구현 마일스톤 전체 영역]▩▩▩▩▩▩--%>
					<%--▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ --%>
					<div class="col-6 one-milestone-Parent-Area implement">
						<div class="one-milestone-main-box implement">
							<div class="milestone-progress-Area plan implement">

								  <div class="progress-bar-percent-Box implement">
								  	
								  	<div class="milestone-progress-all-area implement">
									  	<%-- Progress-bar 트랙 영역 --%>
										<div class="progress milestone-progress-box plan-progress-box plan implement" role="progressbar" aria-label="Info example" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
										  	
										  	<%-- Progress-bar 칠해지는 영역 --%>
										  	<div class="progress-bar milestone-progress-bar plan text-dark implement">
										  	</div><!-- close .progress-bar milestone-progress-bar plan text-dark -->
										  	
										</div><!-- close .progress milestone-progress-box plan-progress-box plan -->
									</div><!-- close .milestone-progress-all-area -->
								  	
								  	<div class="progress-bar-percent-miniBox implement">
								  		<span class="progress-bar-percent-content implement">50%</span>	
								  	</div><!-- close .progress-bar-percent-miniBox -->
								  	
								  </div><!-- close .progress-bar-percent-Box -->
							  
							</div>
							
							<div class="milestone-step-numberBox implement">
								<span class="milestone-step-number implement">STEP 3</span>
							</div>
						
							<div class="one-milestone-Parent-Box">
								<div class="one-milestone-mainCategory-box plan-category-box plan implement">
									<h3 class="milestone-mainCategory-text plan-category-text plan implement">구현</h3>
								</div><!-- close .one-milestone-mainCategory-box -->
								
								<div class="checkbox-title-Area implement">
									<div class="checkbox-title implement">
										<span class="checklist-title-all-element-box implement">
											<span class="checklist-title-icon material-symbols-outlined implement">check_box</span>
											<span class="checklist-title-txt plan-check-title implement">CheckList</span>
										</span>
									</div>
								</div>
								
								<div class="all-milestone-Content-and-btn-box implement">
									<div class="one-milestone-mainContent-box plan-mainContent-box plan implement">
										<div class="milestone-checkList-box plan-checkList plan implement">
											
											
											
											
											<%-- CheckBox 목록 하나 --%>
											<div class="one-milestone-checkbox plan-check plan implement">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox implement">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan implement">
													<%-- Edit --%>
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													<%-- Delete --%>
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											<%-- CheckBox 목록 하나 --%>
											<div class="one-milestone-checkbox plan-check plan implement">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox implement">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan implement">
													<%-- Edit --%>
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													<%-- Delete --%>
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											<%-- CheckBox 목록 하나 --%>
											<div class="one-milestone-checkbox plan-check plan implement">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox implement">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan implement">
													<%-- Edit --%>
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													<%-- Delete --%>
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											
											<%-- CheckBox 목록 하나 --%>
											<div class="one-milestone-checkbox plan-check plan implement">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox implement">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan implement">
													<%-- Edit --%>
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													<%-- Delete --%>
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											
											<%-- CheckBox 목록 하나 --%>
											<div class="one-milestone-checkbox plan-check plan implement">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox implement">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan implement">
													<%-- Edit --%>
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													<%-- Delete --%>
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											
											<%-- CheckBox 목록 하나 --%>
											<div class="one-milestone-checkbox plan-check plan implement">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox implement">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan implement">
													<%-- Edit --%>
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													<%-- Delete --%>
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											


											
		
										</div><!-- close .milestone-checkList-box .plan-checkList .plan -->
									</div><!-- close .one-milestone-mainContent-box .plan-mainContent-box .plan -->
									
									
									<div class="milestone-add-list-btn-Area">
										
										<div class="milestone-add-list-btn-box implement">
											<button type="button" class="milestone-add-list-btn btn btn-light plan-list-add-btn implement">
												<span class="milestone-add-btn-icon material-symbols-outlined implement">add</span>
											</button>
										</div><!-- close .milestone-add-list-btn-box -->
									
									</div><!-- close .milestone-add-list-btn-Area -->
									
								</div><!-- close .all-milestone-Content-and-btn-box -->
								
								
							</div><!-- close .one-milestone-Parent-Box -->
						</div><!-- close .one-milestone-main-box -->
					</div><!-- close .col-6 .one-milestone-Parent-Area [기획 마일스톤 영역 종료] -->
					
					
					
					

					<%--▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ --%>
					<%--▩▩▩▩▩▩[결산 마일스톤 전체 영역]▩▩▩▩▩▩--%>
					<%--▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ --%>
					<div class="col-6 one-milestone-Parent-Area settlement">
						<div class="one-milestone-main-box settlement">
							<div class="milestone-progress-Area plan settlement">

								  <div class="progress-bar-percent-Box settlement">
								  	
								  	<div class="milestone-progress-all-area settlement">
									  	<%-- Progress-bar 트랙 영역 --%>
										<div class="progress milestone-progress-box plan-progress-box plan settlement" role="progressbar" aria-label="Info example" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
										  	
										  	<%-- Progress-bar 칠해지는 영역 --%>
										  	<div class="progress-bar milestone-progress-bar plan text-dark settlement">
										  	</div><!-- close .progress-bar milestone-progress-bar plan text-dark -->
										  	
										</div><!-- close .progress milestone-progress-box plan-progress-box plan -->
									</div><!-- close .milestone-progress-all-area -->
								  	
								  	<div class="progress-bar-percent-miniBox settlement">
								  		<span class="progress-bar-percent-content settlement">50%</span>	
								  	</div><!-- close .progress-bar-percent-miniBox -->
								  	
								  </div><!-- close .progress-bar-percent-Box -->
							  
							</div>
							
							<div class="milestone-step-numberBox settlement">
								<span class="milestone-step-number settlement">STEP 4</span>
							</div>
						
							<div class="one-milestone-Parent-Box">
								<div class="one-milestone-mainCategory-box plan-category-box plan settlement">
									<h3 class="milestone-mainCategory-text plan-category-text plan settlement">결산</h3>
								</div><!-- close .one-milestone-mainCategory-box -->
								
								<div class="checkbox-title-Area">
									<div class="checkbox-title">
										<span class="checklist-title-all-element-box settlement">
											<span class="checklist-title-icon material-symbols-outlined settlement">check_box</span>
											<span class="checklist-title-txt plan-check-title settlement">CheckList</span>
										</span>
									</div>
								</div>
								
								<div class="all-milestone-Content-and-btn-box settlement">
									<div class="one-milestone-mainContent-box plan-mainContent-box plan settlement">
										<div class="milestone-checkList-box plan-checkList plan settlement">
											
											
											
											
											<%-- CheckBox 목록 하나 --%>
											<div class="one-milestone-checkbox plan-check plan settlement">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox settlement">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan settlement">
													<%-- Edit --%>
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													<%-- Delete --%>
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											
											
											<%-- CheckBox 목록 하나 --%>
											<div class="one-milestone-checkbox plan-check plan settlement">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox settlement">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan settlement">
													<%-- Edit --%>
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													<%-- Delete --%>
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											
											
											<%-- CheckBox 목록 하나 --%>
											<div class="one-milestone-checkbox plan-check plan settlement">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox settlement">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan settlement">
													<%-- Edit --%>
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													<%-- Delete --%>
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											
											
											<%-- CheckBox 목록 하나 --%>
											<div class="one-milestone-checkbox plan-check plan settlement">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox settlement">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan settlement">
													<%-- Edit --%>
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													<%-- Delete --%>
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											
											
											<%-- CheckBox 목록 하나 --%>
											<div class="one-milestone-checkbox plan-check plan settlement">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox settlement">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan settlement">
													<%-- Edit --%>
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													<%-- Delete --%>
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											
		
										</div><!-- close .milestone-checkList-box .plan-checkList .plan -->
									</div><!-- close .one-milestone-mainContent-box .plan-mainContent-box .plan -->
									
									
									<div class="milestone-add-list-btn-Area">
										
										<div class="milestone-add-list-btn-box">
											<button type="button" class="milestone-add-list-btn btn btn-light plan-list-add-btn">
												<span class="milestone-add-btn-icon material-symbols-outlined">add</span>
											</button>
										</div><!-- close .milestone-add-list-btn-box -->
									
									</div><!-- close .milestone-add-list-btn-Area -->
									
								</div><!-- close .all-milestone-Content-and-btn-box -->
								
								
							</div><!-- close .one-milestone-Parent-Box -->
						</div><!-- close .one-milestone-main-box -->
					</div><!-- close .col-6 .one-milestone-Parent-Area [기획 마일스톤 영역 종료] -->
					
					
					
					
					
					<div class="col-6 one-milestone-Parent-Area">
					</div>
					
					
					<div class="col-6 one-milestone-Parent-Area">
					</div>
					
				
				</div><!-- close .milestone-parent-Area -->
			</div><!-- close .milestone-mainParent-Area -->
			
			<div class="col-2 milestone-side-Parent-Area" style="border: 1px solid aqua;">
			
			</div>
		</div>
		
</div><!-- end .row -->


<div class="modal fade" id="more-check-content" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body checkbox-modal-content">
        <!-- 클릭한 span class="milestone-" 에 따라 출력 내용이 달라지도록 J-Query 에서 처리. -->
      </div>
    </div>
  </div>
</div>












<script type="text/javascript">

	const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
	const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
	
</script>

</body>
</html>