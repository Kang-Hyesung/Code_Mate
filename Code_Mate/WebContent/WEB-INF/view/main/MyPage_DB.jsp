<%@page import="com.test.mybatis.dto.MyPage_PostDTO"%>
<%@page import="com.test.mybatis.dto.MyPageMethod"%>
<%@page import="com.test.mybatis.dto.MemberDTO"%>
<%@page import="java.util.AbstractCollection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<%

	// [실력 등급 계산 및 아이콘, 텍스트 출력]
	//==================================================================
	MyPageMethod mpm = new MyPageMethod();

	int backendScore = (int) request.getAttribute("backendScore");
	int frontendScore = (int) request.getAttribute("frontendScore");

	String[] backScoreIconArr = mpm.skillGradeIcon(cp, backendScore);
	String[] frontScoreIconArr = mpm.skillGradeIcon(cp, frontendScore);
	
	String backScoreIcon = backScoreIconArr[0];
	String backScoreTxt = backScoreIconArr[1];
	
	String frontScoreIcon = frontScoreIconArr[0];
	String frontScoreTxt = frontScoreIconArr[1];
	//==================================================================
	
	// [공개한 프로젝트 이력 개수 출력 테스트]==========================
	/* 
	ArrayList<MyPage_PjHistoryDTO> pjHistoryList = (ArrayList<MyPage_PjHistoryDTO>) request.getAttribute("pjHistoryList");

	System.out.println("공개한 프로젝트 이력 개수 : " + pjHistoryList.size()); 
	*/
	//==================================================================

	
	// [작성한 게시글의 작성 시간 현재 시간 기준 계산값 출력 테스트]
			
	ArrayList<MyPage_PostDTO> postList = (ArrayList<MyPage_PostDTO>) request.getAttribute("postList");
	
	ArrayList<String> postPrevTimeArr = new ArrayList<String>();
	
	
	System.out.println("시간 출력 테스트입니다.");
	for (MyPage_PostDTO post : postList)
	{
		String result = "";
		
		System.out.println(post.getPost_prev_month());
		System.out.println(post.getPost_prev_day());
		System.out.println(post.getPost_prev_hour());
		System.out.println(post.getPost_prev_minute());
		
		int month = post.getPost_prev_month();
		int day = post.getPost_prev_day();
		int hour = post.getPost_prev_hour();
		int minute = post.getPost_prev_minute();
		
		if (month > 0)
		{
			if (month == 1)
			{
				result = String.format("%d month", month);	
				postPrevTimeArr.add(result);
			}
			else
			{
				result = String.format("%d months", month);	
				postPrevTimeArr.add(result);
			}
		}
		
		
	}
	
	
	
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<!-- BootStrap -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<!-- JQuery -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>

<!-- ionicons -->
<script type="module"
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script type="module"
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

<!-- Google Fonts - Icon -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

<!-- Template Style [css import] -->
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/banner_side.css" />

<!-- Board Style [css import] -->
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/wool_board_style.css" />

<!-- Mypage Style [css import] -->
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/mypage_style.css" />


<style type="text/css">

/*====================================================================*/
/*=======================[마이페이지 구성 명세]=======================*/
/*====================================================================*/

/* 최상단 - 마이페이지 내 정보 수정 버튼 */

/* 마이페이지 상단 프로필 영역 */
/* - 프로필 이미지, 닉네임, 이메일 백엔드 / 프론트엔드 실력 등급 */

/* 마이페이지 1페이지 본문 첫 번째 영역 - [개인정보]*/
/* - 성별(*), 생년월일(*), 가입일, MBTI */
/* - 경력(*) : 회사명, 근속기간, 경력 등록일 */

/* 마이페이지 1페이지 본문 두 번째 영역 - [참여 이력] */
/* - 주요 스킬(사용언어, 기술), 완료된 프로젝트와 미완료된 프로젝트 비율
   - 참여한 프로젝트명, 담당 직무, 시작일/종료일, 완료/미완료 */

/* 마이페이지 2페이지 본문 영역 - [본인이 작성한 게시글 리스트]  */

/* 마이페이지 3페이지 본문 영역 - [본인이 작성한 댓글 리스트] */

/*====================================================================*/
/*====================================================================*/
/*====================================================================*/

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
	
	 .alarm-btn {
    background-color: #f8f9fa;
    border: #f8f9fa;
    color: #4f59ca;
    padding: 0 5px 0 5px;
	transition-property: all;
	transition-duration:0.5s;
	border-radius: 50%;
	font-size: 20px;
	line-height: 30px;
	
}
	.alarm-btn:hover {
    color: var(--bs-btn-hover-color);
    background-color: #4f59ca;
    }


</style>



