<%@page import="com.test.mybatis.dto.MemberDTO"%>
<%@page import="com.test.mybatis.dto.ProjectJoinDTO"%>
<%@page import="com.test.mybatis.dto.MyPageMethod"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String login = "";
	String logout = "";
	String name = "";
	String mem_code="";
	
	if(request.getSession().getAttribute("member") != null)
	{
		login = "";
		logout = "display:none;";
		MemberDTO member = (MemberDTO)request.getSession().getAttribute("member");
		
		mem_code = member.getMem_code();
		name = member.getNickname();
	}
	else
	{
		login = "display:none;";
		logout = "";
	}
	
	//[실력 등급 계산 및 아이콘, 텍스트 출력]
	//==================================================================
	MyPageMethod mpm = new MyPageMethod();

	ProjectJoinDTO score = (ProjectJoinDTO)request.getAttribute("score");
	
	int backendScore = score.getBackend_score();
	int frontendScore = score.getFrontend_score();

	String[] backScoreIconArr = mpm.skillGradeIcon(cp, backendScore);
	String[] frontScoreIconArr = mpm.skillGradeIcon(cp, frontendScore);

	String backScoreIcon = backScoreIconArr[0];
	String backScoreTxt = backScoreIconArr[1];

	String frontScoreIcon = frontScoreIconArr[0];
	String frontScoreTxt = frontScoreIconArr[1];
	//==================================================================
	
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
    margin-top: 30px;
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
		color: #1fc1c0;
		font-weight: bold;
		font-size: 30px;
		/* overflow: wrap; */
		/* white-space:nowrap; */
		flex-wrap: nowrap;
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
  		word-wrap:break-word;
  		overflow: wrap;
	}
	.new
	{
		color: #4f59ca;
		font-weight: bold;
		font-size: 20px;
		padding-left: 5px;
		padding-top: 5px;
		/* overflow: wrap; */
		flex-wrap: nowrap;
	}
	ul
	{
		list-style: none;
    	margin: 0;
    	padding: 0;
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
	.activenav-item > .anav-item
	{
		font-weight: bold;
		border-bottom: 1px solid #e9ecef;
		font-size: 20px;
	}
	.anav-item
	{
		font-size: 20px;
	}
	.wd_title
	{
		font-weight: bold;
		padding-bottom: 10px;
	}
	.forum_l_inner
	{
		padding-top: 30px;
		display: flex;
	}
	.viewnum
	{
		font-size: 13px;
		overflow: hidden;
  		text-overflow: ellipsis;
  		display: -webkit-box;
  		-webkit-line-clamp: 3;
  		-webkit-box-orient: vertical;
  		margin: 10px;
  		color: black;
	}
	.detail
	{
		font-weight: bold;
		font-size: 20px;
		margin: 30px 0 30px;
	}
	.d_content
	{
		font-weight: bold;
		font-size: 15px;
		
	}
	.imgbox
	{
		width: 20px;
	    height: 20px; 
	    border-radius: 70%;
	    overflow: hidden;
	    
	}
	.mojipimg
	{
		width: 100%;
    	height: 100%;
    	object-fit: cover;
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
	    background: #f2f4f8;
	    border-radius: 15px;
	    font-weight: 700;
	    font-size: 13px;
	    line-height: 16px;
	    color: #3e86f5;
	}
	.imgboxx
	{
		width: 100px;
	    height: 100px; 
	    border-radius: 70%;
	    overflow: hidden;
	    margin: auto;
	    
	   
	}
	.contentimg
	{
		width: 100%;
    	height: 100%;
    	object-fit: cover;
    	
	}
	.pic
	{
		width: 250px;
		height: 300px;
		background-color: #f1f3f5;
		margin: auto;
		padding-top: 40px;
	}
	.ppp
	{
		margin: 10px;
		text-align: center;
		font-size: 15px;
		font-weight: bold;
	}
	.btn-group-lg>.btn, .btn-lg
	{
	    padding: 0.6875rem 1.4375rem;
	    font-size: 1rem;
	    line-height: 1.5;
	    border-radius: 0.3rem;
    }
    .btn-coral-600, .btn-coral-600:hover
    {
	    color: #fff;
	    background-color: #1fc1c0;
	    border-color: #1fc1c0;
    }
    
    .tw-w-full
    {
    	margin-top:10px;
    	width: 250px;
    }
    .adiv
    {
    	margin: auto;
    }
    .memberdiv
    {
    	text-align: center;
    }
    .momcom
    {
    	padding-bottom: 20px;
    	border-bottom: 1px solid #f1f3f5;
    	margin-bottom: 20px;
    	padding-top: 30px;
    	border-top: 1px solid #f1f3f5;
    }
    .comment
    {
    	height: auto;
    	background-color: #f1f3f5;
    	border-radius: 15px;
    	
    }
    .topcomment
    {
    	/* display: flex; */
    	height: 200px;
    }
    .comimgbox
    {
    	width: 30px;
	    height: 30px; 
	    border-radius: 70%;
	    overflow: hidden;
    }
    .comimg
    {
    	width: 100%;
    	height: 100%;
    	object-fit: cover;
    }
    textarea
    {
    width: 95%;
    height: 60%;
    border: none;
    resize: none;
    background-color:transparent;
    margin: 20px 20px 0 20px;
    }
    textarea:focus
    {
    	outline: none;
    }
    .ion-icon1
    {
    	width: 50px;
    	height: 50px;
    }
    .comcom
    {
    	display: flex;
    	justify-content: flex-start;
    	margin-top: 15px;
    	
    }
    .coma
    {
    	font-size: 15px;
    	font-weight: bold;
    }
    .comday
    {
    	font-size: 10px;
    	color: gray;
    }
    .comcontent
    {
    	font-size: 15px;
    	font-weight: bold;
    	padding-top: 20px;
    	padding-left: 40px;
    	border-left: 1px solid #f1f3f5;
    	
    }
    .propic
	{
		width: 20px;
	    height: 20px; 
	    border-radius: 70%;
	    overflow: hidden;
	    margin-top: 10px;
	    
	}
	.propicimg
	{
		width: 100%;
    	height: 100%;
    	object-fit: cover;
	}
    .propicdiv
    {
    	display: flex;
    	margin-left: 40px;
    	height: 25px;
    }
    .projectcon
    {
    	display: flex;
    	margin-bottom: 10px;
    }
    .intitleform
    {
    	width: 80%;
    }
    .intitleform1
    {
    	width: 38%;
    }
    .intitleform2
    {
    	width: 12%;
    	height: 40px;
    	margin-right: 119px;
    }
    .listtop2
    {
    	margin-left: 160px;
    	
    }
    .lists
    {
    	display: flex;
    }
    .list1
    {
    	width: 48%;
    	height: 230px;
    	border-bottom: 1px solid gray;
    	overflow:scroll;
    	
    }
    .list2
    {
    	    width: 51%;
		    height: 230px;
		    margin-left: 5px;
		    border-bottom: 1px solid gray;
		    overflow:scroll;
    }
    .listlist
    {
    	border-bottom: 1px solid gray;
    	display: flex;
    	justify-content: space-between;
    }
    .listname
    {
    	font-weight: bold;
    	font-size: small;
    	margin-top: 7px;
    }
    .listtype
    {
    	font-weight: bold;
    	font-size: small;
    	margin-top: 8px;
    }
    .btn12:hover
    {
    	background-color: #2f4f4f;
    	color: white;
    }
    .btn123
    {
    	font-size: small;
    	background-color: #1fc1c0;
    	border: 1px solid #1fc1c0;
    	color: white;
   	    height: 90%;
    }
    .btn123:hover
    {
    	background-color: #2f4f4f;
    	color: white;
    }
    
    .btn1234
    {
    	font-size: small;
    	background-color: #1fc1c0;
    	border: 1px solid #1fc1c0;
    	color: white;
    	height: 90%;
    }
    .btn1234:hover
    {
    	background-color: #2f4f4f;
    	color: white;
    }
    .spanlist
    {
    	margin-top: 2px;
    }
	div
	{
		/* border: 1px solid gray; */
	}
	
</style>
<script type="text/javascript">

	$(document).ready(function()
	{
		if ($("#modalfront").val() == '씨앗')
		{
			$("#modalfront").css("display","none"); 
			$("#modalfront1").css("display","inline"); 
		}
		if ($("#modalfront").val() == '새싹')
		{
			$("#modalfront").css("display","none");
			$("#modalfront2").css("display","inline");
		}
		if ($("#modalfront").val() == '잎새')
		{
			$("#modalfront").css("display","none");
			$("#modalfront3").css("display","inline");
		}
		if ($("#modalfront").val() == '가지')
		{
			$("#modalfront").css("display","none");
			$("#modalfront4").css("display","inline");
		}
		if ($("#modalfront").val() == '열매')
		{
			$("#modalfront").css("display","none");
			$("#modalfront5").css("display","inline");
		}
		if ($("#modalfront").val() == '나무')
		{
			$("#modalfront").css("display","none");
			$("#modalfront6").css("display","inline");
		}
		if ($("#modalfront").val() == '숲')
		{
			$("#modalfront").css("display","none");
			$("#modalfront7").css("display","inline");
		}
		
		
		if ($("#modalback").val() == '씨앗')
		{
			$("#modalback").css("display","none"); 
			$("#modalback1").css("display","inline"); 
		}
		if ($("#modalback").val() == '새싹')
		{
			$("#modalback").css("display","none");
			$("#modalback2").css("display","inline");
		}
		if ($("#modalback").val() == '잎새')
		{
			$("#modalback").css("display","none");
			$("#modalback3").css("display","inline");
		}
		if ($("#modalback").val() == '가지')
		{
			$("#modalback").css("display","none");
			$("#modalback4").css("display","inline");
		}
		if ($("#modalback").val() == '열매')
		{
			$("#modalback").css("display","none");
			$("#modalback5").css("display","inline");
		}
		if ($("#modalback").val() == '나무')
		{
			$("#modalback").css("display","none");
			$("#modalback6").css("display","inline");
		}
		if ($("#modalfront").val() == '숲')
		{
			$("#modalback").css("display","none");
			$("#modalback7").css("display","inline");
		}
		
		<%-- 
		if (<%=name %>.equals($("#pjnick").val()) )
		{
			$(".btnrefuse").css("display","inline");//보이게
			$(".btncancel").css("display","none");//안보이게
			$(".btn123").css("visibility","visible");//보이게
			$(".btnout").css("visibility","visible");//보이게
			
		}
		 --%>
	})
	
 
 		

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
		
		
		<div class="offcanvas offcanvas-top" tabindex="-1" id="offcanvasTop" aria-labelledby="offcanvasTopLabel">
		  
		  
		  <!--[ 검색창을 열었을 때 보여지는 내용 ]-->
		  <div class="offcanvas-body">
		  
		  	<div class="row searchFormArea align-self-center">
		  	
				<div class="col-2">
					<ion-icon name="search-circle"></ion-icon>
				</div><!-- end .col-1 -->
				
				<div class="col-8">
				    <!--===========[searchForm]===========-->
				    <form class="d-flex" role="search" action="search.action" method="get">
				      <input class="form-control me-2 searchTextForm" type="search" name="searchcon" placeholder="검색어를 입력하세요." aria-label="Search">
				      
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
                                   <li class="nav-item">
                                       <a class="anav-item" href="#"><i class="social_tumbleupon"></i>전체 보기</a>
                                   </li>
                                   <li class="activenav-item">
                                       <a class="anav-item" href="#"><i class="icon_lightbulb_alt"></i>모집 중</a>
                                   </li>
                                   <li class="nav-item">
                                       <a class="anav-item" href="#"><i class="icon_lightbulb_alt"></i>모집 완료</a>
                                   </li>
                                   <li class="nav-item">
                                       <a class="anav-item" href="#"><i class="icon_lightbulb_alt"></i>추가 모집</a>
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
	                	<div class="col-8">
	                		<div>
								<p class="ptag">📁프로젝트</p>
							</div>
	                		<div class="one-mojip-box" style="display: flex; flex-wrap: wrap;">
	                		
								<span class="mojip">${project.status }</span>
								<span style="color: black; font-size: 30px;">｜</span>
								<span class="mojipTitle">${project.title }</span>
								<span class="new">new</span>
							</div>
							<div>
								<p class="viewnum">
								${project.kdate }
								·조회수 : <span>${project.views }</span>
								<%-- 
								·댓글 : <span>
								<c:forEach var="comment" items="${comment }">
								<c:if test="${comment.ap_code == project.ap_code}">
									${comment.count}
								</c:if>
								</c:forEach>
								</span>
								 --%>
								</p>
							</div>
							<div>
								<h2 class="detail">요 약</h2>
								<p class="d_content">${project.summary }</p>
							</div>
							<div>
								<h2 class="detail">모집 인원수</h2>
								<div style="">
									<div style="">
										
										<p class="d_content">·백엔드 : ${frontnum }명</p>
									</div>
									
									<div style="">
										
										<p class="d_content">·프론트 : ${backnum }명</p>
									</div>
								</div>
							</div>
							<div>
								<h2 class="detail">태 그</h2>
								<div style="margin-top: 30px;">
									<ul style="display: flex;">
										<c:forEach var="tag" items="${tag }">
										<c:if test="${tag.ap_code == project.ap_code }">
											<li class="litag">${tag.tag_name }</li>
										</c:if>
										</c:forEach>
									
									</ul>
								</div>
							</div>
							<div style="padding-bottom: 30px;">
								<h2 class="detail">상세 내용</h2>
								<span class="d_content">
									${project.content }

								</span>
							</div>
							
							
							<!-- 댓글 -->
							<!-- 
							<div class="momcom">
								<div class="comment">
									<div class="col-12 topcomment">
										<textarea rows="10" cols="80"></textarea>
										<div style="display: flex; justify-content: flex-end;">
											<a href="">
											<ion-icon class="ion-icon1" name="arrow-down-circle"></ion-icon>
											</a>
										</div>
									</div>
								</div>
								<div class="col-12 comcom">
									<div class="comimgbox">
										<img src="img/pompomLove.png" alt="html" class="comimg"/>
									</div>
									<div style="margin-left: 10px;">
										<a href="" class="coma">퐁퐁부인</a>
										<div class="comday">
										2024.03.03 12:00
										<a href="" style="color: gray">신고</a>
										</div>
									</div>
								</div>
								<div class="comcontent">
									내용내용아아아아아아앙아아아아ㅏㅇ아아
								</div>
							</div>
							 -->
							
							<!-- 댓글 끝 -->
						</div>
	                	
	                	<div class="col-4">
	                		<div class="memberdiv">
	                			<a href="" style="cursor: pointer;">
	                				<div class="pic">
	                					<div class="imgboxx">
	                						<img class="contentimg" src="<%=cp %>${member.path }" alt="html" />
	                					</div>
	                					
	                					<div class="ppp">
		                					<p class="ppp" id="pjnick">${project.nickname }</p>
		                					<div class="propicdiv">
		                					<p class="ppp">·백&nbsp;&nbsp;&nbsp;&nbsp;엔&nbsp;&nbsp;&nbsp;&nbsp;드 : 
		                						<div class="propic">
		                							<img class="propicimg" src="<%=backScoreIcon %>" alt="html" />
		                						</div>
		                					</p>
		                					</div>
		                					<div class="propicdiv">
		                					<p class="ppp">·프론트&nbsp;엔드 : 
		                						<div class="propic">
		                							<img class="propicimg" src="<%=frontScoreIcon %>" alt="html" />
		                						</div>
		                					</p>
		                					</div>
		                					<p class="ppp">·매너&nbsp;&nbsp;&nbsp;&nbsp;점수 : ${score.manner_score }℃</p>
	                					</div>
	                				</div>
	                			</a>
                				<div class="adiv">
               						<button type="button" class="btn btn-primary btn-lg btn-coral-600 tw-w-full btn12" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">지원하기</button>
                				</div>
	                		</div>
	                	</div>
	                </div>
                </div>                
			</div>
	
		<div class="col-md-3" style="padding-left: 50px; padding-right: 70px;">
               
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
	
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">프로젝트 신청하기</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        
	          <div class="mb-3">
	          <div class="projectcon">
	            <label for="recipient-name" class="col-form-label">프로젝트 제목:</label>
	            <input type="text" class="form-control intitleform" id="recipient-name" value="${project.title }" disabled="disabled">
	          </div>
	          <div class="projectcon">
	            <label for="recipient-name" class="col-form-label">프로젝트 내용:</label>
	            <input type="text" class="form-control intitleform" id="recipient-name" value="${project.summary }" disabled="disabled">
	          </div>
	          <div class="projectcon">
	          	
	            <label for="recipient-name" class="col-form-label">프로젝트 조건:</label>
	          </div>
	          <div class="projectcon" style="display: flex;">
	           
            	<label for="recipient-name" class="col-form-label">·연령대 : </label>
	            <input type="text" class="form-control intitleform1" id="modalage" value="${agecondition eq 0 ? '없음' : agecondition}" disabled="disabled">
            	<label for="recipient-name" class="col-form-label">·성&nbsp;&nbsp;&nbsp;별 : </label>
	            <input type="text" class="form-control intitleform1" id="modalgender" value="${gendercondition eq 0 ? '없음' : gendercondition}" disabled="disabled">
	          
	          </div>
	          <div class="projectcon" style="display: flex;">
	           
            	<label for="recipient-name" class="col-form-label">·프론트 : </label>
	            <input type="text" class="form-control intitleform1" id="modalfront" value="${frontcondition eq 0 ? '없음' : frontcondition}" disabled="disabled">
	            <input type="image" class="form-control intitleform2" id="modalfront1" disabled="disabled" src="img/grade_icon/1_seed.png" style="display: none;">
	            <input type="image" class="form-control intitleform2" id="modalfront2" disabled="disabled" src="img/grade_icon/2_plant.png" style="display: none;">
	            <input type="image" class="form-control intitleform2" id="modalfront3" disabled="disabled" src="img/grade_icon/3_leaf.png" style="display: none;">
	            <input type="image" class="form-control intitleform2" id="modalfront4" disabled="disabled" src="img/grade_icon/4_branch.png" style="display: none;">
	            <input type="image" class="form-control intitleform2" id="modalfront5" disabled="disabled" src="img/grade_icon/5_pear.png" style="display: none;">
	            <input type="image" class="form-control intitleform2" id="modalfront6" disabled="disabled" src="img/grade_icon/6_tree.png" style="display: none;">
	            <input type="image" class="form-control intitleform2" id="modalfront7" disabled="disabled" src="img/grade_icon/7_forest.png" style="display: none;">
            	<label for="recipient-name" class="col-form-label">·백엔드 : </label>
	            <input type="text" class="form-control intitleform1" id="modalback" value="${backcondition eq 0 ? '없음' :  backcondition}" disabled="disabled">
	            <input type="image" class="form-control intitleform2" id="modalback1" disabled="disabled" src="img/grade_icon/1_seed.png" style="display: none;">
	            <input type="image" class="form-control intitleform2" id="modalback2" disabled="disabled" src="img/grade_icon/2_plant.png" style="display: none;">
	            <input type="image" class="form-control intitleform2" id="modalback3" disabled="disabled" src="img/grade_icon/3_leaf.png" style="display: none;">
	            <input type="image" class="form-control intitleform2" id="modalback4" disabled="disabled" src="img/grade_icon/4_branch.png" style="display: none;">
	            <input type="image" class="form-control intitleform2" id="modalback5" disabled="disabled" src="img/grade_icon/5_pear.png" style="display: none;">
	            <input type="image" class="form-control intitleform2" id="modalback6" disabled="disabled" src="img/grade_icon/6_tree.png" style="display: none;">
	            <input type="image" class="form-control intitleform2" id="modalback7" disabled="disabled" src="img/grade_icon/7_forest.png" style="display: none;">
	          
	          </div>
	          <div class="projectcon" style="display: flex;">
	           
            	<label for="recipient-name" class="col-form-label">·매&nbsp;&nbsp;&nbsp;너 : </label>
	            <input type="text" class="form-control intitleform1" id="modalmanner" value="${mannercondition eq 0.0 ? '없음' :  mannercondition}" disabled="disabled">
            	
	          </div>
	          </div>
	          <div class="mb-3">
	          	<div class="listtop">
	            <label for="message-text" class="col-form-label listtop1">·확정 인원</label>
	            <label for="message-text" class="col-form-label listtop2">·지원 인원</label><br>
	            <label for="message-text" class="col-form-label listtop1">·프론트(${fcount }/${frontnum})</label>
	            <label for="message-text" class="col-form-label listtop1"> ·백엔드(${bcount }/${backnum})</label>
	          	</div>
	          	<div class="lists">
		          	<div class="list1">
		          		<c:set var="name" value="<%=name %>"></c:set>
		          		<c:forEach var="haplists" items="${haplists }">
		          		<div class="listlist">
		          			<span class="listname">${haplists.nickname }</span>
		          			<span class="listtype">${haplists.mr_code eq 'MR0002' ? '백엔드' : '프론트' }</span>
		          			<span class="spanlist">
		          			<%-- <button type="button"class="btn btn1234 btnout" style="${name == project.nickname ? 'visibility:visible;' : 'visibility: hidden;'}">추방</button> --%>
		          			</span>
		          		</div>
		          		</c:forEach>
		          			
		          	</div>
		          	<div class="list2">
		          		<c:forEach var="lists" items="${lists }">
			          	<form action="update.action" method="post">
		          		<div class="listlist">
		          		
		          			<c:set var="name" value="<%=name %>"></c:set>
		          			
		          			<span class="listname" name="listname">${lists.nickname }</span>
		          			<span class="spanlist">
		          			<span class="listtype" name="listtype">${lists.mr_code eq 'MR0002' ? '백엔드' : '프론트' }</span>
			          		<input type="hidden" value="${lists.mem_code }" name="updatemem">
			          		<input type="hidden" value="${lists.mr_code }" name="updatemr">
		          			<button type="submit" class="btn btn123" style="${name == project.nickname ? 'visibility:visible;' : 'visibility: hidden;'}">수락</button>
		          			<%-- <button type="button" class="btn btn1234 btnrefuse" style="${name == project.nickname ? 'display:inline;' : 'display:none;'}">거절</button> --%>
		          			<%-- <button type="button" class="btn btn1234 btncancel" style="${name == project.nickname ? 'display:none;' : 'display:inline'}">취소</button><br> --%>
		          			</span>
		          		<input type="hidden" value="${ap_code }" name="update">
		          		</div>
			          	</form>
		          		</c:forEach>
		          			
		          	</div>
	          	</div>
	            <!-- <textarea class="form-control" id="message-text"></textarea> -->
	          </div>
	        
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <form action="frontinsert.action" method="post">
	        <input type="hidden" value="${ap_code }" name="front">
	        <button type="form.submit" class="btn btn-primary frontbtn">프론트 지원하기</button>
	        </form>
	        <form action="backinsert.action" method="post">
	        <input type="hidden" value="${ap_code }" name="back">
	        <button type="form.submit" class="btn btn-primary backbtn" >백엔드 지원하기</button>
	        </form>
	      </div>
	    </div>
	  </div>
	</div>


</body>
</html>


