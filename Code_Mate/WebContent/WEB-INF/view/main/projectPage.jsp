<%@page import="java.util.ArrayList"%>
<%@page import="com.test.mybatis.dto.ProjectPageDTO"%>
<%@page import="com.test.mybatis.dto.MemberDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

	String login = "";
	String logout = "";
	String name = "";
	String view = "";
	
	
		MemberDTO member = (MemberDTO)request.getSession().getAttribute("member");
	
	if(request.getSession().getAttribute("member") != null)
	{ 
		login = "";
		logout = "display:none;";
		
		name = member.getNickname();
		
		
	}
	else
	{
		login = "display:none;";
		logout = "";
		
		if(request.getAttribute("pjdto") == null)
		{
			view = "display:none;";
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
<style type="text/css">

.w_tag_list {
    display: flex;
    flex-wrap: wrap;
    margin: -5px;
}

.l_widget {
    margin-bottom: 45px;
}

.tag{
	color : #425466;
    padding: 2px 18px;
    display: inline-block;
    background: #F0F2F5;
    font-size: 14px;
    border-radius: 4px;
    transition: all 0.2s linear;
    margin: 1px; 
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
    width: 100%;
    text-align: left;
    padding-left: 30px;
    padding-right: 30px;
    transition: all 300ms linear 0s;
}

.r_widget {
    margin-bottom: 50px;
}

.media {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: start;
    align-items: flex-start;
}

.media-body {
    -ms-flex: 1;
    flex: 1;
}

a{
	text-decoration:none;
	color: cornflowerblue;
}

.heart {
	color: red;
}

.r_heading {
    background: rgba(76, 76, 241, 0.05);
    border-bottom: 1px solid rgba(76, 76, 241, 0.05);
    padding-left: 20px;
    padding-right: 20px;
}

.comment_list .navbar-nav li:first-child {
    padding-top: 0;
}
.comment_list .navbar-nav li {
    border-bottom: 1px solid #e6edf0;
    padding: 10px 0;
}

.user_list_wd {
    border: 1px solid #eaeeef;
    border-radius: 6px;
}

.nav-bar:last-child
{
	background-color: green;
}

.user_list_wd .navbar-nav li:not(:last-child) {
    border-bottom: 1px solid #425466;
}

.user_list_wd .navbar-nav li {
    padding: 11px 0 8px;
}

.question_list_wd .navbar-nav {
    padding: 7px 20px 18px;
}

.question_list_wd .navbar-nav li a {
    font-size: 14px;
    font-weight: 400;
    color: #54595d;
    position: relative;
    padding-left: 45px;
    display: inline-block;
    line-height: 1.5;
}

.question_list_wd .navbar-nav li a span {
    top: 2px;
}
.question_list_wd .navbar-nav li a span {
    height: 30px;
    width: 30px;
    border: 1px solid #e6edf0;
    text-align: center;
    line-height: 28px;
    color: var(--p_color);
    font-size: 14px;
    font-weight: 500;
    display: inline-block;
    border-radius: 50%;
    margin-right: 9px;
    position: absolute;
    left: 0;
    top: 0;
}

.question_list_wd .navbar-nav li {
    padding: 15px 0 15px;
}

.arrow {
    float: right;
    margin-top: 32px;
}

.forum_l_inner .forum_head {
    background: rgba(76, 76, 241, 0.05);
    padding-left: 20px;
    padding-right: 20px;
    border-bottom: 1px solid rgba(76, 76, 241, 0.05);
}

.forum_body
{
    /* padding-right: 50px; */
    transition: all 300ms linear 0s;
}

.postLi:not(:last-child){
	border-bottom: 1px solid gray;
}

.tagList{
list-style-type: none;
}


/* 여기부터 내꺼 */

	.mojip
	{
		color: green;
		font-weight: bold;
		font-size: 30px;
	}
	.mojipend
	{
		color: gray;
		font-weight: bold;
		font-size: 30px;
	}
	.mojipTitle
	{
		font-weight: bold;
		overflow: hidden;
  		text-overflow: ellipsis;
  		display: -webkit-box;
  		-webkit-line-clamp: 2;
  		-webkit-box-orient: vertical;
  		margin-bottom: 10px;
  		color: black;
  		font-size: 30px;
	}
	.new
	{
		color: #4D4DFF;
		font-weight: bold;
		font-size: 20px;
		padding-left: 5px;
		padding-top: 5px;
	}
	.mojipContent
	{
		font-size: 15px;
		color: black;
		font-weight: bold;
		overflow: hidden;
  		text-overflow: ellipsis;
  		display: -webkit-box;
  		-webkit-line-clamp: 3;
  		-webkit-box-orient: vertical;
	}
	.good
	{
		
		font-size: 12px;
		margin: 0;
		color: black;
	}
	.comment
	{
		font-size: 13px;
		margin-left: 20px;
		overflow: hidden;
  		text-overflow: ellipsis;
  		display: -webkit-box;
  		-webkit-line-clamp: 3;
  		-webkit-box-orient: vertical;
  		margin-bottom: 10px;
  		color: black;
	}
	ul
	{
		list-style: none;
    	margin: 0;
    	padding: 0;
	}
	.litag
	{
		padding: 3px 10px;
		width: fit-content;
	    grid-gap: 5px;
	    gap: 5px;
	    height: 22px;
	    background: #e9ecef;
	    border-radius: 15px;
	    font-weight: 700;
	    font-size: 13px;
	    line-height: 16px;
	    color: #3e86f5;
	}
	.ptag
	{
		background-color: #dee2e6;
		color: #495057;
		font-size: 11px;
		font-weight: bold;
		width: 60px;
		border-radius: 10px;
	}
	.input-group>.form-control
	{
		border: 1px solid black;
		border-radius: 5px;
	}
	.input-group:not(.has-validation)>:not(:last-child):not(.dropdown-toggle):not(.dropdown-menu):not(.form-floating) {
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
	}
	a
	{
		color: black;
	}
	.aadiv
	{
		margin: 30px;
		margin-left: 80px;
		margin-right: 80px;
		padding: 10px;
		border-radius: 15px;
		height: fit-content;
		width: fit-content;
		border-bottom: 1px solid #f1f3f5;
		
	}
	.aadiv:hover
	{
		background-color: #f1f3f5;
	}
	.activenav-item > .anav-item
	{
		font-weight: bold;
		border-bottom: 1px solid #e9ecef;
		font-size: 20px;
		cursor: pointer;
	}
	.anav-item
	{
		font-size: 20px;
		cursor: pointer;
	}
	.wd_title
	{
		font-weight: bold;
		padding-bottom: 10px;
	}
	.ingproject
	{
		margin: 30px;
		margin-left: 80px;
		margin-right: 80px;
		padding: 10px;
		border-radius: 15px;
		height: fit-content;
		width: auto;
		border: 1px solid #f1f3f5;
	}
	.ingproject:hover
	{
		background-color: #f1f3f5;
	}
	.jptitle1
	{
		font-size: 50px;
		font-weight: bold;
		padding: 20px 0 20px;
		border-bottom: 1px solid #f1f3f5;
		margin-left: 50px;
	} 
	.jptitle2
	{
		font-size: 50px;
		font-weight: bold;
		padding: 20px 0 20px;
		border-bottom: 1px solid black;
	}
	.jptitle3
	{
		font-size: 50px;
		font-weight: bold;
		padding: 20px 0 20px;
		border-bottom: 1px solid black;
	}
	.jptitle4
	{
		font-size: 50px;
		font-weight: bold;
		padding: 20px 0 20px;
		border-bottom: 1px solid black;
	}
	.jptitle5
	{
		font-size: 50px;
		font-weight: bold;
		padding: 20px 0 20px;
		border-bottom: 1px solid black;
	}
	
	div
	{
		/* border: 1px solid gray; */
	}
</style>

<script type="text/javascript">
const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
const popoverList = [popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
	
	  $( function () {
	    $( '[data-bs-toggle="popover"]' ).popover()
	  } );
</script>

<script type="text/javascript">
	
		
	$(document).ready(function()
	{
		
		
		
		
		$("#side1").click(function()
		{
			$(this).removeClass();
			$(this).addClass("activenav-item");
			
			$("#side2").removeClass();
			$("#side2").addClass("nav-item");
			$("#side3").removeClass();
			$("#side3").addClass("nav-item");
			$("#side4").removeClass();
			$("#side4").addClass("nav-item");
			$("#side5").removeClass();
			$("#side5").addClass("nav-item");
			
			// 프젝 목록
			$(".jptitle2").css("display","");
			$(".jptitle3").css("display","");
			$(".jptitle4").css("display","none");
			$(".jptitle5").css("display","none");
			
			//카운트
			$(".total1").css("display","");
			$(".total2").css("display","none");
			$(".total3").css("display","none");
			$(".total5").css("display","none");
			
		});
		
		// 모집중
		$("#side2").click(function()
		{
			
			$(this).removeClass();
			$(this).addClass("activenav-item");
			
			$("#side1").removeClass();
			$("#side1").addClass("nav-item");
			$("#side3").removeClass();
			$("#side3").addClass("nav-item");
			$("#side4").removeClass();
			$("#side4").addClass("nav-item");
			$("#side5").removeClass();
			$("#side5").addClass("nav-item");
			
			$(".jptitle2").css("display","none");
			$(".jptitle4").css("display","");
			$(".jptitle5").css("display","none");
			$(".jptitle3").css("display","none");
			
			//카운트
			$(".total1").css("display","none");
			$(".total2").css("display","");
			$(".total3").css("display","none");
			$(".total5").css("display","none");
			
		});
		
		// 모집완료
		$("#side3").click(function()
		{
			
			$(this).removeClass();
			$(this).addClass("activenav-item");
			
			$("#side1").removeClass();
			$("#side1").addClass("nav-item");
			$("#side2").removeClass();
			$("#side2").addClass("nav-item");
			$("#side4").removeClass();
			$("#side4").addClass("nav-item");
			$("#side5").removeClass();
			$("#side5").addClass("nav-item");
			
			$(".jptitle2").css("display","none");
			$(".jptitle3").css("display","none");
			$(".jptitle4").css("display","none");
			$(".jptitle5").css("display","");
			
			//카운트
			$(".total1").css("display","none");
			$(".total2").css("display","none");
			$(".total3").css("display","");
			$(".total5").css("display","none");
			
		});
		
		// 추가 모집
		$("#side4").click(function()
		{
			
			$(this).removeClass();
			$(this).addClass("activenav-item");
			
			$("#side1").removeClass();
			$("#side1").addClass("nav-item");
			$("#side3").removeClass();
			$("#side3").addClass("nav-item");
			$("#side2").removeClass();
			$("#side2").addClass("nav-item");
			$("#side5").removeClass();
			$("#side5").addClass("nav-item");
			
			$(".jptitle2").css("display","none");
			$(".jptitle3").css("display","none");
			$(".jptitle4").css("display","none");
			$(".jptitle5").css("display","none");
			
			//카운트
			$(".total1").css("display","none");
			$(".total2").css("display","none");
			$(".total3").css("display","none");
			$(".total5").css("display","none");
		});
		
		// 내가 진행중인 프로젝트
		$("#side5").click(function()
		{
			
			$(this).removeClass();
			$(this).addClass("activenav-item");
			
			$("#side1").removeClass();
			$("#side1").addClass("nav-item");
			$("#side3").removeClass();
			$("#side3").addClass("nav-item");
			$("#side4").removeClass();
			$("#side4").addClass("nav-item");
			$("#side2").removeClass();
			$("#side2").addClass("nav-item");
			
			$(".jptitle3").css("display","none");	
			$(".jptitle4").css("display","none");	
			$(".jptitle5").css("display","none");	
			$(".jptitle2").css("display","");	
			
			//카운트
			$(".total1").css("display","none");
			$(".total2").css("display","none");
			$(".total3").css("display","none");
			$(".total5").css("display","");
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
				    <a href="mypage.action">
						<div id="profile" style="<%=login%>">
							<img class="memberImg" src="img/profileImg_1.png">
						</div>
						<span class="nickname" id="mem1" style="<%=login%>">${member.nickname }</span>
						<div class="gradeIcon" style="<%=login%>">
							🌱
						</div>
					</a>
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
	
	
	<div class="main">
		
		<div class="row">
			<div class="col-md-2" style="padding-left: 50px;">
				<aside class="l_widget forum_list">
                               <h3 class="wd_title">프로젝트 게시판</h3>
                               <ul class="navbar-nav ">
                                   <li class="activenav-item" id="side1">
                                       <a class="anav-item"><i class="social_tumbleupon"></i>전체 보기</a>
                                   </li>
                                   <li class="nav-item" id="side2">
                                       <a class="anav-item"><i class="icon_lightbulb_alt"></i>모집 중</a>
                                   </li>
                                   <li class="nav-item"  id="side3">
                                       <a class="anav-item"><i class="icon_lightbulb_alt"></i>모집 완료</a>
                                   </li>
                                   <li class="nav-item"  id="side4">
                                       <a class="anav-item"><i class="icon_lightbulb_alt"></i>추가 모집</a>
                                   </li>
                                   <li class="nav-item"  id="side5">
                                       <a class="anav-item" style="<%=view %>"><i class="icon_lightbulb_alt"></i>내가 진행중인 프로젝트</a>
                                   </li>
                               </ul>
                </aside>
                
                <aside class="l_widget l_tags_wd">
                                <h3 class="wd_title">태그</h3>
                                <ul class="list-unstyled w_tag_list style-light">
                                	<c:forEach var="lefttag" items="${lefttag }">
                                    <li><a href="#" class="tag">${lefttag.tag_name }</a></li>
                                    
                                	</c:forEach>
                                </ul>
               </aside>
               <aside class="l_widget comment_list">
                                <h3 class="wd_title">최근 올라온 글</h3>
                                <ul class="navbar-nav">
                                	<c:forEach var="newpj" items="${newpj }">
                                	
                                    <li>
                                        <div class="media">
                                            <div class="d-flex">
                                                <ion-icon name="chatbubbles-outline"></ion-icon>
                                            </div>
                                            <div class="media-body">
                                                <a href="#">
                                                    ${newpj.title } by
                                                </a>
                                                <a href="#">
                                                    <img class="rounded-circle" src="img/poby.png" alt="" style="width: 21px; height: 20px;"> ${newpj.nickname }
                                                </a>
                                                <p>${newpj.kdate }</p>
                                            </div>
                                        </div>
                                    </li>
                                    </c:forEach>
                                                                        
                                </ul>
                            </aside>
			</div>
				<div class="col-md-7" style="padding-left: 50px;">
					<div class="forum_topic_list_inner">
	                            <div class="forum_l_inner">
	                                <div class="forum_head d-flex justify-content-between">
	                                    <ul class="nav left">
	                                        <li></li>
	                                    </ul>
	                                    
	                                            <div class="dropdown right_dir">
	                                                <button class="btn dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                                    정렬 <i class="arrow_carrot-down"></i>
	                                                </button>
	                                                <div class="dropdown-menu">
	                                                    <h3 class="title">Filter by author</h3>
	                                                    <form action="#" class="cate-search-form">
	                                                        <input type="text" placeholder="Search users">
	                                                    </form>
	                                                    <div class="all_users short-by scroll">
	                                                        <a class="dropdown-item active-short" href="#">
	                                                            <ion-icon name="checkmark-outline" role="img" class="md hydrated" aria-label="checkmark outline"></ion-icon> Newest
	                                                        </a>
	                                                        <a class="dropdown-item" href="#"> Oldest </a>
	                                                        <a class="dropdown-item" href="#"> Most commented </a>
	                                                        <a class="dropdown-item" href="#"> Least commented </a>
	                                                        <a class="dropdown-item" href="#"> Recently updated </a>
	                                                        <a class="dropdown-item" href="#"> Recently updated </a>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        
	                                    
	                                </div>
	                                <div class="forum_body">
	                                <!-- 게시판 내용 -->
	                                  
	                                	<div class="jptitle2" style="<%=view %>">
	                                		<div class="jptitle1" >·내가 참여하고 있는 프로젝트</div>
												
											<c:forEach var="dto" items="${pjdto }">
		                                    <div class="ingproject"><a href="" class="aa">
												<div class="col-12">
													<div>
														<p class="ptag">📁프로젝트</p>
													</div>
													<div class="" style="display: flex; flex-wrap: wrap;">
														<p class="mojipTitle">${dto.title }</p>
													</div>
													<div>
														<p class="mojipContent">${dto.content }</p>
													</div>
													<div style="margin-top: 30px;">
														<ul style="display: flex; height: 22px;">
														
															
															<c:forEach var="tag" items="${tag }">
	
																<c:if test="${dto.ap_code == tag.ap_code}">
																	
																	<li class="litag">${tag.tag_name }</li>
																	
																</c:if>
															
															</c:forEach>
															
															
														</ul>
													</div>
													<div>
													<p class="good" style="margin-top: 30px;">시작일 : ${dto.sdate }</p>
													<p class="good">작성자😊 : ${dto.nickname }</p>
													</div>
													<div style="display: flex; justify-content: space-between;">
														<div style="display: flex;">
														<%-- <p class="good">댓글💬 : ${dto.count }</p> --%>
														<p class="good">댓글💬 :
														<c:forEach var="comment" items="${comment }">
	
															<c:if test="${dto.ap_code == comment.ap_code}">
																
																${comment.count }
																
															</c:if>
														
														</c:forEach>
														</p>
														<p class="comment">조회수👁️ : ${dto.views }</p>
														</div>
														<p class="comment">작성일 : ${dto.kdate }</p> 
													</div>
												</div>
												</a></div>
												</c:forEach>
													
											</div>
	                                	
	                                	
	                                	 
	                                	<!-- 전체 프로젝트 -->
	                                  
	                                	<div class="jptitle3" style="">
												
											<c:forEach var="dto" items="${pjall }">
		                                    <div class="ingproject"><a href="" class="aa">
												<div class="col-12">
												
													<div>
														<p class="ptag">📁프로젝트</p>
													</div>
													<div class="" style="display: flex; flex-wrap: wrap;">
													<c:if test="${dto.status eq '모집완료' }">
													
														<span class="mojipend" id="${dto.ap_code }">${dto.status }</span><span style="color: black; font-size: 30px;">｜</span>
														
														
													</c:if>	
													<c:if test="${dto.status ne '모집완료' }">
													
														<span class="mojip" id="${dto.ap_code }">${dto.status }</span><span style="color: black; font-size: 30px;">｜</span>
														
														
													</c:if>	
														<p class="mojipTitle">${dto.title }</p>
													</div>
													<div>
														<p class="mojipContent">${dto.content }</p>
													</div>
													<div style="margin-top: 30px;">
														<ul style="display: flex; height: 22px;">
														
															<c:forEach var="tag" items="${tag }">
	
																<c:if test="${dto.ap_code == tag.ap_code}">
																	
																	<li class="litag">${tag.tag_name }</li>
																	
																</c:if>
															
															</c:forEach>
															
														</ul>
													</div>
													<div>
													<p class="good" style="margin-top: 30px;">시작일 : ${dto.sdate }</p>
													<p class="good">작성자😊 : ${dto.nickname }</p>
													</div>
													<div style="display: flex; justify-content: space-between;">
														<div style="display: flex;">
														<p class="good">댓글💬 :
														<c:forEach var="comment" items="${comment }">
	
															<c:if test="${dto.ap_code == comment.ap_code}">
																
																${comment.count }
																
															</c:if>
														
														</c:forEach>
														</p>
														<p class="comment">조회수👁️ : ${dto.views }</p>
														</div>
														<p class="comment kdate">작성일 :${dto.kdate }</p>
													</div>
												</div>
											</a></div>
												</c:forEach>
													
	                                	</div>
	                                	
	                                	
	                                	<!-- 모집중 프로젝트 -->
	                                   
	                                	<div class="jptitle4" style="display:none;">
												
											<c:forEach var="dto" items="${pjing }">
		                                    <div class="ingproject"><a href="" class="aa">
												<div class="col-12">
												
													<div>
														<p class="ptag">📁프로젝트</p>
													</div>
													<div class="" style="display: flex; flex-wrap: wrap;">
														<span class="mojip" >모집중</span><span style="color: black; font-size: 30px;">｜</span>
														<p class="mojipTitle">${dto.title }</p>
													</div>
													<div>
														<p class="mojipContent">${dto.content }</p>
													</div>
													<div style="margin-top: 30px;">
														<ul style="display: flex; height: 22px;">
														
															<c:forEach var="tag" items="${tag }">
	
																<c:if test="${dto.ap_code == tag.ap_code}">
																	
																	<li class="litag">${tag.tag_name }</li>
																	
																</c:if>
															
															</c:forEach>
															
														</ul>
													</div>
													<div>
													<p class="good" style="margin-top: 30px;">시작일 : ${dto.sdate }</p>
													<p class="good">작성자😊 : ${dto.nickname }</p>
													</div>
													<div style="display: flex; justify-content: space-between;">
														<div style="display: flex;">
														<p class="good">댓글💬 :
														<c:forEach var="comment" items="${comment }">
	
															<c:if test="${dto.ap_code == comment.ap_code}">
																
																${comment.count }
																
															</c:if>
														
														</c:forEach>
														</p>
														<p class="comment">조회수👁️ : ${dto.views }</p>
														</div>
														<p class="comment">작성일 : ${dto.kdate }</p>
													</div>
												</div>
											</a></div>
												</c:forEach>
													
	                                	</div>
	                                	
	                                	
	                                	<!-- 모집완료 프로젝트 -->
	                                	
	                                	<div class="jptitle5" style="display: none;">
												
											<c:forEach var="dto" items="${pjend }">
		                                    <div class="ingproject"><a href="" class="aa">
												<div class="col-12">
												
													<div>
														<p class="ptag">📁프로젝트</p>
													</div>
													<div class="" style="display: flex; flex-wrap: wrap;">
														<span class="mojipend" >모집 완료</span><span style="color: black; font-size: 30px;">｜</span>
														<p class="mojipTitle">${dto.title }</p>
													</div>
													<div>
														<p class="mojipContent">${dto.content }</p>
													</div>
													<div style="margin-top: 30px;">
														<ul style="display: flex; height: 22px;">
														
															<c:forEach var="tag" items="${tag }">
	
																<c:if test="${dto.ap_code == tag.ap_code}">
																	
																	<li class="litag">${tag.tag_name }</li>
																	
																</c:if>
															
															</c:forEach>
															
														</ul>
													</div>
													<div>
													<p class="good" style="margin-top: 30px;">시작일 : ${dto.sdate }</p>
													<p class="good">작성자😊 : ${dto.nickname }</p>
													</div>
													<div style="display: flex; justify-content: space-between;">
														<div style="display: flex;">
														<p class="good">댓글💬 :
														<c:forEach var="comment" items="${comment }">
	
															<c:if test="${dto.ap_code == comment.ap_code}">
																
																${comment.count }
																
															</c:if>
														
														</c:forEach>
														</p>
														<p class="comment">조회수👁️ : ${dto.views }</p>
														</div>
														<p class="comment">작성일 : ${dto.kdate }</p>
													</div>
												</div>
											</a></div>
												</c:forEach>
													
	                                	</div>
	                                	
	                                
	                                	
	                                	
	                                	
										<!-- 내용 끝 -->
	                                </div>
	                            </div>
	                            <div class="row pagination_inner">
	                                <div class="col-lg-2">
	                                    <h6 class="total1" style="">Total: <span> ${allcount } </span></h6>
	                                    <h6 class="total2" style="display: none;">Total: <span> ${ingcount } </span></h6>
	                                    <h6 class="total3" style="display: none;">Total: <span> ${endcount } </span></h6>
	                                    <h6 class="total5" style="display: none;">Total: <span> ${mycount } </span></h6>
	                                </div>
	                                <div class="col-lg-8">
	                                    <nav aria-label="Page navigation example">
	                                        <ul class="pagination justify-content-center">
	                                            <li class="page-item"><a class="page-link" href="#"><i class="arrow_carrot-left"></i> Previous</a></li>
	                                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
	                                            <li class="page-item"><a class="page-link" href="#">2</a></li>
	                                            <li class="page-item"><a class="page-link" href="#">3</a></li>
	                                            <li class="page-item"><a class="page-link" href="#">...</a></li>
	                                            <li class="page-item"><a class="page-link" href="#">21</a></li>
	                                            <li class="page-item"><a class="page-link" href="#">Next <i class="arrow_carrot-right"></i></a></li>
	                                        </ul>
	                                    </nav>
	                                </div>
	                                <div class="col-lg-2">
	                                    <div class="input-group go_btn">
	                                        <input type="number" class="form-control" aria-label="Recipient's username">
	                                        <div class="input-group-append">
	                                            <button class="btn btn-outline-secondary" type="button">Go</button>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
				</div>
		
			
			<div class="col-md-3" style="padding-left: 50px; padding-right: 70px;">
				<aside class="r_widget qustion_wd">
	                      	<button class="btn applybtn" type="button" id="applybtn" onclick="location.href='projectapplyform.action'"><img src="img/question-1.png" alt=""> 개설 신청하기<ion-icon name="chevron-forward-outline" class="arrow"></ion-icon></i></button>
	                      	
               </aside>
               
               <aside class="r_widget user_list_wd">
                     <div class="r_heading d-flex justify-content-between">
                         <h3 style="margin-top: 5px;">뜨거운 프로젝트🔥</h3>
                         <h5 style="font-size: 15px; margin-top: 10px;">지난 30일</h5>
                     </div>
                     <!-- 랭킹 -->
                     <aside class="r_widget question_list_wd">
	                     <div class="tab-content" id="myTabContent">
	                         <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
	                             <ul class="navbar-nav">
	                             <c:forEach var="hotpj" items="${hotpj }"  varStatus="status">
	                                 <li><a href="#"><span>${status.count}</span>${hotpj.title }</a></li>
	                                
	                             </c:forEach>
	                             </ul>
	                         </div>
	                     </div>
                	 </aside>
                     <!-- 랭킹 끝 -->
               </aside>
			</div>
		</div>
	</div>
	
	
</body>
</html>