<script type="text/javascript">

 	$(document).ready(function()
	{
		// 테스트
		//alert("확인")
		
		$("p.card-text.project-desc").each(function()
		{
			var pjTxtLen = $(this).text().replaceAll("\t", '').replaceAll(" ", '').length;
			
			if (pjTxtLen > 40)
			{	
				//alert(pjTxtLen);
				$(this).siblings(".view-control-btn").css("display", "block");
				
			}
		});
		
		$("a#showMore").click(function()
		{
			//alert("확인");

			// 탭 제거, 공백 제거, 개행 제거
			var btnTxt = $(this).html().replaceAll("\t", "").replaceAll(" ", "").replaceAll("\n", "");
			
			//alert(btnTxt);
			//--==>> 요약 더보기
			
			if (btnTxt == "요약더보기")
			{
				$(this).html("접기");
			}
			else
			{
				$(this).html("요약 더보기");
			}
			
			$(this).parent(".view-control-btn").siblings("div#pj-desc-body").children(".card.card-body.pj-more-desc-box").css("display", "-webkit-inline-box");
			
		});
		
	}); 
 	
 	const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
	const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
	
	  $( function () {
    $( '[data-bs-toggle="popover"]' ).popover()
  } );

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
	
	 .alarm-btn {
    background-color: #f8f9fa;
    border: #f8f9fa;
    color: #4f59ca;
    padding: 0 5px 0 5px;
	transition-property: all;
	transition-duration:0.5s;
	border-radius: 50%;
	font-size: 20px;
	line-height: 30px;
	
}
	.alarm-btn:hover {
    color: var(--bs-btn-hover-color);
    background-color: #4f59ca;
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





	<!-- 본문 영역 -->
	<div class="row main-text">
		<div class="col-12">

			<div class="container text-center myPageMainArea">

				<div class="row myPageArea">

					<div class="col-11-auto myPageFirstBox">
						<div class="row row-cols-2 profileArea">

							<!--
				 [마이페이지 상단 프로필 영역]
				 - 프로필 수정 / 공개·비공개 여부 버튼
				 - 프로필 이미지, 닉네임, 이메일
				 - 백엔드 / 프론트엔드 실력 등급
				 -->

							<div class="col col-12 profileBtnArea">
								
								<div class="all-btn-box">
								
									<div class="edit-btn-box">
										<button type="button" class="btn btn-outline-dark edit-btn" onclick="location.href='edit_test.com'">
											<span class="material-symbols-outlined col edit-btn-icon">
												settings_heart
											</span>
											<span class="edit-btn-text">edit</span>
										</button>
									</div><!-- close .edit-btn-box -->
	
									<div class="blind-btn-box">
										<button type="button" class="btn btn-outline-dark blind-btn" onclick="location.href='blind_test.com'">
											<span class="material-symbols-outlined blind-btn-icon">
												roller_shades_closed
											</span>
											<span class="blind-btn-text">blind</span>
										</button>
									</div><!-- close .edit-btn-box -->

								</div><!-- close .all-btn-box -->

							</div><!-- close .profileBtnArea -->


							<div class="col col-3 profileImageBox">
								<!-- 혜성강~ -->
								<img class="profileImage" src="<%=cp %>/img/profileImg_1.png">
								<!-- <img class="profileImage" src="img/pompomLove.png"> -->
							</div>
							<!--  -->

							<div class="col col-8 profileMainArea">

								<div class="nickAndEmailBox">
									<!-- <div class="nickNameBox">Mr.Kang</div> -->
									<div class="nickNameBox">${nickName }</div>
									<!-- close .nickNameBox -->

									<!-- <div class="emailBox">hyesung9797@gmail.com</div> -->
									<div class="emailBox">${email }</div>
									<!-- close .emailBox -->
								</div>
								<!-- close .nickAndEmailBox -->



								<div class="row row-cols-3 skillBox basic-info-Box">

									<div class="backSkillGradeBox">
										<div class="textBox skill-mini-box">
											<span class="descText grade-descTxt"> 
												<ion-icon name="bookmark" class="grade-icon"></ion-icon>
												Back-end 
											</span>
										</div>
										<!-- close .textBox -->

										<div class="gradeIconBox">
											<!-- 🌲 <span class="gradeText"> 나무 </span> -->
											
											<div class="gradeIcon-parentBox">
												<div class="gradeIcon-infoBox">
													
													<div class="gradeIcon-miniBox">
														<img class="gradeIconImg" src="<%=backScoreIcon %>">
													</div><!-- close .gradeIcon-miniBox -->
													
													<div class="gradeTxt-miniBox">
														<span class="gradeText"> <%=backScoreTxt %> </span>
													</div><!-- close .gradeTxt-miniBox -->
													
												</div><!-- close .gradeIcon-infoBox -->
											</div><!-- close .gradeIcon-parentBox -->
										</div><!-- close .gradeIconBox -->
									</div><!-- close .backSkillGradeBox -->
									
									
									<div class="frontSkillGradeBox">
										<div class="textBox skill-mini-box">
											<span class="descText grade-descTxt"> 
												<ion-icon name="bookmark" class="grade-icon"></ion-icon>
												Front-end 
											</span>
										</div>
										<!-- close .textBox -->

										<div class="gradeIconBox">
											<!-- 🌲 <span class="gradeText"> 나무 </span> -->
											
											<div class="gradeIcon-parentBox">
												<div class="gradeIcon-infoBox">
													
													<div class="gradeIcon-miniBox">
														<img class="gradeIconImg" src="<%=frontScoreIcon %>">
													</div><!-- close .gradeIcon-miniBox -->
													
													<div class="gradeTxt-miniBox">
														<span class="gradeText"> <%=frontScoreTxt %> </span>
													</div><!-- close .gradeTxt-miniBox -->
													
												</div><!-- close .gradeIcon-infoBox -->
											</div><!-- close .gradeIcon-parentBox -->
										</div><!-- close .gradeIconBox -->
									</div><!-- close .backSkillGradeBox -->
									
									
									
									
									<div class="mannerBox">
										<div class="textBox manner-mini-box">
											<span class="descText grade-descTxt manner-descTxt"> 
												<span class="material-symbols-outlined manner-icon">favorite</span>
												Manner
											</span>
										</div><!-- close .textBox .manner-mini-box -->

										<div class="gradeIconBox mannerIconBox">
											<!-- 🌲 <span class="gradeText"> 나무 </span> -->
											
											<div class="gradeIcon-parentBox mannerIcon-parentBox">
												<div class="gradeIcon-infoBox mannerIcon-infoBox">
													
													<div class="gradeIcon-miniBox mannerIcon-miniBox">
														<span class="material-symbols-outlined temperature-icon">device_thermostat</span>
													</div><!-- close .gradeIcon-miniBox -->
													
													<div class="gradeTxt-miniBox mannerTxt-miniBox">
														<span class="mannerText">${mannerScore }℃</span>
													</div><!-- close .gradeTxt-miniBox -->
													
												</div><!-- close .gradeIcon-infoBox -->
											</div><!-- close .gradeIcon-parentBox -->
										</div><!-- close .gradeIconBox -->
									</div><!-- close .backSkillGradeBox -->



									
									

									<%-- <div class="mannerBox">
										<div class="textBox manner-mini-box">
											<span class="descText grade-descTxt manner-descTxt"> 
												<span class="material-symbols-outlined manner-icon">favorite</span>
												Manner
											</span>
										</div><!-- close .textBox .manner-mini-box -->

										<div class="gradeIconBox mannerIconBox">
											<span class="material-symbols-outlined temperature-icon manner-icon">device_thermostat</span>
											<!-- <span class="mannerText">0℃</span> -->
											<span class="mannerText">${mannerScore }℃</span>
										</div>
									</div> --%><!-- close .frontSkillGradeBox -->
								
								
								</div><!-- close .row .row-cols-2 .skillBox .basic-info-box -->

							 
							</div>
							<!-- close .profileMainArea -->
						</div>
						<!-- close .profileArea -->
					</div>
					<!-- close .col-10-auto .myPageFirstBox -->


					<!-- 		
		『1 page』================================================================
		마이페이지 1페이지 본문 첫 번째 영역 - [개인정보]
		- 성별(*), 생년월일(*), 가입일, MBTI
		- 경력(*) : 회사명, 근속기간, 경력 등록일
		
		마이페이지 1페이지 본문 두 번째 영역 - [참여 이력]
		   - 주요 스킬(사용언어, 기술), 완료된 프로젝트와 미완료된 프로젝트 비율
		   - 참여한 프로젝트명, 담당 직무, 시작일/종료일, 완료/미완료
		================================================================『1 page』
		   
		『2 page』================================================================
		마이페이지 2페이지 본문 영역 - [본인이 작성한 게시글 리스트]
		================================================================『2 page』
		
		『3 page』================================================================
		마이페이지 3페이지 본문 영역 - [본인이 작성한 댓글 리스트]
		================================================================『3 page』

 -->
					<div class="col-10-auto myPageSecondBox">
						
						<!--================[카테고리 탭]================-->
						<div class="row tabArea">

							<ul class="tabCategoryBox nav nav-tabs row row-cols-3" id="myTab"
								role="tablist">

								<!-- [1. 개인정보 / 프로젝트 참여 이력 탭] -->
								<li class="oneCategoryTab nav-item col" role="presentation">
									<button class="category-tab nav-link active main-introduce-tab"
										data-bs-toggle="tab" data-bs-target="#main-tab" type="button"
										role="tab" aria-controls="home-tab-pane" aria-selected="true">프로필</button>
								</li>
								<!-- end .oneCategoryTab -->

								<!-- [2. 본인이 작성한 게시글 리스트 탭] -->
								<li class="oneCategoryTab nav-item" role="presentation">
									<button class="category-tab nav-link col post-written-tab" data-bs-toggle="tab"
										data-bs-target="#create-post-tab" type="button" role="tab"
										aria-controls="profile-tab-pane" aria-selected="false">게시물</button>
								</li>
								<!-- end .oneCategoryTab -->

								<!-- [3. 본인이 작성한 댓글 리스트 탭] -->
								<li class="oneCategoryTab nav-item" role="presentation">
									<button class="category-tab nav-link col comment-written-tab" data-bs-toggle="tab"
										data-bs-target="#create-comment-tab" type="button" role="tab"
										aria-controls="contact-tab-pane" aria-selected="false">댓글</button>
								</li>
								<!-- end .oneCategoryTab -->


							</ul>
							<!-- close .nav .nav-tabs .row .row-cols-3 -->
						</div>
						<!-- close .row .tabArea -->
						
						
						<!--================[본문 영역]================-->
						
						<div class="row mainTextArea">
							<div class="tab-content mainTextBox col-10-auto" id="myTabContent">

								<div class="oneMainContent tab-pane fade container text-center show active" id="main-tab" role="tabpanel" aria-labelledby="home-tab"
									tabindex="0">

					<!--  
		  				『1 page』================================================================
						마이페이지 1페이지 본문 첫 번째 영역 - [개인정보]
						- 성별(*), 생년월일(*), 가입일, MBTI
						- 경력(*) : 회사명, 근속기간, 경력 등록일
						
						마이페이지 1페이지 본문 두 번째 영역 - [참여 이력]
						   - 주요 스킬(사용언어, 기술), 완료된 프로젝트와 미완료된 프로젝트 비율
						   - 참여한 프로젝트명, 담당 직무, 시작일/종료일, 완료/미완료
						================================================================『1 page』
			  		-->

									<div class="privacyArea row row-cols-10">

										<!-- 【개인정보 영역 시작】================= -->
										<div class="privacyBox col-5-auto">
											<div class="descTextBox">
												<span class="descText self-introduce-descTxt"> 자기 소개 </span>
											</div>
											<!-- close .descTextBox -->

											<div class="contentBox">
												<ul class="privacy-list">
													<li class="one-privacy">
														<div class="privacy-box">
															<span class="title-text">성별</span> 
															<span class="content-text"> 
																<span class="gender-icon material-symbols-outlined gender">male</span>
																<!-- <span class="gender-info-text">남성</span> -->
																<span class="gender-info-text">${gender }</span>
															</span>
														</div>
													</li>
													<li class="one-privacy">
														<div class="privacy-box">
															<span class="title-text">생년월일</span> 
															<span class="content-text"> 
															<span class="birth-icon material-symbols-outlined"> celebration </span>
																<!-- <span class="birth-info-text">1997/10/17</span> -->
																<span class="birth-info-text">${birthDay }</span>
															</span>
														</div>
													</li>
													<li class="one-privacy">
														<div class="privacy-box">
															<span class="title-text">MBTI</span> 
															<span class="content-text">
																<span class="mbti-icon material-symbols-outlined">family_star</span>
																<!-- <span class="mbti-info-text">INTJ</span> -->
																<span class="mbti-info-text">${mbti }</span>
															</span>
														</div>
													</li>
												</ul>
											</div>
										</div>
										<!-- close .privacyBox -->


										<!-- 【경력 영역 시작】================= -->
										<div class="careerBox col-5-auto">

											<div class="descTextBox total-career-Area">
												<div class="total-period-career-box">
													<span class="descText career-descTxt"> 경력 </span>
													<span class="material-symbols-outlined"> line_end_diamond </span>
													<span class="descText"> 
														<span class="total-career-descText"> 총</span> 
														<span class="career-info-text">
															
															
															<c:choose>
																<c:when test="${careerList[0].tot_worked_year == 0}">
																	<!-- 0년일 경우, 보여지지 않음 -->
																</c:when>
																<c:otherwise>
																	${careerList[0].tot_worked_year } 년
																</c:otherwise>
															</c:choose>
															
															<c:choose>
																<c:when test="${careerList[0].tot_worked_month == 0}">
																	<!-- 0개월일 경우, 보여지지 않음 -->
																</c:when>
																<c:otherwise>
																	${careerList[0].tot_worked_month } 개월
																</c:otherwise>
															</c:choose>
														</span>
													</span>
												</div>
											</div>

											<!-- 경력 리스트 -->
											<div class="careerListArea row row-cols-3 contentBox">

												<ul class="careerList">

													<c:forEach var="career" items="${careerList }" >
													
														<li class="one-careerBox">
															<div class="career-info-txtBox">
															
																<span class="career-company"> 
																	<!-- 네이버 --> 
																	${career.company_name }
																</span><!-- close one-careerBox --> <br> 
																
																<div class="career-all-period-parent-box">
																	<span class="career-period"> 
																		<!-- 2022-01-27 ~ 2022-09-10 -->
																		${career.join_date } ~ ${career.leave_date } 
																	</span><!-- close .career-period -->
																	<div class="career-tot-period-box">
																		<span class="career-tot-period">
																			┃총
																			
																			<c:choose>
																				<c:when test="${career.worked_year == 0}">
																					<!-- 0년일 경우, 보여지지 않음 -->
																				</c:when>
																				<c:otherwise>
																					${career.worked_year }년
																				</c:otherwise>
																			</c:choose>
																			
																			<c:choose>
																				<c:when test="${career.worked_month  == 0}">
																					<!-- 0 개월일 경우, 보여지지 않음 -->
																				</c:when>
																				<c:otherwise>
																					${career.worked_month }개월
																				</c:otherwise>
																			</c:choose>
																			
																		</span><!-- close .career-tot-period -->
																	</div><!-- close .career-tot-period-box -->
																</div><!-- close .career-all-period-parent-box -->
															</div><!-- close .career-info-txtBox -->
														</li><!-- close .one-careerBox -->
														
													</c:forEach>
													
													<!-- 
													
													[① 네이버 경력]
													<li class="one-careerBox">
														<div class="career-info-txtBox">
														
															<span class="career-company"> 
																네이버 
															</span>close one-careerBox <br> 
															<span class="career-role">
																 백엔드 개발자
															</span>close .career-role <br>
															<span class="career-period"> 
																2022-01-27 ~ 2022-09-10 
															</span>close .career-period
															
														</div>close .career-info-txtBox
													</li>close .one-careerBox
													

													[② 배달의 민족 경력]
													<li class="one-careerBox">
														<div class="career-info-txtBox">
															
															<span class="career-company">
																배달의 민족 
															</span>close one-careerBox <br> 
															<span class="career-role"> 
																백엔드 개발자 
															</span>close .career-role <br> 
															<span class="career-period"> 
																2022-11-20 ~ 2023-01-17 
															</span>close .career-period
															
														</div>close .career-info-txtBox
													</li>close .one-careerBox
												-->

												</ul>
												<!-- close .careerList -->



											</div>
											<!-- close .careerListArea -->

										</div>
										<!-- close .careerBox -->




									</div><!-- close .privacyArea -->

					<!--  
				  		마이페이지 1페이지 본문 두 번째 영역 - [참여 이력]
					   - 주요 스킬(사용언어, 기술), 완료된 프로젝트와 미완료된 프로젝트 비율
					   - 참여한 프로젝트명, 담당 직무, 시작일/종료일, 완료/미완료
				  	-->

									<div class="projectRecord-area">
										
										<div class="all-skill-area row">
										
											<!-- 스킬 -->
											<div class="skill-area col-12">
												
												<div class="descTextBox">
													<span class="descText skill-descTxt"> Skill </span>
												</div>
												
												<div class="skill-content contentBox">
<!-- 												
													<div class="one-skill-tag back-skill-tag">Java</div>
													<div class="one-skill-tag back-skill-tag">Javascript</div>
													<div class="one-skill-tag back-skill-tag">Oracle</div>
													<div class="one-skill-tag back-skill-tag">C++</div>
													<div class="one-skill-tag front-skill-tag">HTML</div>
													<div class="one-skill-tag front-skill-tag">CSS</div>
 -->												
												
												<c:forEach var="skill" items="${skillTag }">
													<div class="one-skill-tag">${skill }</div>
												</c:forEach>
												
												
												</div><!-- close .skill-content .contentBox .back-skill-content-->
											
											</div><!-- close .skill-area .col-5-auto .back-end-area -->
	
											
										</div><!-- close .all-skill-area .row .row-cols-2 -->
<%-- 
										${fn:length(pjHistoryList) }
										<div class="test">
											<c:forEach var="k" begin="0" end="${fn:length(pjHistoryList)}" >
												<span>${k }</span>
											</c:forEach>
											
										</div> --%>


										<!-- 참여한 프로젝트명, 담당 직무, 시작일/종료일, 완료/미완료 -->
										
										<div class="descTextBox pj-history-Text">
											<span class="descText pj-hist-descTxt"> 참여한 프로젝트 </span>
											<!-- 프로젝트 완료 비율 -->
											<div class="pjCompleteRatio-area">
												
												<div class="pjCompleteRatio-box">
													<div class="pjComplete-info-box">
														<span class="material-symbols-outlined"> line_end_diamond </span>
														<span class="descText pjComplete-ratio-txt"> 완료한 프로젝트 비율 </span>
														<span class="pjCompleteRatio"> 
															100%
														</span>
													</div>
												</div>
												
											</div><!-- close .pjCompleteRatio-area -->
										</div><!-- close .descTextBox .pj-history-Text -->
										
										<div class="pj-historyArea contentBox">
		
											<div class="all-prjCard-area">
												
												<!--==========[프로젝트 이력 캐러셀]==========-->
												<div id="carouselExample" class="carousel slide pj-hist-carousel">
												
												  <div class="carousel-inner all-pj-history-box">
												  	
												      <c:forEach var="j" begin="0" end="${pjHistoryList.size() / 3}" step="1">
												  		<!--*****[캐러셀 1페이지 - 프로젝트 이력 세 개를 감싸는 div]*****-->
												  		<c:choose>
												  			<c:when test="${j == 0 }">
															    <div class="carousel-item active one-pj-history-miniBox">
												  			</c:when>
												  			<c:otherwise>
															    <div class="carousel-item one-pj-history-miniBox">
												  			</c:otherwise>
												  		</c:choose>
															
															<div class="oh-my-god">
																
																<c:forEach var="i" begin="${j }" end="${j+2 }" step="1">
																
														      		<c:choose>
														      		
														      			<%-- i 가 프로젝트 이력 개수보다 작을 때만 출력 --%>
														      			<%-- 길이 : 1 → 인덱스 : 0 → i = 0 일 때만 프로젝트 이력을 꺼내와야 함. --%>
														      			<c:when test="${i < pjHistoryList.size() }">
														      				<%--=======[프로젝트 이력 한 개]=======--%>
																      
																			<div class="card one-projectBox">
																				<div class="card-body pj-history">
																					<h5 class="card-header project-name">${pjHistoryList[i].prj_name }</h5>
																					
																					<div class="card-inner project-position-box">
																						<h6 class="card-title project-position">${pjHistoryList[i].prj_role }</h6>
																					</div>
																					
																					<div class="card-inner pj-item-totBox">
																						<div class="card-inner project-desc-box">
																							<div class="view-control-btn more_btn">
																								<a href="#" id="showMore" class="more-close-btnTxt">더보기</a>
																							</div>
																							<p class="card-text project-desc">
																								${pjHistoryList[i].prj_summary }
																							</p>
																							
																							<%--========[요약 더보기 버튼 영역]========--%>
				 																			<div class="more_btn view-control-btn">																				  
																						  	  <a class="btn btn-primary more-close-btnTxt" id="showMore" data-bs-toggle="collapse" href="#pj-desc-body" role="button" aria-expanded="false" aria-controls="collapseExample">
																							    	요약 더보기
																							  </a>
																						  	</div><%-- close .more-btn .view-control-btn --%>
																							
																							<div class="collapse pj-more-desc-area" id="pj-desc-body">
																							  <div class="card card-body pj-more-desc-box">
																							    ${pjHistoryList[i].prj_summary }
																							  </div>
																							</div>
																							
																						</div><%-- end .card-inner .project-desc-box --%>
																						
																						<div class="card-inner project-term-box">
																							<span class="project-term">
																								${pjHistoryList[i].prj_start_date } ~ ${pjHistoryList[i].prj_end_date }
																							</span>
																						</div><%-- end .card-inner .project-term-box --%>
																						
																						<div class="card-inner project-ok-box">
																							<span class="project-ok-or-not">
																								프로젝트 완료 :
																							</span>
																							<span class="ok-or-not">${pjHistoryList[i].prj_complete }</span>
																						</div><%-- close .card-inner .project-ok-box --%>
																					</div><%-- close .card-inner .pj-item-totBox --%>
																				</div><%-- close .pj-history --%>
																				
																			</div><%-- close .one-projectBox --%>
														      			</c:when>
														      			
														      		</c:choose>
														      		
																</c:forEach><!-- end for~i -->
															
															</div><!-- close .oh-my-god -->
														</div><!-- close .carousel-item active one-pj-history-miniBox -->
												      </c:forEach><!-- end for~j -->
												      
													</div><!-- close .carousel-inner .all-pj-history-box -->
											     </div><!-- close #carouselExample  -->
											  </div><!-- close .carousel-inner .all-pj-history-box -->
											  
											  
											  
												      <!-- 
												      <div class="oh-my-god">
												      
													      =======[프로젝트 이력 한 개]=======
													      
															<div class="card one-projectBox">
																<div class="card-body pj-history">
																	<h5 class="card-header project-name">무인 호텔 키오스크</h5>
																	
																	<div class="card-inner project-position-box">
																		<h6 class="card-title project-position">팀장</h6>
																	</div>end .card-inner .project-position-box
																	
																	<div class="card-inner pj-item-totBox">
																		<div class="card-inner project-desc-box">
																			<div class="view-control-btn more_btn">
																				<a href="#" id="showMore" class="more-close-btnTxt">더보기</a>
																			</div>
																			<p class="card-text project-desc">
																				Java 와 객체 직렬화/역직렬화를 이용한 무인 호텔 키오스크 자판기
																			</p>
																			
																			========[요약 더보기 버튼 영역]========
 																			<div class="more_btn view-control-btn">																				  
																		  	  <a class="btn btn-primary more-close-btnTxt" id="showMore" data-bs-toggle="collapse" href="#pj-desc-body" role="button" aria-expanded="false" aria-controls="collapseExample">
																			    	요약 더보기
																			  </a>
																		  	</div>close .more-btn .view-control-btn
																			
																			<div class="collapse pj-more-desc-area" id="pj-desc-body">
																			  <div class="card card-body pj-more-desc-box">
																			    Java 와 객체 직렬화/역직렬화를 이용한 무인 호텔 키오스크 자판기
																			  </div>
																			</div>
																			
																		</div>end .card-inner .project-desc-box
																		
																		<div class="card-inner project-term-box">
																			<span class="project-term">2023-09-26 ~ 2023-10-16</span>
																		</div>end .card-inner .project-term-box
																		
																		<div class="card-inner project-ok-box">
																			<span class="project-ok-or-not">
																				프로젝트 완료 :
																			</span>
																			<span class="ok-or-not">⭕</span>
																		</div>close .card-inner .project-ok-box
																	</div>close .card-inner .pj-item-totBox
																</div>close .pj-history
																
															</div>close .one-projectBox
															
															
													      =======[프로젝트 이력 한 개]=======
													      
															<div class="card one-projectBox">
																<div class="card-body pj-history">
																	<h5 class="card-header project-name">
																		일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십
																	</h5>
																	
																	<div class="card-inner project-position-box">
																		<h6 class="card-title project-position">프론트엔드</h6>
																	</div>end .card-inner .project-position-box
																	
																	<div class="card-inner pj-item-totBox">
																		<div class="card-inner project-desc-box">
																			<p class="card-text project-desc">
																				일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구
																			</p>
																			
																			========[요약 더보기 버튼 영역]========
 																			<div class="more_btn view-control-btn">																				  
																		  	  <a class="btn btn-primary more-close-btnTxt" id="showMore" data-bs-toggle="collapse" href="#pj-desc-body" role="button" aria-expanded="false" aria-controls="collapseExample">
																			    	요약 더보기
																			  </a>
																		  	</div>close .more-btn .view-control-btn
																			
																			<div class="collapse pj-more-desc-area" id="pj-desc-body">
																			  <div class="card card-body pj-more-desc-box">
																			    일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구
																			  </div>
																			</div>
																			
																			
																			
																		</div>end .card-inner .project-desc-box
																		
																		<div class="card-inner project-term-box">
																			<span class="project-term">2023-10-18 ~ 2023-11-15</span>
																		</div>end .card-inner .project-term-box
																		
																		<div class="card-inner project-ok-box">
																			<span class="project-ok-or-not">
																				프로젝트 완료 :
																			</span>
																			<span class="ok-or-not">❌</span>
																		</div>close .card-inner .project-ok-box
																	</div>close .card-inner pj-item-totBox
																</div>close .pj-history
																
															</div>close .one-projectBox
															
															
													      =======[프로젝트 이력 한 개]=======
													      
															<div class="card one-projectBox">
																<div class="card-body pj-history">
																	<h5 class="card-header project-name">
																		개발자 프로젝트 모집
																	</h5>
																	
																	<div class="card-inner project-position-box">
																		<h6 class="card-title project-position">팀장</h6>
																	</div>end .card-inner .project-position-box
																	
																	<div class="card-inner pj-item-totBox">
																		<div class="card-inner project-desc-box">
																			<div class="more_btn view-control-btn">
																				<a href="#" id="showMore">더보기</a>
																			</div>
																			<p class="card-text project-desc">
																				개발자의 프로젝트를 모집해주는 웹 사이트
																			</p>
																			
																			
																			========[요약 더보기 버튼 영역]========
 																			<div class="more_btn view-control-btn">																				  
																		  	  <a class="btn btn-primary more-close-btnTxt" id="showMore" data-bs-toggle="collapse" href="#pj-desc-body" role="button" aria-expanded="false" aria-controls="collapseExample">
																			    	요약 더보기
																			  </a>
																		  	</div>close .more-btn .view-control-btn
																			
																			<div class="collapse pj-more-desc-area" id="pj-desc-body">
																			  <div class="card card-body pj-more-desc-box">
																				개발자의 프로젝트를 모집해주는 웹 사이트
																			  </div>
																			</div>
																			
																			
																		</div>end .card-inner .project-desc-box
																		
																		<div class="card-inner project-term-box">
																			<span class="project-term">2023-12-10 ~ 2024-01-08</span>
																		</div>end .card-inner .project-term-box
																		
																		<div class="card-inner project-ok-box">
																			<span class="project-ok-or-not">
																				프로젝트 완료 :
																			</span>
																			<span class="ok-or-not">⭕</span>
																		</div>close .card-inner .project-ok-box
																	</div>close .pj-history
																</div>close .card-inner .pj-item-totBox
															</div>close .one-projectBox
												
			
												    </div>close .oh-my-god
												   </div>close .carousel-item .active .one-pj-history-miniBox
												   
												  	*****[캐러셀 2페이지 - 프로젝트 이력 세 개를 감싸는 div]*****
												    <div class="carousel-item one-pj-history-miniBox">
														<div class="oh-my-god">
														
														
														=======[프로젝트 이력 한 개]=======
													      
															<div class="card one-projectBox">
																<div class="card-body pj-history">
																	<h5 class="card-header project-name">
																		마라탕 조합왕 마조마조
																	</h5>
																	
																	<div class="card-inner project-position-box">
																		<h6 class="card-title project-position">백엔드</h6>
																	</div>end .card-inner .project-position-box
																	
																	<div class="card-inner pj-item-totBox">
																		<div class="card-inner project-desc-box">
																			<div class="more_btn view-control-btn">
																				<a href="#" id="showMore" class="more-close-btnTxt">더보기</a>
																			</div>
																			<p class="card-text project-desc">
																				베스트 마라탕 토핑 조합과 특색있는 마라 음식을
																				추천해 주는 프로그램
																			</p>
																			
																			========[요약 더보기 버튼 영역]========
																			<div class="more_btn view-control-btn">																				  
																		  	  <a class="btn btn-primary more-close-btnTxt" id="showMore" data-bs-toggle="collapse" href="#pj-desc-body" role="button" aria-expanded="false" aria-controls="collapseExample">
																			    	요약 더보기
																			  </a>
																		  	</div>close .more-btn .view-control-btn
																			
																			<div class="collapse pj-more-desc-area" id="pj-desc-body">
																			  <div class="card card-body pj-more-desc-box">
																			    베스트 마라탕 토핑 조합과 특색있는 마라 음식을
																				추천해 주는 프로그램
																			  </div>
																			</div>
																			
																			
																		</div>end .card-inner .project-desc-box
																		
																		<div class="card-inner project-term-box">
																			<span class="project-term">2024-02-15 ~ 2024-04-10</span>
																		</div>end .card-inner .project-term-box
																		
																		<div class="card-inner project-ok-box">
																			<span class="project-ok-or-not">
																				프로젝트 완료 :
																			</span>
																			<span class="ok-or-not">❌</span>
																		</div>close .card-inner .project-ok-box
																	</div>close .card-inner .pj-item-totBox

																</div>close .pj-history
															</div>close .one-projectBox
															
														=======[프로젝트 이력 한 개]=======
													      
															<div class="card one-projectBox">
																<div class="card-body pj-history">
																	<h5 class="card-header project-name">
																		너무 지쳐 프로젝트
																	</h5>
																	
																	<div class="card-inner project-position-box">
																		<h6 class="card-title project-position">프론트엔드</h6>
																	</div>end .card-inner .project-position-box
																	
																	
																	<div class="card-inner pj-item-totBox">
																		<div class="card-inner project-desc-box">
																			
																			<div class="more_btn view-control-btn">
																				<a href="#" id="showMore" class="more-close-btnTxt">더보기</a>
																			</div> 
																			
																			<p class="card-text project-desc">
																				요약 설명이 길어진다면 어떻게 되는 겁니까?
																				나는 알 수 없다. 그저 카드 스타일이
																				망가지지 않기를 바랄 뿐이다.
																				요약을 길게 작성하는 사람이 정말 밉다.
																				마이페이지는 왜 해도해도 끝이 없는가?
																				속도를 빨리 내도록 하자.
																			</p>
																			subString 이용해서, 안 잘리는 부분만 위에서 뿌려주도록 처리
																			     밑에, 클릭을 통해 나오는 텍스트는 원문 그대로 삽입.
																			
																			
																			========[요약 더보기 버튼 영역]========
 																			<div class="more_btn view-control-btn">																				  
																		  	  <a class="btn btn-primary more-close-btnTxt" id="showMore" data-bs-toggle="collapse" href="#pj-desc-body" role="button" aria-expanded="false" aria-controls="collapseExample">
																			    	요약 더보기
																			  </a>
																		  	</div>close .more-btn .view-control-btn
																			
																			<div class="collapse pj-more-desc-area" id="pj-desc-body">
																			  <div class="card card-body pj-more-desc-box">
																			    요약 설명이 길어진다면 어떻게 되는 겁니까?
																				나는 알 수 없다. 그저 카드 스타일이
																				망가지지 않기를 바랄 뿐이다.
																				요약을 길게 작성하는 사람이 정말 밉다.
																				마이페이지는 왜 해도해도 끝이 없는가?
																				속도를 빨리 내도록 하자.
																			  </div>
																			</div>
																			
																			
																		</div>end .card-inner .project-desc-box
																		
																		<div class="card-inner project-term-box">
																			<span class="project-term">2024-02-15 ~ 2024-04-10</span>
																		</div>end .card-inner .project-term-box
																		
																		<div class="card-inner project-ok-box">
																			<span class="project-ok-or-not">
																				프로젝트 완료 :
																			</span>
																			<span class="ok-or-not">❌</span>
																		</div>close .card-inner .project-ok-box
																	
																	</div>close .card-inner .pj-item-totBox
																</div>close .pj-history
																
															</div>close .one-projectBox
														

												    	</div>close .oh-my-god 
												    	
												    	
												    </div>close .carousel-item .one-pj-history-miniBox
												    
												  </div>close .carousel-inner .all-pj-history-box -->
												  
													<c:if test="${pjHistoryList.size() > 3 }">
														<div class="pj-hist-carousel-btn-area">
															
															<div class="pj-hist-all-btn-box">
															  
															  <div class="pj-hist-all-btn-miniBox">
															  
																  <button class="carousel-control-prev pj-hist-carousel-btn pj-hist-prev-btn" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
																    <span class="material-symbols-outlined pj-hist-prev-icon">navigate_before</span>
																    <span class="visually-hidden pj-hist-prevText">Previous</span>
																  </button>
																  
																  <button class="carousel-control-next pj-hist-carousel-btn pj-hist-next-btn" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
																    <span class="material-symbols-outlined pj-hist-next-icon">navigate_next</span>
																    <span class="visually-hidden pj-hist-nextText">Next</span>
																  </button>
															  
														  	 </div><!-- close .pj-hist-all-btn-box -->
														  	 
														  	</div><!-- close .pj-hist-all-btn-box -->
														  
														</div><!-- close .pj-hist-carousel-btn-area -->
													</c:if>
													
												</div><!-- close #carouselExample #pj-history-carousel-area .carousel .slide .pj-hist-carousel -->
												  
												
											</div><!-- close .all-prjCard-area [프로젝트 캐러셀 영역 종료] -->
												
										</div><!-- close .pj-historyArea .contentBox [프로젝트 본문을 감싸는 영역 종료]-->



									</div><!-- close .projectRecord-area [프로젝트 영역 최상위 부모 종료] -->


								</div><!-- close .oneMainContent .tab-pane .fade .show .active [본문 1페이지 - 프로필 종료] -->
								


								<div class="oneMainContent tab-pane fade" id="create-post-tab" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">

									<div class="descTextBox">
										<span class="descText my-post-descTxt"> 내가 작성한 게시글 목록 </span>
									</div>									
								 	<div class="all-post-area contentBox">
								 		<div class="post-total-parentBox">
										 	<div class="post-total-area">
											 	<div class="forum_body">
											 	
											 		<c:forEach var="post" items="${postList }">
					                                    <ul class="navbar-nav topic_list">
					                                        <li class="postLi">
					                                            <div class="media">
					                                                <div class="media-body">
					                                                    <div class="t_title">
					                                                    	<span class="post-class-text">${post.post_class } Q&A 게시판</span>
					                                                        <a href="forum-single.html" class="board-a-tag-link post-subject-link">
					                                                            <h4 class="post-title-text-box">
					                                                            	${post.post_title }
					                                                            </h4>
					                                                        </a><!-- close .board-a-tag-link .post-subject-link -->
					                                                    </div>    
					                                                    <h6 style="margin-top: 10px;"><ion-icon name="time-outline"></ion-icon>
					                                                    
					                                                     <%-- 26 minutes ago --%>
					                                                     
					                                                     <c:choose>
					                                                     
					                                                     	<%-- 몇 달 전일 때 --%>
					                                                     	<c:when test="${post.post_prev_month > 0 }">
					                                                     	
					                                                     		${post.post_prev_month }
					                                                     		
					                                                     		<c:choose>
			                                                     					<c:when test="${post.post_prev_month == 1 }">
			                                                     						month
			                                                     					</c:when>
			                                                     					<c:otherwise>
			                                                     						months
			                                                     					</c:otherwise>
			                                                     				</c:choose>
					                                                     		ago
					                                                     		
					                                                     	</c:when>
					                                                     	
					                                                     	<%-- 며칠 전일 때 --%>
					                                                     	<c:when test="${post.post_prev_day > 0 }">
					                                                     	
					                                                     		${post.post_prev_day }
				                                                     			<c:choose>
			                                                     					<c:when test="${post.post_prev_day == 1 }">
			                                                     						day
			                                                     					</c:when>
			                                                     					<c:otherwise>
			                                                     						days
			                                                     					</c:otherwise>
			                                                     				</c:choose>
					                                                     		ago
					                                                     		
					                                                     	</c:when>
					                                                     	
					                                                     	<%-- 당일일 때 --%>
					                                                     	<c:when test="${post.post_prev_day == 0 }">
					                                                     		
					                                                     		<c:choose>
					                                                     		
					                                                     			<%-- 몇 시간 전일 때 --%>
					                                                     			<c:when test="${post.post_prev_hour > 0 }">
					                                                     			
					                                                     				${post.post_prev_hour }
					                                                     				<c:choose>
					                                                     					<c:when test="${post.post_prev_hour == 1 }">
					                                                     						hour
					                                                     					</c:when>
					                                                     					<c:otherwise>
					                                                     						hours
					                                                     					</c:otherwise>
					                                                     				</c:choose>
							                                                     		ago
							                                                     		
					                                                     			</c:when>
					                                                     			
					                                                     			<%-- 몇 분 전일 때 --%>
					                                                     			<c:when test="${post.post_prev_hour == 0 }">
					                                                     			
					                                                     				${post.post_prev_minute } 
					                                                     				<c:choose>
					                                                     					<c:when test="${post.post_prev_minute == 1 }">
					                                                     						minute
					                                                     					</c:when>
					                                                     					<c:otherwise>
					                                                     						minutes
					                                                     					</c:otherwise>
					                                                     				</c:choose>
							                                                     		ago
					                                                     			
					                                                     			</c:when>
					                                                     		
					                                                     		</c:choose>
					                                                     		
					                                                     	</c:when>
					                                                     	
					                                                     
					                                                     </c:choose>
					                                                     
					                                                     
					                                                     
					                                                    </h6>
					                                                </div>
					                                                <div class="media-right">
					                                                    <ul class="nav">
					                                                        <li class="dropdown">
					                                                        
					                                                            <a class="dropdown-toggle board-a-tag-link" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					                                                                <img src="img/profile.png" alt="" style="width: 25px; height: 25px;"> ${post.nickname }
					                                                            </a>
					                                                            
					                                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
					                                                                <div class="media">
					                                                                    <div class="media-body">
					                                                                   
					                                                                        <a href="#" class="board-a-tag-link modal-link">
					                                                                            <h4>${post.nickname }</h4>
					                                                                        </a>
					                                                                        
					                                                                        <a class="follow_btn board-a-tag-link" href="#">Follow</a>
					                                                                        
					                                                                    </div>
					                                                                </div>
					                                                                <div class="row answere_items">
					                                                                    <div class="col-4">
					                                                                        <a href="#" class="answers-link board-a-tag-link">
					                                                                            <h4>Answers</h4>
					                                                                        </a>
					                                                                        <h6>30</h6>
					                                                                    </div>
					                                                                    <div class="col-4">
					                                                                        <a href="#" class="question-link board-a-tag-link">
					                                                                            <h4>Question</h4>
					                                                                        </a>
					                                                                        <h6>40</h6>
					                                                                    </div>
					                                                                    <div class="col-4">
					                                                                        <a href="#" class="followers-link board-a-tag-link">
					                                                                            <h4>Followers</h4>
					                                                                        </a>
					                                                                        <h6>30</h6>
					                                                                    </div>
					                                                                </div>
					                                                            </div>
					                                                        </li>
					                                                    </ul>
					                                                    <a class="count board-a-tag-link comment-link" href="#"><ion-icon name="chatbubbles-outline" role="img" class="md hydrated board-a-tag-link" aria-label="chatbubbles outline"></ion-icon>${post.post_comment_count }</a>
					                                                    <a class="count board-a-tag-link view-count-link" href="#"><ion-icon name="eye-outline" role="img" class="md hydrated board-a-tag-link" aria-label="eye outline"></ion-icon>${post.post_views }</a>
					                                                </div>
					                                            </div>
					                                        </li>
					                                    </ul>
				                                    </c:forEach>
				                                    
				                                    
				                                    <!-- 
				                                    <ul class="navbar-nav topic_list">
				                                        <li class="postLi">
				                                            <div class="media">
				                                                <div class="media-body">
				                                                    <div class="t_title">
				                                                    	<span class="post-class-text">기술 Q&A 게시판</span>
				                                                        <a href="forum-single.html" class="board-a-tag-link post-subject-link">
				                                                            <h4>일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십</h4>
				                                                        </a>close .board-a-tag-link .post-subject-link
				                                                    </div>    
				                                                        <ul class="tagList" style="display: flex;">
				                                                        	<li style="margin: 0px; padding: 0px;"><a href="#" class="tag board-a-tag-link">자바</a></li>
				                                                        	<li style="margin: 0px; padding: 0px;"><a href="#" class="tag board-a-tag-link">오라클</a></li>
				                                                        	<li style="margin: 0px; padding: 0px;"><a href="#" class="tag board-a-tag-link">아재개그</a></li>
				                                                        </ul>
				                                                        
				                                                    <h6 style="margin-top: 10px;"><ion-icon name="time-outline"></ion-icon> 26 minutes ago
				                                                    </h6>
				                                                </div>
				                                                <div class="media-right">
				                                                    <ul class="nav">
				                                                        <li class="dropdown">
				                                                        
				                                                            <a class="dropdown-toggle board-a-tag-link" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				                                                                <img src="img/profile.png" alt="" style="width: 25px; height: 25px;"> 강혜성
				                                                            </a>close .dropdown-toggle .board-a-tag-link
				                                                            
				                                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				                                                                <div class="media">
				                                                                    <div class="media-body">
				                                                                   
				                                                                        <a href="#" class="board-a-tag-link modal-link">
				                                                                            <h4>Jonah Terry</h4>
				                                                                        </a>
				                                                                        
				                                                                        <a class="follow_btn board-a-tag-link" href="#">Follow</a>
				                                                                        
				                                                                    </div>
				                                                                </div>
				                                                                <div class="row answere_items">
				                                                                    <div class="col-4">
				                                                                        <a href="#" class="answers-link board-a-tag-link">
				                                                                            <h4>Answers</h4>
				                                                                        </a>
				                                                                        <h6>30</h6>
				                                                                    </div>
				                                                                    <div class="col-4">
				                                                                        <a href="#" class="question-link board-a-tag-link">
				                                                                            <h4>Question</h4>
				                                                                        </a>
				                                                                        <h6>40</h6>
				                                                                    </div>
				                                                                    <div class="col-4">
				                                                                        <a href="#" class="followers-link board-a-tag-link">
				                                                                            <h4>Followers</h4>
				                                                                        </a>
				                                                                        <h6>30</h6>
				                                                                    </div>
				                                                                </div>
				                                                            </div>
				                                                        </li>
				                                                    </ul>
				                                                    <a class="count board-a-tag-link like-link" href="#"><ion-icon name="heart-outline" role="img" class="md hydrated board-a-tag-link" aria-label="heart outline"></ion-icon> 5</a>
				                                                    <a class="count board-a-tag-link comment-link" href="#"><ion-icon name="chatbubbles-outline" role="img" class="md hydrated board-a-tag-link" aria-label="chatbubbles outline"></ion-icon> 70</a>
				                                                    <a class="count board-a-tag-link view-count-link" href="#"><ion-icon name="eye-outline" role="img" class="md hydrated board-a-tag-link" aria-label="eye outline"></ion-icon> 420</a>
				                                                </div>
				                                            </div>
				                                        </li>
				                                    </ul>
				                                    <ul class="navbar-nav topic_list">
				                                        <li class="postLi">
				                                            <div class="media">
				                                                <div class="media-body">
				                                                    <div class="t_title">
				                                                        <a href="forum-single.html" class="board-a-tag-link post-subject-link">
				                                                            <h4>무릎 박으면 마이아파</h4>
				                                                        </a>close .board-a-tag-link .post-subject-link
				                                                    </div>    
				                                                        <ul class="tagList" style="display: flex;">
				                                                        	<li style="margin: 0px; padding: 0px;"><a href="#" class="tag board-a-tag-link">자바</a></li>
				                                                        	<li style="margin: 0px; padding: 0px;"><a href="#" class="tag board-a-tag-link">오라클</a></li>
				                                                        	<li style="margin: 0px; padding: 0px;"><a href="#" class="tag board-a-tag-link">아재개그</a></li>
				                                                        </ul>
				                                                        
				                                                    <h6 style="margin-top: 10px;"><ion-icon name="time-outline"></ion-icon> 26 minutes ago
				                                                    </h6>
				                                                </div>
				                                                <div class="media-right">
				                                                    <ul class="nav">
				                                                        <li class="dropdown">
				                                                        
				                                                            <a class="dropdown-toggle board-a-tag-link" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				                                                                <img src="img/profile.png" alt="" style="width: 25px; height: 25px;"> 강혜성
				                                                            </a>close .dropdown-toggle .board-a-tag-link
				                                                            
				                                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				                                                                <div class="media">
				                                                                    <div class="media-body">
				                                                                   
				                                                                        <a href="#" class="board-a-tag-link modal-link">
				                                                                            <h4>Jonah Terry</h4>
				                                                                        </a>
				                                                                        
				                                                                        <a class="follow_btn board-a-tag-link" href="#">Follow</a>
				                                                                        
				                                                                    </div>
				                                                                </div>
				                                                                <div class="row answere_items">
				                                                                    <div class="col-4">
				                                                                        <a href="#" class="answers-link board-a-tag-link">
				                                                                            <h4>Answers</h4>
				                                                                        </a>
				                                                                        <h6>30</h6>
				                                                                    </div>
				                                                                    <div class="col-4">
				                                                                        <a href="#" class="question-link board-a-tag-link">
				                                                                            <h4>Question</h4>
				                                                                        </a>
				                                                                        <h6>40</h6>
				                                                                    </div>
				                                                                    <div class="col-4">
				                                                                        <a href="#" class="followers-link board-a-tag-link">
				                                                                            <h4>Followers</h4>
				                                                                        </a>
				                                                                        <h6>30</h6>
				                                                                    </div>
				                                                                </div>
				                                                            </div>
				                                                        </li>
				                                                    </ul>
				                                                    <a class="count board-a-tag-link like-link" href="#"><ion-icon name="heart-outline" role="img" class="md hydrated board-a-tag-link" aria-label="heart outline"></ion-icon> 5</a>
				                                                    <a class="count board-a-tag-link comment-link" href="#"><ion-icon name="chatbubbles-outline" role="img" class="md hydrated board-a-tag-link" aria-label="chatbubbles outline"></ion-icon> 70</a>
				                                                    <a class="count board-a-tag-link view-count-link" href="#"><ion-icon name="eye-outline" role="img" class="md hydrated board-a-tag-link" aria-label="eye outline"></ion-icon> 420</a>
				                                                </div>
				                                            </div>
				                                        </li>
				                                    </ul>
				                                    <ul class="navbar-nav topic_list">
				                                        <li class="postLi">
				                                            <div class="media">
				                                                <div class="media-body">
				                                                    <div class="t_title">
				                                                        <a href="forum-single.html" class="board-a-tag-link post-subject-link">
				                                                            <h4>아아니 윤수혀엉!!!!!</h4>
				                                                        </a>close .board-a-tag-link .post-subject-link
				                                                    </div>    
				                                                        <ul class="tagList" style="display: flex;">
				                                                        	<li style="margin: 0px; padding: 0px;"><a href="#" class="tag board-a-tag-link">자바</a></li>
				                                                        	<li style="margin: 0px; padding: 0px;"><a href="#" class="tag board-a-tag-link">오라클</a></li>
				                                                        	<li style="margin: 0px; padding: 0px;"><a href="#" class="tag board-a-tag-link">아재개그</a></li>
				                                                        </ul>
				                                                        
				                                                    <h6 style="margin-top: 10px;"><ion-icon name="time-outline"></ion-icon> 26 minutes ago
				                                                    </h6>
				                                                </div>
				                                                <div class="media-right">
				                                                    <ul class="nav">
				                                                        <li class="dropdown">
				                                                        
				                                                            <a class="dropdown-toggle board-a-tag-link" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				                                                                <img src="img/profile.png" alt="" style="width: 25px; height: 25px;"> 강혜성
				                                                            </a>close .dropdown-toggle .board-a-tag-link
				                                                            
				                                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				                                                                <div class="media">
				                                                                    <div class="media-body">
				                                                                   
				                                                                        <a href="#" class="board-a-tag-link modal-link">
				                                                                            <h4>Jonah Terry</h4>
				                                                                        </a>
				                                                                        
				                                                                        <a class="follow_btn board-a-tag-link" href="#">Follow</a>
				                                                                        
				                                                                    </div>
				                                                                </div>
				                                                                <div class="row answere_items">
				                                                                    <div class="col-4">
				                                                                        <a href="#" class="answers-link board-a-tag-link">
				                                                                            <h4>Answers</h4>
				                                                                        </a>
				                                                                        <h6>30</h6>
				                                                                    </div>
				                                                                    <div class="col-4">
				                                                                        <a href="#" class="question-link board-a-tag-link">
				                                                                            <h4>Question</h4>
				                                                                        </a>
				                                                                        <h6>40</h6>
				                                                                    </div>
				                                                                    <div class="col-4">
				                                                                        <a href="#" class="followers-link board-a-tag-link">
				                                                                            <h4>Followers</h4>
				                                                                        </a>
				                                                                        <h6>30</h6>
				                                                                    </div>
				                                                                </div>
				                                                            </div>
				                                                        </li>
				                                                    </ul>
				                                                    <a class="count board-a-tag-link like-link" href="#"><ion-icon name="heart-outline" role="img" class="md hydrated board-a-tag-link" aria-label="heart outline"></ion-icon> 5</a>
				                                                    <a class="count board-a-tag-link comment-link" href="#"><ion-icon name="chatbubbles-outline" role="img" class="md hydrated board-a-tag-link" aria-label="chatbubbles outline"></ion-icon> 70</a>
				                                                    <a class="count board-a-tag-link view-count-link" href="#"><ion-icon name="eye-outline" role="img" class="md hydrated board-a-tag-link" aria-label="eye outline"></ion-icon> 420</a>
				                                                </div>
				                                            </div>
				                                        </li>
				                                    </ul>
				                                    <ul class="navbar-nav topic_list">
				                                        <li class="postLi">
				                                            <div class="media">
				                                                <div class="media-body">
				                                                    <div class="t_title">
				                                                        <a href="forum-single.html" class="board-a-tag-link post-subject-link">
				                                                            <h4>와... 내 말을 아무도 안 들어!</h4>
				                                                        </a>close .board-a-tag-link .post-subject-link
				                                                    </div>    
				                                                        <ul class="tagList" style="display: flex;">
				                                                        	<li style="margin: 0px; padding: 0px;"><a href="#" class="tag board-a-tag-link">자바</a></li>
				                                                        	<li style="margin: 0px; padding: 0px;"><a href="#" class="tag board-a-tag-link">오라클</a></li>
				                                                        	<li style="margin: 0px; padding: 0px;"><a href="#" class="tag board-a-tag-link">아재개그</a></li>
				                                                        </ul>
				                                                        
				                                                    <h6 style="margin-top: 10px;"><ion-icon name="time-outline"></ion-icon> 10 minutes ago
				                                                    </h6>
				                                                </div>
				                                                <div class="media-right">
				                                                    <ul class="nav">
				                                                        <li class="dropdown">
				                                                        
				                                                            <a class="dropdown-toggle board-a-tag-link" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				                                                                <img src="img/profile.png" alt="" style="width: 25px; height: 25px;"> 강혜성
				                                                            </a>close .dropdown-toggle .board-a-tag-link
				                                                            
				                                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				                                                                <div class="media">
				                                                                    <div class="media-body">
				                                                                   
				                                                                        <a href="#" class="board-a-tag-link modal-link">
				                                                                            <h4>Jonah Terry</h4>
				                                                                        </a>
				                                                                        
				                                                                        <a class="follow_btn board-a-tag-link" href="#">Follow</a>
				                                                                        
				                                                                    </div>
				                                                                </div>
				                                                                <div class="row answere_items">
				                                                                    <div class="col-4">
				                                                                        <a href="#" class="answers-link board-a-tag-link">
				                                                                            <h4>Answers</h4>
				                                                                        </a>
				                                                                        <h6>30</h6>
				                                                                    </div>
				                                                                    <div class="col-4">
				                                                                        <a href="#" class="question-link board-a-tag-link">
				                                                                            <h4>Question</h4>
				                                                                        </a>
				                                                                        <h6>40</h6>
				                                                                    </div>
				                                                                    <div class="col-4">
				                                                                        <a href="#" class="followers-link board-a-tag-link">
				                                                                            <h4>Followers</h4>
				                                                                        </a>
				                                                                        <h6>30</h6>
				                                                                    </div>
				                                                                </div>
				                                                            </div>
				                                                        </li>
				                                                    </ul>
				                                                    <a class="count board-a-tag-link like-link" href="#"><ion-icon name="heart-outline" role="img" class="md hydrated board-a-tag-link" aria-label="heart outline"></ion-icon> 5</a>
				                                                    <a class="count board-a-tag-link comment-link" href="#"><ion-icon name="chatbubbles-outline" role="img" class="md hydrated board-a-tag-link" aria-label="chatbubbles outline"></ion-icon> 70</a>
				                                                    <a class="count board-a-tag-link view-count-link" href="#"><ion-icon name="eye-outline" role="img" class="md hydrated board-a-tag-link" aria-label="eye outline"></ion-icon> 420</a>
				                                                </div>
				                                            </div>
				                                        </li>
				                                    </ul>
				                                    <ul class="navbar-nav topic_list">
				                                        <li class="postLi">
				                                            <div class="media">
				                                                <div class="media-body">
				                                                    <div class="t_title">
				                                                        <a href="forum-single.html" class="board-a-tag-link post-subject-link">
				                                                            <h4>블록 딱 5개만 더 쌓는거야~</h4>
				                                                        </a>close .board-a-tag-link .post-subject-link
				                                                    </div>    
				                                                        <ul class="tagList" style="display: flex;">
				                                                        	<li style="margin: 0px; padding: 0px;"><a href="#" class="tag board-a-tag-link">자바</a></li>
				                                                        	<li style="margin: 0px; padding: 0px;"><a href="#" class="tag board-a-tag-link">오라클</a></li>
				                                                        	<li style="margin: 0px; padding: 0px;"><a href="#" class="tag board-a-tag-link">아재개그</a></li>
				                                                        </ul>
				                                                        
				                                                    <h6 style="margin-top: 10px;"><ion-icon name="time-outline"></ion-icon> 3 minutes ago
				                                                    </h6>
				                                                </div>
				                                                <div class="media-right">
				                                                    <ul class="nav">
				                                                        <li class="dropdown">
				                                                        
				                                                            <a class="dropdown-toggle board-a-tag-link" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				                                                                <img src="img/profile.png" alt="" style="width: 25px; height: 25px;"> 강혜성
				                                                            </a>close .dropdown-toggle .board-a-tag-link
				                                                            
				                                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				                                                                <div class="media">
				                                                                    <div class="media-body">
				                                                                   
				                                                                        <a href="#" class="board-a-tag-link modal-link">
				                                                                            <h4>Jonah Terry</h4>
				                                                                        </a>
				                                                                        
				                                                                        <a class="follow_btn board-a-tag-link" href="#">Follow</a>
				                                                                        
				                                                                    </div>
				                                                                </div>
				                                                                <div class="row answere_items">
				                                                                    <div class="col-4">
				                                                                        <a href="#" class="answers-link board-a-tag-link">
				                                                                            <h4>Answers</h4>
				                                                                        </a>
				                                                                        <h6>30</h6>
				                                                                    </div>
				                                                                    <div class="col-4">
				                                                                        <a href="#" class="question-link board-a-tag-link">
				                                                                            <h4>Question</h4>
				                                                                        </a>
				                                                                        <h6>40</h6>
				                                                                    </div>
				                                                                    <div class="col-4">
				                                                                        <a href="#" class="followers-link board-a-tag-link">
				                                                                            <h4>Followers</h4>
				                                                                        </a>
				                                                                        <h6>30</h6>
				                                                                    </div>
				                                                                </div>
				                                                            </div>
				                                                        </li>
				                                                    </ul>
				                                                    <a class="count board-a-tag-link like-link" href="#"><ion-icon name="heart-outline" role="img" class="md hydrated board-a-tag-link" aria-label="heart outline"></ion-icon> 5</a>
				                                                    <a class="count board-a-tag-link comment-link" href="#"><ion-icon name="chatbubbles-outline" role="img" class="md hydrated board-a-tag-link" aria-label="chatbubbles outline"></ion-icon> 70</a>
				                                                    <a class="count board-a-tag-link view-count-link" href="#"><ion-icon name="eye-outline" role="img" class="md hydrated board-a-tag-link" aria-label="eye outline"></ion-icon> 420</a>
				                                                </div>
				                                            </div>
				                                        </li>
				                                    </ul>
				                                    <ul class="navbar-nav topic_list">
				                                        <li class="postLi">
				                                            <div class="media">
				                                                <div class="media-body">
				                                                    <div class="t_title">
				                                                        <a href="forum-single.html" class="board-a-tag-link post-subject-link">
				                                                            <h4>노우</h4>
				                                                        </a>close .board-a-tag-link .post-subject-link
				                                                    </div>    
				                                                        <ul class="tagList" style="display: flex;">
				                                                        	<li style="margin: 0px; padding: 0px;"><a href="#" class="tag board-a-tag-link">자바</a></li>
				                                                        	<li style="margin: 0px; padding: 0px;"><a href="#" class="tag board-a-tag-link">오라클</a></li>
				                                                        	<li style="margin: 0px; padding: 0px;"><a href="#" class="tag board-a-tag-link">아재개그</a></li>
				                                                        </ul>
				                                                        
				                                                    <h6 style="margin-top: 10px;"><ion-icon name="time-outline"></ion-icon> 1 minutes ago
				                                                    </h6>
				                                                </div>
				                                                <div class="media-right">
				                                                    <ul class="nav">
				                                                        <li class="dropdown">
				                                                        
				                                                            <a class="dropdown-toggle board-a-tag-link" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				                                                                <img src="img/profile.png" alt="" style="width: 25px; height: 25px;"> 강혜성
				                                                            </a>close .dropdown-toggle .board-a-tag-link
				                                                            
				                                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				                                                                <div class="media">
				                                                                    <div class="media-body">
				                                                                   
				                                                                        <a href="#" class="board-a-tag-link modal-link">
				                                                                            <h4>Jonah Terry</h4>
				                                                                        </a>
				                                                                        
				                                                                        <a class="follow_btn board-a-tag-link" href="#">Follow</a>
				                                                                        
				                                                                    </div>
				                                                                </div>
				                                                                <div class="row answere_items">
				                                                                    <div class="col-4">
				                                                                        <a href="#" class="answers-link board-a-tag-link">
				                                                                            <h4>Answers</h4>
				                                                                        </a>
				                                                                        <h6>30</h6>
				                                                                    </div>
				                                                                    <div class="col-4">
				                                                                        <a href="#" class="question-link board-a-tag-link">
				                                                                            <h4>Question</h4>
				                                                                        </a>
				                                                                        <h6>40</h6>
				                                                                    </div>
				                                                                    <div class="col-4">
				                                                                        <a href="#" class="followers-link board-a-tag-link">
				                                                                            <h4>Followers</h4>
				                                                                        </a>
				                                                                        <h6>30</h6>
				                                                                    </div>
				                                                                </div>
				                                                            </div>
				                                                        </li>
				                                                    </ul>
				                                                    <a class="board-a-tag-link like-link" href="#"><ion-icon name="heart-outline" role="img" class="md hydrated board-a-tag-link" aria-label="heart outline"></ion-icon> 5</a>
				                                                    <a class="board-a-tag-link comment-link" href="#"><ion-icon name="chatbubbles-outline" role="img" class="md hydrated board-a-tag-link" aria-label="chatbubbles outline"></ion-icon> 70</a>
				                                                    <a class="board-a-tag-link view-count-link" href="#"><ion-icon name="eye-outline" role="img" class="md hydrated board-a-tag-link" aria-label="eye outline"></ion-icon> 420</a>
				                                                </div>
				                                            </div>
				                                        </li>
				                                    </ul>
				                                     -->
				                                    
			                                    </div><!-- close .forum_body -->
										 	</div><!-- close .post-total-area -->
										 </div><!-- close .post-total-parentBox -->
									 </div><!-- close .all-post-area .contentBox -->


								</div><!-- close .oneMainContent .tab-pane .fade #create-post-tab [본문 2페이지 - 게시글 종료] -->
								
								
								<!-- [본문 3페이지 시작 - 댓글] -->
								<div class="oneMainContent tab-pane fade" id="create-comment-tab" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">
									
									<div class="descTextBox">
										<span class="descText my-post-descTxt"> 내가 작성한 댓글 목록 </span>
									</div>									
								 	<div class="all-post-area contentBox">
								 		<div class="post-total-parentBox">
										 	<div class="post-total-area">
											 	<div class="forum_body">
											 	
											 	
											 		<%-- 댓글 한 개 --%>
											 		
											 		<c:forEach var="comment" items="${commentList }">
					                                      <ul class="navbar-nav topic_list">
					                                        <li class="postLi">
					                                            <div class="media">
					                                                <div class="media-body">
					                                                    <div class="t_title">
					                                                    	<span class="post-class-text">${comment.comment_class } Q&A 게시판</span>
					                                                    	<div class="comment-post-title-txt-box">[${comment.comment_post_title }]</div>
					                                                        <a href="forum-single.html" class="board-a-tag-link post-subject-link">
					                                                            <p class="comment-content-text">▶ ${comment.comment_content }
					                                                            </p>
					                                                        </a>
					                                                    </div>    
					                                                    <h6 style="margin-top: 10px;"><ion-icon name="time-outline"></ion-icon> 
					                                                    
					                                                    <%-- 26 minutes ago --%>
					                                                     
					                                                     <c:choose>
					                                                     
					                                                     	<%-- 몇 달 전일 때 --%>
					                                                     	<c:when test="${comment.comment_prev_month > 0 }">
					                                                     	
					                                                     		${comment.comment_prev_month }
					                                                     		
					                                                     		<c:choose>
			                                                     					<c:when test="${comment.comment_prev_month == 1 }">
			                                                     						month
			                                                     					</c:when>
			                                                     					<c:otherwise>
			                                                     						months
			                                                     					</c:otherwise>
			                                                     				</c:choose>
					                                                     		ago
					                                                     		
					                                                     	</c:when>
					                                                     	
					                                                     	<%-- 며칠 전일 때 --%>
					                                                     	<c:when test="${comment.comment_prev_day > 0 }">
					                                                     	
					                                                     		${comment.comment_prev_day }
				                                                     			<c:choose>
			                                                     					<c:when test="${comment.comment_prev_day == 1 }">
			                                                     						day
			                                                     					</c:when>
			                                                     					<c:otherwise>
			                                                     						days
			                                                     					</c:otherwise>
			                                                     				</c:choose>
					                                                     		ago
					                                                     		
					                                                     	</c:when>
					                                                     	
					                                                     	<%-- 당일일 때 --%>
					                                                     	<c:when test="${comment.comment_prev_day == 0 }">
					                                                     		
					                                                     		<c:choose>
					                                                     		
					                                                     			<%-- 몇 시간 전일 때 --%>
					                                                     			<c:when test="${comment.comment_prev_hour > 0 }">
					                                                     			
					                                                     				${comment.comment_prev_hour }
					                                                     				<c:choose>
					                                                     					<c:when test="${comment.comment_prev_hour == 1 }">
					                                                     						hour
					                                                     					</c:when>
					                                                     					<c:otherwise>
					                                                     						hours
					                                                     					</c:otherwise>
					                                                     				</c:choose>
							                                                     		ago
							                                                     		
					                                                     			</c:when>
					                                                     			
					                                                     			<%-- 몇 분 전일 때 --%>
					                                                     			<c:when test="${comment.comment_prev_hour == 0 }">
					                                                     			
					                                                     				${comment.comment_prev_minute } 
					                                                     				<c:choose>
					                                                     					<c:when test="${comment.comment_prev_minute == 1 }">
					                                                     						minute
					                                                     					</c:when>
					                                                     					<c:otherwise>
					                                                     						minutes
					                                                     					</c:otherwise>
					                                                     				</c:choose>
							                                                     		ago
					                                                     			
					                                                     			</c:when>
					                                                     		
					                                                     		</c:choose>
					                                                     		
					                                                     	</c:when>
					                                                     	
					                                                     
					                                                     </c:choose>
					                                                    </h6>
					                                                </div>
					                                                <div class="media-right">
					                                                    <ul class="nav">
					                                                        <li class="dropdown">
					                                                        
					                                                            <a class="dropdown-toggle board-a-tag-link" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					                                                                <img src="img/profile.png" alt="" style="width: 25px; height: 25px;"> ${comment.nickname }
					                                                            </a>
					                                                            
					                                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
					                                                                <div class="media">
					                                                                    <div class="media-body">
					                                                                   
					                                                                        <a href="#" class="board-a-tag-link modal-link">
					                                                                            <h4>${comment.nickname }</h4>
					                                                                        </a>
					                                                                        
					                                                                        <a class="follow_btn board-a-tag-link" href="#">Follow</a>
					                                                                        
					                                                                    </div>
					                                                                </div>
					                                                            </div>
					                                                        </li>
					                                                    </ul>
					                                                    <div class="comment-up-parentBox">
					                                                    	<div class="comment-up-miniBox">
							                                                    <a class="comment-up-link count board-a-tag-link like-link" href="#"><span class="material-symbols-outlined comment-up-icon">thumb_up</span>
							                                                    	<span class="up-count-txt">${comment.comment_up_count }</span>
							                                                    </a>
						                                                    </div>
					                                                    </div>
					                                                </div>
					                                            </div>
					                                        </li>
					                                    </ul>
				                                    </c:forEach>
				                                    
											 		<%-- 댓글 한 개 --%>
				                                    <!--   <ul class="navbar-nav topic_list">
				                                        <li class="postLi">
				                                            <div class="media">
				                                                <div class="media-body">
				                                                    <div class="t_title">
				                                                    	<span class="post-class-text">기술 Q&A 게시판</span>
				                                                    	<div class="post-title-txt-box">게시글 제목</div>
				                                                        <a href="forum-single.html" class="board-a-tag-link post-subject-link">
				                                                            <p>일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십</p>
				                                                        </a>
				                                                    </div>    
				                                                    <h6 style="margin-top: 10px;"><ion-icon name="time-outline"></ion-icon> 26 minutes ago
				                                                    </h6>
				                                                </div>
				                                                <div class="media-right">
				                                                    <ul class="nav">
				                                                        <li class="dropdown">
				                                                        
				                                                            <a class="dropdown-toggle board-a-tag-link" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				                                                                <img src="img/profile.png" alt="" style="width: 25px; height: 25px;"> 강혜성
				                                                            </a>
				                                                            
				                                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				                                                                <div class="media">
				                                                                    <div class="media-body">
				                                                                   
				                                                                        <a href="#" class="board-a-tag-link modal-link">
				                                                                            <h4>Jonah Terry</h4>
				                                                                        </a>
				                                                                        
				                                                                        <a class="follow_btn board-a-tag-link" href="#">Follow</a>
				                                                                        
				                                                                    </div>
				                                                                </div>
				                                                                <div class="row answere_items">
				                                                                    <div class="col-4">
				                                                                        <a href="#" class="answers-link board-a-tag-link">
				                                                                            <h4>Answers</h4>
				                                                                        </a>
				                                                                        <h6>30</h6>
				                                                                    </div>
				                                                                    <div class="col-4">
				                                                                        <a href="#" class="question-link board-a-tag-link">
				                                                                            <h4>Question</h4>
				                                                                        </a>
				                                                                        <h6>40</h6>
				                                                                    </div>
				                                                                    <div class="col-4">
				                                                                        <a href="#" class="followers-link board-a-tag-link">
				                                                                            <h4>Followers</h4>
				                                                                        </a>
				                                                                        <h6>30</h6>
				                                                                    </div>
				                                                                </div>
				                                                            </div>
				                                                        </li>
				                                                    </ul>
				                                                    <div class="comment-up-parentBox">
				                                                    	<div class="comment-up-miniBox">
						                                                    <a class="comment-up-link count board-a-tag-link like-link" href="#"><span class="material-symbols-outlined comment-up-icon">thumb_up</span>
						                                                    	<span class="up-count-txt">3</span>
						                                                    </a>
					                                                    </div>
				                                                    </div>
				                                                </div>
				                                            </div>
				                                        </li>
				                                    </ul> -->
				                                                    
				                                                    
				                                                </div>
				                                            </div>
				                                        </li>
				                                    </ul>
				                                    
			                                    </div><!-- close .forum_body -->
										 	</div><!-- close .post-total-area -->
										 </div><!-- close .post-total-parentBox -->
									 </div><!-- close .all-post-area .contentBox -->
								
								</div><!-- close .oneMainContent .tab-pane .fade #create-comment-tab [본문 3페이지 - 댓글 종료] -->

							</div>
							<!-- close .tab-content .mainTextBox -->
						</div>
						<!-- close .row .mainTextArea -->
					</div>
					<!-- close .col-10-auto .myPageSecondBox -->

				</div>
				<!-- close .row .align-items-center .myPageMainArea -->

			</div><!-- close .container .text-center .myPageMainArea -->


		</div><!-- close . -->
	</div>
	<!-- end .row -->

</body>
</html>






