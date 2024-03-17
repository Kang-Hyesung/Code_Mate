<%@page import="java.util.ArrayList"%>
<%@page import="com.test.mybatis.dto.Milestone_MemberEvaluDTO"%>
<%@page import="com.test.mybatis.MyPageMethod"%>
<%@page import="org.springframework.ui.ModelMap"%>
<%@page import="com.test.mybatis.dto.MemberDTO"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
	/*============[팀원 평가 정보 DTO에 이미지 url 변수값 Set 하기]===========*/

	ArrayList<Milestone_MemberEvaluDTO> memberEvaluList = (ArrayList<Milestone_MemberEvaluDTO>)request.getAttribute("memberEvaluList");
	
	int memEv_backend_score, memEv_frontend_score;
	String memEv_backGradeIcon, memEv_frontGradeIcon;
	
	for (int i = 0; i< memberEvaluList.size(); i++)
	{
		// 백엔드 점수를 변수에 저장.
		memEv_backend_score = memberEvaluList.get(i).getBackend_score();
		memEv_frontend_score = memberEvaluList.get(i).getFrontend_score();
		
		// 현재 경로 cp와, 점수 int 값으로 스킬 등급 아이콘 이미지 url 문자열 반환받기
		// (*index = 0 : 스킬 등급 아이콘 이미지 url 이므로, 메소드 호출 후 『[0]』을 붙임.)
		memEv_backGradeIcon = mpm.skillGradeIcon(cp, memEv_backend_score)[0];
		memEv_frontGradeIcon = mpm.skillGradeIcon(cp, memEv_frontend_score)[0];
		
		// 위에서 구한 아이콘 url 문자열을, i번째 DTO 객체에 set 해 준다.
		memberEvaluList.get(i).setBackGradeIcon(memEv_backGradeIcon);
		memberEvaluList.get(i).setFrontGradeIcon(memEv_frontGradeIcon);
		
		// 제대로 등급 아이콘 url이 set 되었는지 확인.
		/*
		System.out.println("=====================================================================");
		System.out.printf("%d번째 Milestone_MemberEvaluDTO의 백엔드 아이콘 이미지 url\n%s\n"
						  , i, memberEvaluList.get(i).getBackGradeIcon());
		System.out.println("=====================================================================");
		System.out.printf("%d번째 Milestone_MemberEvaluDTO의 프론트엔드 아이콘 이미지 url\n%s\n"
						  , i, memberEvaluList.get(i).getFrontGradeIcon());
		System.out.println("=====================================================================");
		*/
		
	}
	
	
	pageContext.setAttribute("memberEvaluList", memberEvaluList);
	
	
	//=====================================================
	// 체크리스트 비활성화 여부를 판별할 플래그 변수 선언.
	//=====================================================

	// 실패
	boolean isDisabled = false;
	
	
	String disabledStr = "";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${planCheckList[0].prj_name }의 마일스톤 페이지</title>

<!-- BootStrap -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<!-- Banner Style -->
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/banner_side.css" />

<!-- JQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- ionicons -->
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

<!-- Milestone Style -->
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/milestone_style.css" />

<!-- Google Fonts Icons -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />



<script type="text/javascript">

 	const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
	const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
	
	$( function ()
	{
    	$( '[data-bs-toggle="popover"]' ).popover();
    	
    }); 
 	
 	
 	$(function()
	{

 		total_percent = "${total_percent}";
 		
 		//alert("[페이지 로드] total_percent 확인 : " + total_percent);
 		
		if (total_percent == 400)
		{
			// 팀원 평가 div 영역이 보여지도록 display 속성 변경
			$(".member-evaluation-Parent-Area").css("display", "block");
			// 마일스톤 전체 페이지 영역 높이를 변경 
			$(".col-10.milestone-main-Parent-Area").css("height", "1900px");
			
			
			$(".milestone-success-step-blindBox").css("display", "block");
			$(".milestone-success-blindBox").css("display", "block");
			
			/* 체크리스트 전체 Disabled 설정 */
			$("input.plan-checkbox").each(function() 
			{
			    $(this).prop('disabled', true);
			});
			
			/* edit 버튼 전체 Disabled 설정 */
			$("button.edit-action-button").each(function()
			{
			    $(this).prop('disabled', true);
					
			});

			/* delete 버튼 전체 Disabled 설정 */
			$("button.delete-action-button").each(function()
			{
			    $(this).prop('disabled', true);
					
			});
			
			
		}
		else
		{
			$(".member-evaluation-Parent-Area").fadeOut(1200);
		}
		
 		
 		/*[체크리스트 항목 클릭시, 모달창이 뜨도록 처리]================*/

 		$(".milestone-checkbox-content").click(function()
		{
 			/*
 			[체크리스트 내용 span]  		  - 아이디 : [#check${planItem.checklist_code}]
			                                  - 클래스 : [.content${planItem.checklist_code}]
			
			[체크리스트 작성자 닉네임 hidden] - 클래스 : [.nickname${planItem.checklist_code}]
			[체크리스트 작성자 직위 hidden]   - 클래스 : [.member-role${planItem.checklist_code}]
			
			
			[체크리스트 모달창 닉네임 span] 	- 클래스 : [.checkbox-modal-nickname]
			[체크리스트 모달창 직위 span]      	- 클래스 : [.checkbox-modal-member-role]
			[체크리스트 모달창 내용 span]      	- 클래스 : [.checkbox-modal-content]
			[체크리스트 모달창 스텝 span]      	- 클래스 : [.checkbox-modal-step]
 			*/
 			
	 		//[클릭된 내용에 해당하는 체크리스트의 CK 가져오기]*****************
	 		//alert($(this).attr("id").replaceAll("check", ""));
	 		//--==>> CK0016
	 		//******************************************************************
	 		
	 		var ckCodeTxt = $(this).attr("id").replaceAll("check", "");
	 		
	 		//[클릭된 체크리스트 항목을 작성한 멤버의 닉네임, 직위, 체크리스트 대분류 스텝명 가져오기]****
	 		var nickName = $("." + "nickname" + ckCodeTxt).val();
	 		var member_role = $("." + "member-role" + ckCodeTxt).val();
	 		var content = $("." + "content" + ckCodeTxt).text();
	 		var step = $("." + "step" + ckCodeTxt).val();
	 		//*******************************************************************************************
	 		
	 		$(".checkbox-modal-nickname").html(nickName);
	 		$(".checkbox-modal-member-role").html(member_role);
	 		$(".checkbox-modal-content").html(content);
	 		$(".checkbox-modal-step").html(step);
	 		
	 		/*[받아온 스텝명에 따라, 배경색 색상 분기 처리]====================*/
	 		
	 		if (step == "기획")
	 		{
	 			$(".checklist-more-modal-header").css("background", "rgb(251 143 143)");
	 		}
	 		else if (step == "설계")
	 		{
	 			$(".checklist-more-modal-header").css("background", "rgb(83 217 217)");
	 		}
	 		else if (step == "구현")
	 		{
	 			$(".checklist-more-modal-header").css("background", "rgb(233 218 7)");
	 		}
	 		else if (step == "결산")
	 		{
	 			$(".checklist-more-modal-header").css("background", "rgb(162 227 38)");
	 		}
	 		
	 		
	 		$("#more-check-content").modal("show");
	 		
		});

	});
 	
 	
 	
 	
</script>

