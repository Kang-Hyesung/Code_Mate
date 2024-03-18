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

<!-- JQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- ionicons -->
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

<!-- Datepicker -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js"></script>

<!-- tag -->
<link href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>
<style type="text/css">
	.totaldiv
	{
		margin-left: 30px;
	}
	textarea
    {
	    width: 100%;
	    border: none;
	    resize: none;
	    background-color:transparent;
	    /* margin: 20px 20px 0 20px; */
    }
    textarea:focus
    {
    	outline: none;
    }
    .hang
    {
    	font-size: 40px;
    	font-weight: bold;
    	margin-left: -30px;
    	padding-bottom: 20px;
    	padding-top: 20px;
    }
    .title
    {
    	width: 100%;
    	height: auto;
    	border-bottom: 1px solid #f1f3f5;
    	margin-top: 10px;
    }
    .titletextarea
    {
    	height: auto;
    	font-size: 30px;
    	font-weight: bold;
    }
    .projectnametextarea
    {
    	height: auto;
    	font-size: 30px;
    	font-weight: bold;
    }
    .subcontent
    {
    	width: 100%;
    	height: auto;
    	border-bottom: 1px solid #f1f3f5;
    }
    .subcontextarea
    {
    	height: auto;
    	font-size: 20px;
    	margin: 20px 0 20px;
    	/* font-weight: bold; */
    }
    .content
    {
    	width: 100%;
    	height: auto;
    	border-bottom: 1px solid #f1f3f5;
    }
    .contextarea
    {
    	height: auto;
    	font-size: 20px;
    	margin: 20px 0 20px;
    	/* font-weight: bold; */
    }
    ul
    {
    	display: flex;
    	margin-top: 5px;
    	margin-left: -10px;
    }
    .menu
    {
    	font-size: 20px;
    	font-weight: bold;
    	margin-right: 20px;
    	margin-bottom: 10px;
    	
    }
    .date
    {
    	border-bottom: 1px solid #f1f3f5;
    	padding : 20px 0 20px;
    }
    .tag
    {
    	border-bottom: 1px solid #f1f3f5;
    	padding : 20px 0 20px;
    }
    .role
    {
    	border-bottom: 1px solid #f1f3f5;
    	padding : 20px 0 20px;
    }
    .gender
    {
    	display: flex;
    	border-bottom: 1px solid #f1f3f5;
    	padding : 20px 0 20px;
    }
    label {
	  font-size: 18px;
	  line-height: 1rem;
      padding: 3px 0.4em;
	}
	
	[type="radio"], span {
	  vertical-align: middle;
	}
	
	[type="radio"] {
	  appearance: none;
	  border: max(2px, 0.1em) solid gray;
	  border-radius: 50%;
	  width: 1.25em;
	  height: 1.25em;
	  transition: border 0.1s ease-in-out;
	}
	
	[type="radio"]:checked {
	  border: 0.4em solid #ed6653;
	}
	
	[type="radio"]:focus-visible {
	  outline-offset: max(2px, 0.1em);
	  outline: max(2px, 0.1em) dotted #ed6653;
	}
	
	[type="radio"]:hover {
	  box-shadow: 0 0 0 max(4px, 0.2em) lightgray;
	  cursor: pointer;
	}
	
	[type="radio"]:hover + span {
	  cursor: pointer;
	}
	
	[type="radio"]:disabled {
	  background-color: lightgray;
	  box-shadow: none;
	  opacity: 0.7;
	  cursor: not-allowed;
	}
    .age
    {
    	display: flex;
    	border-bottom: 1px solid #f1f3f5;
    	padding : 20px 0 20px;
    }
    .ssmenu
    {
    	border-bottom: 1px solid #f1f3f5;
    	padding : 20px 0 20px;
    }
    .grademenu
    {
    	display: flex;
    	
    }
    select
    {
    	margin-left: 10px;
    	border-radius: 5px;
    }
    .inpnum
    {
    	width: auto;
    }
    .btnmenu
    {
    	margin: auto;
    	padding-top: 20px;
    	display: flex;
    	gap: 40px;
    	justify-content: center;
    }
    .btn1
    {
    	width: 150px;
    	border-radius: 50px;
    	background-color: #1fc1c0;
    	color: white;
    	font-weight: bold;
    	font-size: 20px;
    }
    .btn1:hover
    {
    	background-color: #ced4da;
    	border: 0;
    }
    .aa
    {
    	color: gray;
    	text-decoration-line: none;
		font-size: 20px;
		cursor: pointer;
		
    }
    .adiv
    {
    	margin: auto;
    }
    .selecthang
    {
    	display: none;
    }
    .progress
    {
    	background: #f1f3f5;
    	font-size: 20px;
    }
    .tem
    {
    	color: gray;
    }
    .radioimgbox
    {
    	width: 20px;
    	height: 20px;
    	margin: 0 5px 0 5px;
    }
    .radioimg
    {
    	width: 100%;
    	height: 100%;
    }
    label
    {
    	display: flex;
    }
    span
    {
    	margin-top: 3px;
    }
    .memo1
    {
	    width: 200px;
	    height: 100px;
	    background-color: #f1f3f5;
	    margin-top: 600%;
	    font-size: 15px;
	    font-weight: bold;
    }
    .memo2
    {
	    width: 200px;
	    height: 100px;
	    background-color: #f1f3f5;
	    margin-top: 260px;
	    font-size: 15px;
	    font-weight: bold;
    }
    .light_gray
    {
    	height: 10px;
    	width: 200px;
    	background-color: #f1f3f5;
    	border-radius: 50px;
    }
    .blue
    {
    	height: 100%;
    	width: 36.5%;
    	border-radius: 50px;
    	background-color: #ed6653;
    }
    .tembox
    {
    	height: 30px;
    	width: 200px;
    }
    .tem
    {
    	color: #ed6653;
    	font-weight: bold;
    	width: 36.5%;
    	height: 100%;
    	margin-left: 36.5%;
    }
    
