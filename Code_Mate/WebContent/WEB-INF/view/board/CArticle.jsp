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
<title>Article.jsp</title>
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
a{
	text-decoration: none;
	color: #242729;
}

.forum-post-top {
    display: flex;
}

.forum-post-top .forum-post-author .forum-author-meta {
    display: flex;
}

.forum-post-top .forum-post-author .forum-author-meta .author-badge:first-child {
    margin-right: 20px;
}

.forum-post-top .author-avatar img {
    border-radius: 50%;
    margin-right: 15px;
}

.question-icon {
    font-size: 50px;
    margin-right: 15px;
    font-weight: 600;
}

.q-title {
    display: flex;
    padding: 20px 15px 15px 0;
}

.q-title h1 {
    font-size: 24px;
    margin-top: 30px;
}

.forum-post-content .forum-post-btm {
    display: flex;
    justify-content: space-between;
    border-bottom: 1px solid gray;
    padding-bottom: 20px;
    padding-top: 30px;
}

.tagIcon{
	margin-right: 10px;
}

.logos{
	margin-right: 5px;
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
    width: 200px;
    text-align: left;
    padding-left: 30px;
    padding-right: 30px;
    transition: all 300ms linear 0s;
    margin-left: 130px;
    margin-top: 200px;
}

.best-answer {
    background: #f9f9f9;
    padding: 30px 40px 30px 30px;
    margin-top: 60px;
    border-radius: 6px;
}

.best-answer .accepted-ans-mark{
	display: none;
}

.gh1 .accepted-ans-mark {
    color: #0abe76;
    font-size: 14px;
    text-align: right;
    display: block;
}

.best-answer .best-ans-content {
    margin-top: 30px;
}

</style>

<style type="text/css">
@import url("https://fonts.googleapis.com/css?family=Montserrat:600&display=swap");
.contentA {
  display: flex;
  cursor: pointer;
}

.heart {
  position: absolute;
  background: url("img/heart.png") no-repeat;
  background-position: left;
  background-size: 2900%;
  height: 90px;
  width: 90px;
  transform: translate(-50%, -50%);
  margin-top: 15px;
  margin-left: 10px;
}

.text {
  font-size: 21px;
  margin-left: 30px;
  color: #000;
  font-family: "Montserrat", sans-serif;
}

.heart.heart-active {
  animation: animate 0.8s steps(28) 1;
  background-position: right;
}