<!--========[마일스톤 페이지 스크립트 처리 시작]=========-->
<script type="text/javascript">


	$(document).ready(function()
	{
		
		//=======[체크박스 체크 여부 Ajax 처리로 갱신]==========
		$(".checkList-checkbox").click(function()
		{
			// 테스트
			//alert("체크 확인");
			
			//alert("체크 코드 : " + $(this).val());
			//--==>> 체크 코드 : CK0014
			
			
			var checklist_code = $(this).val();
			
			//*******************************************************
			// POST 방식으로 체크리스트 갱신 컨트롤러 동작 url 요청
			// → 대분류 단계명, 완료 퍼센트를 반환받는다.
			//*******************************************************
			$.ajax(
			{
				type: "POST"
				, url: "check.action"
				, data: "checklist_code=" + checklist_code
				, dataType: "json"
				, success: function(jsonObj)
				{
					//****************************
					//[대분류 단계명 확인]
					//****************************
					//alert(jsonObj.step);
					//--==>> 설계
					//****************************
					
					//****************************
					//[완료 퍼센트 확인]
					//****************************
					//alert(jsonObj.percent);
					//--==>> 84
					//****************************
					
					//[변수에 저장]***************
					var step = jsonObj.step;
					var percent = jsonObj.percent;
					total_percent = jsonObj.total_percent;
					//****************************
					
					//[마일스톤 대분류 전체 완료 퍼센트 총합값 테스트]=======
					//alert("전체 완료 퍼센트 총합값 : " + total_percent);
					//--==>> 전체 완료 퍼센트 총합값 : 232
					//=======================================================
					
					
					/*
					[기획 퍼센트 텍스트] - 아이디 : [#plan-percentage]
					[기획 프로그레스 바] - 아이디 : [#plan-progress-bar]
					
					[설계 퍼센트 텍스트] - 아이디 : [#design-percentage]
					[설계 프로그레스 바] - 아이디 : [#design-progress-bar]
					
					[구현 퍼센트 텍스트] - 아이디 : [#implement-percentage]
					[구현 프로그레스 바] - 아이디 : [#implement-progress-bar]
					
					[결산 프로그레스 바] - 아이디 : [#settlement-progress-bar]
					[결산 퍼센트 텍스트] - 아이디 : [#settlement-percentage]
					*/
					
					//[대분류 단계명이 무엇이냐에 따라, 업데이트하는 프로그레스바가 달라지도록 처리.]
					
					if (step == "기획")
					{
						// [완료 퍼센트 값 업데이트]
						$("#plan-percentage").html(percent + "%");
						
						// [프로그레스바 길이(width) 스타일 변경]
						$("#plan-progress-bar").css("width", percent + "%");
						
					}
					else if (step == '설계')
					{
						// [완료 퍼센트 값 업데이트]
						$("#design-percentage").html(percent + "%");
						
						// [프로그레스바 길이(width) 스타일 변경]
						$("#design-progress-bar").css("width", percent + "%");
						
					}
					else if (step == '구현')
					{
						// [완료 퍼센트 값 업데이트]
						$("#implement-percentage").html(percent + "%");
						
						// [프로그레스바 길이(width) 스타일 변경]
						$("#implement-progress-bar").css("width", percent + "%");
						
					}
					else if (step == '결산')
					{
						// [완료 퍼센트 값 업데이트]
						$("#settlement-percentage").html(percent + "%");
						
						// [프로그레스바 길이(width) 스타일 변경]
						$("#settlement-progress-bar").css("width", percent + "%");
						
					}
					
					
					   
				}// end success: function(){}
				
				, complete: function()
				{
					// [Ajax 처리가 끝난 이후에, 타이밍에 맞게 완료 퍼센트가 보여짐.]
					//alert("[체크리스트 체크] total_percent 확인 : " + total_percent);
				
					if (total_percent == 400)
					{
						
						/* 체크박스 전체 Disabled 설정 */
						$("input.plan-checkbox").each(function() {
						    $(this).prop('disabled', true);
						});
						 
						/* 수정 버튼 전체 Disabled 설정 */
						$("button.edit-action-button").each(function()
						{
						    $(this).prop('disabled', true);
								
						});
						
						/* 삭제 버튼 전체 Disabled 설정 */
						$("button.delete-action-button").each(function()
						{
						    $(this).prop('disabled', true);
								
						});
						
						
						// 팀원 평가 div 영역이 보여지도록 display 속성 변경
						//***************************************************
						$(".member-evaluation-Parent-Area").fadeIn(1000);
						
						// 마일스톤 페이지 영역 전체 영역의 길이를 변경.
						//***************************************************
						$(".col-10.milestone-main-Parent-Area").css("height", "1900px");

						//***************************************************
						// 마일스톤 체크리스트 영역이 어두워지도록 처리
						//***************************************************
						$(".milestone-success-step-blindBox").fadeIn(1000);
						$(".milestone-success-blindBox").fadeIn(1000);
						
					}
					else
					{
						
						$(".member-evaluation-Parent-Area").fadeOut(1000);
						
						$(".milestone-success-step-blindBox").fadeOut(1000);
						$(".milestone-success-blindBox").fadeOut(1000);
						
					}
					
					
				}// end complete:function(){}
				
			});/* end $.ajax() */
			
			
			
			
		});
		//=======================================================
			
		

		
		//=======[마일스톤 체크리스트 항목 추가 Ajax 이후 리다이렉트로 갱신]==========
		$(".new-content-submit").click(function()
		{
			// 테스트
			//alert("Submit 버튼 클릭 확인");
			
			//----------------------------------------------------------
			// [사용자가 새롭게 입력한 체크리스트 항목 내용 확인]
			//----------------------------------------------------------
			//alert("체크리스트 내용 : " + $("#design-new-list-content").val());
			//----------------------------------------------------------
			
			//----------------------------------------------------------
			// [사용자가 추가하려고 하는 마일스톤 단계 대분류명 확인]
			//----------------------------------------------------------
			//alert("단계명 : " + $(this).val());
			//----------------------------------------------------------
			
			
			//-----------------------------------------------------------------------------
			// [클릭된 submit 버튼이 포함된 마일스톤 대분류의 input 엘리먼트 id 가져오기]
			//-----------------------------------------------------------------------------
			// alert($(this).parent(".checkbox-all-btn-box").siblings(".add-checklist-content-box")
			//			 .children(".add-checklist-content").attr("id"));
			//-----------------------------------------------------------------------------
			
			var new_inputCheckBox_id = "#" + $(this).parent(".checkbox-all-btn-box")
											  .siblings(".add-checklist-content-box")
			 								  .children(".add-checklist-content").attr("id");
			//alert("체크박스 아이디 확인 : " + new_inputCheckBox_id);
			/*  
			(String v_cp_code, String v_ma_code, String v_step, String v_content)
			*/
			var v_cp_code = "CP0001";
			var v_ma_code = "${ma_code}";
			var v_step = $(this).val();
			var v_content = $(new_inputCheckBox_id).val();
			
			//alert("Ajax 처리 시작");
			
			$.ajax(
			{
				type: "POST"
				, url: "checklist_insert.action"
				, data: "v_cp_code="	+ v_cp_code
					  + "&v_ma_code="	+ v_ma_code
					  + "&v_step="		+ v_step
					  + "&v_content="	+ v_content
					  
				, success: function()
				{
					//alert("Ajax 처리 완료");
					$(location).attr("href", "Milestone.action");
				}
				, error: function()
				{
					//alert("Ajax 처리 중 에러 발생");
					//$(location).attr("href", "Milestone.action");
					
				}
			});
			
			//alert("Ajax 처리 종료");
			 
		});
		
		

		/*[항목 추가버튼 클릭시, 입력창이 보여지도록 처리.]*/
		$(".new-checklist-item-btn").click(function()
		{
			
			/*
			【[+] 항목 추가 버튼 로직 정리】▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩

			[+] 버튼 클릭 (클래스 : [.new-checklist-item-btn]

			부모 선택 .parent (클래스 : [.new-checklist-item-btn-box])

			부모 선택 .parent (클래스 : [.new-checklist-item-btn-Area])

			형제 선택 .siblings (클래스 : [.one-milestone-mainContent-box])

			자식 선택 .children (클래스 : [.milestone-checkList-box])

			자식 선택 .children (클래스 : [.add-checklist-box])

			**********************************************
			① 스타일 변경 → display : flex
			**********************************************
			
			▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩
			*/
			
			
			
			// 테스트
			//alert("항목 추가버튼 클릭 확인");
			
			// [버튼의 css 를 변경하기 위한 엘리먼트 변수 선언]========================
			
			// ↓ (버튼 엘리먼트)
			var add_list_btn_ele = $(this);
			// ↓ (버튼의 아이콘 엘리먼트)
			var add_list_plus_icon_ele = $(this).children(".milestone-add-btn-icon");
			//=========================================================================
			
			var add_ckList_box = $(this).parent(".new-checklist-item-btn-box").parent(".new-checklist-item-btn-Area")
				   						.siblings(".one-milestone-mainContent-box").children(".milestone-checkList-box")
				   						.children(".add-checklist-box");
			
			// [제대로 선택했는지 확인]
			//alert("선택한 요소 확인 : " + add_ckList_box.html());
			
			/**********************************************
			 ① 스타일 변경 → display : flex
			**********************************************/
			
			//alert("스타일 확인 : " + add_ckList_box.css("display"));
			//--==>> 스타일 확인 : none
			//--==>> 스타일 확인 : flex
			
			
			//****************************************************************************
			//[어떤 마일스톤 대분류의 추가 입력인지 판별하기 위해, 버튼의 value 값 확인.]
			//****************************************************************************
			//alert($(this).val());
			//--==>> plan-add
			//****************************************************************************
			
			//[변수에 저장]*************************
			var mileMajorTopicAdd = $(this).val();
			//**************************************
			
			var checklistBoxId  = checkMileMajorTopic(mileMajorTopicAdd);
			
			//[버튼의 value 에 해당하는 체크리스트 스크롤 박스 id 확인]
			//alert(checklistBoxId);
			//--==>> #all-plan-checklist
			
			// [추가 입력항목창이 숨겨진 상태라면, 보이도록 설정]
			if (add_ckList_box.css("display") == "none")
			{
				//alert("숨겨진 상태이므로 보이도록 설정한다.");
				add_ckList_box.css("display", "flex");
				
				//=====================================================================================
				// 항목을 새롭게 추가하는 경우, [+] 버튼이 취소 버튼으로 변경되기 위해
				// 클릭한 항목 추가버튼의 아이콘이 [Ⅹ] 모양으로 변경되고, 버튼 색이 변경되도록 변경.
				//=====================================================================================
				
				add_list_btn_ele.css({"background":"#eb6f6f", "border":"1px solid #d56363"});
				add_list_plus_icon_ele.css("transform", "rotate(50deg)");

				//=====================================================================================
				
					
				//◎ 『스크롤바 이동 처리 액션 - 입력창 위치로』▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩
				
				//[추가 항목 입력 창의 위치를 offset 변수에 저장]
				var offset = add_ckList_box.offset();
				
				//[마일스톤 대분류 체크리스트 스크롤 박스의 스크롤바를 입력창 위치로 이동시킨다.]
				$(checklistBoxId).animate({scrollTop: offset.top}, 1200);
				
				//▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩
				
				
			}
			else if (add_ckList_box.css("display") == "flex")
			{
				var input_add_ckList_ele = add_ckList_box.children(".add-checklist-content-box")
														 .children(".add-checklist-content");
				
				// ① 입력창 항목 전부 삭제
				input_add_ckList_ele.val("");
				
				// ② 스타일 변경 → display : none
				add_ckList_box.css("display", "none");

				//=====================================================================
				// ★★[위에서 제이쿼리로 변경했던 스타일을 삭제하여 스타일 초기화]
				//=====================================================================
				add_list_btn_ele.removeAttr("style");
				add_list_plus_icon_ele.removeAttr("style");
				//=====================================================================
				
				
				//◎ 『스크롤바 이동 처리 액션 - 맨 첫 위치로』▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩
				
				//[마일스톤 대분류 체크리스트 스크롤 박스의 스크롤바를 입력창 위치로 이동시킨다.]
				$(checklistBoxId).animate({scrollTop: 0}, 600);
				
				//▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩
				
			}
			

		});
		
		
		// [ 마일스톤 대분류에 해당하는 체크리스트의
		//   전체 스크롤 div 영역 id 를 반환받기 위한 함수 선언 ]=============================
		function checkMileMajorTopic(addBtnVal)
		{
			/*
			[기획 마일스톤 추가 버튼 『+』 value] - [plan-add]
			[설계 마일스톤 추가 버튼 『+』 value] - [design-add]
			[구현 마일스톤 추가 버튼 『+』 value] - [implement-add]
			[결산 마일스톤 추가 버튼 『+』 value] - [settlement-add]
			
			[기획 체크리스트 전체를 감싸는 div] - 아이디 : [#all-plan-checklist]
			[설계 체크리스트 전체를 감싸는 div] - 아이디 : [#all-design-checklist]
			[구현 체크리스트 전체를 감싸는 div] - 아이디 : [#all-implement-checklist]
			[결산 체크리스트 전체를 감싸는 div] - 아이디 : [#all-settlement-checklist]
			*/
			
			var checklistBoxId = "";
			
			if (addBtnVal == "plan-add")
			{
				checklistBoxId = "#all-plan-checklist";
			}
							
			else if (addBtnVal == "design-add")
			{
				checklistBoxId = "#all-design-checklist";
			}
				
			else if (addBtnVal == "implement-add")
			{
				checklistBoxId = "#all-implement-checklist";
			}
				
			else if (addBtnVal == "settlement-add")
			{
				checklistBoxId = "#all-settlement-checklist";
			}
			
			return checklistBoxId;
		}
	
		

		
		
		//[추가 입력을 취소했을 때 처리]=====================================
		$(".milestone-add-cancel-btn").click(function()
		{
			
			/*
			【cancel 버튼 로직 정리】▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩

			cancel 버튼 클릭 (클래스 : [.milestone-del-btn])

			부모 선택 .parent (클래스 : [.checkbox-all-btn-box])
			
			부모 선택 .parent (클래스 : [.add-checklist-box])
			
			********************************************************************
			① 입력창 항목 전부 삭제
			$(".add-checklist-box").children(".add-checklist-content-box")
								   .children(".add-checklist-content").val("");
			********************************************************************
			
			********************************************************************
			② 스타일 변경 → display : none
			********************************************************************
			
			▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩
			
			*/
			
			
			// 테스트
			// alert("cancel 버튼 클릭 확인.");
			
			
			// [새로운 항목 추가 입력창 전체를 감싸는 div 엘리먼트]
			var add_ckList_box = $(this).parent(".checkbox-all-btn-box").parent(".add-checklist-box");
			
			// [새로운 항목 추가 입력창 input 엘리먼트]
			var input_content_box = add_ckList_box.children(".add-checklist-content-box").children(".add-checklist-content");
			
			
			//alert(add_ckList_box);
			
			//********************************************************************
			/* 	① 입력창 항목 전부 삭제
				$(".add-checklist-box").children(".add-checklist-content-box")
									   .children(".add-checklist-content").val("");
			*/
			//********************************************************************
			
			// 입력값 모두 초기화
			input_content_box.val("");
			
		   /*********************************************************************
			② 스타일 변경 → display : none
			*********************************************************************/
			
			add_ckList_box.css("display", "none");
			
			
		});
		
		
		/*[마일스톤 항목 delete(삭제) 버튼 클릭시, 액션 처리]======================*/
		$(document).on("click", ".delete-action-button", function()
		{
			// 테스트
			//alert("삭제 버튼 클릭 확인");
			
			//[삭제 버튼에 저장된 CK_CODE value 값 확인]
			//alert($(this).val());
			//--==>> CK0001
			
			var checklist_code = $(this).val();
			
			$.ajax(
			{
				type: "POST"
				, url:  "checklist_delete_ok.action"
				, data: "checklist_code=" + checklist_code
				, success: function()
				{
					$(location).attr("href", "Milestone.action");
					//alert("삭제 완료했습니다.");
				}
			});
			
		});
		
		openEditControll = 0;
		
		
		/*[마일스톤 항목 edit(수정) 버튼 클릭시, 액션 처리]========================*/
		$(document).on("click", ".edit-action-button", function() 
		{
			
			//alert("플래그 변수 값 openEditControll : " + openEditControll);
			
			// 테스트
			//alert("수정 버튼 클릭 확인.");
			
			/*
			▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩			
			1. 수정 버튼을 클릭했을 경우, <span> 이 아닌 <input type="text"> 로 html 변경
			2. 입력창 안에, 원본 데이터가 들어가 있는 상태 (input 엘리먼트의 value 값으로 원본 데이터가 삽입되어야 함)
			3. 버튼이 [submit] 과 [cancel] 로 변경되어야 함.
			4. cancel 버튼은 <button type="reset"> 으로 설정하며, 이 버튼을 클릭했을 때
			   다시 <span> 태그 안의 데이터 창으로 변경되어야 한다.
			5. [submit] 버튼을 클릭할 경우 『edit_checklist.action』 요청.
			   → 이를 Ajax 로 요청한다.
		    6. 이 요청을 받는 컨트롤러에서는 다시 Milestone.action url 을 요청하도록 처리하여
		       리다이렉트를 통해 갱신 내용이 적용된 상태로 페이지를 조회할 수 있도록 한다.
			▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩			
			*/
			
			/*
			
			【edit 버튼시 처리할 내용 정리】▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩
			
			[<span> 을 <input> 으로 변경]
			
			수정 버튼 클릭 $(this) - 클래스 [.edit-check-btn] 
			
			부모 선택 .parent() - 클래스 [.checkbox-all-btn-box]
			
			부모 선택 .parent() - 클래스 [.one-milestone-checkbox]
			
			이것의 html 을, 새로운 입력창으로 변경시켜보도록 한다.
			▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩
			*/
			
			if (openEditControll == 0)
			{
			
				openEditControll = 1;
				
				// [edit 버튼을 클릭한 div 객체의 클래스를 가져온다. (클래스를 통한 스타일 적용을 위함.)]=======================================
				var selectElement = $(this).parent(".checkbox-all-btn-box").parent(".one-milestone-checkbox");
				   
				var elementClass = selectElement.attr("class");
				
				//alert("edit 버튼 클릭한 객체의 클래스 : " + elementClass);
				//--==>> edit 버튼 클릭한 객체의 클래스 : one-milestone-checkbox plan-check plan design
				
				//==============================================================================================================================
			
				
				// [edit 버튼을 클릭했을 때, 이 버튼을 포함하는 div의 상위 부모 클래스 id(CK_CODE)를 반환받는다.]================================
				var parentElement = $(this).parent(".checkbox-all-btn-box").parent(".one-milestone-checkbox").parent(".outline-checkbox-Area");
				
				parentCkCodeId = parentElement.attr("id");
				//alert(parentCkCodeId);
				
				//alert($("#" + parentCkCodeId).html());
				//==============================================================================================================================
	
				
				//★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
				// [CK_CODE id 를 갖는 부모 div의 자식 HTML문 전체를 전역변수 childrenHTMLContent 에 저장한다.]=======
				childrenHTMLContent = $("#" + parentCkCodeId).html();
				//====================================================================================================
				//★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
				
					
			
			var checklist_code = $(this).val();
				checklist_content = "";
	
				$.ajax(
				{
					type: "POST"
					, url: "checklist_edit.action"
					, data: "checklist_code=" + checklist_code
					, success: function(data)
					{
						//-----------------------------------------------------------------------
						// ② checklist_code에 해당하는 체크리스트 항목을 전달받는다. → (data)
						//-----------------------------------------------------------------------
						//alert("수신 성공!");
						//alert(data);
						$("#" + parentCkCodeId).empty();
						
						    changeHTMLContent = 
							"<div class='edit-checklist-all-big-box " + elementClass + "'>"
							+"	<div class='edit-checklist-all-item-Parent-box'>"
							+"		<form name='checkform' action='checklist_edit_ok.action' method='get'>"
							+"			                                                                                                                                                                                    "
					        +"                                                                                                                                                                                              "
							+"			<input type='hidden' name='ma_code' value='${ma_code }'>                                                                                                                            "
							+"			<div class='edit-checklist-all-item-box'>                                                                                                                                           "
							+"				<div class='edit-checklist-content-box add-checklist-content-box'>                                                                                                              "
							+"					<input type='text' name='checklist_content' class='edit-checklist-content-input add-checklist-content'"
							+"							value='" + data + "'>"                                                                     
							+"				</div>                                                                                                                                                                          "
							+"			                                                                                                                                                                                    "
							+"				<div class='edit-checklist-btn-box checkbox-all-btn-box plan'>                                                                                                                  "
							+"				                                                                                                                                                                                "
							+"				                                                                                                                                                                                "
							+"					                                                                                                                                                                            "
							+"						<button type='submit' class='edit-checklist-submit-btn milestone-add-list-btn checkbox-btn edit-check-btn btn btn-sm btn-outline-info'                                  "
							+"						value='" + parentCkCodeId + "' name='checklist_code'>                                                                                                                   "
							+"							                                                                                                                                                                    "
							+"							<span class='edit-checklist-submit-btn-content milestone-add-list-content milestone-edit-content'>                                                                  "
							+"								<span class='edit-checklist-submit-text milestone-add-list-text milestone-edit-btn-text'>submit!</span>                                                         "
							+"								<span class='edit-checklist-submit-icon milestone-add-list-btn-icon milestone-edit-btn-icon material-symbols-outlined'>task_alt</span>                          "
							+"							</span>                                                                                                                                                             "
							+"							                                                                                                                                                                    "
							+"						</button>                                                                                                                                                               "
							+"				                                                                                                                                                                                "
					        +"                                                                                                                                                                                              "
							+"						                                                                                                                                                                        "
							+"						<button type='button' class='edit-cancel-please edit-checklist-cancel-btn milestone-del-btn checkbox-btn delete-check-btn btn btn-sm btn-outline-danger'>                                  "
					        +"                                                                                                                                                                                              "
							+"							<span class='edit-checklist-cancel-content milestone-add-cancel-content milestone-del-content'>                                                                     "
							+"								<span class='edit-checklist-cancel-text milestone-add-cancel-text milestone-del-btn-text'>cancel</span>                                                         "
							+"								<span class='edit-checklist-cancel-icon milestone-add-cancel-icon milestone-delete-btn-icon material-symbols-outlined'>cancel</span>                            "
							+"							</span>                                                                                                                                                             "
							+"							                                                                                                                                                                    "
							+"						</button>                                                                                                                                                               "
							+"					                                                                                                                                                                            "
							+"				</div>                                                                                                                                                                          "
							+"			</div>                                                                                                                                                                              "
							+"		</form>                                                                                                                                                                                 "
							+"	</div>                                                                                                                                                                                      "
							+"</div>";                                             
						
						$("#" + parentCkCodeId).html(changeHTMLContent);
						
						
					}
					, error: function(data)
					{
						alert("에러 발생 ㅠㅠ");
					}
				});
				
				
			//alert(changeHTMLContent);
			
				
				
				//-------------------------------------------------------------------
				// ① edit 버튼을 클릭한 항목의 CK_CODE (체크리스트 코드) 가져오기 
				//    (checklist_codechecklist_code)
				//-------------------------------------------------------------------
				
				//alert($(this).val());
				//--==>> CK0001
			
				
			}// end if (openEditControll == 0)
				
			
			
			
		});
		
		
		//[수정 확인(submit) 버튼을 클릭했을 때 플래그 변수 처리]===================================
		$(".edit-checklist-submit-btn").click(function()
		{
			openEditControll = 0;
		});
		
		

		
		/*[항목 edit 버튼 입력을 취소하기 위해 cancel 버튼을 클릭했을 경우 처리]===================*/
	 	$(document).on("click", ".edit-cancel-please", function() 
	 	{
	 		
	 		openEditControll = 0;
	 		
	 	 	// 테스트
	 		//alert("항목 수정 cancel 버튼 클릭 확인.");
	 	 	
	 	 	//******************************************************************************************
	 	 	// [cancel] 버튼을 클릭했을 경우, 이전에 보여지던 체크리스트 항목 HTML 이 보여져야 한다.
	 	 	//******************************************************************************************
	 	 	
	 	 	//******************************************************************************************
	 	 	// 체크리스트 항목을 감싸는 div의 자식을 삭제하기 전 저장해 두었던 원본 HTML 문자열이 저장된
	 	 	// childrenHTMLContent 변수의 값을, 부모의 HTML 로 삽입해 준다.
	 	 	//******************************************************************************************
	 	 	
	 		
	 	 	/*
	 	 	[항목 수정 취소 cancel 버튼 클릭시 액션]
			1. 취소 버튼 클릭 $(this) - 클래스 [.edit-checklist-cancel-btn]
			2. 부모 선택 .parent() - 클래스 [.edit-checklist-btn-box]
			3. 부모 선택 .parent() - 클래스 [.edit-checklist-all-item-box]
	 	 	4. 부모 선택 .parent() - 네임 [ [name='checkform'] ] (form 이 부모이다.)
			5. 부모 선택 .parent() - 클래스 [.edit-checklist-all-item-Parent-box]
			6. 부모 선택 .parent() - 클래스 [.edit-checklist-all-big-box]
			7. 부모 선택 .parent() - 클래스 [.outline-checkbox-Area]
	 	 	*/
	 	 	
	 	 	
	 	 	
	 		var editCancelParentEle = $(this).parent(".edit-checklist-btn-box").parent(".edit-checklist-all-item-box")
	 			   					  	     .parent("[name='checkform']").parent(".edit-checklist-all-item-Parent-box")
	 			   					  	     .parent(".edit-checklist-all-big-box").parent(".outline-checkbox-Area");
	 	 	
	 	 	
	 		//[선택한 엘리먼트가 확실한지 확인.]******
	 		
	 	 	//alert(editCancelParentEle.html());

	 		//***************************************
	 	 	
	 	 	
	 	 	//[선택한 항목 수정 입력창의 최상위 부모 id 가져오기]**************
	 		
	 		var editCancelCkCodeId = editCancelParentEle.attr("id");
	 		
	 		//alert(editCancelCkCodeId);
	 		//--==>> CK0009
	 		//*****************************************************************
	 		
	 		//*****************************************************************************************
	 		//[위의 CK_CODE id 를 갖는 엘리먼트의 자식 HTML 로, 이전에 저장해 두었던 HTML 내용 삽입.]
			// → childrenHTMLContent
	 		//*****************************************************************************************
	 		
	 		$("#" + editCancelCkCodeId).html(childrenHTMLContent);
			 	    
	 	});
	 
		

		$(".one-member-info-main-Box").click(function()
		{
			//[평가자 ma_code, 피평가자 ma_code] 를 구해서
			// modal 창에 hidden 으로 넣어 주어야
			// form action 처리 이후 컨트롤러에서 받아줄 수 있다.
			
			//===========================================
			//『평가자 ma_code』
			//===========================================
			// 테스트 - 현재 로그인한 회원의 ma 코드 확인
			//	alert("${ma_code}")
			//--==>> MA0001
			//===========================================
				
			//===========================================
			//『피평가자 ma_code』
			//===========================================
			// 테스트 - 클릭한 멤버의 멤버지원코드 확인
			//alert($(this).attr("id"));
			//--==>> MA0003
			//===========================================
			
			/*
			***********************************************************
			[값을 넣어줄 모달창 input 엘리먼트]
			***********************************************************
				<input type="text" class="a-ma-code-hidden" value="">
	      	  	<input type="text" class="p-ma-code-hidden" value="">	
			***********************************************************
			*/
			
			var a_ma_code = "${ma_code}";
			var p_ma_code = $(this).attr("id");
			var p_nickname = $("#nickname-" + $(this).attr("id")).html();
			var evalu_done = $("#evalu-done" + p_ma_code).html();
			
			
			if (evalu_done == '평가미완료')
			{
				$(".a-ma-code-hidden").val(a_ma_code);
				$(".p-ma-code-hidden").val(p_ma_code);
				$(".evalu-member-nickname").html(p_nickname);
				
				$("#member-evaluation-modal").modal("show");	
				
			}
			else if (evalu_done == '평가완료')
			{
				$("#dont-evaluation-modal").modal("show");
				$(".dont-evalu-member-nickname").html(p_nickname);
			}
			
		});
		
		
		$(".evalu-done-blind-box").click(function ()
		{
			var dont_evalu_p_nickname = $(this).attr("id").replaceAll("blind", "");
			$("#dont-evaluation-modal").modal("show");
			$(".dont-evalu-member-nickname").html(dont_evalu_p_nickname);
		});
		
		
	});// end $(document).ready(function(){ });

	
	
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
						<img class="memberImg" src="img/profileImg_1.png">
					</div>
					<span class="nickname" id="mem1" style="<%=login%>">${member.nickname }</span>
					<div class="gradeIcon" style="<%=login%>">
						<img src="<%=iconUrlStr %>"  class="skillGradeIconImg" />
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
						<img alt="Logo" class="LogoImageBanner d-inline-block align-text-top lastchange" src="img/TestLogo.png" >
					</a>
					<!--===========[Logo]===========-->
					
					
					<div class="menuOptions nav nav-underline" id="nav">
						<ul class="nav-item">
							<a href="#" class="majorTopic nav-link link">프로젝트12345123<ion-icon class="menuIcon" name="terminal-outline"></ion-icon></a>
							<li class="miniMenuOption">
								<ul>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
								</ul>
							</li>
						</ul>
						<ul class="nav-item ">
							<a href="#" class="majorTopic nav-link link">프로젝345<ion-icon class="menuIcon" name="desktop-outline"></ion-icon></a>
							<li  class="miniMenuOption">
								<ul>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
								</ul>
							</li>
						</ul>
						<ul class="nav-item">
							<a href="#" class="majorTopic nav-link link">프로젝트123415<ion-icon class="menuIcon" name="reader-outline"></ion-icon></a>
							<li class="miniMenuOption">
								<ul>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
								</ul>
							</li>
						</ul>
						<ul class="nav-item">
							<a href="#" class="majorTopic nav-link link">프로젝2345<ion-icon class="menuIcon" name="person-outline"></ion-icon></a>
							<li class="miniMenuOption">
								<ul>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
								</ul>
							</li>
						</ul>
						<ul class="nav-item">
							<a href="#" class="majorTopic nav-link link">프로젝2345<ion-icon class="menuIcon" name="person-outline"></ion-icon></a>
							<li class="miniMenuOption">
								<ul>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트121231345</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
									<li class="miniMenuOption"><a href="#" class="nav-link link">프로젝트12345</a></li>
								</ul>
							</li>
						</ul>
						
					</div><!-- end .menuOptions -->
				</div><!-- end .leftmenuBar -->
			</div><!-- end .leftmenuBarBox -->
		</div><!-- end .col-6 .menuArea -->
		

		<!-- 본문 영역 -->
		<div class="row main-text">
			
			<div class="col-10 milestone-main-Parent-Area">

				<div class="row milestone-mainBox-Area">

					<%--▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ --%>
					<%--▩▩▩▩▩▩[기획 마일스톤 전체 영역]▩▩▩▩▩▩--%>
					<%--▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ --%>
					<div class="col-6 one-milestone-Parent-Area">
						<div class="one-milestone-main-box">
							<div class="milestone-progress-Area plan">

								  <div class="progress-bar-percent-Box">
								  	
								  	<div class="milestone-progress-all-area">
									  	<%-- Progress-bar 트랙 영역 --%>
										<div class="progress milestone-progress-box plan-progress-box plan" role="progressbar" aria-label="Info example" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
										  	
										  	<%-- Progress-bar 칠해지는 영역 --%>
										  	<div id="plan-progress-bar" class="progress-bar milestone-progress-bar plan text-dark"
										  	 style="width: ${planInitialPercent}%">
										  	</div><!-- close .progress-bar milestone-progress-bar plan text-dark -->
										  	
										</div><!-- close .progress milestone-progress-box plan-progress-box plan -->
									</div><!-- close .milestone-progress-all-area -->
								  	
								  	<div class="progress-bar-percent-miniBox">
								  		<span id="plan-percentage" class="progress-bar-percent-content">${planInitialPercent }%</span>	
								  	</div><!-- close .progress-bar-percent-miniBox -->
								  	
								  </div><!-- close .progress-bar-percent-Box -->
							  
							</div>
							
							<div class="milestone-success-step-blindBox"></div>
							<div class="milestone-step-numberBox">
								<span class="milestone-step-number">STEP 1</span>
								
							</div>
						
						
							
							<div class="milestone-success-blindBox"></div>
							<div class="one-milestone-Parent-Box">
								
								<div class="one-milestone-mainCategory-box plan-category-box plan">
									<h3 class="milestone-mainCategory-text plan-category-text plan">기획</h3>
								</div><!-- close .one-milestone-mainCategory-box -->
								
								<div class="checkbox-title-Area">
									<div class="checkbox-title">
										<span class="checklist-title-all-element-box">
											<span class="checklist-title-icon material-symbols-outlined">check_box</span>
											<span class="checklist-title-txt plan-check-title">CheckList</span>
										</span>
									</div>
								</div>
								
								<div class="all-milestone-Content-and-btn-box">
									<div id="all-plan-checklist" class="one-milestone-mainContent-box plan-mainContent-box plan">
										<div class="milestone-checkList-box plan-checkList plan">
											
											
											
											<c:forEach var="planItem" items="${planCheckList }">
												<%-- CheckBox 목록 하나 --%>
												<div class="outline-checkbox-Area" id="${planItem.checklist_code }">
												<div class="one-milestone-checkbox plan-check plan">
													<%-- 
													<c:choose>
													
														[마일스톤 대분류를 모두 완료해서, 체크리스트가 비활성화 되었을 때]
														<c:when test="${isDisabled == true }">
															<input type="checkbox" value="${planItem.checklist_code }" class="plan-checkbox checkList-checkbox"
															${planItem.is_checked == 1 ? "checked='on'" : "" }
															disabled>
														</c:when>
														
														<c:otherwise>
															<input type="checkbox" value="${planItem.checklist_code }" class="plan-checkbox checkList-checkbox"
															${planItem.is_checked == 1 ? "checked='on'" : "" }
															>
														</c:otherwise>
														
													</c:choose>
														
													 --%>
														
														<input type="checkbox" value="${planItem.checklist_code }" class="plan-checkbox checkList-checkbox"
															${planItem.is_checked == 1 ? "checked='on'" : "" }
															<%=disabledStr %>>
														<span id="check${planItem.checklist_code }" class="content${planItem.checklist_code } milestone-checkbox-content">${planItem.checklist_content }</span>
														<input type="hidden" class="nickname${planItem.checklist_code }" value="${planItem.nickname }">
														<input type="hidden" class="member-role${planItem.checklist_code }" value="${planItem.member_role }">
														<input type="hidden" class="step${planItem.checklist_code }" value="${planItem.step }">
														
														
													<c:choose>
													
														<c:when test="${member.mem_code eq planItem.mem_code || memberRole == '팀장'}">
															<div class="checkbox-all-btn-box plan">
																<%-- Edit --%>
																<button type="button" class="edit-action-button checkbox-btn edit-check-btn btn btn-sm btn-outline-info" 
																		value="${planItem.checklist_code }">
																	
																	<span class="milestone-edit-content">
																		<span class="milestone-edit-btn-text">edit</span>
																		<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
																	</span>
																	
																</button>
																
																
																<%-- Delete --%>
																<button type="button" class="delete-action-button checkbox-btn delete-check-btn btn btn-sm btn-outline-danger"
																		value="${planItem.checklist_code }">
																	<span class="milestone-del-content">
																		<span class="milestone-del-btn-text">delete</span>
																		<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
																	</span>
																</button>
																
																
															</div><!-- close .checkbox-all-btn-box .plan -->
														
														</c:when>
														
														<c:otherwise>
															<div class="checkbox-all-btn-box plan" id="${planItem.checklist_code }">
																<%-- Edit --%>
																<button type="button" class="edit-action-button checkbox-btn edit-check-btn btn btn-sm btn-outline-info" 
																		value="${planItem.checklist_code }"
																		disabled="disabled"
																		style="background: none;">
																	
																	<span class="dont-touch-icon-1 material-symbols-outlined">block</span>
																	
																	<span class="milestone-edit-content">
																		<span class="milestone-edit-btn-text">edit</span>
																		<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
																	</span>
																	
																</button>
																
																
																<%-- Delete --%>
																<button type="button" class="delete-action-button checkbox-btn delete-check-btn btn btn-sm btn-outline-danger"
																		value="${planItem.checklist_code }"
																		disabled="disabled"
																		style="background: none;">
																	
																	<span class="dont-touch-icon-2 material-symbols-outlined">block</span>
																	
																	<span class="milestone-del-content">
																		<span class="milestone-del-btn-text">delete</span>
																		<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
																	</span>
																</button>
																
																
															</div><!-- close .checkbox-all-btn-box .plan -->
														
														</c:otherwise>
													
													</c:choose>
													
												</div><!-- close .one-milestone-checkbox .plan-check .plan -->
												</div>
											</c:forEach>
											
											
											<%--[ 테스트용 수정 입력창 ]--%>
											<%-- 
											<div class="edit-checklist-all-big-box one-milestone-checkbox plan-check plan">
												
												<div class="edit-checklist-all-item-Parent-box">
													<form name="checkform" action="checklist_edit_ok.action" method="get">
														

														<input type="hidden" name="ma_code" value="${ma_code }">
														<div class="edit-checklist-all-item-box">
															<div class="edit-checklist-content-box add-checklist-content-box">
																<input type="text" name="checklist_content" class="edit-checklist-content-input add-checklist-content">
															</div>
														
															<div class="edit-checklist-btn-box checkbox-all-btn-box plan">
															
															
																
																	<button type="submit" class="edit-checklist-submit-btn milestone-add-list-btn checkbox-btn edit-check-btn btn btn-sm btn-outline-info"
																	value="CK0001" name="checklist_code">
																		
																		<span class="edit-checklist-submit-btn-content milestone-add-list-content milestone-edit-content">
																			<span class="edit-checklist-submit-text milestone-add-list-text milestone-edit-btn-text">submit!</span>
																			<span class="edit-checklist-submit-icon milestone-add-list-btn-icon milestone-edit-btn-icon material-symbols-outlined">task_alt</span>
																		</span>
																		
																	</button>
															
			
																	
																	<button type="button" class="edit-checklist-cancel-btn milestone-del-btn checkbox-btn delete-check-btn btn btn-sm btn-outline-danger">
			
																		<span class="edit-checklist-cancel-content milestone-add-cancel-content milestone-del-content">
																			<span class="edit-checklist-cancel-text milestone-add-cancel-text milestone-del-btn-text">cancel</span>
																			<span class="edit-checklist-cancel-icon milestone-add-cancel-icon milestone-delete-btn-icon material-symbols-outlined">cancel</span>
																		</span>
																		
																	</button>
																
															</div>
														</div>
													</form>
												</div>
											</div>
											 --%>
											<%--[ 「+」 버튼 클릭시, 기획 체크리스트 목록 추가 입력창 ]--%>
												<div class="add-checklist-box one-milestone-checkbox plan-check plan" id="plan-add-divBox">
													
													<div class="add-checklist-content-box">
														<input type="text" class="add-checklist-content" id="plan-new-list-content" placeholder="새로운 항목을 입력하세요!">
													</div>
													
													<div class="checkbox-all-btn-box plan">
													
														<%-- submit 버튼 --%>
														<button type="button" id="plan-add-submit" class="new-content-submit milestone-add-list-btn checkbox-btn edit-check-btn btn btn-sm btn-outline-info"
														value="기획" >
															
															<span class="milestone-add-list-content milestone-edit-content">
																<span class="milestone-add-list-text milestone-edit-btn-text">submit!</span>
																<span class="milestone-add-list-btn-icon milestone-edit-btn-icon material-symbols-outlined">task_alt</span>
															</span>
															
														</button>
														
														
														<%-- cancel 버튼  --%>
														<button type="button" id="plan-add-cancel" class="milestone-add-cancel-btn milestone-del-btn checkbox-btn delete-check-btn btn btn-sm btn-outline-danger">

															<span class="milestone-add-cancel-content milestone-del-content">
																<span class="milestone-add-cancel-text milestone-del-btn-text">cancel</span>
																<span class="milestone-add-cancel-icon milestone-delete-btn-icon material-symbols-outlined">cancel</span>
															</span>
															
														</button>
														
														
													</div><!-- close .checkbox-all-btn-box .plan -->
												</div><!-- close .one-milestone-checkbox .plan-check .plan -->
												
											
											
											
											
