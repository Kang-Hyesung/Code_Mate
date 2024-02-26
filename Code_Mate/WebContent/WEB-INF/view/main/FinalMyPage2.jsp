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
<title>MyPage.html</title>


<!-- BootStrap -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<!-- ionicons -->
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

<!-- JQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>


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

/* 웹페이지 body 영역 */
body
{
	height: 100%;
}


/* 전체 div 영역 */
div
{
	/* border: 1px solid gray; */
}

/* 마이페이지 영역 전체를 감싸는 최상위 부모 div */
.myPageMainArea
{
	/* height: 1400px; */

}



/* 마이페이지 본문 영역 div */
.myPageArea 
{
    height: 130%;
    margin: 20px;
    padding: 20px;
    border-radius: 10px;
}

/* 프로필 하단 본문 영역 div */
.row.mainTextArea 
{
    height: inherit;
}

/* 프로필 영역전체에 해당하는 최상위 부모 div */
.row.row-cols-2.profileArea 
{
    margin: 0 0 0 50px;
}

/* 프로필 이미지를 감싸는 부모 div */
.profileImageBox
{
	overflow: hidden;
	border-radius: 70%;
	width: 200px;
	height:  200px;
    margin: 56px;
}



/* 프로필 이미지 */
.profileImage
{
	width: 100%;
	height: 100%;
	object-fit: cover;
	
}

/* 프로필 이메일 */
.col-6.emailBox 
{
    font-size: 14px;
    color: gray;
    line-height: 50px;
}

/* 프로필 최상단 Skill-Grade를 감싸는 div 영역 */
.col-12.mainTextBox
{
    text-align: left;
    font-size: 25px;
    color: #345f53;
    border-radius: 10px;
    /* border-bottom: 3px solid gray; */
}

/* 프로필 최상단 Back-end, Front-end 설명 텍스트를 감싸는 div 영역 */
.textBox 
{
    text-align: left;
    padding: 10px 0px 10px 30px;
    font-size: 18px;
    color: #41b179;
    border-bottom: 2px solid;
    box-shadow: inherit;
}

/* 프로필 최상단 Back-end, Front-end 박스 하단의 아이콘을 감싸는 div 영역 */
.gradeIconBox 
{
    font-size: 36px;
}

/* 각각의 카테고리 탭 하나에 해당하는 영역 */
.category-tab 
{
    width: 300px;
    text-align: center;
    margin: auto;
}


/* 각각의 항목들을 설명하는 큰 텍스트를 감싸는 div 영역 */
.descTextBox 
{
    font-size: 26px;
    color: green;
    text-align: left;
    border-top: 5px solid green;
    padding: 12px;
    box-shadow: initial;
    margin: 30px 10px 10px 15px;
    
    
}

/* 프로필 표시 영역 - [닉네임, 이메일 div] */
.nickAndEmailBox
{
	overflow: hidden;
	margin: 40px;
	text-align: left;
	 
}


/* 프로필 닉네임 */
.nickNameBox
{
	font-weight: bold;
	font-size: 30px;
}


/* 프로필 표시 영역 - [스킬 div] */
.skillBox
{
	margin: 30px 20px 20px 20px;
}

/* 프로필 수정 및 공개 비공개 버튼 영역 div */
.profileBtnArea
{
	text-align: right;
}

/* 마이페이지 - 상단 개인정보 부분 박스 영역 div */
.contentBox 
{
    box-shadow: 3px 3px 3px 3px #d1d1d1;
    border-radius: 10px;
}


/* 마이페이지 본문 영역 전체를 감싸는 최상위 부모 div */
.myPageSecondBox
{

}

/* 마이페이지 탭 아래의 본문 전체 영역 */
.mainTextArea
{
	height: 1000px;
}

/* 회사명 */
.companyName
{
	font-weight: bold;
}

/* 경력 리스트 전체를 감싸는 영역 */
.careerListArea.row.row-cols-3 
{
    margin: 20px;
    box-shadow: 3px 3px 3px 3px #d1d1d1;
    border-radius: 10px;
}

/* 경력 리스트 ul 태그 클래스(리스트 전체) */
.one-careerBox
{
	list-style-type: none;	
	text-align: left;
	margin: 40px;
	border-left: 1px solid gray;
}


</style>

</head>
<body>

