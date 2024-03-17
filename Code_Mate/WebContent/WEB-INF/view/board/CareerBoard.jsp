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
<title>게시판</title>
<!-- BootStrap -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/banner_side.css" />

<!-- JQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- ionicons -->
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

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
    background: #1fc1c0;
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
	color: #242729;
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

.forum_body .navbar-nav li {
    padding: 25.5px 30px;
    transition: all 300ms linear 0s;
}

.postLi:not(:last-child){
	border-bottom: 1px solid gray;
}

.tagList{
list-style-type: none;
}

.forum_list .navbar-nav li a {
    font-size: 14px;
    font-weight: 400;
    color: #425466;
    display: block;
    line-height: 38px;
    border-radius: 2px;
    padding: 0 15px;
    transition: all 300ms linear 0s;
}

.forum_list .navbar-nav li a:hover{
	background: #E4E4FD;
}

.forum_list .navbar-nav li.active a {
    background: #4f59ca;
    color: #fff;
    font-weight: 500;
}
</style>

<script type="text/javascript">
const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
	
	  $( function () {
	    $( '[data-bs-toggle="popover"]' ).popover()
	  } );
</script>

<script type="text/javascript">
function selChange() {
	
	
	var sel = document.getElementById('cntPerPage').value;
	location.href="'<%= request.getContextPath() %>'/careerlist.action?nowPage=${paging.nowPage}&cntPerPage="+sel;
}