<%-- 											
											
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan">

												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox">

													<span class="milestone-checkbox-content">
														무엇무엇을 해야함!
													</span>
												</form>
												
												<div class="checkbox-all-btn-box plan">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox">
													<span class="milestone-checkbox-content">
													일이삼사오육칠팔구십일이삼사오육칠팔
													</span>
												</form>
												
												<div class="checkbox-all-btn-box plan">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox">

													<span class="milestone-checkbox-content">
														이것은 테스트를 위해 상당히 길게 쓰는 목표입니다. 글자가 오버플로우 됐을 때만 툴팁이 나타나게 하고 싶은데 잘 안 되네요...
													</span>
													
												</form>
												
												<div class="checkbox-all-btn-box plan">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->

 --%>

											
											
											
											
											
		
										</div><!-- close .milestone-checkList-box .plan-checkList .plan -->
									</div><!-- close .one-milestone-mainContent-box .plan-mainContent-box .plan -->
									
									
									<div class="new-checklist-item-btn-Area milestone-add-list-btn-Area">
										
										<div class="new-checklist-item-btn-box milestone-add-list-btn-box">
											<button type="button" id="plan-add-btn" class="new-checklist-item-btn milestone-add-list-btn btn btn-light plan-list-add-btn"
											value="plan-add">
												<span class="milestone-add-btn-icon material-symbols-outlined">add</span>
											</button>
										</div><!-- close .milestone-add-list-btn-box -->
									
									</div><!-- close .milestone-add-list-btn-Area -->
									
								</div><!-- close .all-milestone-Content-and-btn-box -->
								
								
								
								
								
								
								
							</div><!-- close .one-milestone-Parent-Box -->
						</div><!-- close .one-milestone-main-box -->
					</div><!-- close .col-6 .one-milestone-Parent-Area [기획 마일스톤 영역 종료] -->
					
					


					<%--▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ --%>
					<%--▩▩▩▩▩▩[설계 마일스톤 전체 영역]▩▩▩▩▩▩--%>
					<%--▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ --%>
					<div class="col-6 one-milestone-Parent-Area design">
						<div class="one-milestone-main-box design">
							<div class="milestone-progress-Area plan design">

								  <div class="progress-bar-percent-Box">
								  	
								  	<div class="milestone-progress-all-area">
									  	<%-- Progress-bar 트랙 영역 --%>
										<div class="progress milestone-progress-box plan-progress-box plan design" role="progressbar" aria-label="Info example" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
										  	
										  	<%-- Progress-bar 칠해지는 영역 --%>
										  	<div id="design-progress-bar" class="progress-bar milestone-progress-bar plan text-dark  design"
										  	style="width: ${designInitialPercent}%">
										  	</div><!-- close .progress-bar milestone-progress-bar plan text-dark -->
										  	
										</div><!-- close .progress milestone-progress-box plan-progress-box plan -->
									</div><!-- close .milestone-progress-all-area -->
								  	
								  	<div class="progress-bar-percent-miniBox design">
								  		<span id="design-percentage" class="progress-bar-percent-content design">
								  			${designInitialPercent }%
								  		</span>	
								  	</div><!-- close .progress-bar-percent-miniBox -->
								  	
								  </div><!-- close .progress-bar-percent-Box -->
							  
							</div>
							
							<div class="milestone-success-step-blindBox"></div>
							<div class="milestone-step-numberBox design">
								<span class="milestone-step-number design">STEP 2</span>
							</div>
						
							<div class="milestone-success-blindBox"></div>
							<div class="one-milestone-Parent-Box">
								<div class="one-milestone-mainCategory-box plan-category-box plan  design">
									<h3 class="milestone-mainCategory-text plan-category-text plan design">설계</h3>
								</div><!-- close .one-milestone-mainCategory-box -->
								
								<div class="checkbox-title-Area design">
									<div class="checkbox-title design">
										<span class="checklist-title-all-element-box design">
											<span class="checklist-title-icon material-symbols-outlined design">check_box</span>
											<span class="checklist-title-txt plan-check-title design">CheckList</span>
										</span>
									</div>
								</div>
								
								<div class="all-milestone-Content-and-btn-box">
									<div id="all-design-checklist" class="one-milestone-mainContent-box plan-mainContent-box plan design">
										<div class="milestone-checkList-box plan-checkList plan design">
											
											
											
											<c:forEach var="designItem" items="${designCheckList }">
											
												<%-- CheckBox 목록 하나 --%>
												<div class="outline-checkbox-Area" id="${designItem.checklist_code }">
												<div class="one-milestone-checkbox plan-check plan design" >
													
												<%-- 	
													<c:choose>
													
														[마일스톤 대분류를 모두 완료해서, 체크리스트가 비활성화 되었을 때]
														<c:when test="${isDisabled == true }">
															<input type="checkbox" value="${designItem.checklist_code }"  class="plan-checkbox design checkList-checkbox"
															${designItem.is_checked == 1 ? "checked='on'" : "" }
															disabled>
														</c:when>
														
														<c:otherwise>
															<input type="checkbox" value="${designItem.checklist_code }"  class="plan-checkbox design checkList-checkbox"
															${designItem.is_checked == 1 ? "checked='on'" : "" }
															>
														</c:otherwise>
														
													</c:choose> 
													
													--%>
														
														<input type="checkbox" value="${designItem.checklist_code }"  class="plan-checkbox design checkList-checkbox"
															${designItem.is_checked == 1 ? "checked='on'" : "" }
															<%=disabledStr %>>
															
														
													
														<span id="check${designItem.checklist_code }" class="content${designItem.checklist_code } milestone-checkbox-content">${designItem.checklist_content }</span>
														<input type="hidden" class="nickname${designItem.checklist_code }" value="${designItem.nickname }">
														<input type="hidden" class="member-role${designItem.checklist_code }" value="${designItem.member_role }">
														<input type="hidden" class="step${designItem.checklist_code }" value="${designItem.step }">
													
													
													<c:choose>
													
														<c:when test="${member.mem_code eq designItem.mem_code || memberRole == '팀장'}">
															<div class="checkbox-all-btn-box plan">
																<%-- Edit --%>
																<button type="button" class="edit-action-button checkbox-btn edit-check-btn btn btn-sm btn-outline-info" 
																		value="${designItem.checklist_code }">
																	
																	<span class="milestone-edit-content">
																		<span class="milestone-edit-btn-text">edit</span>
																		<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
																	</span>
																	
																</button>
																
																
																<%-- Delete --%>
																<button type="button" class="delete-action-button checkbox-btn delete-check-btn btn btn-sm btn-outline-danger"
																		value="${designItem.checklist_code }">
																	<span class="milestone-del-content">
																		<span class="milestone-del-btn-text">delete</span>
																		<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
																	</span>
																</button>
																
																
															</div><!-- close .checkbox-all-btn-box .plan -->
														
														</c:when>
														
														<c:otherwise>
															<div class="checkbox-all-btn-box plan" id="${designItem.checklist_code }">
																<%-- Edit --%>
																<button type="button" class="edit-action-button checkbox-btn edit-check-btn btn btn-sm btn-outline-info" 
																		value="${designItem.checklist_code }"
																		disabled="disabled"
																		style="background: none;">
																	
																	<span class="dont-touch-icon-1 material-symbols-outlined">block</span>
																	
																	<span class="milestone-edit-content">
																		<span class="milestone-edit-btn-text">edit</span>
																		<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
																	</span>
																	
																</button>
																
																
																<%-- Delete --%>
																<button type="button" class="delete-action-button checkbox-btn delete-check-btn btn btn-sm btn-outline-danger"
																		value="${designItem.checklist_code }"
																		disabled="disabled"
																		style="background: none;">
																	
																	<span class="dont-touch-icon-2 material-symbols-outlined">block</span>
																	
																	<span class="milestone-del-content">
																		<span class="milestone-del-btn-text">delete</span>
																		<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
																	</span>
																</button>
																
																
															</div><!-- close .checkbox-all-btn-box .plan -->
														
														</c:otherwise>
													
													</c:choose>
													
													
												</div><!-- close .one-milestone-checkbox .plan-check .plan -->
												</div>
												
												
											</c:forEach>
											
												<%--[ 「+」 버튼 클릭시, 설계 체크리스트 목록 추가 입력창 ]--%>
												<div class="one-milestone-checkbox plan-check plan design add-checklist-box">
													
													<div class="add-checklist-content-box">
														<input type="text" class="add-checklist-content" id="design-new-list-content" placeholder="새로운 항목을 입력하세요!">
													</div>
													
													<div class="checkbox-all-btn-box plan">
													
														<%-- submit 버튼 --%>
														<button type="button" class="new-content-submit milestone-add-list-btn checkbox-btn edit-check-btn btn btn-sm btn-outline-info"
														value="설계" >
															
															<span class="milestone-add-list-content milestone-edit-content">
																<span class="milestone-add-list-text milestone-edit-btn-text">submit!</span>
																<span class="milestone-add-list-btn-icon milestone-edit-btn-icon material-symbols-outlined">task_alt</span>
															</span>
															
														</button>
														
														
														<%-- cancel 버튼  --%>
														<button type="button" class="milestone-add-cancel-btn milestone-del-btn checkbox-btn delete-check-btn btn btn-sm btn-outline-danger">

															<span class="milestone-del-content milestone-add-cancel-content">
																<span class="milestone-add-cancel-text milestone-del-btn-text">cancel</span>
																<span class="milestone-add-cancel-icon milestone-delete-btn-icon material-symbols-outlined">cancel</span>
															</span>
															
														</button>
														
														
													</div><!-- close .checkbox-all-btn-box .plan -->
												</div><!-- close .one-milestone-checkbox .plan-check .plan -->
												
											