@keyframes animate {
  0% {
    background-position: left;
  }
  100% {
    background-position: right;
  }
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
	var flagList  = ${jsonList};
	
	function test1() 
	{
	    if ("${member}" != "") 
	    {	
	    	//alert(flagList[0].flag);
	        //alert(flagList.length);
	    	
	        for (var i = 0; i < flagList.length; i++) 
	        {
	            if (parseInt(flagList[i].flag) > 0) 
	            {
	                $('.heartClass' + flagList[i].cqcCode).addClass("heart-active");
	            }
	        }
	    }
	}
	
	function test(commentIndex)
	{	
		var heartButton = $('.heartClass' + commentIndex);
		
		var textButton = $('.textClass' + commentIndex);
		
		
		if ("${member}" == "")
		{
			if(confirm("로그인이 필요합니다. 로그인하시겠습니까?"))
			{
				location.href="Login.action";
			}
		}
		
		else
		{
			if (heartButton.hasClass('heart-active'))
			{	
				$.ajax({
					type:"GET",
					url:"likeCDown.action?cqc_code="+commentIndex+"&mem_code="+"${member.mem_code}",
					success:function(data){
						$('.textClass' + commentIndex).html("Like " + data);
						$('.heartClass' + commentIndex).removeClass("heart-active");
					}
				})
								
			}
			else
			{					
				$.ajax({
					type:"GET",
					url:"likeCUp.action?cqc_code="+commentIndex+"&mem_code="+"${member.mem_code}",
					success:function(data){
						$('.textClass' + commentIndex).html("Like " + data);
						$('.heartClass' + commentIndex).addClass("heart-active");
					}
				})
				
			}
		}

	}
	
	window.onload = test1;
</script>

<script type="text/javascript">
function insertReply(cqc_code) {
    var reply = document.getElementById("area" + cqc_code).value;
    
    if ("${member}" == "")
	{
		if(confirm("로그인이 필요합니다. 로그인하시겠습니까?"))
		{
			location.href="Login.action";
		}
	}
    else
    {
    	$.ajax({
            type: "POST", // HTTP 요청 방식
            url: "creplyinsert.action", // 요청을 보낼 URL
            data: { // 전송할 데이터
                cqc_code: cqc_code, // cqc_code 값
                reply: reply, // reply 값
                mem_code: "${member.mem_code}"
            },
            success: function(response) { // 요청이 성공했을 때의 콜백 함수
                // 성공 처리를 수행하거나 필요에 따라 페이지 리로드 등을 수행할 수 있습니다.
                // 예를 들어, 페이지 리로드
                window.location.reload();
            },
            error: function(xhr, status, error) { // 요청이 실패했을 때의 콜백 함수
                // 실패 처리를 수행할 수 있습니다.
                console.error("Request failed:", error); // 콘솔에 에러 메시지 출력
            }
        });
    }
}

	function landers()
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
			$("#exampleModal").modal("show");
		}
		
	}
	
	function insertComment()
	{	
		var comment = document.getElementById("message-text").value;
				
		$.ajax({
            type: "POST", // HTTP 요청 방식
            url: "ccommentinsert.action", // 요청을 보낼 URL
            data: { // 전송할 데이터
                cq_code: "${param.code}",
                comment: comment,
                mem_code: "${member.mem_code}"
            },
            success: function(response) { // 요청이 성공했을 때의 콜백 함수
                // 성공 처리를 수행하거나 필요에 따라 페이지 리로드 등을 수행할 수 있습니다.
                // 예를 들어, 페이지 리로드
                window.location.reload();
            },
            error: function(xhr, status, error) { // 요청이 실패했을 때의 콜백 함수
                // 실패 처리를 수행할 수 있습니다.
                console.error("Request failed:", error); // 콘솔에 에러 메시지 출력
            }
        });
	}
	
	function report()
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
			$("#reportModal").modal("show");
		}
	}
	
	function insertReport()
	{
		$("#reportForm").submit();
	}
	
	function voteP()
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
			var voteSel = document.getElementsByName("voteSel");
			var selectedValue;
			
			for (var i = 0; i < voteSel.length; i++) {
		        if (voteSel[i].checked) {
		            selectedValue = voteSel[i].value;
		            break;
		        }
		    }
			
			if (selectedValue !== undefined) 
			{
				$.ajax({
					type:"GET",
					url:"votep.action?vs_code="+selectedValue+"&mem_code="+"${member.mem_code}",
					success:function(data){
						window.location.reload();
					}
				})
				
		    } 
			else 
			{
		        alert("옵션을 선택해 주세요");
		    }
		}
		
	}
</script>