<div class="container text-center myPageMainArea">

	<div class="row myPageArea" style="border: 3px solid orange;">
		
		<div class="col-11-auto myPageFirstBox">
			<div class="row row-cols-2 profileArea">
			
				<!--
				 [마이페이지 상단 프로필 영역]
				 - 프로필 수정 / 공개·비공개 여부 버튼
				 - 프로필 이미지, 닉네임, 이메일
				 - 백엔드 / 프론트엔드 실력 등급
				 --> 
			
				<div class="col col-12 profileBtnArea">
					<div class="btn-group profileBtnBox" role="group" aria-label="Basic radio toggle button group">
					  <input type="radio" class="btn-check edit-btn" name="btnradio" id="btnradio1" autocomplete="off" checked>
					  <label class="btn btn-outline-primary" for="btnradio1">수정하기</label>
					
					  <input type="radio" class="btn-check edit-btn" name="btnradio" id="btnradio2" autocomplete="off">
					  <label class="btn btn-outline-primary" for="btnradio2">공개/비공개 변경</label>
					</div>
				</div><!-- close .profileBtnBox -->
				
				
				<div class="col col-3 profileImageBox">
				<!-- 혜성강~ -->
					<!-- <img class="profileImage" src="img/profileImg_1.png"> -->
					<img class="profileImage" src="img/pompomLove.png">
				</div><!--  -->
				
				<div class="col col-8 profileMainArea">
		
					<div class="nickAndEmailBox">
						<div class="nickNameBox">
							Mr.Kang
						</div><!-- close .nickNameBox -->
						
						<div class="emailBox">
							hyesung9797@gmail.com
						</div><!-- close .emailBox -->
					</div><!-- close .nickAndEmailBox -->
					
				
					
					<div class="row row-cols-2 skillBox">
						
						<div class="col-12 mainTextBox">
							<span class="skillText">실력 등급</span>
						</div><!-- close .mainTextBox -->
						
						<div class="backSkillGradeBox">
							<div class="textBox">
								<span class="descText">
									Back-end
								</span>
							</div><!-- close .textBox -->
							
							<div class="gradeIconBox">
								🌲
								<span class="gradeText">
									나무
								</span>
							</div>
						</div><!-- close .backSkillGradeBox -->
						
						<div class="frontSkillGradeBox">

							<div class="textBox">
								<span class="descText">
									Front-end
								</span>
							</div><!-- close .textBox -->
							
							<div class="gradeIconBox">
								🌱
								<span class="gradeText">
									새싹
								</span>
							</div>
						</div><!-- close .frontSkillGradeBox -->
					</div><!-- close .row .row-cols-2 .skillBox -->
		
						
				</div><!-- close .profileMainArea -->
			</div><!-- close .profileArea -->
		</div><!-- close .col-10-auto .myPageFirstBox -->
		
		
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
			
			<div class="row tabArea">
			
				<ul class="tabCategoryBox nav nav-tabs row row-cols-3" id="myTab" role="tablist">
					
					<!-- [1. 개인정보 / 프로젝트 참여 이력 탭] -->
					<li class="oneCategoryTab nav-item col" role="presentation">
				    	<button class="category-tab nav-link active" data-bs-toggle="tab" data-bs-target="#main-tab" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">Home</button>
					</li><!-- end .oneCategoryTab -->
				  	
				  	<!-- [2. 본인이 작성한 게시글 리스트 탭] -->
				  	<li class="oneCategoryTab nav-item" role="presentation">
				    	<button class="category-tab nav-link col" data-bs-toggle="tab" data-bs-target="#create-post-tab" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">Profile</button>
				  	</li><!-- end .oneCategoryTab -->
				  	
				  	<!-- [3. 본인이 작성한 댓글 리스트 탭] -->
				  	<li class="oneCategoryTab nav-item" role="presentation">
				    	<button class="category-tab nav-link col" data-bs-toggle="tab" data-bs-target="#create-comment-tab" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">Contact</button>
				  	</li><!-- end .oneCategoryTab -->
				  	
				  	
				</ul><!-- close .nav .nav-tabs .row .row-cols-3 -->
						
			</div><!-- close .row .tabArea -->
			
		
			<div class="row mainTextArea">
				<div class="tab-content mainTextBox col-10-auto" id="myTabContent">
				  
				  <div class="oneMainContent tab-pane fade container text-center show active" id="main-tab" role="tabpanel" aria-labelledby="home-tab" tabindex="0">	
				  	
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
				  				<span class="descText">
				  					[Who am I?]
				  				</span>
			  				</div><!-- close .descTextBox -->
			  				
			  				<div class="contentBox">
				  				성별 : 남성<br>
				  				생년월일 : 1997/10/17<br>
				  				MBTI : INTJ
			  				</div>
			  			</div><!-- close .privacyBox -->
			  			
			  			
						<!-- 【경력 영역 시작】================= -->			  			
			  			<div class="careerBox col-5-auto">

			  				<div class="descTextBox">
				  				<span class="descText">
				  					[Career]
				  				</span>
			  				</div>
			  				<div class="total-career row">
			  					<span class="descText col-4">
				  					경력
				  				</span>
				  				<div class="career-content col-6">
			  					 	2년
				  				</div>
			  				</div>

			  				<!-- 경력 리스트 -->
			  				<div class="careerListArea row row-cols-3">
			  				
			  					<ul class="careerList">
			  						
			  						<li class="one-careerBox">
										
										<ion-icon name="disc-outline"></ion-icon>			  				
										<span class="career-company">
											네이버
										</span><!-- close one-careerBox -->
										<br>
										<span class="career-role">
											백엔드 개발자
										</span><!-- close .career-role -->
										<br>
										<span class="career-period">
											2022-01-27 ~ 2022-09-10
										</span><!-- close .career-period -->
										
									</li><!-- close .one-careerBox -->
									
			  						<li class="one-careerBox">
										<span class="career-icon">
											<ion-icon name="disc-outline"></ion-icon>			  				
										</span><!-- close .career-icon -->

										<span class="career-company">
											배달의 민족
										</span><!-- close one-careerBox -->
										<br>

										<span class="career-role">
											백엔드 개발자
										</span><!-- close .career-role -->
										<br>
										<span class="career-period">
											2022-11-20 ~ 2023-01-17
										</span><!-- close .career-period -->
										
									</li><!-- close .one-careerBox -->
			  						
			  					
			  					</ul><!-- close .careerList -->
			  				
			  				
			  				
			  				</div><!-- close .careerListArea -->
			  				
			  			</div><!-- close .careerBox -->
			  			
			  			
			  			
			  			
			  		</div><!-- close .privacyArea -->
				  	
				  	<!--  
				  		마이페이지 1페이지 본문 두 번째 영역 - [참여 이력]
					   - 주요 스킬(사용언어, 기술), 완료된 프로젝트와 미완료된 프로젝트 비율
					   - 참여한 프로젝트명, 담당 직무, 시작일/종료일, 완료/미완료
				  	-->
				  	
				  	<div class="projectRecord-area">
				  	
				  		<!-- 스킬 -->
				  		<div class="skill-area">
				  			<div class="descTextBox">
							  	<span class="descText">
							  		Skill
							  	</span><!-- close .descText -->
				  			</div><!-- close .descBox -->
				  			<div class="skill-content">
						  			Java, Javascript, Oracle, C++
						  	</div><!-- close .skill-content -->
				  		</div><!-- close .skill-area -->
				  		
				  		<!-- 프로젝트 완료 비율 -->
				  		<div class="pjCompleteRatio-area">
				  			<div class="descTextBox">
				  				완료한 프로젝트 비율
				  			</div>
					  		<div class="pjCompleteRatio">
					  			40%
					  		</div><!-- close .pjCompleteRatio -->
				  		</div><!-- close .pjComplateRatio-area  -->
				  		
				  		<!-- 참여한 프로젝트명, 담당 직무, 시작일/종료일, 완료/미완료 -->
				  		<div class="pj-historyArea row row-cols-3">


					  		<!-- 프로젝트 이력 한 개 -->
					  		<div class="card one-projectBox" >
							  <div class="card-body pj-history">
							  
							    <h5 class="card-title project-name">무인 호텔 키오스크</h5>
							    <h6 class="card-title project-job">백엔드</h6>
							    <p class="card-text project-desc">Java 와 객체 직렬화/역직렬화를 이용한 무인 호텔 키오스크 자판기</p>
							    <span class="project-term">2023-09-26 ~ 2023-10-16</span>
							    
							  </div><!-- close .pj-history -->
							</div><!-- close .one-projectBox -->


					  		
					  		<!-- 프로젝트 이력 한 개 -->
					  		<div class="card one-projectBox">
							  <div class="card-body pj-history">
							  
							    <h5 class="card-title project-name">개발자 프로젝트 모집</h5>
							    <h6 class="card-title project-job">백엔드</h6>
							    <p class="card-text project-desc">개발자의 프로젝트를 모집해주는 웹 사이트</p>
							    <span class="project-term">2024-02-10 ~ 2024-02-21</span>
							    
							  </div><!-- close .pj-history -->
							</div><!-- close .one-projectBox -->

				  			
				  			
				  			
				  			
				  		</div><!-- close .pj-historyArea -->
				  		
				  		
				  	</div><!-- close .projectRecord-area -->
				  	
				  	
				  	
				  	
				  </div><!-- close .oneMainContent .tab-pane .fade .show .active -->
				  
				  
				  <div class="oneMainContent tab-pane fade" id="create-post-tab" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
				  		
				  		내가 작성한 게시글 목록이 보여진다....
				  		
				  		
				  </div><!-- close .oneMainContent .tab-pane .fade #create-post-tab  -->
				  
				  
				  <div class="oneMainContent tab-pane fade" id="create-comment-tab" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">
				  
				  		내가 작성한 댓글 목록이 보여진다....
				  
				  </div><!-- close .oneMainContent .tab-pane .fade #create-comment-tab -->
				
				</div><!-- close .tab-content .mainTextBox -->
			</div><!-- close .row .mainTextArea -->
		</div><!-- close .col-10-auto .myPageSecondBox -->
		
		
		
	</div><!-- close .row .align-items-center .myPageMainArea -->

</div>


</body>
</html>