<%-- 											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan design">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox design">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->

											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan design">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox design">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan design">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info design" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan design">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox design">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan design">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info design" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan design">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox design">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan design">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info design" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan design">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox design">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan design">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info design" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											
 --%>											
											


											
		
										</div><!-- close .milestone-checkList-box .plan-checkList .plan -->
									</div><!-- close .one-milestone-mainContent-box .plan-mainContent-box .plan -->
									
									
									<div class="new-checklist-item-btn-Area milestone-add-list-btn-Area">
										
										<div class="new-checklist-item-btn-box milestone-add-list-btn-box design">
											<button type="button" class="new-checklist-item-btn milestone-add-list-btn btn btn-light plan-list-add-btn design"
											value="design-add">
												<span class="milestone-add-btn-icon material-symbols-outlined design">add</span>
											</button>
										</div><!-- close .milestone-add-list-btn-box -->
									
									</div><!-- close .milestone-add-list-btn-Area -->
									
								</div><!-- close .all-milestone-Content-and-btn-box -->
								
								
							</div><!-- close .one-milestone-Parent-Box -->
						</div><!-- close .one-milestone-main-box -->
					</div><!-- close .col-6 .one-milestone-Parent-Area [기획 마일스톤 영역 종료] -->
					
					

					<%--▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ --%>
					<%--▩▩▩▩▩▩[구현 마일스톤 전체 영역]▩▩▩▩▩▩--%>
					<%--▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ --%>
					<div class="col-6 one-milestone-Parent-Area implement">
						<div class="one-milestone-main-box implement">
							<div class="milestone-progress-Area plan implement">

								  <div class="progress-bar-percent-Box implement">
								  	
								  	<div class="milestone-progress-all-area implement">
									  	<%-- Progress-bar 트랙 영역 --%>
										<div class="progress milestone-progress-box plan-progress-box plan implement" role="progressbar" aria-label="Info example" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
										  	
										  	<%-- Progress-bar 칠해지는 영역 --%>
										  	<div id="implement-progress-bar" class="progress-bar milestone-progress-bar plan text-dark implement"
										  	style="width: ${implementInitialPercent}%">
										  	</div><!-- close .progress-bar milestone-progress-bar plan text-dark -->
										  	
										</div><!-- close .progress milestone-progress-box plan-progress-box plan -->
									</div><!-- close .milestone-progress-all-area -->
								  	
								  	<div class="progress-bar-percent-miniBox implement">
								  		<span id="implement-percentage" class="progress-bar-percent-content implement">
								  			${implementInitialPercent }%
								  		</span>	
								  	</div><!-- close .progress-bar-percent-miniBox -->
								  	
								  </div><!-- close .progress-bar-percent-Box -->
							  
							</div>
							
							
							<div class="milestone-success-step-blindBox"></div>
							<div class="milestone-step-numberBox implement">
								<span class="milestone-step-number implement">STEP 3</span>
							</div>
						
							<div class="milestone-success-blindBox"></div>
							<div class="one-milestone-Parent-Box">
								<div class="one-milestone-mainCategory-box plan-category-box plan implement">
									<h3 class="milestone-mainCategory-text plan-category-text plan implement">구현</h3>
								</div><!-- close .one-milestone-mainCategory-box -->
								
								<div class="checkbox-title-Area implement">
									<div class="checkbox-title implement">
										<span class="checklist-title-all-element-box implement">
											<span class="checklist-title-icon material-symbols-outlined implement">check_box</span>
											<span class="checklist-title-txt plan-check-title implement">CheckList</span>
										</span>
									</div>
								</div>
								
								<div class="all-milestone-Content-and-btn-box implement">
									<div id="all-implement-checklist" class="one-milestone-mainContent-box plan-mainContent-box plan implement">
										<div class="milestone-checkList-box plan-checkList plan implement">
											
											
											
											<c:forEach var="implementItem" items="${implementCheckList }">
												<%-- CheckBox 목록 하나 --%>
												<div class="outline-checkbox-Area" id="${implementItem.checklist_code }">
												<div class="one-milestone-checkbox plan-check plan implement">
													
													
													<%-- 
													<c:choose>
													
														[마일스톤 대분류를 모두 완료해서, 체크리스트가 비활성화 되었을 때]
														<c:when test="${isDisabled == true }">
															<input type="checkbox" value="${implementItem.checklist_code }"  class="plan-checkbox implement checkList-checkbox"
															${implementItem.is_checked == 1 ? "checked='on'" : "" }
															disabled>
														</c:when>
														
														<c:otherwise>
															<input type="checkbox" value="${implementItem.checklist_code }"  class="plan-checkbox implement checkList-checkbox"
															${implementItem.is_checked == 1 ? "checked='on'" : "" }
															>
														</c:otherwise>
														
													</c:choose>
													
													--%>
													
														<input type="checkbox" value="${implementItem.checklist_code }"  class="plan-checkbox implement checkList-checkbox"
														${implementItem.is_checked == 1 ? "checked='on'" : "" }
														<%=disabledStr %>>
														
														<span id="check${implementItem.checklist_code }" class="content${implementItem.checklist_code } milestone-checkbox-content">${implementItem.checklist_content }</span>
														<input type="hidden" class="nickname${implementItem.checklist_code }" value="${implementItem.nickname }">
														<input type="hidden" class="member-role${implementItem.checklist_code }" value="${implementItem.member_role }">
														<input type="hidden" class="step${implementItem.checklist_code }" value="${implementItem.step }">
													
													
													<c:choose>
													
														<c:when test="${member.mem_code eq implementItem.mem_code  || memberRole == '팀장'}">
															<div class="checkbox-all-btn-box plan">
																<%-- Edit --%>
																<button type="button" class="edit-action-button checkbox-btn edit-check-btn btn btn-sm btn-outline-info" 
																		value="${implementItem.checklist_code }">
																	
																	<span class="milestone-edit-content">
																		<span class="milestone-edit-btn-text">edit</span>
																		<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
																	</span>
																	
																</button>
																
																
																<%-- Delete --%>
																<button type="button" class="delete-action-button checkbox-btn delete-check-btn btn btn-sm btn-outline-danger"
																		value="${implementItem.checklist_code }">
																	<span class="milestone-del-content">
																		<span class="milestone-del-btn-text">delete</span>
																		<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
																	</span>
																</button>
																
																
															</div><!-- close .checkbox-all-btn-box .plan -->
														
														</c:when>
														
														<c:otherwise>
															<div class="checkbox-all-btn-box plan" id="${implementItem.checklist_code }">
																<%-- Edit --%>
																<button type="button" class="edit-action-button checkbox-btn edit-check-btn btn btn-sm btn-outline-info" 
																		value="${implementItem.checklist_code }"
																		disabled="disabled"
																		style="background: none;">
																	
																	<span class="dont-touch-icon-1 material-symbols-outlined">block</span>
																	
																	<span class="milestone-edit-content">
																		<span class="milestone-edit-btn-text">edit</span>
																		<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
																	</span>
																	
																</button>
																
																
																<%-- Delete --%>
																<button type="button" class="delete-action-button checkbox-btn delete-check-btn btn btn-sm btn-outline-danger"
																		value="${implementItem.checklist_code }"
																		disabled="disabled"
																		style="background: none;">
																	
																	<span class="dont-touch-icon-2 material-symbols-outlined">block</span>
																	
																	<span class="milestone-del-content">
																		<span class="milestone-del-btn-text">delete</span>
																		<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
																	</span>
																</button>
																
																
															</div><!-- close .checkbox-all-btn-box .plan -->
														
														</c:otherwise>
													
													</c:choose>
													
													
													
												</div><!-- close .one-milestone-checkbox .plan-check .plan -->
												</div>
											</c:forEach>
											
											<%--[ 「+」 버튼 클릭시, 『구현』 체크리스트 목록 추가 입력창 ]--%>
												<div class="add-checklist-box one-milestone-checkbox plan-check plan implement">
													
													<div class="add-checklist-content-box">
														<input type="text" class="add-checklist-content" id="implement-new-list-content" placeholder="새로운 항목을 입력하세요!">
													</div>
													
													<div class="checkbox-all-btn-box implement">
													
														<%-- submit 버튼 --%>
														<button type="button" class="new-content-submit milestone-add-list-btn checkbox-btn edit-check-btn btn btn-sm btn-outline-info"
														value="구현" >
															
															<span class="milestone-add-list-content milestone-edit-content">
																<span class="milestone-add-list-text milestone-edit-btn-text">submit!</span>
																<span class="milestone-add-list-btn-icon milestone-edit-btn-icon material-symbols-outlined">task_alt</span>
															</span>
															
														</button>
														
														
														<%-- cancel 버튼  --%>
														<button type="button" class="milestone-add-cancel-btn milestone-del-btn checkbox-btn delete-check-btn btn btn-sm btn-outline-danger">

															<span class="milestone-del-content milestone-add-cancel-content">
																<span class="milestone-add-cancel-text milestone-del-btn-text">cancel</span>
																<span class="milestone-add-cancel-icon milestone-delete-btn-icon material-symbols-outlined">cancel</span>
															</span>
															
														</button>
														
														
													</div><!-- close .checkbox-all-btn-box .plan -->
												</div><!-- close .one-milestone-checkbox .plan-check .plan -->
												
												
											
