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
<title>신고 관련 문의</title>
<!-- BootStrap -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/banner_side.css" />

<!-- JQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>

<!-- ionicons -->
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<style type="text/css">
	.prjname{vertical-align: middle;}
	.prjtitle{padding-top: 10px; justify-content: space-between;}

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
	/* 큰 창 */
	.skill-progress{
    width: 400px;
    height: 250px;
    padding: 20px;
    color: white;
    background-color: #C7C8CC;
    border-radius: 10px;
    color : #fff;
    box-shadow: 0 3px 6px rgba(0,0,0,8.16);

    /* 해당요소를 수직,수평중앙정렬 */
    /* position: absolute;
    top : 50%;
    left : 50%;
    transform: translate(-50%, -50%); */      /*translate(-top위치, -left위치)*/
	}
	
	.skill-progress h1{
	    text-align: center;
	    font-size: 30px;
	    box-shadow: 0 20px 50px rgba(0, 0, 0, 0.089);
	}
	.item {
    transition: 0.4s;
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
	    background : linear-gradient(to right, #EED3D9, #EED3D9);   /*방향(deg각도도 가능), 시작색상, 종료색상*/
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
	/* div{border: 1px solid black;} */
	
	.meeting-list {
	  list-style-type: none;
	  padding: 0;
	  box-shadow: 0 3px 6px rgba(0,0,0,8.16);
	}
	
	.meeting-list li {
	  background-color: #fff;
	  padding: 10px;
	  margin: 5px 0;
	  border-radius: 5px;
	  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	}
	
	.meeting-date {
	  font-weight: bold;
	  margin-right: 10px;
	}
	
	.meeting-author {
	  margin-right: 10px;
	}
	
	.meeting-title {
	  font-style: italic;
	}
	
	.report-list {
	  list-style-type: none;
	  padding: 0;
	}
	
	.report-list li {
	  background-color: #fff;
	  padding: 15px;
	  margin: 10px 0;
	  border-radius: 8px;
	  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	}
	
	.report-author {
	  font-weight: bold;
	  margin-bottom: 5px;
	  display: block;
	}
	
	.report-title {
	  font-size: 1.1em;
	  color: #333;
	}
	
	.task-container {
	  max-width: 600px;
	  margin: 20px auto;
	  padding: 20px;
	  background-color: #fff;
	  border-radius: 8px;
	  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	}
	
	.task-list {
	  list-style-type: none;
	  padding: 0;
	}
	
	.task-list li {
	  padding: 15px;
	  margin: 10px 0;
	  border-bottom: 1px solid #ccc;
	}
	
	.task-assignee {
	  font-weight: bold;
	  margin-bottom: 5px;
	  display: block;
	}
	
	.task-title {
	  color: #333;
	}
	
	.task-date {
	  color: #666;
	}
	
	.lastchange{margin-top: 40px;}
	
	/*admin page*/
	.row-space {
	margin-right: 20px;
	margin-bottom: 20px;
	justify-content: flex-start;
	flex-flow: row nowrap;
	display: flex;
}
.bordered-div {
	border: 1px solid #d9d9d9;
	padding: 18px;
	margin-right: 10px;
	margin-bottom: 10px;
	height: 110px;
}
.material-symbols-outlined {
	font-family: 'Material Symbols Outlined';
	font-weight: normal;
	font-style: normal;
	font-size: 39px;
	line-height: 1;
	letter-spacing: normal;
	text-transform: none;
	display: inline-block;
	white-space: nowrap;
	word-wrap: normal;
	direction: ltr;
	-webkit-font-feature-settings: 'liga';
	-webkit-font-smoothing: antialiased;
}
ul.pagination2 {
	display: inline;
}
li.pagination2 {
	display: inline;
}
nav.pagination2 {
	display: inline;
}
.pagination {
	justify-content: center;
}
.spanicon {
	position: relative;
	bottom: 4px;
}
.btn {
	line-height: 0px;
	height: 30px;
}
	
	/* 테이블 스타일	*/
	        .div-table {
            display: table;
            width: 100%;
            border-spacing: 2px;
            border-collapse: collapse;
        }

        .div-table-row {
            display: table-row;
        }

        .div-table-cell {
            display: table-cell;
            border: 1px solid #d9d9d9;
            padding: 8px;
            text-align: center;
}
.ellipsis-content {
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	
	max-width: 150px;
}
        /* 날짜 스타일 */
        .date-class {
			margin-top: 4%;
		}
		
		.date-input {
			border: var(--bs-border-width) solid var(--bs-border-color);
		    padding: 10px;
		    border-radius: 8px;
		    font-weight: 5;
		    font-family: 'SUITE-Regular';
		    width: 12%;
		}
		.date-span {
			font-size: 25px;
		}
		
		.com-select {
	
	border-radius: 3px;
    font-family: 'SUITE-Regular';
    height: 46px;
    border: var(--bs-border-width) solid var(--bs-border-color);
    margin-right: 5px;
    width: 110px;
}
.com-input {
    border-radius: 3px;
    border: 1px solid #d9d9d9;
    width: 24%;
    height: 46px;
	    
}
.com-btn {
    border-radius: 3px;
    
}
.comm-div {
    margin-top: 17px;
    margin-bottom: 9px;
    display: flex;
    
}
        
</style>
<!-- 내용 전체 출력 -->
<script>
	$(document).ready(function () {
    $('[data-toggle="tooltip"]').tooltip();

    $('.ellipsis-content').on('click', function () {
        var content = $(this).html();
        
        $('#modal_content').text(content);
        $('#inquirydetail').modal("show");
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
	
	
	
	<div class="flex">
		<div class="col-6 menuArea">
			<div class="leftmenuBarBox">
				<div class="leftmenuBar">
				
					<!--===========[Logo]===========-->
					<a class="navbar-brand mainLogo link" href="#">
						<img alt="Logo" class="LogoImageBanner d-inline-block align-text-top" src="img/TestLogo.png" >
					</a>
					<!--===========[Logo]===========-->
					
					
					<div class="menuOptions nav nav-underline lastchange" id="nav">
						<ul class="nav-item">
							<a href="#" class="majorTopic nav-link link">회원 관리<ion-icon class="menuIcon" name="terminal-outline"></ion-icon></a>
							<li class="miniMenuOption">
								<ul>
									<li class="miniMenuOption"><a href="Member.action" class="nav-link link">전체 회원</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">가입한 회원</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">탈퇴한 회원</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">패널티 보유 회원</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">블랙 리스트</a></li>
								</ul>
							</li>
						</ul>
						<ul class="nav-item ">
							<a href="#" class="majorTopic nav-link link">커뮤니티 관리<ion-icon class="menuIcon" name="desktop-outline"></ion-icon></a>
							<li  class="miniMenuOption">
								<ul>
									<li class="miniMenuOption"><a href="#" class="nav-link link">게시글</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">댓글</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">대댓글</a></li>
								</ul>
							</li>
						</ul>
						<ul class="nav-item">
							<a href="#" class="majorTopic nav-link link">신고 관리<ion-icon class="menuIcon" name="reader-outline"></ion-icon></a>
							<li class="miniMenuOption">
								<ul>
									<li class="miniMenuOption"><a href="#" class="nav-link link">신고 접수</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">신고 처리</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">처리 완료</a></li>
								</ul>
							</li>
						</ul>
						<ul class="nav-item">
							<a href="Inquiry_Faq.action" class="majorTopic nav-link link">고객 센터<ion-icon class="menuIcon" name="person-outline"></ion-icon></a>
							<li class="miniMenuOption">
								<ul>
									<li class="miniMenuOption"><a href="Inquiry_Faq.action"
										class="nav-link link">FAQ</a></li>
									<li class="miniMenuOption"><a href="Inquiry_1v1.action"
										class="nav-link link">1대1 문의</a></li>
									<li class="miniMenuOption"><a href="Inquiry_Report.action"
										class="nav-link link">신고 관련 문의</a></li>
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
			
			
				<div class="col-md-9 col-lg-9 col-sm-9 col-xs-9 bordered-div"
				style="width: 100%; height: 100%; border: 1px solid #d9d9d9;">
				<h5>신고 관련 문의 사항</h5>
				<div class="date-class">
					<span style="margin-right: 14px;">기간별 검색</span>
					<input class="date-input" id="date_first" type="date" data-placeholder="날짜 선택" required aria-required="true" ></input>
					<span class="date-span">-</span>
					<input class="date-input" id= "date_sysdate" type="date" data-placeholder="날짜 선택" required aria-required="true"></input>
				</div>
				
				<div class="row-4 comm-div">
					<select class="com-select">
						<option selected>전체</option>
						<option value="1">질문</option>
						<option value="2">항의</option>
						<option value="3">기타</option>
					</select>
					<input type="text" class="com-input">
					<button  type="button" class="btn btn-sm btn-secondary com-btn">검색</button>
				</div>
				<div class="table-responsive">
					<table class="table no-wrap">
						<thead>
							<tr class="text-center">
								<!-- ~ 신고 종류 까지 기존 신고 데이터 사용 -->
								<th class="border-top-0">#</th>
								<th class="border-top-0">신고 번호</th>
								<th class="border-top-0">신고 유형</th>
								<th class="border-top-0">신고 종류</th>
								
								<th class="border-top-0">작성일</th>
								<th class="border-top-0">닉네임</th>
								<th class="border-top-0">아이디</th>
								<th class="border-top-0">제목</th>
								<th class="border-top-0">내용</th>
								<th class="border-top-0">문의 유형</th>
								<th class="border-top-0">처리 상태</th>
								<th class="border-top-0">답변 하기</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="text-center">1</td>
								<td class="text-center">20240001</td>
								<td class="text-center">개인</td>
								<td class="text-center">부적절한 닉네임</td>
								
								<td class="text-center">2024-02-26</td>
								<td class="text-center">윤수 짱짱</td>
								<td class="text-center">ys0106</td>
								<td class="text-center">닉네임 변경 단위 기간</td>
								

								
								<td class="text-center ellipsis-content" data-toggle="tooltip"
									data-placement="top" title="전체 내용을 보려면 클릭하세요.">제가 신고한 사람의 닉네임이 언제쯤 바뀌나요?</td>
									
								<div class="modal fade" id="inquirydetail" tabindex="-1" aria-labelledby="inquirydetail" aria-hidden="true">
								  <div class="modal-dialog modal-dialog-centered">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="inquirydetailLabel">전체 내용</h5>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <div class="modal-body">
								        <p id="modal_content"></p>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
								      </div>
								    </div>
								  </div>
								</div>			
														
								
								<td class="text-center">질문</td>
								
								<td class="text-center">
									<a href="">
										<span class="material-symbols-outlined" style="font-size: 21px;">Done</span>
									</a>
								</td>
								
								<td class="text-center">
									<button type="submit">답변하기</button>
								</td>
							</tr>
							<tr>
								<td class="text-center ellipsis-content">1</td>
								<td class="text-center ellipsis-content">20240001</td>
								<td class="text-center ellipsis-content">개인</td>
								<td class="text-center ellipsis-content">부적절한 닉네임</td>
								
								<td class="text-center ellipsis-content">2024-02-26</td>
								<td class="text-center ellipsis-content">윤수 짱짱</td>
								<td class="text-center ellipsis-content">ys0106</td>
								<td class="text-center ellipsis-content">닉네임 변경 단위 기간</td>
								

								
								<td class="text-center ellipsis-content" data-toggle="tooltip"
									data-placement="top" title="전체 내용을 보려면 클릭하세요.">제가 신고한 사람의 닉네임이 언제쯤 바뀌나요?</td>
									
								<div class="modal fade" id="inquirydetail" tabindex="-1" aria-labelledby="inquirydetail" aria-hidden="true">
								  <div class="modal-dialog modal-dialog-centered">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="inquirydetailLabel">전체 내용</h5>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <div class="modal-body">
								        <p id="modal_content"></p>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
								      </div>
								    </div>
								  </div>
								</div>			
														
								
								<td class="text-center">질문</td>
								
								<td class="text-center">
									<a href="">
										<span class="material-symbols-outlined" style="font-size: 21px;">Done</span>
									</a>
								</td>
								
								<td class="text-center">
									<button type="submit">답변하기</button>
								</td>
							</tr>
							<tr>
								<td class="text-center">1</td>
								<td class="text-center">20240001</td>
								<td class="text-center">개인</td>
								<td class="text-center">부적절한 닉네임</td>
								
								<td class="text-center">2024-02-26</td>
								<td class="text-center">윤수 짱짱</td>
								<td class="text-center">ys0106</td>
								<td class="text-center">닉네임 변경 단위 기간</td>
								

								
								<td class="text-center ellipsis-content" data-toggle="tooltip"
									data-placement="top" title="전체 내용을 보려면 클릭하세요.">제가 신고한 사람의 닉네임이 언제쯤 바뀌나요?</td>
									
								<div class="modal fade" id="inquirydetail" tabindex="-1" aria-labelledby="inquirydetail" aria-hidden="true">
								  <div class="modal-dialog modal-dialog-centered">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="inquirydetailLabel">전체 내용</h5>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <div class="modal-body">
								        <p id="modal_content"></p>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
								      </div>
								    </div>
								  </div>
								</div>			
														
								
								<td class="text-center">질문</td>
								
								<td class="text-center">
									<a href="">
										<span class="material-symbols-outlined" style="font-size: 21px;">Done</span>
									</a>
								</td>
								
								<td class="text-center">
									<button type="submit">답변하기</button>
								</td>
							</tr>
							<tr>
								<td class="text-center">1</td>
								<td class="text-center">20240001</td>
								<td class="text-center">개인</td>
								<td class="text-center">부적절한 닉네임</td>
								
								<td class="text-center">2024-02-26</td>
								<td class="text-center">윤수 짱짱</td>
								<td class="text-center">ys0106</td>
								<td class="text-center">닉네임 변경 단위 기간</td>
								

								
								<td class="text-center ellipsis-content" data-toggle="tooltip"
									data-placement="top" title="전체 내용을 보려면 클릭하세요.">제가 신고한 사람의 닉네임이 언제쯤 바뀌나요?</td>
									
								<div class="modal fade" id="inquirydetail" tabindex="-1" aria-labelledby="inquirydetail" aria-hidden="true">
								  <div class="modal-dialog modal-dialog-centered">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="inquirydetailLabel">전체 내용</h5>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <div class="modal-body">
								        <p id="modal_content"></p>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
								      </div>
								    </div>
								  </div>
								</div>			
														
								
								<td class="text-center">질문</td>
								
								<td class="text-center">
									<a href="">
										<span class="material-symbols-outlined" style="font-size: 21px;">Done</span>
									</a>
								</td>
								
								<td class="text-center">
									<button type="submit">답변하기</button>
								</td>
							</tr>
							<tr>
								<td class="text-center">1</td>
								<td class="text-center">20240001</td>
								<td class="text-center">개인</td>
								<td class="text-center">부적절한 닉네임</td>
								
								<td class="text-center">2024-02-26</td>
								<td class="text-center">윤수 짱짱</td>
								<td class="text-center">ys0106</td>
								<td class="text-center">닉네임 변경 단위 기간</td>
								

								
								<td class="text-center ellipsis-content" data-toggle="tooltip"
									data-placement="top" title="전체 내용을 보려면 클릭하세요.">제가 신고한 사람의 닉네임이 언제쯤 바뀌나요?</td>
									
								<div class="modal fade" id="inquirydetail" tabindex="-1" aria-labelledby="inquirydetail" aria-hidden="true">
								  <div class="modal-dialog modal-dialog-centered">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="inquirydetailLabel">전체 내용</h5>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <div class="modal-body">
								        <p id="modal_content"></p>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
								      </div>
								    </div>
								  </div>
								</div>			
														
								
								<td class="text-center">질문</td>
								
								<td class="text-center">
									<a href="">
										<span class="material-symbols-outlined" style="font-size: 21px;">Done</span>
									</a>
								</td>
								
								<td class="text-center">
									<button type="submit">답변하기</button>
								</td>
							</tr>
							<tr>
								<td class="text-center">1</td>
								<td class="text-center">20240001</td>
								<td class="text-center">개인</td>
								<td class="text-center">부적절한 닉네임</td>
								
								<td class="text-center">2024-02-26</td>
								<td class="text-center">윤수 짱짱</td>
								<td class="text-center">ys0106</td>
								<td class="text-center">닉네임 변경 단위 기간</td>
								

								
								<td class="text-center ellipsis-content" data-toggle="tooltip"
									data-placement="top" title="전체 내용을 보려면 클릭하세요.">제가 신고한 사람의 닉네임이 언제쯤 바뀌나요?</td>
									
								<div class="modal fade" id="inquirydetail" tabindex="-1" aria-labelledby="inquirydetail" aria-hidden="true">
								  <div class="modal-dialog modal-dialog-centered">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="inquirydetailLabel">전체 내용</h5>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <div class="modal-body">
								        <p id="modal_content"></p>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
								      </div>
								    </div>
								  </div>
								</div>			
														
								
								<td class="text-center">질문</td>
								
								<td class="text-center">
									<a href="">
										<span class="material-symbols-outlined" style="font-size: 21px;">Done</span>
									</a>
								</td>
								
								<td class="text-center">
									<button type="submit">답변하기</button>
								</td>
							</tr>
							<tr>
								<td class="text-center">1</td>
								<td class="text-center">20240001</td>
								<td class="text-center">개인</td>
								<td class="text-center">부적절한 닉네임</td>
								
								<td class="text-center">2024-02-26</td>
								<td class="text-center">윤수 짱짱</td>
								<td class="text-center">ys0106</td>
								<td class="text-center">닉네임 변경 단위 기간</td>
								

								
								<td class="text-center ellipsis-content" data-toggle="tooltip"
									data-placement="top" title="전체 내용을 보려면 클릭하세요.">제가 신고한 사람의 닉네임이 언제쯤 바뀌나요?</td>
									
								<div class="modal fade" id="inquirydetail" tabindex="-1" aria-labelledby="inquirydetail" aria-hidden="true">
								  <div class="modal-dialog modal-dialog-centered">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="inquirydetailLabel">전체 내용</h5>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <div class="modal-body">
								        <p id="modal_content"></p>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
								      </div>
								    </div>
								  </div>
								</div>			
														
								
								<td class="text-center">질문</td>
								
								<td class="text-center">
									<a href="">
										<span class="material-symbols-outlined" style="font-size: 21px;">Done</span>
									</a>
								</td>
								
								<td class="text-center">
									<button type="submit">답변하기</button>
								</td>
							</tr>
							<tr>
								<td class="text-center">1</td>
								<td class="text-center">20240001</td>
								<td class="text-center">개인</td>
								<td class="text-center">부적절한 닉네임</td>
								
								<td class="text-center">2024-02-26</td>
								<td class="text-center">윤수 짱짱</td>
								<td class="text-center">ys0106</td>
								<td class="text-center">닉네임 변경 단위 기간</td>
								

								
								<td class="text-center ellipsis-content" data-toggle="tooltip"
									data-placement="top" title="전체 내용을 보려면 클릭하세요.">제가 신고한 사람의 닉네임이 언제쯤 바뀌나요?</td>
									
								<div class="modal fade" id="inquirydetail" tabindex="-1" aria-labelledby="inquirydetail" aria-hidden="true">
								  <div class="modal-dialog modal-dialog-centered">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="inquirydetailLabel">전체 내용</h5>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <div class="modal-body">
								        <p id="modal_content"></p>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
								      </div>
								    </div>
								  </div>
								</div>			
														
								
								<td class="text-center">질문</td>
								
								<td class="text-center">
									<a href="">
										<span class="material-symbols-outlined" style="font-size: 21px;">Done</span>
									</a>
								</td>
								
								<td class="text-center">
									<button type="submit">답변하기</button>
								</td>
							</tr>
							<tr>
								<td class="text-center">1</td>
								<td class="text-center">20240001</td>
								<td class="text-center">개인</td>
								<td class="text-center">부적절한 닉네임</td>
								
								<td class="text-center">2024-02-26</td>
								<td class="text-center">윤수 짱짱</td>
								<td class="text-center">ys0106</td>
								<td class="text-center">닉네임 변경 단위 기간</td>
								

								
								<td class="text-center ellipsis-content" data-toggle="tooltip"
									data-placement="top" title="전체 내용을 보려면 클릭하세요.">제가 신고한 사람의 닉네임이 언제쯤 바뀌나요?</td>
									
								<div class="modal fade" id="inquirydetail" tabindex="-1" aria-labelledby="inquirydetail" aria-hidden="true">
								  <div class="modal-dialog modal-dialog-centered">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="inquirydetailLabel">전체 내용</h5>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <div class="modal-body">
								        <p id="modal_content"></p>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
								      </div>
								    </div>
								  </div>
								</div>			
														
								
								<td class="text-center">질문</td>
								
								<td class="text-center">
									<a href="">
										<span class="material-symbols-outlined" style="font-size: 21px;">Done</span>
									</a>
								</td>
								
								<td class="text-center">
									<button type="submit">답변하기</button>
								</td>
							</tr>
							<tr>
								<td class="text-center">1</td>
								<td class="text-center">20240001</td>
								<td class="text-center">개인</td>
								<td class="text-center">부적절한 닉네임</td>
								
								<td class="text-center">2024-02-26</td>
								<td class="text-center">윤수 짱짱</td>
								<td class="text-center">ys0106</td>
								<td class="text-center">닉네임 변경 단위 기간</td>
								

								
								<td class="text-center ellipsis-content" data-toggle="tooltip"
									data-placement="top" title="전체 내용을 보려면 클릭하세요.">제가 신고한 사람의 닉네임이 언제쯤 바뀌나요?</td>
									
								<div class="modal fade" id="inquirydetail" tabindex="-1" aria-labelledby="inquirydetail" aria-hidden="true">
								  <div class="modal-dialog modal-dialog-centered">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="inquirydetailLabel">전체 내용</h5>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <div class="modal-body">
								        <p id="modal_content"></p>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
								      </div>
								    </div>
								  </div>
								</div>			
														
								
								<td class="text-center">질문</td>
								
								<td class="text-center">
									<a href="">
										<span class="material-symbols-outlined" style="font-size: 21px;">Done</span>
									</a>
								</td>
								
								<td class="text-center">
									<button type="submit">답변하기</button>
								</td>
							</tr>
							<tr>
								<td class="text-center">1</td>
								<td class="text-center">20240001</td>
								<td class="text-center">개인</td>
								<td class="text-center">부적절한 닉네임</td>
								
								<td class="text-center">2024-02-26</td>
								<td class="text-center">윤수 짱짱</td>
								<td class="text-center">ys0106</td>
								<td class="text-center">닉네임 변경 단위 기간</td>
								

								
								<td class="text-center ellipsis-content" data-toggle="tooltip"
									data-placement="top" title="전체 내용을 보려면 클릭하세요.">제가 신고한 사람의 닉네임이 언제쯤 바뀌나요?</td>
									
								<div class="modal fade" id="inquirydetail" tabindex="-1" aria-labelledby="inquirydetail" aria-hidden="true">
								  <div class="modal-dialog modal-dialog-centered">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="inquirydetailLabel">전체 내용</h5>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <div class="modal-body">
								        <p id="modal_content"></p>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
								      </div>
								    </div>
								  </div>
								</div>			
														
								
								<td class="text-center">질문</td>
								
								<td class="text-center">
									<a href="">
										<span class="material-symbols-outlined" style="font-size: 21px;">Done</span>
									</a>
								</td>
								
								<td class="text-center">
									<button type="submit">답변하기</button>
								</td>
							</tr>
													
							
						</tbody>
					</table>
				</div>
				<nav aria-label="...">
					<ul class="pagination">
						<li class="page-item pagination2"><a class="page-link">Previous</a></li>
						<li class="page-item pagination2"><a class="page-link"
							href="#">1</a></li>
						<li class="page-item pagination2"><a class="page-link"
							href="#">2</a></li>
						<li class="page-item pagination2"><a class="page-link"
							href="#">3</a></li>
						<li class="page-item pagination2"><a class="page-link"
							href="#">Next</a></li>
					</ul>
				</nav>
			</div>
			<!-- <div class="col-3">사이드를 여기에 작성하세요</div> -->
			</div>				
		</div>
		
				
	</div><!-- end .row -->
		
		



</body>
</html>