function sendIt()
{	
	
	if ("${member}" == "")
	{
		if(confirm("로그인이 필요합니다. 로그인하시겠습니까?"))
		{
			location.href="Login.action";
		}
	}
	else
	{
		location.href="qinsertform.action";
	}
}
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
				
				<span class="nav-link"><a href="boardlist.action" class="link">프로젝트 게시판</a></span>
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
	
	<div class="main">
		
		<div class="row">
			<div class="col-md-2" style="padding-left: 50px;">
				<aside class="l_widget forum_list">
                                <h3 class="wd_title">카테고리</h3>
                                <ul class="navbar-nav ">
                                    <li class="nav-item">
                                        <a href="boardlist.action"><i class="social_tumbleupon"></i>전체 보기</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="techlist.action"><i class="icon_lightbulb_alt"></i>기술</a>
                                    </li>
                                    <li class="active nav-item">
                                        <a href="careerlist.action"><i class="icon_lightbulb_alt"></i>커리어</a>
                                    </li>
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
                                    <ul class="nav right">
                                        <li>
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
                                        </li>
                                    </ul>
                                </div>
                                <div class="forum_body">
                                    <ul class="navbar-nav topic_list">
                                        <!-- 
                                        <li class="postLi">
                                            <div class="media">
                                                <div class="media-body">
                                                    <div class="t_title">
                                                        <a href="forum-single.html">
                                                            <h4>물리학자가 웃을 때 내는 소리는?</h4>
                                                        </a>
                                                    </div>    
                                                        <ul class="tagList" style="display: flex;">
                                                        	<li style="margin: 0px; padding: 0px;"><a href="#" class="tag">자바</a></li>
                                                        	<li style="margin: 0px; padding: 0px;"><a href="#" class="tag">오라클</a></li>
                                                        	<li style="margin: 0px; padding: 0px;"><a href="#" class="tag">아재개그</a></li>
                                                        </ul>
                                                        
                                                    <h6 style="margin-top: 10px;"><ion-icon name="time-outline"></ion-icon> 26 minutes ago
                                                    </h6>
                                                </div>
                                                <div class="media-right">
                                                    <ul class="nav">
                                                        <li class="dropdown">
                                                            <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                <img src="img/profile.png" alt="" style="width: 25px; height: 25px;"> 정한울
                                                            </a>
                                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                                                <div class="media">
                                                                    <div class="media-body">
                                                                   
                                                                        <a href="#">
                                                                            <h4>Jonah Terry</h4>
                                                                        </a>
                                                                        <a class="follow_btn" href="#">Follow</a>
                                                                    </div>
                                                                </div>
                                                                <div class="row answere_items">
                                                                    <div class="col-4">
                                                                        <a href="#">
                                                                            <h4>Answers</h4>
                                                                        </a>
                                                                        <h6>30</h6>
                                                                    </div>
                                                                    <div class="col-4">
                                                                        <a href="#">
                                                                            <h4>Question</h4>
                                                                        </a>
                                                                        <h6>40</h6>
                                                                    </div>
                                                                    <div class="col-4">
                                                                        <a href="#">
                                                                            <h4>Followers</h4>
                                                                        </a>
                                                                        <h6>30</h6>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                    <a class="count" href="#"><ion-icon name="chatbubbles-outline" role="img" class="md hydrated" aria-label="chatbubbles outline"></ion-icon> 70</a>
                                                    <a class="count" href="#"><ion-icon name="eye-outline" role="img" class="md hydrated" aria-label="eye outline"></ion-icon> 420</a>
                                                </div>
                                            </div>
                                        </li>
                                         -->
                                         <c:forEach var="item" items="${list}">
	                                         <li class="postLi">
	                                         	<div class="media">
	                                         		<div class="media-body">
	                                         			<div class="t_title">
	                                         				<a href="article.action?code=${item.code }">
	                                         					<h4>${item.title}</h4>
	                                         				</a>
	                                         			</div>
	                                         			
                                                        <h6 style="margin-top: 10px;"><ion-icon name="time-outline"></ion-icon> ${item.kdate}</h6>
	                                         		</div>
	                                         		
	                                         		<div class="media-right" style="text-align: center;">
	                                         			<ul class="nav">
	                                         				<li class="dropdown">
	                                         					<a class="dropdown-toggle" href="mypage.action" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                	<img src="img/profile.png" alt="" style="width: 25px; height: 25px;"> ${item.nickname}
                                                            	</a>
	                                         				</li>
	                                         			</ul>
	                                         			<a class="count" href="#"><ion-icon name="chatbubbles-outline" role="img" class="md hydrated" aria-label="chatbubbles outline"></ion-icon> ${item.comments}</a>
                                                    	<a class="count" href="#"><ion-icon name="eye-outline" role="img" class="md hydrated" aria-label="eye outline"></ion-icon> ${item.views}</a>
	                                         		</div>
	                                         		
	                                         	</div>
	                                         </li>
                                         </c:forEach>
                                         
                                    </ul>
                                </div>
                            </div>
                            <div class="row pagination_inner">
                                <div class="col-lg-2">
                                    <h6>Total: <span> ${count } </span></h6>
                                </div>
                                
                                <div style="display: block; text-align: center;">		
									<c:if test="${paging.startPage != 1 }">
										<a href="<%=cp %>/careerlist.action?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
									</c:if>
									<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
										<c:choose>
											<c:when test="${p == paging.nowPage }">
												<b>${p }</b>
											</c:when>
											<c:when test="${p != paging.nowPage }">
												<a href="<%=cp %>/careerlist.action?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
											</c:when>
										</c:choose>
									</c:forEach>
									<c:if test="${paging.endPage != paging.lastPage}">
										<a href="<%=cp %>/careerlist.action?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
									</c:if>
								</div>
                                
                            </div>
                        </div>
			</div>
			<div class="col-md-3" style="padding-left: 50px; padding-right: 70px;">
				<aside class="r_widget qustion_wd">
                       	<button class="btn" type="button" onclick="sendIt()"><img src="img/question-1.png" alt=""> 질문하기<ion-icon name="chevron-forward-outline" class="arrow"></ion-icon></i></button>
                </aside>
                
                <aside class="r_widget user_list_wd">
                                <div class="r_heading d-flex justify-content-between">
                                    <h3>지식인 랭킹</h3>
                                </div>
                                <ul class="navbar-nav">
                                    <c:forEach var="item1" items="${RList }">
                                    <li>
                                    	<a href="#">
                                    		<div class="media">
                                    			<img class="rounded-circle" src="img/profile.png" alt="" style="width: 21px; height: 20px; margin-top: 7px; margin-right: 2px;">
                                    			
                                    			<div class="media-body">
                                                    <h4>${item1.nickname }</h4>
                                            </div>
                                            <div class="media-right">
                                            	<div class="count">
                                            		${item1.likes } <ion-icon name="heart" class='heart'></ion-icon>
                                            	</div>
                                            </div>
                                    		</div>
                                    		
                                    	</a>
                                    </li>
                                    </c:forEach>
                                    <!-- 
                                    <li>
                                        <a href="#">
                                            <div class="media">
                                                <div class="d-flex">
                                                    <img class="rounded-circle" src="img/profile.png" alt="" style="width: 21px; height: 20px; margin-top: 7px; margin-right: 2px;">
                                                </div>
                                                <div class="media-body">
                                                    <h4>정한울</h4>
                                                </div>
                                                <div class="media-right">
                                                    <div class="count">
                                                        100 <ion-icon name="heart" class='heart'></ion-icon>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="media">
                                                <div class="d-flex">
                                                    <img class="rounded-circle" src="img/profile.png" alt="" style="width: 21px; height: 20px; margin-top: 7px; margin-right: 2px;">
                                                </div>
                                                <div class="media-body">
                                                    <h4>이윤수</h4>
                                                </div>
                                                <div class="media-right">
                                                    <div class="count">
                                                        73 <ion-icon name="heart" class='heart'></ion-icon>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="media">
                                                <div class="d-flex">
                                                    <img class="rounded-circle" src="img/profile.png" alt="" style="width: 21px; height: 20px; margin-top: 7px; margin-right: 2px;">
                                                </div>
                                                <div class="media-body">
                                                    <h4>강혜성</h4>
                                                </div>
                                                <div class="media-right">
                                                    <div class="count">
                                                        67 <ion-icon name="heart" class='heart'></ion-icon>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="media">
                                                <div class="d-flex">
                                                    <img class="rounded-circle" src="img/profile2.png" alt="" style="width: 21px; height: 20px; margin-top: 7px; margin-right: 2px;">
                                                </div>
                                                <div class="media-body">
                                                    <h4>김지민</h4>
                                                </div>
                                                <div class="media-right">
                                                    <div class="count">
                                                        45 <ion-icon name="heart" class='heart'></ion-icon>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="media">
                                                <div class="d-flex">
                                                    <img class="rounded-circle" src="img/profile.png" alt="" style="width: 21px; height: 20px; margin-top: 7px; margin-right: 2px;">
                                                </div>
                                                <div class="media-body">
                                                    <h4>길현욱</h4>
                                                </div>
                                                <div class="media-right">
                                                    <div class="count">
                                                        34 <ion-icon name="heart" class='heart'></ion-icon>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                   <li>
                                        <a href="#">
                                            <div class="media">
                                                <div class="d-flex">
                                                    <img class="rounded-circle" src="img/profile.png" alt="" style="width: 21px; height: 20px; margin-top: 7px; margin-right: 2px;">
                                                </div>
                                                <div class="media-body">
                                                    <h4>박범구</h4>
                                                </div>
                                                <div class="media-right">
                                                    <div class="count">
                                                        26 <ion-icon name="heart" class='heart'></ion-icon>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="media">
                                                <div class="d-flex">
                                                    <img class="rounded-circle" src="img/profile2.png" alt="" style="width: 21px; height: 20px; margin-top: 7px; margin-right: 2px;">
                                                </div>
                                                <div class="media-body">
                                                    <h4>파파야</h4>
                                                </div>
                                                <div class="media-right">
                                                    <div class="count">
                                                        10 <ion-icon name="heart" class='heart'></ion-icon>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                             -->        
                                    
                                </ul>
                            </aside>
                            
                            <aside class="r_widget question_list_wd">
                                <div class="r_heading d-flex justify-content-between">
                                    <h3>트렌드</h3>
                                </div>
                                <div class="tab-content" id="myTabContent">
                                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                        <ul class="navbar-nav">
                                        	
                                        	<c:forEach var="item2" items="${trendList }" varStatus="status">
                                        		<li><a href="#"><span>0${status.count }</span>${item2.title }</a>
                                        	</c:forEach>
                                        	
                                        	<!-- 
                                            <li><a href="#"><span>01</span>점심 메뉴 추천 부탁드립니다.</a>
                                            </li>
                                            <li><a href="#"><span>02</span>어떤 옷 살까요?</a></li>
                                            <li><a href="#"><span>03</span>K5 하이드리브 풀옵 VS 그랜저 깡통</a>
                                            </li>
                                            <li><a href="#"><span>04</span>당구장 가실분 너만오면 고</a>
                                            </li>
                                            <li><a href="#"><span>05</span>경상도 사투리좀 알려주세요</a></li>
                                            <li><a href="#"><span>06</span>호날두 VS 메시</a>
                                            </li>
                                             -->
                                        </ul>
                                    </div>  
                                </div>
                            </aside>
			</div>
			
		</div>
	</div>
	

</body>
</html>