<%-- 											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan implement">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox implement">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan implement">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan implement">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox implement">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan implement">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan implement">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox implement">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan implement">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan implement">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox implement">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan implement">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan implement">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox implement">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan implement">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan implement">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox implement">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan implement">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											

 --%>
											
		
										</div><!-- close .milestone-checkList-box .plan-checkList .plan -->
									</div><!-- close .one-milestone-mainContent-box .plan-mainContent-box .plan -->
									
									
									<div class="new-checklist-item-btn-Area milestone-add-list-btn-Area">
							
										<div class="new-checklist-item-btn-box milestone-add-list-btn-box implement">
											<button type="button"  class="new-checklist-item-btn milestone-add-list-btn btn btn-light plan-list-add-btn implement"
											value="implement-add">
												<span class="milestone-add-btn-icon material-symbols-outlined implement">add</span>
											</button>
										</div><!-- close .milestone-add-list-btn-box -->
								
									
									</div><!-- close .milestone-add-list-btn-Area -->
									
								</div><!-- close .all-milestone-Content-and-btn-box -->
								
								
							</div><!-- close .one-milestone-Parent-Box -->
						</div><!-- close .one-milestone-main-box -->
					</div><!-- close .col-6 .one-milestone-Parent-Area [기획 마일스톤 영역 종료] -->
					
					
					
					

					<%--▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ --%>
					<%--▩▩▩▩▩▩[결산 마일스톤 전체 영역]▩▩▩▩▩▩--%>
					<%--▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ --%>
					<div class="col-6 one-milestone-Parent-Area settlement">
						<div class="one-milestone-main-box settlement">
							<div class="milestone-progress-Area plan settlement">

								  <div class="progress-bar-percent-Box settlement">
								  	
								  	<div class="milestone-progress-all-area settlement">
									  	<%-- Progress-bar 트랙 영역 --%>
										<div class="progress milestone-progress-box plan-progress-box plan settlement" role="progressbar" aria-label="Info example" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
										  	
										  	<%-- Progress-bar 칠해지는 영역 --%>
										  	<div id="settlement-progress-bar" class="progress-bar milestone-progress-bar plan text-dark settlement"
										  	style="width: ${settlementInitialPercent}%">
										  	</div><!-- close .progress-bar milestone-progress-bar plan text-dark -->
										  	
										</div><!-- close .progress milestone-progress-box plan-progress-box plan -->
									</div><!-- close .milestone-progress-all-area -->
								  	
								  	<div class="progress-bar-percent-miniBox settlement">
								  		<span id="settlement-percentage" class="progress-bar-percent-content settlement">
								  			${settlementInitialPercent }%
								  		</span>	
								  	</div><!-- close .progress-bar-percent-miniBox -->
								  	
								  </div><!-- close .progress-bar-percent-Box -->
							  
							</div>
							
							<div class="milestone-success-step-blindBox"></div>
							<div class="milestone-step-numberBox settlement">
								<span class="milestone-step-number settlement">STEP 4</span>
							</div>
						
							<div class="milestone-success-blindBox"></div>
							<div class="one-milestone-Parent-Box">
								<div class="one-milestone-mainCategory-box plan-category-box plan settlement">
									<h3 class="milestone-mainCategory-text plan-category-text plan settlement">결산</h3>
								</div><!-- close .one-milestone-mainCategory-box -->
								
								<div class="checkbox-title-Area">
									<div class="checkbox-title settlement">
										<span class="checklist-title-all-element-box settlement">
											<span class="checklist-title-icon material-symbols-outlined settlement">check_box</span>
											<span class="checklist-title-txt plan-check-title settlement">CheckList</span>
										</span>
									</div>
								</div>
								
								<div class="all-milestone-Content-and-btn-box settlement">
									<div id="all-settlement-checklist" class="one-milestone-mainContent-box plan-mainContent-box plan settlement">
										<div class="milestone-checkList-box plan-checkList plan settlement">
											
											
											
											<c:forEach var="settlementItem" items="${settlementCheckList }">
												<%-- CheckBox 목록 하나 --%>
												<div class="outline-checkbox-Area" id="${settlementItem.checklist_code }">
												<div class="one-milestone-checkbox plan-check plan settlement">
													
													<%-- 
													<c:choose>
													
														[마일스톤 대분류를 모두 완료해서, 체크리스트가 비활성화 되었을 때]
														<c:when test="${isDisabled == true }">
															<input type="checkbox" value="${settlementItem.checklist_code }"  class="plan-checkbox settlement checkList-checkbox"
															${settlementItem.is_checked == 1 ? "checked='on'" : "" }
															disabled checked="checked">
														</c:when>
														
														<c:otherwise>
															<input type="checkbox" value="${settlementItem.checklist_code }"  class="plan-checkbox settlement checkList-checkbox"
															${settlementItem.is_checked == 1 ? "checked='on'" : "" }
															>
														</c:otherwise>
														
													</c:choose>
													 --%>
													
														<input type="checkbox" value="${settlementItem.checklist_code }"  class="plan-checkbox settlement checkList-checkbox"
														${settlementItem.is_checked == 1 ? "checked='on'" : "" }
														<%=disabledStr %>>
														
														<span id="check${settlementItem.checklist_code }" class="content${settlementItem.checklist_code } milestone-checkbox-content">${settlementItem.checklist_content }</span>
														<input type="hidden" class="nickname${settlementItem.checklist_code }" value="${settlementItem.nickname }">
														<input type="hidden" class="member-role${settlementItem.checklist_code }" value="${settlementItem.member_role }">
														<input type="hidden" class="step${settlementItem.checklist_code }" value="${settlementItem.step }">
													
													
													<c:choose>
													
														<c:when test="${member.mem_code eq settlementItem.mem_code  || memberRole == '팀장'}">
															<div class="checkbox-all-btn-box plan">
																<%-- Edit --%>
																<button type="button" class="edit-action-button checkbox-btn edit-check-btn btn btn-sm btn-outline-info" 
																		value="${settlementItem.checklist_code }">
																	
																	<span class="milestone-edit-content">
																		<span class="milestone-edit-btn-text">edit</span>
																		<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
																	</span>
																	
																</button>
																
																
																<%-- Delete --%>
																<button type="button" class="delete-action-button checkbox-btn delete-check-btn btn btn-sm btn-outline-danger"
																		value="${settlementItem.checklist_code }">
																	<span class="milestone-del-content">
																		<span class="milestone-del-btn-text">delete</span>
																		<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
																	</span>
																</button>
																
																
															</div><!-- close .checkbox-all-btn-box .plan -->
														
														</c:when>
														
														<c:otherwise>
															<div class="checkbox-all-btn-box plan" id="${settlementItem.checklist_code }">
																<%-- Edit --%>
																<button type="button" class="edit-action-button checkbox-btn edit-check-btn btn btn-sm btn-outline-info" 
																		value="${settlementItem.checklist_code }"
																		disabled="disabled"
																		style="background: none;">
																	
																	<span class="dont-touch-icon-1 material-symbols-outlined">block</span>
																	
																	<span class="milestone-edit-content">
																		<span class="milestone-edit-btn-text">edit</span>
																		<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
																	</span>
																	
																</button>
																
																
																<%-- Delete --%>
																<button type="button" class="delete-action-button checkbox-btn delete-check-btn btn btn-sm btn-outline-danger"
																		value="${settlementItem.checklist_code }"
																		disabled="disabled"
																		style="background: none;">
																	
																	<span class="dont-touch-icon-2 material-symbols-outlined">block</span>
																	
																	<span class="milestone-del-content">
																		<span class="milestone-del-btn-text">delete</span>
																		<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
																	</span>
																</button>
																
																
															</div><!-- close .checkbox-all-btn-box .plan -->
														
														</c:otherwise>
													
													</c:choose>
													
													
												</div><!-- close .one-milestone-checkbox .plan-check .plan -->
												</div>
											</c:forEach>
											
											<%--[ 「+」 버튼 클릭시, 『결산』 체크리스트 목록 추가 입력창 ]--%>
												<div class="one-milestone-checkbox plan-check plan settlement add-checklist-box">
													
													<div class="add-checklist-content-box">
														<input type="text" class="add-checklist-content" id="settlement-new-list-content" placeholder="새로운 항목을 입력하세요!">
													</div>
													
													<div class="checkbox-all-btn-box plan">
													
														<%-- submit 버튼 --%>
														<button type="button" class="new-content-submit milestone-add-list-btn checkbox-btn edit-check-btn btn btn-sm btn-outline-info"
														value="결산" >
															
															<span class="milestone-add-list-content milestone-edit-content">
																<span class="milestone-add-list-text milestone-edit-btn-text">submit!</span>
																<span class="milestone-add-list-btn-icon milestone-edit-btn-icon material-symbols-outlined">task_alt</span>
															</span>
															
														</button>
														
														
														<%-- cancel 버튼  --%>
														<button type="button" class="milestone-add-cancel-btn milestone-del-btn checkbox-btn delete-check-btn btn btn-sm btn-outline-danger">

															<span class="milestone-del-content milestone-add-cancel-content">
																<span class="milestone-add-cancel-text milestone-del-btn-text">cancel</span>
																<span class="milestone-add-cancel-icon milestone-delete-btn-icon material-symbols-outlined">cancel</span>
															</span>
															
														</button>
														
														
													</div><!-- close .checkbox-all-btn-box .plan -->
												</div><!-- close .one-milestone-checkbox .plan-check .plan -->
												
											
	<%-- 										
											
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan settlement">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox settlement">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan settlement">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan settlement">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox settlement">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan settlement">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan settlement">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox settlement">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan settlement">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
											
											
											
											
											CheckBox 목록 하나
											<div class="one-milestone-checkbox plan-check plan settlement">
												
												<form name="checkform" action="/check.action" method="get">
													<input type="checkbox" val="CK0001"  class="plan-checkbox settlement">
													<span class="milestone-checkbox-content">무엇무엇을 해야함!</span>
												</form>
												
												<div class="checkbox-all-btn-box plan settlement">
													Edit
													<button type="button" class="checkbox-btn edit-check-btn btn btn-sm btn-outline-info" value="CK0001">
														
														<span class="milestone-edit-content">
															<span class="milestone-edit-btn-text">edit</span>
															<span class="milestone-edit-btn-icon material-symbols-outlined">edit</span>
														</span>
														
													</button>
													
													
													Delete
													<button type="button" class="checkbox-btn delete-check-btn btn btn-sm btn-outline-danger" value="CK0001">
														<span class="milestone-del-content">
															<span class="milestone-del-btn-text">delete</span>
															<span class="milestone-delete-btn-icon material-symbols-outlined">delete</span>
														</span>
													</button>
													
													
												</div><!-- close .checkbox-all-btn-box .plan -->
												
											</div><!-- close .one-milestone-checkbox .plan-check .plan -->
			 --%>								
											
											
		
										</div><!-- close .milestone-checkList-box .plan-checkList .plan -->
									</div><!-- close .one-milestone-mainContent-box .plan-mainContent-box .plan -->
									
									
									<div class="new-checklist-item-btn-Area milestone-add-list-btn-Area">
										
										<div class="new-checklist-item-btn-box milestone-add-list-btn-box settlement">
											<button type="button" class="new-checklist-item-btn milestone-add-list-btn btn btn-light plan-list-add-btn settlement"
											value="settlement-add">
												<span class="milestone-add-btn-icon material-symbols-outlined">add</span>
											</button>
										</div><!-- close .milestone-add-list-btn-box -->
									
									</div><!-- close .milestone-add-list-btn-Area -->
									
								</div><!-- close .all-milestone-Content-and-btn-box -->
								
								
							</div><!-- close .one-milestone-Parent-Box -->
						</div><!-- close .one-milestone-main-box -->
					</div><!-- close .col-6 .one-milestone-Parent-Area [기획 마일스톤 영역 종료] -->
					
				
				
					
					

			
				<div class="col-12 member-evaluation-Parent-Area">
				
					<div class="row member-evaluation-main-Area">
						
						<div class="member-evaluation-title-Area">
							<span class="member-evaluation-icon material-symbols-outlined">person_check</span>
							<span class="member-evaluation-title">팀원 평가</span>
						</div>

						<div id="member-evalu-carousel" class="carousel carousel-dark slide">
						  
						  <div class="member-evalu-carousel-inner carousel-inner">
						  
						  <c:set var="memberEvaluList" value="${pageScope.memberEvaluList }"/>
						  
						  <c:forEach var="i" begin="0" end="${memberEvaluList.size() }" step="3">
						  
						  	<c:choose>
						  		<c:when test="${i == 0 }">
						    		<div class="member-evalu-carousel-item-one-Page carousel-item active" data-bs-interval="2000">
						    	</c:when>
						    	<c:otherwise>
						    		<div class="member-evalu-carousel-item-one-Page carousel-item" data-bs-interval="2000">
						    	</c:otherwise>
						    </c:choose>
					    
					    
					    
						    <div class="all-memberEvalu-one-page-box">
								<c:forEach var="j" begin="${i }" end="${i+2 }" step="1">

								<c:if test="${j < memberEvaluList.size() && member.mem_code != memberEvaluList[j].p_mem_code }"> 
								    
								    
								    <%--【회원 한 명에 대한 정보】▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩--%>
								    <div class="one-member-info-main-and-blind-box">
								    
									    
									    <c:choose>
									    	<c:when test="${memberEvaluList[j].evalu_ok == '평가완료' }">
											    <div class="evalu-done-blind-box" id="blind${memberEvaluList[j].p_nickname }" style="display: block;"></div>
									    	</c:when>
									    	<c:otherwise>
											    <div class="evalu-done-blind-box" id="blind${memberEvaluList[j].p_nickname }" ></div>
									    	</c:otherwise>
									    </c:choose>
									    
										<div id="${memberEvaluList[j].p_ma_code }" class="one-member-info-main-Box">
											
											
											<div class="evaluation-done-or-not-box">
												<span id="evalu-done${memberEvaluList[j].p_ma_code }" class="evaluation-done-or-not">${memberEvaluList[j].evalu_ok }</span>
											</div>
											
											<div class="one-member-profile-image-Box">
												<img src="<%=cp %>/img/test_profile_img/햄버거왜케맛있눙.png" class="one-member-profile-image">
											</div>
											
												<div class="one-member-nick-role-all-Area">
													<div class="one-member-nickname-Box">
														<span class="descTxt member-nickname-desc">Nickname</span> 
														<span class="one-member-nickname" id="nickname-${memberEvaluList[j].p_ma_code }">${memberEvaluList[j].p_nickname }</span>
													</div>
													
													<div class="one-member-role-Box">
														<span class="descTxt member-role-desc">Member-Role</span> 
														<span class="one-member-role">${memberEvaluList[j].p_member_role }</span>
													</div>
												</div><!-- close .one-member-nick-role-all-Area -->
												
												<div class="one-member-total-score-Parent-Box">
													
													<%--▩▩▩▩▩▩▩▩[백엔드 스킬 등급]▩▩▩▩▩▩▩▩--%>
													<div class="all-backend-grade-info-Parent-Area">
													
															<div class="descTxt-Parent-Box backend">
																<span class="descTxt backend-grade-desc">Back-end</span>
															</div>
															
															<div class="one-member-backend-grade-icon-Parent-Box">
																<div class="one-member-backend-grade-icon-Box">
																	<img src="${memberEvaluList[j].backGradeIcon }" class="one-member-backend-grade-icon">
																</div>
															</div>
														
													</div><!-- close .all-backend-grade-info-Parent-Area -->
											
											
													<%--▩▩▩▩▩▩▩▩[프론트엔드 스킬 등급]▩▩▩▩▩▩▩▩--%>
													<div class="all-frontend-grade-info-Parent-Area">
														
															<div class="descTxt-Parent-Box frontend">
																<span class="descTxt frontend-grade-desc">Front-end</span>
			
															</div> 
															
															<div class="one-member-frontend-grade-icon-Parent-Box">
																<div class="one-member-frontend-grade-icon-Box">
																	<img src="${memberEvaluList[j].frontGradeIcon }" class="one-member-frontend-grade-icon">
																</div>
															</div>
														
													</div><!-- close .all-frontend-grade-info-Parent-Area -->
		
		
													<%--▩▩▩▩▩▩▩▩▩▩[매너 점수]▩▩▩▩▩▩▩▩▩▩--%>
													<div class="all-manner-score-info-Parent-Area">
														
															<div class="descTxt-Parent-Box manner">
																<span class="descTxt manner-score-desc">Manner</span>
															</div>
															
															<div class="one-member-manner-score-Parent-Box">
																<div class="one-member-manner-score-Box">
																	<span class="one-member-manner-score">${memberEvaluList[j].manner_score }℃</span>
																</div>
															</div>
														
													</div><!-- close .all-manner-score-info-Parent-Area -->
										
										
												</div><!-- close .one-member-total-score-Parent-Box -->
										
										</div><!-- close .one-member-info-main-Box -->						     					      
									</div><!-- close .one-member-info-main-and-blind-box -->
								</c:if>
								
							</c:forEach><!-- end for~j (회원 하나) -->
							
							</div><!-- close .one-member-info-main-Box [캐러셀 한 페이지 안의 회원들 종료] -->
							
					       </div><!-- close .carousel-item [캐러셀 한 페이지 종료] -->
						</c:forEach><!-- end for~i (캐러셀 한 페이지) -->
							
						  </div><!-- close .carousel-inner [캐러셀 내부 전체 종료] -->
					   
						
						<!-- end for~i (캐러셀 한 페이지) -->
							
							<%-- 
							    【회원 한 명에 대한 정보】▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩
								<div class="one-member-info-main-Box">
									<div class="one-member-profile-image-Box">
										<img src="<%=cp%>/img/test_profile_img/꼬옥.png" class="one-member-profile-image">
									</div>
									
										<div class="one-member-nick-role-all-Area">
											<div class="one-member-nickname-Box">
												<span class="descTxt member-nickname-desc">Nickname</span> 
												<span class="one-member-nickname">띵끌</span>
											</div>
											
											<div class="one-member-role-Box">
												<span class="descTxt member-role-desc">Member-Role</span> 
												<span class="one-member-role">백엔드</span>
											</div>
										</div><!-- close .one-member-nick-role-all-Area -->
										
										<div class="one-member-total-score-Parent-Box">
											
											▩▩▩▩▩▩▩▩[백엔드 스킬 등급]▩▩▩▩▩▩▩▩
											<div class="all-backend-grade-info-Parent-Area">
											
													<div class="descTxt-Parent-Box backend">
														<span class="descTxt backend-grade-desc">Back-end</span>
													</div>
													
													<div class="one-member-backend-grade-icon-Parent-Box">
														<div class="one-member-backend-grade-icon-Box">
															<img src="<%=cp %>/img/grade_icon/1_seed.png" class="one-member-backend-grade-icon">
														</div>
													</div>
												
											</div><!-- close .all-backend-grade-info-Parent-Area -->
									
									
											▩▩▩▩▩▩▩▩[프론트엔드 스킬 등급]▩▩▩▩▩▩▩▩
											<div class="all-frontend-grade-info-Parent-Area">
												
													<div class="descTxt-Parent-Box frontend">
														<span class="descTxt frontend-grade-desc">Front-end</span>
	
													</div> 
													
													<div class="one-member-frontend-grade-icon-Parent-Box">
														<div class="one-member-frontend-grade-icon-Box">
															<img src="<%=cp %>/img/grade_icon/2_plant.png" class="one-member-frontend-grade-icon">
														</div>
													</div>
												
											</div><!-- close .all-frontend-grade-info-Parent-Area -->


											▩▩▩▩▩▩▩▩▩▩[매너 점수]▩▩▩▩▩▩▩▩▩▩
											<div class="all-manner-score-info-Parent-Area">
												
													<div class="descTxt-Parent-Box manner">
														<span class="descTxt manner-score-desc">Manner</span>
													</div>
													
													<div class="one-member-manner-score-Parent-Box">
														<div class="one-member-manner-score-Box">
															<span class="one-member-manner-score">38.9℃</span>
														</div>
													</div>
												
											</div><!-- close .all-manner-score-info-Parent-Area -->
								
								
										</div><!-- close .one-member-total-score-Parent-Box -->
								
								</div><!-- close .one-member-info-main-Box -->						     					      
						    【[끝!] - 회원 한 명에 대한 정보】▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩

							    【회원 한 명에 대한 정보】▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩
								<div class="one-member-info-main-Box">
									<div class="one-member-profile-image-Box">
										<img src="<%=cp%>/img/test_profile_img/체엣.png" class="one-member-profile-image">
									</div>
									
										<div class="one-member-nick-role-all-Area">
											<div class="one-member-nickname-Box">
												<span class="descTxt member-nickname-desc">Nickname</span> 
												<span class="one-member-nickname">귀여운걸보면행복해져ㅎㅎ</span>
											</div>
											
											<div class="one-member-role-Box">
												<span class="descTxt member-role-desc">Member-Role</span> 
												<span class="one-member-role">백엔드</span>
											</div>
										</div><!-- close .one-member-nick-role-all-Area -->
										
										<div class="one-member-total-score-Parent-Box">
											
											▩▩▩▩▩▩▩▩[백엔드 스킬 등급]▩▩▩▩▩▩▩▩
											<div class="all-backend-grade-info-Parent-Area">
											
													<div class="descTxt-Parent-Box backend">
														<span class="descTxt backend-grade-desc">Back-end</span>
													</div>
													
													<div class="one-member-backend-grade-icon-Parent-Box">
														<div class="one-member-backend-grade-icon-Box">
															<img src="/img/grade_icon/1_seed.png" class="one-member-backend-grade-icon">
														</div>
													</div>
												
											</div><!-- close .all-backend-grade-info-Parent-Area -->
									
									
											▩▩▩▩▩▩▩▩[프론트엔드 스킬 등급]▩▩▩▩▩▩▩▩
											<div class="all-frontend-grade-info-Parent-Area">
												
													<div class="descTxt-Parent-Box frontend">
														<span class="descTxt frontend-grade-desc">Front-end</span>
	
													</div> 
													
													<div class="one-member-frontend-grade-icon-Parent-Box">
														<div class="one-member-frontend-grade-icon-Box">
															<img src="/img/grade_icon/2_plant.png" class="one-member-frontend-grade-icon">
														</div>
													</div>
												
											</div><!-- close .all-frontend-grade-info-Parent-Area -->


											▩▩▩▩▩▩▩▩▩▩[매너 점수]▩▩▩▩▩▩▩▩▩▩
											<div class="all-manner-score-info-Parent-Area">
												
													<div class="descTxt-Parent-Box manner">
														<span class="descTxt manner-score-desc">Manner</span>
													</div>
													
													<div class="one-member-manner-score-Parent-Box">
														<div class="one-member-manner-score-Box">
															<span class="one-member-manner-score">38.9℃</span>
														</div>
													</div>
												
											</div><!-- close .all-manner-score-info-Parent-Area -->
								
								
										</div><!-- close .one-member-total-score-Parent-Box -->
								
								</div><!-- close .one-member-info-main-Box -->						     					      
						    【[끝!] - 회원 한 명에 대한 정보】▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩
						      
							
						    </div><!-- close .carousel-item [캐러셀 한 페이지 종료] -->
						  </div><!-- close .carousel-inner [캐러셀 내부 전체 종료] -->
