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
<title>${planCheckList[0].prj_name }의 마일스톤 페이지</title>

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

<!--========[마일스톤 페이지 스크립트 처리 시작]=========-->
<script type="text/javascript">

	$(document).ready(function()
	{
		//=======[체크박스 체크 여부 Ajax 처리로 갱신]==========
		$(".checkList-checkbox").click(function()
		{
			// 테스트
			//alert("체크 확인");
			
			//alert("체크 코드 : " + $(this).val());
			//--==>> 체크 코드 : CK0014
			
			var checklist_code = $(this).val();
			
			//*******************************************************
			// POST 방식으로 체크리스트 갱신 컨트롤러 동작 url 요청
			//*******************************************************
			$.ajax(
			{
				type: "POST"
				, url: "check.action"
				, data: "checklist_code=" + checklist_code
				
			});
			
		});
		//=======================================================
			
		$("#plan-add-btn").click(function()
		{
			// 테스트
			//alert("클릭 확인");
			
		});
		
		
		
		//=======[마일스톤 체크리스트 항목 추가 Ajax 이후 리다이렉트로 갱신]==========
		$(".new-content-submit").click(function()
		{
			// 테스트
			//alert("Submit 버튼 클릭 확인");
			
			//----------------------------------------------------------
			// [사용자가 새롭게 입력한 체크리스트 항목 내용 확인]
			//----------------------------------------------------------
			//alert("체크리스트 내용 : " + $("#design-new-list-content").val());
			//----------------------------------------------------------
			
			//----------------------------------------------------------
			// [사용자가 추가하려고 하는 마일스톤 단계 대분류명 확인]
			//----------------------------------------------------------
			//alert("단계명 : " + $(this).val());
			//----------------------------------------------------------
			
			
			//-----------------------------------------------------------------------------
			// [클릭된 submit 버튼이 포함된 마일스톤 대분류의 input 엘리먼트 id 가져오기]
			//-----------------------------------------------------------------------------
			// alert($(this).parent(".checkbox-all-btn-box").siblings(".add-checklist-content-box")
			//			 .children(".add-checklist-content").attr("id"));
			//-----------------------------------------------------------------------------
			
			var new_inputCheckBox_id = "#" + $(this).parent(".checkbox-all-btn-box")
											  .siblings(".add-checklist-content-box")
			 								  .children(".add-checklist-content").attr("id");
			
			/*  
			(String v_cp_code, String v_ma_code, String v_step, String v_content)
			*/
			var v_cp_code = "CP0001";
			var v_ma_code = "MA0001";
			var v_step = $(this).val();
			var v_content = $(new_inputCheckBox_id).val();
			

			
			$.ajax(
			{
				type: "POST"
				, url: "checklist_insert.action"
				, data: "v_cp_code="	+ v_cp_code
					  + "&v_ma_code="	+ v_ma_code
					  + "&v_step="		+ v_step
					  + "&v_content="	+ v_content
				, success: function()
				{
					$(location).attr("href", "Milestone.action");
				}
				, error: function()
				{
					//$(location).attr("href", "Milestone.action");
					
				}
			});
			 
		});
		
		
		/*
		【[+] 항목 추가 버튼 로직 정리】▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩

		[+] 버튼 클릭 (클래스 : [.new-checklist-item-btn]

		부모 선택 .parent (클래스 : [.new-checklist-item-btn-box])

		부모 선택 .parent (클래스 : [.new-checklist-item-btn-Area])

		형제 선택 .siblings (클래스 : [.one-milestone-mainContent-box])

		자식 선택 .children (클래스 : [.milestone-checkList-box])

		자식 선택 .children (클래스 : [.add-checklist-box])

		**********************************************
		① 스타일 변경 → display : flex
		**********************************************
		
		▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩
		*/
		
		/*[항목 추가버튼 클릭시, 입력창이 보여지도록 처리.]*/
		$(".new-checklist-item-btn").click(function()
		{
			// 테스트
			//alert("항목 추가버튼 클릭 확인");
			
			// [버튼의 css 를 변경하기 위한 엘리먼트 변수 선언]========================
			
			// ↓ (버튼 엘리먼트)
			var add_list_btn_ele = $(this);
			// ↓ (버튼의 아이콘 엘리먼트)
			var add_list_plus_icon_ele = $(this).children(".milestone-add-btn-icon");
			//=========================================================================
			
			var add_ckList_box = $(this).parent(".new-checklist-item-btn-box").parent(".new-checklist-item-btn-Area")
				   						.siblings(".one-milestone-mainContent-box").children(".milestone-checkList-box")
				   						.children(".add-checklist-box");
			
			// [제대로 선택했는지 확인]
			//alert("선택한 요소 확인 : " + add_ckList_box.html());
			
			/**********************************************
			 ① 스타일 변경 → display : flex
			**********************************************/
			
			//alert("스타일 확인 : " + add_ckList_box.css("display"));
			//--==>> 스타일 확인 : none
			//--==>> 스타일 확인 : flex
			
			
			// [추가 입력항목창이 숨겨진 상태라면, 보이도록 설정]
			if (add_ckList_box.css("display") == "none")
			{
				//alert("숨겨진 상태이므로 보이도록 설정한다.");
				add_ckList_box.css("display", "flex");
				
				//=====================================================================================
				// 항목을 새롭게 추가하는 경우, [+] 버튼이 취소 버튼으로 변경되기 위해
				// 클릭한 항목 추가버튼의 아이콘이 [Ⅹ] 모양으로 변경되고, 버튼 색이 변경되도록 변경.
				//=====================================================================================
				
				add_list_btn_ele.css({"background":"#eb6f6f", "border":"1px solid #d56363"});
				add_list_plus_icon_ele.css("transform", "rotate(50deg)");

				//=====================================================================================
				
				
			}
			else if (add_ckList_box.css("display") == "flex")
			{
				var input_add_ckList_ele = add_ckList_box.children(".add-checklist-content-box")
														 .children(".add-checklist-content");
				
				// ① 입력창 항목 전부 삭제
				input_add_ckList_ele.val("");
				
				// ② 스타일 변경 → display : none
				add_ckList_box.css("display", "none");
				
				//=====================================================================
				// ★★[위에서 제이쿼리로 변경했던 스타일을 삭제하여 스타일 초기화]
				//=====================================================================
				add_list_btn_ele.removeAttr("style");
				add_list_plus_icon_ele.removeAttr("style");
				//=====================================================================
				
				
			}
					
		});
		
		
		
		
		
		/*
		【cancel 버튼 로직 정리】▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩

		cancel 버튼 클릭 (클래스 : [.milestone-del-btn])

		부모 선택 .parent (클래스 : [.checkbox-all-btn-box])
		
		부모 선택 .parent (클래스 : [.add-checklist-box])
		
		********************************************************************
		① 입력창 항목 전부 삭제
		$(".add-checklist-box").children(".add-checklist-content-box")
							   .children(".add-checklist-content").val("");
		********************************************************************
		
		********************************************************************
		② 스타일 변경 → display : none
		********************************************************************
		
		▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩
		
		*/
		
		
		
		$(".milestone-add-cancel-btn").click(function()
		{
			// 테스트
			// alert("cancel 버튼 클릭 확인.");
			
			
			// [새로운 항목 추가 입력창 전체를 감싸는 div 엘리먼트]
			var add_ckList_box = obj.parent(".checkbox-all-btn-box").parent(".add-checklist-box");
			
			// [새로운 항목 추가 입력창 input 엘리먼트]
			var input_content_box = add_ckList_box.children(".add-checklist-content-box").children(".add-checklist-content");
			
			
			//********************************************************************
			/* 	① 입력창 항목 전부 삭제
				$(".add-checklist-box").children(".add-checklist-content-box")
									   .children(".add-checklist-content").val("");
			*/
			//********************************************************************
			
			// 입력값 모두 초기화
			input_content_box.val("");
			
		   /*********************************************************************
			② 스타일 변경 → display : none
			*********************************************************************/
			
			add_ckList_box.css("display", "none");
			
			
		});
		
		
		
		
	});// end $(document).ready(function(){ });

	
	
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
											
											
											
											<c:forEach var="planItem" items="${planCheckList }">
												<%-- CheckBox 목록 하나 --%>
												<div class="one-milestone-checkbox plan-check plan">
													
														<input type="checkbox" value="${planItem.checklist_code }" class="plan-checkbox checkList-checkbox"
														${planItem.is_checked == 1 ? "checked='on'" : "" }
														>
														<span class="milestone-checkbox-content">${planItem.checklist_content }</span>
													
													<div class="checkbox-all-btn-box plan">
														<%-- Edit --%>
														<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" 
																value="${planItem.checklist_code }">
															
															<span class="milestone-edit-content">
																<span class="milestone-edit-btn-text">edit</span>
																<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
															</span>
															
														</button>
														
														
														<%-- Delete --%>
														<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger"
																value="${planItem.checklist_code }">
															<span class="milestone-del-content">
																<span class="milestone-del-btn-text">delete</span>
																<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
															</span>
														</button>
														
														
													</div><!-- close .checkbox-all-btn-box .plan -->
													
												</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											</c:forEach>
											
											<%--[ 「+」 버튼 클릭시, 기획 체크리스트 목록 추가 입력창 ]--%>
												<div class="add-checklist-box one-milestone-checkbox plan-check plan" id="plan-add-divBox">
													
													<div class="add-checklist-content-box">
														<input type="text" class="add-checklist-content" id="plan-new-list-content" placeholder="새로운 항목을 입력하세요!">
													</div>
													
													<div class="checkbox-all-btn-box plan">
													
														<%-- submit 버튼 --%>
														<button type="button" id="plan-add-submit" class="new-content-submit milestone-add-list-btn checkbox-btn edit-check-btn btn btn-sm btn-outline-info"
														value="기획" >
															
															<span class="milestone-add-list-content milestone-edit-content">
																<span class="milestone-add-list-text milestone-edit-btn-text">submit!</span>
																<span class="milestone-add-list-btn-icon milestone-edit-btn-icon material-symbols-outlined">task_alt</span>
															</span>
															
														</button>
														
														
														<%-- cancel 버튼  --%>
														<button type="button" id="plan-add-cancel" class="milestone-add-cancel-btn milestone-del-btn checkbox-btn delete-check-btn btn btn-sm btn-outline-danger">

															<span class="milestone-add-cancel-content milestone-del-content">
																<span class="milestone-add-cancel-text milestone-del-btn-text">cancel</span>
																<span class="milestone-add-cancel-icon milestone-delete-btn-icon material-symbols-outlined">cancel</span>
															</span>
															
														</button>
														
														
													</div><!-- close .checkbox-all-btn-box .plan -->
												</div><!-- close .one-milestone-checkbox .plan-check .plan -->
												
											
											
											
											
