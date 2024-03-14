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
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/banner_side.css" />

<!-- JQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- ionicons -->
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<style type="text/css">

	@font-face
	{
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
	.center
	{
		width: 1200px;
		height: 550px;
		padding: 0;
		margin: 0;
	}
	.title
	{
		display: flex;
	}
	.top
	{
		display: flex;
		justify-content: space-between;
	}
	.container
	{
		
		padding: 0px;
		margin: auto;
		justify-content: space-evenly;
		overflow: hidden;
	}
	.aa
	{
		width: 320px;
	    height: 300px;
	    margin: 5px;
	    padding: 15px;
		border-radius: 15px;
		border: 1px solid gray;
		box-shadow : 2px 2px 2px 2px #87878775;
		text-decoration-line: none;
		/* background-color: #f8f9fa; */
		 flex-shrink: 0;
	}
	.a1
	{
		color: black;
		text-decoration-line: none;
	}
	.container > .aa
	{
		color: black;
	}
	.bottom
	{
		display: flex;
		justify-content: space-between;
		font-size: 13px;
		border-top: 1px solid gray;
	}
	.endday
	{
		
		color: gray;
	}
	.menu
	{
		background-color: #dee2e6;
	    /* opacity: 0.5; */
	    width: fit-content;
	    padding-left: 5px;
	    padding-right: 5px;
	    border-radius: 50px;
	    color: black;
	    font-size: 15px;
	    font-weight: bold;
	    margin-top: 2px;
	}
	.menu>span
	{
		color: black;
		
	}
	.enddate>span
	{
		color: red;
	    border-radius: 50px;
	    border: 1.5px solid red;
	    padding-left: 5px;
	    padding-right: 5px;
	    font-size: 15px;
	    font-weight: bold;
		
	}
	.title
	{
		font-size: 30px;
	    height: 100px;
	    overflow: hidden;
	    padding: 10px 0 10px;
	    text-overflow: ellipsis;
  		display: -webkit-box;
  		-webkit-line-clamp: 2;
  		-webkit-box-orient: vertical;
	}
	.content
	{
		
		font-size: 20px;
	    height: 178px;
	    white-space: normal;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    display: -webkit-box;
	    -webkit-line-clamp: 2;
	    -webkit-box-orient: vertical;
	    margin: 25px 0 25px;
	}
	.btn1
	{
		background-color: #ed0086;
		color: white;
		border:0px solid white;
		border-radius: 100px;
		
	}
	a>img
	{
		width: 30px;
		height: 30px;
	}
	.all
	{
		display: flex;
		justify-content: flex-end;
		font-size: 25px;
		text-decoration: underline;
		color: gray;
		cursor: pointer;
	}
	
	
	
	/* 전체 메뉴바 영역을 감싸는 최상위 부모 div */
	.menuArea
	{
		
		width: 18%;
		
	
	}
	
	.picMenu
	{
		display: flex;
		flex-wrap: wrap;
	}
	.centerMenu
	{
		padding: auto;
		/* border: 1px solid black; */
		height: 300px;
		display: flex;
		white-space: nowrap;
	}
	/* 이미지 슬라이드 */
	/* 사진앞 점(없애야함) */
	.btn-container
	{
		margin-top: 130px;
	}
	.prevbtn
	{
		width: 30px;
		height: 30px;
	}
	
	.nextbtn
	{
		width: 30px;
		height: 30px;
	}
	
	li
	{
		list-style-type: none;
	}
	.slideMain {
	width: 1500px;
	height: 300px;
    overflow: hidden;
    /* margin: 0 auto; */
    
	}
	.slide {
      display: flex;
      transition: all 1s;
      width: 1500px;
	}
	
	.mainImg {
	    width: 1300px;
	    height: 298px;
	    margin-left: -55px;
	}
	
	/* 슬라이드 끝 */
	.hoho
	{
		/* border: 1px solid black; */
		height: 50px;
		display: flex;
	}
	/* 프로젝트 슬라이드 */
	.proprevbtn
	{
		width: 30px;
		height: 30px;
		cursor: pointer;
	}
	
	.pronextbtn
	{
		width: 30px;
		height: 30px;
		cursor: pointer;
		
		
	}
	.proslide
	{
    	display: flex;
	    white-space: nowrap;
	    font-size: 0;
	    /* overflow-x: auto; */
	    padding-left: inherit;
	    margin-left: 0;
	    width: 100%;
	  
	  	
	}
	.proslide li:hover
	{
		background-color: #f1f3f5;
		cursor: pointer;
	}
	.litop
	{
		display: flex;
		justify-content: space-between;
		/* margin-right: -160px; */
	}
	.licontent
	{
		font-size: 20px;
	    height: 178px;
	    white-space: normal;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    display: -webkit-box;
	    -webkit-line-clamp: 2;
	    -webkit-box-orient: vertical;
	    margin: 25px 0 25px;
		/* margin-right: -160px; */
	}
	.libottom
	{
		display: flex;
		justify-content: space-between;
		font-size: 13px;
		border-top: 1px solid gray;
		/* margin-right: -160px; */
	}
</style>

<script type="text/javascript">
	/* 	
	const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
	const popoverList = [popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
	
	  $( function () {
	    $( '[data-bs-toggle="popover"]' ).popover()
	  } );
		 */
		let currentSlide = 1;
		let IMAGE_WIDTH = 1300;
		

		
		
		function next() {
		const nextBtn = document.querySelector('.nextbtn');
		const prevBtn = document.querySelector('.prevbtn');
		const slide = document.querySelector('.slide');
		const slideLength = document.querySelectorAll('.slide li').length;
		
		
		// 다음 버튼 클릭
		
		//alert(slideLength);
		 
		//alert(IMAGE_WIDTH * currentSlide);
		  if (currentSlide >= slideLength) {
		    currentSlide = 0;
		  }
		  
		  // 알아보기
		  slide.style.transform = 'translateX(-'+ (IMAGE_WIDTH * currentSlide) +'px)';
		  //alert(`translateX(-${IMAGE_WIDTH * currentSlide}px)`);
		  currentSlide++;
		}
	
	
		//prevBtn.addEventListener('click', prev);
		
		function prev() {
		const prevBtn = document.querySelector('.prevbtn');
		const slide = document.querySelector('.slide');
		const slideLength = document.querySelectorAll('.slide li').length;
		
		//alert(slideLength);
		
		  if (currentSlide == 1) {
		    currentSlide = slideLength;
		  } else {
		    currentSlide--;
		  }
		  slide.style.transform = 'translateX(-'+ (IMAGE_WIDTH * (currentSlide-1)) +'px)';
		  //alert(IMAGE_WIDTH * currentSlide);
		}
	 
		
		
		function pronext1()
		{
			const nextBtn = document.querySelector('.pronextbtn');
			const slide = document.querySelector('.proslide1');
			const slideLength = document.querySelectorAll('.proslide1 li').length;
			const container_width = $('.container').width();
			
			
			// 다음 버튼 클릭
			
			//alert(slideLength);
			 
			//alert(projectwidth * currentSlide);
			if(currentSlide == 1 && slideLength <= 4)
			{
				currentSlide = 0;
			}
			else if (currentSlide == 2 && slideLength <= 8 && slideLength > 4) {
				    currentSlide = 0;
				   
				}
			  else if (currentSlide == 3) {
			    currentSlide = 0;
			  }
			  //alert($("li").index());
			  // 알아보기
			  slide.style.transition = 'transform 0.5s ease-in-out';
			  slide.style.transform = 'translateX(-'+ (container_width * currentSlide) +'px)';
			  
			  //alert(`translateX(-${IMAGE_WIDTH * currentSlide}px)`);
			  
				currentSlide++;
			  
		}
		 
		function proprev1() {
			const prevBtn = document.querySelector('.proprevbtn');
			const slide = document.querySelector('.proslide1');
			const slideLength = document.querySelectorAll('.proslide1 li').length;
			const container_width = $('.container').width();
			
			//alert(slideLength);
			
			  if (currentSlide == 1 && slideLength > 8) {
				  slideLength == 12;
			    currentSlide = (slideLength-9);
			  }
			   else if (currentSlide == 1 && slideLength <= 8 && slideLength > 4)
				{
				   slideLength == 8;
				  currentSlide = (slideLength-4);
				} 
			  else if (currentSlide == 1 && slideLength <= 4)
				{
				  currentSlide = 0
				}
			
			
			/* if (currentSlide == 1) {
			    currentSlide = (slideLength-4);
			  } */
			  else {
			    currentSlide--;
			  }
			  slide.style.transition = 'transform 0.5s ease-in-out';
			  slide.style.transform = 'translateX(-'+ (container_width * (currentSlide-1)) +'px)';
			  //alert(IMAGE_WIDTH * currentSlide);
			}
		
		
		
		function pronext2()
		{
			const nextBtn = document.querySelector('.pronextbtn');
			const slide = document.querySelector('.proslide2');
			const slideLength = document.querySelectorAll('.proslide2 li').length;
			const container_width = $('.container').width();
			
			
			// 다음 버튼 클릭
			
			//alert(container_width);
			 
			//alert(projectwidth * currentSlide);
			  if(currentSlide == 1 && slideLength <= 4)
				{
					currentSlide = 0;
				}
				else if (currentSlide == 2 && slideLength <= 8 && slideLength > 4) {
					  
					    currentSlide = 0;
					   
				}
			  else if (currentSlide == 3) {
			    currentSlide = 0;
			  }
			  //alert($("li").index());
			  // 알아보기
			  slide.style.transition = 'transform 0.5s ease-in-out';
			  slide.style.transform = 'translateX(-'+ (container_width * currentSlide) +'px)';
			  
			  //alert(`translateX(-${IMAGE_WIDTH * currentSlide}px)`);
			  
				currentSlide++;
			  
		}
		 
		function proprev2() {
			const prevBtn = document.querySelector('.proprevbtn');
			const slide = document.querySelector('.proslide2');
			const slideLength = document.querySelectorAll('.proslide2 li').length;
			const container_width = $('.container').width();
			
			//alert(slideLength);
				
			if (currentSlide == 1 && slideLength > 8) {
				slideLength == 12;
			    currentSlide = (slideLength-9);
			  }
			   else if (currentSlide == 1 && slideLength <= 8 && slideLength > 4)
				{
				   slideLength == 8;
				  currentSlide = (slideLength-4);
				} 
			  else if (currentSlide == 1 && slideLength <= 4)
				{
				  currentSlide = 0
				}
			
			
			/* if (currentSlide == 1) {
			    currentSlide = (slideLength-4);
			  } */
			 
			
			  else {
			    currentSlide--;
			  }
			  slide.style.transition = 'transform 0.5s ease-in-out';
			  slide.style.transform = 'translateX(-'+ (container_width * (currentSlide-1)) +'px)';
			  //alert(IMAGE_WIDTH * currentSlide);
			}
		 
		$(document).ready(function()
		{
			$(".all1").click(function()
			{
				//alert("ghrdls1");
				$(location).attr("href", "ProjectList.action");
			})
			
			$(".all2").click(function()
			{
				//alert("ghrdls2");
				$(location).attr("href", "QnaList.action");
			})
		})
		
		
</script>
</head>
<body>

<div class="row mainArea">

	<div class="col-12 bannerMain">
		<div class="row bannerArea">
			<nav class="navbar bg-body-tertiary">
			  <div class="container-fluid nav nav-underline">
			    
			 	<!--===========[Logo]===========-->
				<a class="navbar-brand bannerLogo" href="#">
					<img alt="Logo" class="bannerLogoImage d-inline-block align-text-top" src="img/TestLogo.png" >
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
	
	<!-- 상단 사진 영역 -->
	<div class="picMenu">
		<div class="col-2"></div>
		<div class="col-8 centerMenu">
			<!-- 슬라이드 영역 -->
			<div class="btn-container">
				<img src="img/left-arrow-button.png" alt="html" class="prevbtn" onclick="prev()"/>
			</div>
			<div class="slideMain">
				<ul class="slide" id="slide">
					<li>
						<img class="mainImg" alt="html" src="img/back1.png">
					</li>
					<li>
						<img class="mainImg" alt="html" src="img/back2.png">
					</li>
					
				</ul>
			</div>
			<div class="btn-container">
				<img src="img/right-arrow-button.png" alt="html" class="nextbtn" onclick="next()"/>
			</div>
			<!-- end 슬라이드 -->
		</div>
		<!-- <div class="col-2">
			
		</div> -->
	</div>
	
	<!-- 게시판? 영역 -->
	<div class="col-12 hoho"></div>
	<div class="flex">
		
		<!-- 본문 영역 -->
		<div class="row main-text">
			<div class="col-12">
				<div class="container">
					<div class="title">
						<h1>
							인기 프로젝트 TOP 12🔥
							
						</h1>
						
					</div>
					<div class="top">
						<h3>
							인기 프로젝트를 확인해보세요
						</h3>
						<div>
							<a><img alt="html" src="img/left-arrow-button.png" class="proprevbtn" onclick="proprev1()"></a>
							<a><img alt="html" src="img/right-arrow-button.png" class="pronextbtn" onclick="pronext1()"></a>
						</div>
					</div>
					<br>
				</div>
				<div class="container" id="container">
					<ul class="proslide proslide1">
					<c:forEach var="list" items="${list }" begin="0" end="11" step="1" varStatus="status">
						
						<a href="" class="a1">
						<li href="" class="aa" id="aa1">
							<div class="litop">
								<div class="menu"><span>📁프로젝트</span></div>
								
								<div class="enddate"><span>🚨마감일</span></div>
								
							</div>
							<div class="licontent">
								<div class="c title">${list.title }</div>
								<div class="c content">${list.content }</div>
							</div>
							<div class="libottom">
								<div class="endday">마감일 : ${list.sdate }</div>
								<div class="view">👁️조회수 : ${list.views }</div>
							</div>
						</li>
						</a>
						
					</c:forEach>
					
					
					</ul>
				
				<a class="all all1">모두 보기 >>></a>
				</div>
				
				<!-- 1 -->
				<div class="container">
					<div class="title">
						<h1>
							인기 Q&A TOP 12🔥
							
						</h1>
						
					</div>
					<div class="top">
						<h3>
							인기 Q&A 를 확인해보세요
						</h3>
						<div>
							<a><img alt="html" src="img/left-arrow-button.png" class="proprevbtn" onclick="proprev2()"></a>
							<a><img alt="html" src="img/right-arrow-button.png" class="pronextbtn" onclick="pronext2()"></a>
						</div>
					</div>
					<br>
				</div>
				<div class="container" id="container">
					<ul class="proslide proslide2">
					<c:forEach var="list" items="${qnalist }" begin="0" end="11" step="1" varStatus="status">
						<a href="article.action?code=${list.tq_code }" class="a1">
						<li class="aa" id="aa1">
							<div class="litop">
								<div class="menu"><span>🔍Q&A</span></div>
							</div>
							<div class="licontent">
								<div class="c title">${list.title }</div>
								<div class="c content">${list.content }</div>
							</div>
							<div class="libottom">
								<div class="endday">작성일 : ${list.kdate }</div>
								<div class="view">👁️조회수 : ${list.views }</div>
							</div>
						</li>
						</a>
						
					</c:forEach>
					
					
					</ul>
				
				<a class="all all2">모두 보기 >>></a>
				</div>
				
				
				</div>
				</div>
	</div><!-- end flex -->

</body>
</html>