--%>
						      
						      
						  
						  <c:if test="${memberEvaluList.size() > 3 }">
							  <div class="memberEvalu-all-btn-miniBox">
							  
								  <!--[앞 페이지 이동 버튼]-->
								  <button class="carousel-control-prev" type="button" data-bs-target="#member-evalu-carousel" data-bs-slide="prev">
								    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								    <span class="visually-hidden">Previous</span>
								  </button>
								  
								  <!--[뒷 페이지 이동 버튼]-->
								  <button class="carousel-control-next" type="button" data-bs-target="#member-evalu-carousel" data-bs-slide="next">
								    <span class="carousel-control-next-icon" aria-hidden="true"></span>
								    <span class="visually-hidden">Next</span>
								  </button>
							  
							  </div><!-- close .memberEvalu-all-btn-miniBox -->
						  </c:if>
						  
						  
						</div><!-- close #member-evalu-carousel -->

					
					</div><!-- close .row .member-evaluation-main-Area -->
				</div><!-- close .col-12 .member-evaluation-Parent-Area -->
				


				
				</div><!-- close .milestone-parent-Area -->
				
				
				
			</div><!-- close .milestone-mainParent-Area -->
			
			<!-- 사이드 영역 -->
			<div class="col-2 milestone-side-Parent-Area">
			</div>
		</div>
		
		
		