<!-- 투표 -->

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Option');
        data.addColumn('number', 'Votes');
        
        <c:forEach var="item5" items="${voteContent}">
        data.addRow(['<c:out value="${item5.content}" />', <c:out value="${item5.count}" />]);
   	 	</c:forEach>

        var barchart_options = {title:'${voteTitle.title}',
                width:400,
                height:300,
                legend: 'none',
                hAxis: {
                    format: '0' // 정수로 표시
                }};
        
		var barchart = new google.visualization.BarChart(document.getElementById('barchart_div'));
		barchart.draw(data, barchart_options);
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
	
		<!-- 본문 영역 -->
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-9">
                      <div class="forum-post-top">
                          <a class="author-avatar" href="#">
                              <img src="img/profile.png" alt="" style="width: 50px; height: 50px;">
                          </a>
                          <div class="forum-post-author">
                              <a class="author-name" href="#"> ${dto.nickname } </a>
                              <div class="forum-author-meta">
                              	  <div class="author-badge">
                                      <ion-icon name="footsteps-outline"></ion-icon>
                                      <span>커리어</span>
                                      
                                      <ion-icon name="calendar-clear-outline" style="margin-left: 10px;"></ion-icon>
                                      ${dto.kdate }
                                      
                                      <ion-icon name="eye-outline" role="img" class="md hydrated" aria-label="eye outline" style="margin-left: 920px;"></ion-icon>
                                      <span>${dto.views }</span>
                                      
                                      
                                  </div>
                              </div>
                          </div>
                      </div>
                      <div class="q-title">
                            <span class="question-icon" title="Question">Q:</span>
                            <h1>${dto.title }</h1>
                      </div>
                      
                      <div class="forum-post-content">
                            <div class="content">
                            	<p>
                            		${dto.content }
                            	</p>
                            </div>
                            
                            <c:if test="${not empty voteContent}">
                            	
                            	<div class="vote">
                            		<table class="table table-striped">
                            			<tr>
                            				<th>
                            					Q: ${voteTitle.title }
                            				</th>
                            			</tr>
                            			
										<c:forEach var="item5" items="${voteContent }" varStatus="status">
											<tr>
												<td>
													<input class="form-check-input" type="radio" name="voteSel" id="sel${status.count }" value="${item5.vs_code }">
		                            				<label class="form-check-label" for="sel${status.count }">
												    	${item5.content }
												  	</label>
												</td>
											</tr>
										</c:forEach>
										<tr>
											<td>
												<button class="btn btn-primary" onclick="voteP()">참여하기</button>
											</td>
										</tr>                            				
                            			
                          			 </table>
                            	
                            
                            		 
                            	</div>
                            
                            	<div id="barchart_div" style="border: 1px solid #ccc"></div>
                            </c:if>
                            
                            
                            
                            <div class="forum-post-btm">
                                <div class="taxonomy forum-post-tags">
                                </div>
                                <div class="taxonomy forum-post-cat">
                                </div>
                            </div>
                            <div class="action-button-container action-btns" style="margin-left: 1250px;">
                            	<button type="button" class="btn" onclick="report()">
                            		<img src="img/red.png" alt="" style="width: 30px;">
                            	</button>
                            </div>
                      </div>
                     <!--  
                      <div class="best-answer">
                            <div class="row">
                                <div class="col-lg-9">
                                    <div class="forum-post-top">
                                        <a class="author-avatar" href="#">
                                            <img src="img/profile2.png" alt="" style="width: 50px; height: 50px;">
                                        </a>
                                        <div class="forum-post-author">
                                            <a class="author-name" href="#"> 김지민 </a>
                                            <div class="forum-author-meta">
                                                <div class="author-badge">
                                                    <ion-icon name="calendar-clear-outline"></ion-icon>
                                                    <a href=""> 2024.01.19</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <p class="accepted-ans-mark">
                                        <ion-icon name="checkmark-circle-outline"></ion-icon> <span>베스트 답변</span>
                                    </p>
                                </div>
                            </div>
                            <div class="best-ans-content d-flex">
                                <span class="question-icon" title="The Best Answer">A:</span>
                                <p>
                                    우선 제일먼저 해야할일은 카레용돼지고기를 후추로 톡톡세번 그리고 자박하게 잠길정도로 우유를 부어줍니다.
우유와 후추가 돼지고기 특유의 잡내를 잡아준답니다.
15분정도 재워둡니다.<br>
                                    양파중간사이즈 2개, 감자큰거 1개,당근1/2개,새송이버섯2개(없으면 패스하셔도무관)
을 먹기 좋은 크기로 잘라서 준비합니다.<br>
                                    카레를 할 냄비를 준비하신후에 버터1스푼과 마늘1스푼을 넣고<br>
                                    양파썰어둔것을 모두 넣어서 볶아줍니다.