<%-- 											
											
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan">

												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox">

													<span class="milestone-checkbox-content">
														무엇무엇을 해야함!
													</span>
												</form>
												
												<div class="checkbox-all-btn-box plan">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox">
													<span class="milestone-checkbox-content">
													일이삼사오육칠팔구십일이삼사오육칠팔
													</span>
												</form>
												
												<div class="checkbox-all-btn-box plan">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox">

													<span class="milestone-checkbox-content">
														이것은 테스트를 위해 상당히 길게 쓰는 목표입니다. 글자가 오버플로우 됐을 때만 툴팁이 나타나게 하고 싶은데 잘 안 되네요...
													</span>
													
												</form>
												
												<div class="checkbox-all-btn-box plan">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->

 --%>

											
											
											
											
											
		
										</div><!-- close .milestone-checkList-box .plan-checkList .plan -->
									</div><!-- close .one-milestone-mainContent-box .plan-mainContent-box .plan -->
									
									
									<div class="new-checklist-item-btn-Area milestone-add-list-btn-Area">
										
										<div class="new-checklist-item-btn-box milestone-add-list-btn-box">
											<button type="button" id="plan-add-btn" class="new-checklist-item-btn milestone-add-list-btn btn btn-light plan-list-add-btn">
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
											
											
											
											<c:forEach var="designItem" items="${designCheckList }">
												<%-- CheckBox 목록 하나 --%>
												<div class="one-milestone-checkbox plan-check plan design">
													
													<form name="checkform" action="/check.action" method="get">
														<input type="checkbox" value="${designItem.checklist_code }"  class="plan-checkbox design checkList-checkbox"
														${designItem.is_checked == 1 ? "checked='on'" : "" }>
														<span class="milestone-checkbox-content">${designItem.checklist_content }</span>
													</form>
													
													<div class="checkbox-all-btn-box plan">
														<%-- Edit --%>
														<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="${designItem.checklist_code }">
															
															<span class="milestone-edit-content">
																<span class="milestone-edit-btn-text">edit</span>
																<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
															</span>
															
														</button>
														
														
														<%-- Delete --%>
														<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="${designItem.checklist_code }">
															<span class="milestone-del-content">
																<span class="milestone-del-btn-text">delete</span>
																<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
															</span>
														</button>
														
														
													</div><!-- close .checkbox-all-btn-box .plan -->
													
												</div><!-- close .one-milestone-checkbox .plan-check .plan -->
												
												
												
											</c:forEach>
											
												<%--[ 「+」 버튼 클릭시, 설계 체크리스트 목록 추가 입력창 ]--%>
												<div class="one-milestone-checkbox plan-check plan design add-checklist-box">
													
													<div class="add-checklist-content-box">
														<input type="text" class="add-checklist-content" id="design-new-list-content" placeholder="새로운 항목을 입력하세요!">
													</div>
													
													<div class="checkbox-all-btn-box plan">
													
														<%-- submit 버튼 --%>
														<button type="button" class="new-content-submit milestone-add-list-btn checkbox-btn edit-check-btn btn btn-sm btn-outline-info"
														value="설계" >
															
															<span class="milestone-add-list-content milestone-edit-content">
																<span class="milestone-add-list-text milestone-edit-btn-text">submit!</span>
																<span class="milestone-add-list-btn-icon milestone-edit-btn-icon material-symbols-outlined">task_alt</span>
															</span>
															
														</button>
														
														
														<%-- cancel 버튼  --%>
														<button type="button" class="milestone-add-cancel-btn milestone-del-btn checkbox-btn delete-check-btn btn btn-sm btn-outline-danger">

															<span class="milestone-del-content milestone-add-cancel-content">
																<span class="milestone-add-cancel-text milestone-del-btn-text">cancel</span>
																<span class="milestone-add-cancel-icon milestone-delete-btn-icon material-symbols-outlined">cancel</span>
															</span>
															
														</button>
														
														
													</div><!-- close .checkbox-all-btn-box .plan -->
												</div><!-- close .one-milestone-checkbox .plan-check .plan -->
												
											