</div><!-- end .row -->



<!--▩▩▩▩▩▩[체크리스트 항목 더보기 모달창]▩▩▩▩▩▩-->

<div class="modal fade" id="more-check-content" tabindex="-1" aria-labelledby="checklist-more-Label" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
    
      <div class="modal-header checklist-more-modal-header">
        
        <h1 class="modal-title fs-5" id="checklist-more-Label">
        	<span class="checkbox-modal-step"><!-- JQuery 를 통해 스텝명을 보여준다. --></span>
        	체크리스트 항목 더보기
        </h1>
        
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body checklist-more-information-all-Area">
      	
      	
      	<div class="modal-body all-nickname-member-role-Parent-Area">
	      	<div class="modal-body all-nickname-info-Parent-Box">
		      
			      <div class="nickname-desc-title-box score-devision-title-box">
				      <span class="score-devision-title nickname-desc-text">
				      <span class="score-devision-title-icon material-symbols-outlined">badge</span>
						항목 추가자 닉네임
					  </span>
				  </div>
				  
				  <div class="checkbox-modal-nickname-box">
				      <span class="checkbox-modal-nickname">
				      	<!-- JQuery 를 통해 닉네임을 보여준다. -->
				      </span>
				  </div>
			 
			 </div><!-- close .modal-body .all-nickname-info-Parent-Box -->
				 
			  
			  <div class="modal-body all-member-role-info-Parent-Box">
			  
				   <div class="member-role-desc-text-box score-devision-title-box">
				      <span class="member-role-desc-text score-devision-title">
				      <span class="member-role-desc-text-icon material-symbols-outlined">developer_mode_tv</span>
				      	항목 추가자 직무
				      </span>
				   </div>
				   
				   <div class="checkbox-modal-member-role-box"> 
				      <span class="checkbox-modal-member-role">
				      <!-- JQuery 를 통해 직위를 보여준다. -->
				      </span>
				   </div>
				   
			  </div><!-- close .all-member-role-info-Parent-Box -->
		  </div><!-- close .all-nickname-member-role-Parent-Area -->
		  
		  <div class="modal-body all-score-devision-info-Parent-Box">
		  
			   <div class="score-devision-desc-text-box score-devision-title-box">
			      <span class="score-devision-desc-text score-devision-title">체크리스트 항목 전체 내용</span>
			   </div>
			   
			   <div class="checkbox-modal-content-box"> 
			      <span class="checkbox-modal-content">
			      <!-- JQuery 를 통해 체크리스트 항목을 보여준다. -->
			      </span>
			   </div>
			   
		  </div><!-- close .all-score-devision-info-Parent-Box -->
	  
	  
      </div>
	      
    </div>
  </div>