</style>
<script type="text/javascript">

	function resize1(obj) {
	    obj.style.height = '30px';
	    obj.style.height = (30 + obj.scrollHeight) + 'px';
	}
	function resize2(obj) {
	    obj.style.height = '70px';
	    obj.style.height = (70 + obj.scrollHeight) + 'px';
	}
	function resize3(obj) {
	    obj.style.height = '130px';
	    obj.style.height = (130 + obj.scrollHeight) + 'px';
	}

	
	$(document).ready(function()
    {
		
		
    	$(".aa").click(function()
    	{
    		$(this).text(function(i, text){
                return text === "더보기" ? "닫기" : "더보기";
            });
    		
            if ($(".selecthang").is(":visible"))
            {
            	
            	$(".selecthang").hide();
            	
            	$("input[name=skillscore1]").attr("disabled", true);
            	$("input[name=skillscore2]").attr("disabled", true);
            	$("input[name=gender]").attr("disabled", true);
            	$("#age").attr("disabled", true);
            	$("#inpnum").attr("disabled", true);
            	
            	
            } else
            {
            	$(".selecthang").show();
            	
            	$("input[name=skillscore1]").attr("disabled", false);
            	$("input[name=skillscore2]").attr("disabled", false);
            	$("input[name=gender]").attr("disabled", false);
            	$("#age").attr("disabled", false);
            	$("#inpnum").attr("disabled", false);
            	
            }
        });
    	
    	
    	$("#inpnum").on("input", function() {
    		/* alert($('#inpnum').val()) */
    		var inputnum = $("#inpnum").val();
    		$(".blue").css("width",inputnum+'%');
    		$("#tem").html(inputnum + "℃");
    		$("#tem").css("margin-left",inputnum+"%");
    		$("#tem").text(inputnum +"℃");
    	
    		
        });
    	
    });
	
	$(document).ready(function() {
	    $('.input-daterange').datepicker({
	        format: 'yyyy-mm-dd',
	        todayHighlight: true,
	        startDate: '2d',
	        minDate: $("#sdate").val(),
	        language: 'ko' // 한국어 설정 추가
       	
	    });
	    
	    
		
	});
	
	
	
	
	function submit123()
	{
		
		 
		$("#projectinsert").submit();
		
	}
	

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
	
	<form action="projectapply.action" method="get" id="projectinsert">
	<div class="flex">
		<div class="col-2 menuArea">
		</div><!-- end .col-6 .menuArea -->
		
		<!-- 본문 영역 -->
		<div class="row main-text">
			<div class="col-9 totaldiv">
			<!-- <form action="projectapply.action" method="get" id="projectinsert"> -->
				<div class="hang">
					·필수 항목
				</div>
				<div class="title">
					<textarea rows="1" cols="" placeholder="제목을 입력해주세요" class="titletextarea" id="titletextarea" name="titletextarea" onkeydown="resize1(this)"></textarea>
				</div>
				<div class="title">
					<textarea rows="1" cols="" placeholder="프로젝트 이름을 입력해주세요" class="projectnametextarea" id="projectnametextarea" name="projectnametextarea" onkeydown="resize1(this)"></textarea>
				</div>
				<div class="subcontent">
					<textarea rows="3" cols="" placeholder="요약 내용을 입력해주세요" class="subcontextarea" id="subcontextarea" name="subcontextarea" onkeydown="resize2(this)"></textarea>
				</div>
				<div class="form-group">
					<div class="date">
						<div class="menu">예상 기간</div>
						<div class="input-group input-daterange">
	          				<input type="text" class="form-control sdate" id="sdate" name="sdate" placeholder="시작일" readonly> 
	          				<input type="text" class="form-control edate" id="edate" name="edate" placeholder="종료일" readonly>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="tag">
						<div class="menu">태그</div>
						<div>
							<input id="basic" name='basic' placeholder="태그를 입력해주세요">
							
							<script>
							    const input = document.querySelector('input[name=basic]');
							    let tagify = new Tagify(input, {
							        delimiters: ", ", // 태그 구분자 설정
							        dropdown: {
							            enabled: 0, // 태그 입력시 드롭다운 사용 여부 설정
							        }
							    });
							    
							    // 리스트 자료 구조
							    var arraylist;
							    
							    
							    // 태그가 추가되면 이벤트 발생
							    tagify.on('add', function() {
							      console.log(tagify.value); // 입력된 태그 정보 객체
							      
									
									
							      
							      
							    })
							    
							      
							    
							    
							    
							    
							    
							</script>
							
						</div>
					</div>
				</div>
				<div class="role">
					<ul>
						<li>백엔드</li>
						<select id="back" name="back">
							<option value="">선택</option>
							<option value="1">1명</option>
							<option value="2">2명</option>
							<option value="3">3명</option>
							<option value="4">4명</option>
							<option value="5">5명</option>
							<option value="6">6명</option>
						</select>
					</ul>
					<ul>
						<li>프론트</li>
						<select id="front" name="front">
							<option value="">선택</option>
							<option value="1">1명</option>
							<option value="2">2명</option>
							<option value="3">3명</option>
							<option value="4">4명</option>
							<option value="5">5명</option>
							<option value="6">6명</option>
						</select>
					</ul>
				</div>
				<div class="content">
					<textarea rows="5" cols="" placeholder="내용을 입력해주세요" class="contextarea" id="contextarea" name="contextarea" onkeydown="resize3(this)"></textarea>
				</div>
				
				<div class="adiv"><a class="aa">더보기</a></div>
				<!-- 버튼 클릭시 선택 항목 보이게 -->
				<!-- </form> -->
				
				<!-- <form action="projectapply.action" method="get" id="projectinsert2"> -->
				<div class="selecthang">
					<div class="hang">
						·선택 항목
					</div>
					<!-- <div class="memo">자신의 등급보다 한단계 낮은 등급까지 선택 가능합니다.</div> -->
					<div class="ssmenu">
						<div class="menu">백엔드 필터링(최소 조건 입력)(나보다 한단계 낮은 단계까지)</div>
						<div class="grademenu">
							<label>
							  <input type="radio" name="skillscore1"  value="1" disabled="disabled"/>
							  <div class="radioimgbox">
							  	<img src="img/grade_icon/1_seed.png" alt="html" class="radioimg" />
							  </div>
							  <span>씨앗</span>
							</label>
							<label>
							  <input type="radio" name="skillscore1" value="2" disabled="disabled"/>
							  <div class="radioimgbox">
							  	<img src="img/grade_icon/2_plant.png" alt="html" class="radioimg" />
							  </div>
							  <span>새싹</span>
							</label>
							<label>
							  <input type="radio" name="skillscore1" value="3" disabled="disabled"/>
							  <div class="radioimgbox">
							  	<img src="img/grade_icon/3_leaf.png" alt="html" class="radioimg" />
							  </div>
							  <span>잎새</span>
							</label>
							<label>
							  <input type="radio" name="skillscore1" value="4" disabled="disabled"/>
							  <div class="radioimgbox">
							  	<img src="img/grade_icon/4_branch.png" alt="html" class="radioimg" />
							  </div>
							  <span>가지</span>
							</label>
							<label>
							  <input type="radio" name="skillscore1" value="5" disabled="disabled"/>
							  <div class="radioimgbox">
							  	<img src="img/grade_icon/5_pear.png" alt="html" class="radioimg" />
							  </div>
							  <span>열매</span>
							</label>
							<label>
							  <input type="radio" name="skillscore1" value="6" disabled="disabled"/>
							  <div class="radioimgbox">
							  	<img src="img/grade_icon/6_tree.png" alt="html" class="radioimg" />
							  </div>
							  <span>나무</span>
							</label>
							<label>
							  <input type="radio" name="skillscore1" value="7" disabled="disabled"/>
							  <div class="radioimgbox">
							  	<img src="img/grade_icon/7_forest.png" alt="html" class="radioimg" />
							  </div>
							  <span>숲</span>
							</label>
						</div>
					</div>
					<div class="ssmenu">
						<div class="menu">프론트 필터링(최소 조건 입력)(나보다 한단계 낮은 단계까지)</div>
						<div class="grademenu">
							<label>
							  <input type="radio" name="skillscore2"  value="1" disabled="disabled"/>
							  <div class="radioimgbox">
							  	<img src="img/grade_icon/1_seed.png" alt="html" class="radioimg" />
							  </div>
							  <span>씨앗</span>
							</label>
							<label>
							  <input type="radio" name="skillscore2" value="2" disabled="disabled"/>
							  <div class="radioimgbox">
							  	<img src="img/grade_icon/2_plant.png" alt="html" class="radioimg" />
							  </div>
							  <span>새싹</span>
							</label>
							<label>
							  <input type="radio" name="skillscore2" value="3" disabled="disabled"/>
							  <div class="radioimgbox">
							  	<img src="img/grade_icon/3_leaf.png" alt="html" class="radioimg" />
							  </div>
							  <span>잎새</span>
							</label>
							<label>
							  <input type="radio" name="skillscore2" value="4" disabled="disabled"/>
							  <div class="radioimgbox">
							  	<img src="img/grade_icon/4_branch.png" alt="html" class="radioimg" />
							  </div>
							  <span>가지</span>
							</label>
							<label>
							  <input type="radio" name="skillscore2" value="5" disabled="disabled"/>
							  <div class="radioimgbox">
							  	<img src="img/grade_icon/5_pear.png" alt="html" class="radioimg" />
							  </div>
							  <span>열매</span>
							</label>
							<label>
							  <input type="radio" name="skillscore2" value="6" disabled="disabled"/>
							  <div class="radioimgbox">
							  	<img src="img/grade_icon/6_tree.png" alt="html" class="radioimg" />
							  </div>
							  <span>나무</span>
							</label>
							<label>
							  <input type="radio" name="skillscore2" value="7" disabled="disabled"/>
							  <div class="radioimgbox">
							  	<img src="img/grade_icon/7_forest.png" alt="html" class="radioimg" />
							  </div>
							  <span>숲</span>
							</label>
						</div>
					</div>
					<div class="gender">
						<div class="menu" id="gender">성별</div>
						<label>
						  <input type="radio" name="gender" value="male" disabled="disabled"/>
						  <span>남성</span>
						</label>
						<label>
						  <input type="radio" name="gender" value="female" disabled="disabled"/>
						  <span>여성</span>
						</label>
					</div>
					<div class="age">
						<div class="menu">연령대</div>
						<select name="age" id="age" disabled="disabled">
							<option value="">선택</option>
							<option value="10">10대</option>
							<option value="20">20대</option>
							<option value="30">30대</option>
							<option value="40">40대</option>
							<option value="50">50대</option>
							<option value="60">60대</option>
						</select>
					</div>
					<div class="manner">
						<div class="menu">매너점수 필터링(최소 조건 입력)(나보다 낮은 점수만)</div>
						<div class="tembox">
							<div class="tem" id="tem"></div>
						</div>
						<div class="light_gray">
						  <div class="blue" style=""></div>
						</div><br>
						<input type="number" name="inpnum" value="36.5" step="0.1"  maxlength="100" class="inpnum" id="inpnum" disabled="disabled">
					</div>
				</div>
				<!-- </form> -->
				<!-- 버튼 -->
				<div class="btnmenu">
					<button type="button" class="btn btn1" onclick="submit123()">개설하기</button>
					<button type="button" "location.href='projectapplycancel.action'" class="btn btn1">취    소</button>
				</div>
				
			</div>
			<div class="col-2">
				<div class="selecthang">
					<div class="memo1"><br>자신의 등급보다 한단계 낮은 등급까지 선택 가능합니다.</div>
					<div class="memo2"><br>자신의 낮은 점수만 선택 가능합니다.</div>
				</div>
			</div>
			
			
		</div>
	</div>
</form>


</body>
</html>