<%-- 											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan design">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox design">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->

											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan design">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox design">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan design">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info design" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan design">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox design">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan design">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info design" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan design">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox design">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan design">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info design" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan design">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox design">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan design">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info design" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											
 --%>											
											


											
		
										</div><!-- close .milestone-checkList-box .plan-checkList .plan -->
									</div><!-- close .one-milestone-mainContent-box .plan-mainContent-box .plan -->
									
									
									<div class="new-checklist-item-btn-Area milestone-add-list-btn-Area">
										
										<div class="new-checklist-item-btn-box milestone-add-list-btn-box design">
											<button type="button" class="new-checklist-item-btn milestone-add-list-btn btn btn-light plan-list-add-btn design">
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
											
											
											
											<c:forEach var="implementItem" items="${implementCheckList }">
												<%-- CheckBox 목록 하나 --%>
												<div class="one-milestone-checkbox plan-check plan implement">
													
													<form name="checkform" action="/check.action" method="get">
														<input type="checkbox" val="${implementItem.checklist_code }"  class="plan-checkbox implement checkList-checkbox"
														${implementItem.is_checked == 1 ? "checked='on'" : "" }>
														<span class="milestone-checkbox-content">${implementItem.checklist_content }</span>
													</form>
													
													<div class="checkbox-all-btn-box plan implement">
														<%-- Edit --%>
														<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info"
																value="${implementItem.checklist_code }">
															
															<span class="milestone-edit-content">
																<span class="milestone-edit-btn-text">edit</span>
																<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
															</span>
															
														</button>
														
														
														<%-- Delete --%>
														<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" 
																value="${implementItem.checklist_code }">
															<span class="milestone-del-content">
																<span class="milestone-del-btn-text">delete</span>
																<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
															</span>
														</button>
														
														
													</div><!-- close .checkbox-all-btn-box .plan -->
													
												</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											</c:forEach>
											
											<%--[ 「+」 버튼 클릭시, 『구현』 체크리스트 목록 추가 입력창 ]--%>
												<div class="one-milestone-checkbox plan-check plan implement add-checklist-box">
													
													<div class="add-checklist-content-box">
														<input type="text" class="add-checklist-content" id="implement-new-list-content" placeholder="새로운 항목을 입력하세요!">
													</div>
													
													<div class="checkbox-all-btn-box implement">
													
														<%-- submit 버튼 --%>
														<button type="button" class="new-content-submit milestone-add-list-btn checkbox-btn edit-check-btn btn btn-sm btn-outline-info"
														value="구현" >
															
															<span class="milestone-add-list-content milestone-edit-content">
																<span class="milestone-add-list-text milestone-edit-btn-text">submit!</span>
																<span class="milestone-add-list-btn-icon milestone-edit-btn-icon material-symbols-outlined">task_alt</span>
															</span>
															
														</button>
														
														
														<%-- cancel 버튼  --%>
														<button type="button" class="milestone-add-cancel-btn milestone-del-btn checkbox-btn delete-check-btn btn btn-sm btn-outline-danger">

															<span class="milestone-del-content milestone-add-cancel-content">
																<span class="milestone-add-cancel-text milestone-del-btn-text">cancel</span>
																<span class="milestone-add-cancel-icon milestone-delete-btn-icon material-symbols-outlined">cancel</span>
															</span>
															
														</button>
														
														
													</div><!-- close .checkbox-all-btn-box .plan -->
												</div><!-- close .one-milestone-checkbox .plan-check .plan -->
												
												
											