</div>



<!--▩▩▩▩▩▩▩[별점 입력 모달창]▩▩▩▩▩▩▩-->

<div class="modal fade" id="member-evaluation-modal" tabindex="-1" aria-labelledby="evaluation-modal-Label" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="evaluation-modal-Label">
        	<span class="evalu-member-nickname"></span> 멤버를 평가해 주세요!
        </h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <form action="member_Evaluation.action" method="get">
      
      	  <input type="hidden" class="a-ma-code-hidden" name="a_ma_code" value="">
      	  <input type="hidden" class="p-ma-code-hidden" name="p_ma_code" value="">
			<div class="evalu-guide-text-box">
	        	<span class="evalu-guide-text">*평가점수를 입력하지 않으시면, 3점이 부여됩니다.</span>
	       </div>
      		
      		<div class="modal-body member-all-evaluation-Parent-Area">
		      <div class="modal-body member-skill-evaluation-Area">
		        	
				<div class="member-skill-evaluation-box">
		     		<div class="score-devision-title-box">
		     			<span class="score-devision-title skill-score-title">실력 점수</span>
		     		</div>
		      		
		      		<fieldset class="evalu-star-radio-set skill-evaluation" id="ED0001">
		                 <input type="radio" id="skill-rating5" name="skill-evaluation-score" value="5"><label for="skill-rating5" title="5점"></label>
		                 <input type="radio" id="skill-rating4" name="skill-evaluation-score" value="4"><label for="skill-rating4" title="4점"></label>
		                 <input type="radio" id="skill-rating3" name="skill-evaluation-score" value="3"><label for="skill-rating3" title="3점"></label>
		                 <input type="radio" id="skill-rating2" name="skill-evaluation-score" value="2"><label for="skill-rating2" title="2점"></label>
		                 <input type="radio" id="skill-rating1" name="skill-evaluation-score" value="1"><label for="skill-rating1" title="1점"></label>
		            </fieldset>
		         </div>
		         
		      </div>
		      
		      
		      <div class="modal-body member-manner-evaluation-Area">
		      
		      	<div class="member-manner-evaluation-box">
		      		<div class="score-devision-title-box">
		      			<span class="score-devision-title manner-score-title">매너 점수</span>
		      		</div>
		      		
		      		<fieldset class="evalu-star-radio-set manner-evaluation" id="ED0002">
		                 <input type="radio" id="manner-rating5" name="manner-evaluation-score" value="5"><label for="manner-rating5" title="5점"></label>
		                 <input type="radio" id="manner-rating4" name="manner-evaluation-score" value="4"><label for="manner-rating4" title="4점"></label>
		                 <input type="radio" id="manner-rating3" name="manner-evaluation-score" value="3"><label for="manner-rating3" title="3점"></label>
		                 <input type="radio" id="manner-rating2" name="manner-evaluation-score" value="2"><label for="manner-rating2" title="2점"></label>
		                 <input type="radio" id="manner-rating1" name="manner-evaluation-score" value="1"><label for="manner-rating1" title="1점"></label>
		             </fieldset>
		      	</div>
		      
		      </div>
	      </div>
	     		
	      
	      <div class="member-evalu-buttons-Area">
	      	<button type="submit" class="member-evaluation-submit btn btn-outline-success btn-sm">평가 완료</button>
	      	<button type="button" class="member-evaluation-cancel btn btn-outline-danger btn-sm" data-bs-dismiss="modal" aria-label="Close">취소</button>
	      </div>
	      
      </form>
      
    </div>
  </div>
</div>


<!--▩▩▩▩▩▩▩[별점 입력 금지 안내문 모달창]▩▩▩▩▩▩▩-->
<div class="modal fade" id="dont-evaluation-modal" tabindex="-1" aria-labelledby="member-evalu-warning" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header dont-evaluation-title">
        <span class="modal-title fs-5" id="member-evalu-warning">이런!</span>
        <span class="modal-title fs-5 dont-try-evaluation">멤버 평가 입력이 불가능합니다!</span>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body dont-evaluation-content">
      	<span class="dont-evalu-member-nickname"></span>
      	멤버는 평가가 이미 완료된 회원이므로, 멤버 평가를 처리할 수 없습니다.
      </div>
    </div>
  </div>
</div>





<script type="text/javascript">

	const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
	const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
	
</script>



</body>
</html>