<%@page import="com.test.mybatis.MyPageMethod"%>
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
<title>Template.jsp</title>
<!-- BootStrap -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/banner_side.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<!-- JQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- ionicons -->
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<script type="text/javascript">
const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
const popoverList = [popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
	
	  $( function () {
	    $( '[data-bs-toggle="popover"]' ).popover()
	  } );
</script>

<script type="text/javascript">
		$(function()
		{
			  $(".memberImg").click(function()
			{
				$(".logout").show();
			})
			
			$(".logout").click(function()
			{
				$(location).attr("href", "logout.action");
			});
			
		})
</script>

<script type="text/javascript">
	$(function()
	{
		$(".onerow").click(function()
		{
			$("#moreInfo").modal("show");
			
			id = $(this).attr('id');
			
			var nickname = $("." + "nickname" + id).text();
			
			var date = $("." + "date" + id).text();
		
			var title = $("." + "taskTitle" + id).text();
			
			var content = $("." + "content" + id).val();
			
			var summary = $("." + "summary" + id).val();
			
			$("#nickname").val(nickname);
			$("#date").val(date);
			$("#content").val(content);
			$("#summary").val(summary);
			$("#title").val(title);
		})
		
		// 승인버튼 클릭시
		$(".pass").click(function()
		{
			$(location).attr("href", "reportpass.action?br_code=" + id + "&ap_code=" + "${ap_code}" + "&cp_code=" + "${cp_code}");
		})
		
		// 승인버튼 클릭시
		$(".nonepass").click(function()
		{
			$(location).attr("href", "reportnonepass.action?br_code=" + id + "&ap_code=" + "${ap_code}" + "&cp_code=" + "${cp_code}");
		})
	})
</script> 

<style type="text/css">
	.report {
    width: 1200px;
    box-shadow: 1px 2px 1px 1px gray;
    margin-top: 67px;
    background-color: #fffef5;
    padding: 33px;
    border-radius: 25px;
}
	/* div{border: 1px solid black;} */
	.reHead {
    display: flex;
    justify-content: space-around;
    font-size: 25px;
    font-weight: bold;
    padding: 5px;
    color: #8f8585;
    margin-bottom: 15px;
}
	/* div{border: 1px solid black;} */
	.oneReport {
    font-size: 14px;
    margin: 30px 0 30px 0;
    border-bottom: 1px solid gray;
    padding: 10px;
    border-radius: 30px;
    display: flex;
    background-color: white;
    position: relative;
    box-shadow: 2px 1px 3px #8d8881;
    bottom: 20px;
    height: 34px;
}
	.task {
    width: 235px;
    padding-left: 10px;
    height: 52px;
    -webkit-transform: skew(20deg);
    position: relative;
    left: 20px;
    z-index: 2;
    box-shadow: 4px 0 5px #8d8881;
}
	.task.high{color:red;}
	.content {
    width: 424px;
    padding-left: 142px;
    position: relative;
    bottom: 3px;
}
	.summary{width:  253px; position: relative;
    bottom: 3px;}
	.date{width:  312px; position: relative;
    bottom: 3px;}
	.state{width: 140px; position: relative;
    bottom: 3px;}
	.form-select {
    width: 120px;
    float: right;
    position: relative;
    right: 430px;
}
	.result{display: flex; justify-content: space-around;}
	.taskTitle {
    color: white;
    -webkit-transform: skew(-20deg);
    position: relative;
    top: 15px;
    text-align: center;
    right: 10px;
    text-shadow: -1px 0px 3px #614223;
    font-weight: bold;
}
	.onerow{display: flex;}
	.a{background-color: #79d0f7;}
	.b{background-color: #53df76;}
	.c{background-color: #cadb63;}
	.stateText {
    position: relative;
    bottom: 8px;
}
	.material-symbols-outlined {
    position: relative;
    bottom: 2px;
}
	.high{color: #87b4f5;}
	.mid{color: #fded85f5;}
	.low{color: #f5877e;	}
	.highback{background-color: #87b4f5;}
	.midback{background-color: #fded85f5;}
	.lowback{background-color: #f5877e;}
	/* .writer{display: flex;}
	.writerspace {
    position: relative;
    width: 300px;
    left: 127px;
    text-align: right;
}
	.other {
    display: grid;
}
	.form-control:disabled {
    background-color: #ffffff;
}
	.result{display: contents;} */
</style>
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
		<div class="row main-text">
			<div class="col-12">
				<h1>업무보고서 조회</h1>
					<select class="form-select" aria-label="Default select example">
					  <option selected>팀원 선택</option>
					  <c:forEach var="i"  begin="0" end="${memberList.size() - 1 }" step="1">
						  <option value="${memberList[i].mem_code }">${memberList[i].nickname }</option>
					  </c:forEach>
					</select>
					<div class="report">
						
						<div class="reHead">
							<div>업무명</div>
							<div>작성자</div>
							<div>작성 일자</div>
							<div>상태</div>
						</div>
						<div class="reBody">
							<c:forEach var="i"  begin="0" end="${reportList.size() - 1 }" step="1">
								
								<div class="onerow" id="${reportList[i].br_code }">
										<c:if test="${reportList[i].state == '승인'}"> 
											<div class="task highback"> <div class="taskTitle taskTitle${reportList[i].br_code }">${reportList[i].title }</div></div>
												<div class="oneReport">
													<div class="content nickname${reportList[i].br_code }">${reportList[i].nickname }</div>
													<div class="date date${reportList[i].br_code }">${reportList[i].kdate }</div>
										</c:if>
										<c:if test="${reportList[i].state == '보류'}"> 
											<div class="task midback"> <div class="taskTitle taskTitle${reportList[i].br_code }">${reportList[i].title }</div></div>
												<div class="oneReport">
													<div class="content nickname${reportList[i].br_code }">${reportList[i].nickname }</div>
													<div class="date date${reportList[i].br_code }">${reportList[i].kdate }</div>
										</c:if>
										<c:if test="${reportList[i].state == '거절'}"> 
											<div class="task lowback"> <div class="taskTitle taskTitle${reportList[i].br_code }">${reportList[i].title }</div></div>
												<div class="oneReport">
													<div class="content nickname${reportList[i].br_code }">${reportList[i].nickname }</div>
													<div class="date date${reportList[i].br_code }">${reportList[i].kdate }</div>
										</c:if>
								
										<input type="hidden"  value="${reportList[i].content }" class="content${reportList[i].br_code }"/>
										<input type="hidden"  value="${reportList[i].summary }" class="summary${reportList[i].br_code }"/>
										
										<c:if test="${reportList[i].state == '승인'}"> 
											<div class="state high">
												<span class="material-symbols-outlined">check</span>
												<span class="stateText">${reportList[i].state }</span>
											</div>
										</c:if>
										<c:if test="${reportList[i].state == '거절'}"> 
											<div class="state low">
												<span class="material-symbols-outlined">dangerous</span>
												<span class="stateText">${reportList[i].state }</span>
											</div>
										</c:if>
										<c:if test="${reportList[i].state == '보류'}"> 
											<div class="state mid">
												<span class="material-symbols-outlined">change_history</span>
												<span class="stateText">${reportList[i].state }</span>
											</div>
										</c:if>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
			</div>
	
		</div>
</div><!-- end .row -->

<div class="modal" tabindex="-1" id="moreInfo">
  <div class="modal-dialog ">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">업무보고서 내용</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="mb-3 writer">
            <label for="recipient-name" class="col-form-label">작성자</label>
            <input type="text" class="form-control writerspace" id="nickname" disabled="disabled">
        </div>
        
        <div class="mb-3 writer">
            <label for="recipient-name" class="col-form-label">업무명</label>
            <input type="text" class="form-control writerspace" id="title" disabled="disabled">
        </div>
        <div class="mb-3 other">
            <label for="recipient-name" class="col-form-label">보고서 내용</label>
            <input type="text" class="form-control" id="content" disabled="disabled">
        </div>
        <div class="mb-3 other">
            <label for="recipient-name" class="col-form-label">보고서 요약</label>
            <input type="text" class="form-control" id="summary" disabled="disabled">
        </div>
         <div class="mb-3 other">
            <label for="recipient-name" class="col-form-label">첨부 파일</label>
            <a href= "C\Downloads\mypage_style.css" download="mypage_style.css">side.css</a>
        </div>
        
        <!-- 팀장인 경우에만 보이도록 처리해야 함 -->
        <c:if test="${flag eq 'leader' }">
	        <div class="result">
		        <button class="btn btn-primary pass">승인</button>
		        <button class="btn btn-dark nonepass">거절</button>
		    </div>
	    </c:if>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


</body>
</html>