<%-- 											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan implement">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox implement">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan implement">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan implement">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox implement">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan implement">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan implement">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox implement">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan implement">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan implement">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox implement">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan implement">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan implement">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox implement">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan implement">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan implement">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox implement">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan implement">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											

 --%>
											
		
										</div><!-- close .milestone-checkList-box .plan-checkList .plan -->
									</div><!-- close .one-milestone-mainContent-box .plan-mainContent-box .plan -->
									
									
									<div class="new-checklist-item-btn-Area milestone-add-list-btn-Area">
							
										<div class="new-checklist-item-btn-box milestone-add-list-btn-box implement">
											<button type="button"  class="new-checklist-item-btn milestone-add-list-btn btn btn-light plan-list-add-btn implement">
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
											
											
											
											<c:forEach var="settlementItem" items="${settlementCheckList }">
												<%-- CheckBox 목록 하나 --%>
												<div class="one-milestone-checkbox plan-check plan settlement">
													
													<form name="checkform" action="/check.action" method="get">
														<input type="checkbox" val="${settlementItem.checklist_code }"  class="plan-checkbox settlement checkList-checkbox"
														${settlementItem.is_checked == 1 ? "checked='on'" : "" }>
														
														<span class="milestone-checkbox-content">${settlementItem.checklist_content }</span>
													</form>
													
													<div class="checkbox-all-btn-box plan settlement">
														<%-- Edit --%>
														<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" 
																value="${settlementItem.checklist_code }">
															
															<span class="milestone-edit-content">
																<span class="milestone-edit-btn-text">edit</span>
																<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
															</span>
															
														</button>
														
														
														<%-- Delete --%>
														<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" 
																value="${settlementItem.checklist_code }">
															<span class="milestone-del-content">
																<span class="milestone-del-btn-text">delete</span>
																<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
															</span>
														</button>
														
														
													</div><!-- close .checkbox-all-btn-box .plan -->
													
												</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											</c:forEach>
											
											<%--[ 「+」 버튼 클릭시, 『결산』 체크리스트 목록 추가 입력창 ]--%>
												<div class="one-milestone-checkbox plan-check plan settlement add-checklist-box">
													
													<div class="add-checklist-content-box">
														<input type="text" class="add-checklist-content" id="settlement-new-list-content" placeholder="새로운 항목을 입력하세요!">
													</div>
													
													<div class="checkbox-all-btn-box plan">
													
														<%-- submit 버튼 --%>
														<button type="button" class="new-content-submit milestone-add-list-btn checkbox-btn edit-check-btn btn btn-sm btn-outline-info"
														value="결산" >
															
															<span class="milestone-add-list-content milestone-edit-content">
																<span class="milestone-add-list-text milestone-edit-btn-text">submit!</span>
																<span class="milestone-add-list-btn-icon milestone-edit-btn-icon material-symbols-outlined">task_alt</span>
															</span>
															
														</button>
														
														
														<%-- cancel 버튼  --%>
														<button type="button" class="milestone-add-cancel-btn milestone-del-btn checkbox-btn delete-check-btn btn btn-sm btn-outline-danger">

															<span class="milestone-del-content milestone-add-cancel-content">
																<span class="milestone-add-cancel-text milestone-del-btn-text">cancel</span>
																<span class="milestone-add-cancel-icon milestone-delete-btn-icon material-symbols-outlined">cancel</span>
															</span>
															
														</button>
														
														
													</div><!-- close .checkbox-all-btn-box .plan -->
												</div><!-- close .one-milestone-checkbox .plan-check .plan -->
												
											
	<%-- 										
											
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan settlement">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox settlement">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan settlement">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan settlement">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox settlement">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan settlement">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan settlement">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox settlement">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan settlement">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan settlement">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox settlement">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan settlement">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
			 --%>								
											
											
		
										</div><!-- close .milestone-checkList-box .plan-checkList .plan -->
									</div><!-- close .one-milestone-mainContent-box .plan-mainContent-box .plan -->
									
									
									<div class="new-checklist-item-btn-Area milestone-add-list-btn-Area">
										
										<div class="new-checklist-item-btn-box milestone-add-list-btn-box">
											<button type="button" class="new-checklist-item-btn milestone-add-list-btn btn btn-light plan-list-add-btn">
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