버터를 넣으면 고소한맛이 나서 좋더라구요^^<br><br>
                                </p>
                            </div>
                            
                            <div>
                            	<div class="row">
                            		
                            		<div class="col-lg-12" >
                            			
                            			
                            			<div>
                            				<div class="bg-light p-2" style="margin-left: 70px;">
                    <div class="d-flex flex-row align-items-start"><a class="author-avatar" href="#">
                              						<img src="img/profile.png" alt="" style="width: 50px; height: 50px;">
                          						</a><textarea class="form-control ml-1 shadow-none textarea" style="width: 800px; height: 150px;  margin-left: 20px;"></textarea></div>
                    <div class="mt-2 text-right" style="margin-left: 600px;"><button class="btn btn-primary btn-sm shadow-none" type="button">Post comment</button><button class="btn btn-outline-primary btn-sm ml-1 shadow-none" type="button">Cancel</button></div>
                </div>
                            				<div style="margin-left: 70px;">
                            					<a class="author-avatar" href="#">
                              						<img src="img/profile.png" alt="" style="width: 50px; height: 50px;">
                          						</a>
                          						
                          						<a href="">정한울</a>
                          						<div>
                          							<span>정말 좋은 글입니당</span>
                          						</div>
                            				</div>
                            			</div>
                            			
                            		</div>
                            		
                            	</div>
                            </div>
                        </div>
                         -->                         
                         <c:forEach var="item" items="${commentList }" varStatus="status">
                         	<div class="best-answer gh${status.count}">
                         		<div class="row">
                         			<div class="col-lg-9">
                         				<div class="forum-post-top">
                         					<a class="author-avatar" href="#">
                                            	<img src="img/profile2.png" alt="" style="width: 50px; height: 50px;">
                                        	</a>
                         				</div>
                         				<div class="forum-post-author">
                         					 <a class="author-name" href="#"> ${item.nickname } </a>
                         					 <div class="forum-author-meta">
                                                <div class="author-badge">
                                                    <ion-icon name="calendar-clear-outline"></ion-icon>
                                                    <a href=""> ${item.kdate }</a>
                                                </div>
                                            </div>
                         				</div>
                         			</div>
                         			<div class="col-lg-3">
	                                    <p class="accepted-ans-mark">
	                                        <ion-icon name="checkmark-circle-outline"></ion-icon> <span>베스트 답변</span>
	                                    </p>
	                                    <div class="heart-btn" style="margin-left: 200px;">
									      <div class="contentA" onclick="test('${item.cqc_code}')">
									        <span class="heart heartClass${item.cqc_code}"></span>
									        <span class="text textClass${item.cqc_code}">Like ${item.likes }</span>
									        <span class="numb"></span>
									      </div>
										</div>
                                	</div>
                         		</div>
                         		
                         		<div class="best-ans-content d-flex">
                                	<span class="question-icon" title="The Best Answer">A:</span>
                                     <p>
                                     	${item.comments }
                                     </p>
                            	</div>
                            	
                            	<div>
                            	<div class="row">
                            		
                            		<div class="col-lg-12" >
                            			
                            			
                            			<div>
                            				<div class="bg-light p-2" style="margin-left: 70px;">
                    <div class="d-flex flex-row align-items-start"><a class="author-avatar" href="#">
                              						<img src="img/profile.png" alt="" style="width: 50px; height: 50px;">
                          						</a>
	                          						<form action="creplyinsert.action" method="post" name="myForm">
	                          							<textarea class="form-control ml-1 shadow-none textarea" style="width: 800px; height: 150px;  margin-left: 20px;" id="area${item.cqc_code}"></textarea>
	                          							<div class="mt-2 text-right" style="margin-left: 600px;"><button class="btn btn-primary btn-sm shadow-none" type="button" onclick="insertReply('${item.cqc_code}')">Post comment</button><button class="btn btn-outline-primary btn-sm ml-1 shadow-none" type="reset">Cancel</button></div>
	                          						</form>
                          						</div>
                							</div>
                            				
                            				
                            					<c:forEach var="item3" items="${replyList }">
													<div style="margin-left: 70px;">                          									
	                        							<c:if test="${item.cqc_code eq item3.cqc_code }">
	                        								<a class="author-avatar" href="#">
	                              								<img src="img/profile.png" alt="" style="width: 50px; height: 50px;">
	                          								</a>
	                          								
	                          								<div style="display: flex;">
	                          									<a href="">${item3.nickname }</a>
	                          									
	                          									<span style="margin-left: 900px;">${item3.kdate }</span>
	                          								</div>
	                          								
	                        								<div>
	                        									${item3.reply }
	                        								</div>
	                        								
	                        							</c:if>
                          							</div>
                        						</c:forEach>
                            					
                            				
                            				
                            			</div>
                            			
                            		</div>
                            		
                            	</div>
                            </div>	
                            	
                         	</div>
                         	
                         </c:forEach>
                  </div>
                  
                  
                  
                  <div class="col-lg-3">
                  	<div class="forum_sidebar">
                  		<aside class="r_widget qustion_wd">
                       		<button class="btn" type="button" onclick="landers()"><img src="img/question-1.png" alt=""> 대답하기<ion-icon name="chevron-forward-outline" class="arrow"></ion-icon></i></button>
                		</aside>
                  	</div>
                  </div>
			</div>
		</div>
		
		<!-- 대답 모달 시작 -->
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalLabel">대답하기</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        <form>
				          <div class="mb-3">
				            <label for="recipient-name" class="col-form-label">질문:</label>
				            <input type="text" class="form-control" id="recipient-name" value="${dto.title }" disabled="disabled">
				          </div>
				          <div class="mb-3">
				            <label for="message-text" class="col-form-label">대답:</label>
				            <textarea class="form-control" id="message-text"></textarea>
				          </div>
				        </form>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				        <button type="button" class="btn btn-primary" onclick="insertComment()">Send message</button>
				      </div>
				    </div>
				  </div>
			</div>
		<!-- 모달 종료 -->
		
		<!-- 신고 모달 시작 -->
		<div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalLabel">신고하기</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        <form action="reportInsert.action" method="get" id="reportForm">
				          <div class="mb-3">
				            <label for="recipient-name" class="col-form-label">신고자</label>
				            <input type="text" class="form-control" id="recipient-name" value="${member.nickname }" disabled="disabled">
				          </div>
				          <div class="mb-3">
				          	 <label for="" class="col-form-label">신고 사유</label>
					          	<!-- 	 
					          	<div class="form-check">
								  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
								  <label class="form-check-label" for="flexRadioDefault2">
								    욕설
								  </label>
								</div>
								 -->
								 
								 <c:forEach var="reason" items="${reasonList }" varStatus="status">
								 	<c:choose>
									    <c:when test="${status.count eq 1}">
									        <div class="form-check">
										 		<input class="form-check-input" type="radio" name="reason" id="reason${status.count}"value="${reason.rr_code}" checked="checked">
										 		 <label class="form-check-label" for="reason${status.count}">
										    		${reason.reason }
										  		</label>
								 			</div>
									    </c:when>
									    <c:otherwise>
									       <div class="form-check">
										 		<input class="form-check-input" type="radio" name="reason" id="reason${status.count}"value="${reason.rr_code}">
										 		 <label class="form-check-label" for="reason${status.count}">
										    		${reason.reason }
										  		</label>
								 			</div>
									    </c:otherwise>
										</c:choose>
										
								 	</c:forEach>
								 
				          </div>
				          <div class="mb-3">
				            <label for="message-text" class="col-form-label">내용:</label>
				            <textarea class="form-control" id="message-text" name="content"></textarea>
				          </div>
				          <div class="hidden">
								<input type="hidden" name="mem_code" value="${member.mem_code }" />
								<input type="hidden" name="code"  value="${param.code }"/>
						 </div>
				        </form>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				        <button type="button" class="btn btn-primary" onclick="insertReport()">Send message</button>
				      </div>
				    </div>
				  </div>
			</div>
		<!-- 신고 모달 종료 -->

</body>
</html>