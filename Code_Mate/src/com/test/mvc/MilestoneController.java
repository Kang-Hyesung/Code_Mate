package com.test.mvc;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Map;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.mybatis.MyPageMethod;
import com.test.mybatis.dao.IMemberDAO;
import com.test.mybatis.dao.IMilestoneDAO;
import com.test.mybatis.dao.IMyPageDAO;
import com.test.mybatis.dto.MemberDTO;
import com.test.mybatis.dto.Milestone_CheckListDTO;
import com.test.mybatis.dto.Milestone_MemberEvaluDTO;

import jdk.nashorn.internal.parser.JSONParser;

@Controller
public class MilestoneController
{
	@Autowired
	private SqlSession sqlSession;
	
	//=================================================================================================
	// [마일스톤 페이지 첫 요청시, 체크리스트 요소들을 모델에 담아서 뿌려준다.]
	//=================================================================================================

	@RequestMapping(value = "/Milestone.action", method = RequestMethod.GET)
	public String milestonePage(ModelMap model, HttpSession session, HttpServletRequest request)
	{
		IMilestoneDAO dao = sqlSession.getMapper(IMilestoneDAO.class);
		IMyPageDAO myDao = sqlSession.getMapper(IMyPageDAO.class);
		MyPageMethod mpm = new MyPageMethod();
		
		//[ 로그인한 회원의 MEM_CODE 와, 진입한 참여 프로젝트의 개설확정 코드 CP_CODE를 이용해
		//  멤버 지원 코드 얻어내기 ]============================================================
		
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		int backendScore;
		int frontendScore;
		ArrayList<Milestone_MemberEvaluDTO> memberEvaluList;
		String memberRole;
		
		
		if (member != null)
		{
			model.addAttribute("ma_code", dao.searchMyMaCode(member.getMem_code(), "CP0001"));
			
			backendScore = myDao.backendScore(member.getMem_code());
			frontendScore = myDao.frontendScore(member.getMem_code());
			
			// 로그인한 회원의 백엔드 / 프론트엔드 점수 모델에 저장.
			model.addAttribute("backendScore", backendScore);
			model.addAttribute("frontendScore", frontendScore);
			
			// 로그인한 회원을 제외한 팀원 평가 항목 리스트 모델에 저장.
			memberEvaluList = dao.milestoneMemberEvaluation("CP0001", member.getMem_code());
			
			// 로그인한 회원의 직무 모델에 저장.
			memberRole = dao.whatIsMyMemberRole("CP0001", member.getMem_code());
			
			System.out.println("로그인한 회원의 직무 : " + memberRole);
		}
		else
		{
			// 로그인 정보가 없을 경우, 임시로 임의 회원 정보 보내기
			//------------------------------
			// MEM_CODE : MEM0001
			// ID 		: QWE
			// PW 		: 123
			//------------------------------
			model.addAttribute("ma_code", "MA0001");
			memberEvaluList = dao.milestoneMemberEvaluation("CP0001", "MEM0001");
			memberRole = dao.whatIsMyMemberRole("CP0001", "MEM0001");
		}
		
		
		
		model.addAttribute("planCheckList", dao.milestone_checkList("CP0001", "기획"));
		model.addAttribute("designCheckList", dao.milestone_checkList("CP0001", "설계"));
		model.addAttribute("implementCheckList", dao.milestone_checkList("CP0001", "구현"));
		model.addAttribute("settlementCheckList", dao.milestone_checkList("CP0001", "결산"));
		
		model.addAttribute("planInitialPercent", dao.milestoneOkPercent("기획", "CP0001"));
		model.addAttribute("designInitialPercent", dao.milestoneOkPercent("설계", "CP0001"));
		model.addAttribute("implementInitialPercent", dao.milestoneOkPercent("구현", "CP0001"));
		model.addAttribute("settlementInitialPercent", dao.milestoneOkPercent("결산", "CP0001"));
		
		
		//[전체 마일스톤 완료 퍼센트 총합값 전달]===========================
		int total_percent = dao.allMileStoneTotalPercent("CP0001");
		model.addAttribute("total_percent", total_percent);
		
		//[멤버 평가를 위한 프로젝트 참여 멤버 정보 전송하기]
		
		//================================================================================
		// 1. 스킬 등급 아이콘 url 문자열 변수 『backGradeIcon, frontGradeIcon』이
		//    set 되지 않은 형태의 ArrayList<Milestone_MemberEvaluDTO> 반환받기.
		//================================================================================
		
		//================================================================================
		// 2. 반환받은 ArrayList의 size() 만큼 for 문을 돌면서,
		//    backGradeIcon, frontGradeIcon 변수 set 하기
		// --------------------------------------------------------------------------
		//    → MyPageMethod : String[] skillGradeIcon(String cp, int skillScore)
		//================================================================================
		
		
		model.addAttribute("memberEvaluList", memberEvaluList);
		model.addAttribute("memberRole", memberRole);
		
		
		return "/WEB-INF/view/project/MileStoneDB.jsp";
		
	}
	
	//=================================================================================================
	// [체크리스트 항목 체크시, 업데이트 실행]
	//=================================================================================================
	@ResponseBody
	@RequestMapping(value = "/check.action", method = RequestMethod.POST)
	public String checkingAction(String checklist_code)
	{
		IMilestoneDAO dao = sqlSession.getMapper(IMilestoneDAO.class);
		
		int isCheckedNum = dao.isChecked(checklist_code);
		String is_checked_code = "";
		
		// 『is_checked_code』 설정 ========
		// [CC0001] : 체크 안된 상태
		// [CC0002] : 체크한 상태
		// =================================
		
		// 체크가 안 된 상태라면, 체크한 상태로 변경할 수 있도록 문자열 지정
		if (isCheckedNum == 0)
		{
			is_checked_code = "CC0002";
		}
		// 체크가 된 상태라면, 체크가 안 된 상태로 변경할 수 있도록 문자열 지정
		else if (isCheckedNum == 1)
		{
			is_checked_code = "CC0001";
		}
		
		dao.checkingAction(checklist_code, is_checked_code);
		
		System.out.println("[체크리스트 체크] 체크리스트 변경 완료~!!!");
		
		String stepAndCpCodeStr = dao.ckCodeToStepCpCode(checklist_code);
		
		//System.out.println("대분류명/개설확정코드 : " + test);
		//--==>> 대분류명/개설확정코드 : 기획/CP0001
		
		String[] stepAndCpCodeArr = stepAndCpCodeStr.split("/");
		
		String step = stepAndCpCodeArr[0];
		String prj_cp_code = stepAndCpCodeArr[1];
		
		//System.out.println("[체크리스트 체크] 마일스톤 대분류명 : " + stepName);
		//--==>> [체크리스트 체크] 마일스톤 대분류명 : 설계
		
		//System.out.println("[체크리스트 체크] 개설확정코드 : " + prjCpCode);
		//--==>> [체크리스트 체크] 개설확정코드 : CP0001
		
		String milePercentage = dao.milestoneOkPercent(step, prj_cp_code);
		int mileTotPercentage = dao.allMileStoneTotalPercent(prj_cp_code);
		
		
		System.out.println("[체크리스트 체크] 마일스톤 완료 퍼센트 반환 : " + milePercentage);
		System.out.println("[체크리스트 체크] 마일스톤 전체 대분류 항목 완료 퍼센트 총합 값 반환 : " + mileTotPercentage);
		
		StringBuffer sb = new StringBuffer();
		
		sb.append("{\"step\" : " + "\"" + step + "\"");
		sb.append(", \"percent\" : " + "\"" + milePercentage + "\"");
		sb.append(", \"total_percent\" : " + "\"" + mileTotPercentage + "\"}");
		
		
		return sb.toString();
		
		
	}
	
	
	//=================================================================================================
	// [체크리스트 항목을 추가하는 액션 처리]
	//=================================================================================================
	@RequestMapping(value = "/checklist_insert.action", method = RequestMethod.POST)
	public String checklistInsertingAction(String v_cp_code, String v_ma_code, String v_step, String v_content)
	{
		System.out.println("1");
		//(String v_cp_code, String v_ma_code, String v_step, String v_content)
		IMilestoneDAO dao = sqlSession.getMapper(IMilestoneDAO.class);
		
		//System.out.println("컨트롤러 동작 확인");
		
		System.out.println("[체크리스트 항목 추가] 개설확정코드 : " + v_cp_code);
		System.out.println("[체크리스트 항목 추가] 멤버지원코드 : " + v_ma_code);
		System.out.println("[체크리스트 항목 추가] 단계 : " + v_step);
		System.out.println("[체크리스트 항목 추가] 내용 : " + v_content);

		dao.checkListInserting(v_cp_code, v_ma_code, v_step, v_content);
		
		
		return "redirect:Milestone.action";
	}

	
	//[체크리스트 수정 버튼 클릭시, 이전 데이터 값 뿌려주기]=================================
	@ResponseBody
	@RequestMapping(value = "/checklist_edit.action", method = RequestMethod.POST)
	public String checklistEditAction(String checklist_code)
	{
		
		IMilestoneDAO dao = sqlSession.getMapper(IMilestoneDAO.class);
		
		String checklist_content = dao.searchCheckList(checklist_code);
		
		System.out.println("[체크리스트 수정 클릭] 넘어온 코드 값   : " + checklist_code);
		System.out.println("[체크리스트 수정 클릭] 클릭한 항목 내용 : " + checklist_content);
		
		return checklist_content;
	}
	
	
	//[체크리스트 수정 액션]===================================================================
	@RequestMapping(value = "/checklist_edit_ok.action", method = RequestMethod.GET)
	public String checklistEditOkAction(String ma_code, String checklist_code, String checklist_content) throws ScriptException
	{
		IMilestoneDAO dao = sqlSession.getMapper(IMilestoneDAO.class);
		
		System.out.println("체크 코드 : " + checklist_code);
		System.out.println("멤버 지원 코드 : " + ma_code);
		System.out.println("체크 리스트 내용 : " + checklist_content);
		
		dao.checkListEditOk(checklist_code, ma_code, checklist_content);
		
		return "redirect:Milestone.action";
	}
	
	//[체크리스트 삭제 액션]===================================================================
	@RequestMapping(value = "/checklist_delete_ok.action", method = RequestMethod.POST)
	public String checklistDeleteOkAction(String checklist_code)
	{
		IMilestoneDAO dao = sqlSession.getMapper(IMilestoneDAO.class);
		
		System.out.println("[체크리스트 삭제] 삭제할 체크리스트 코드 : " + checklist_code);
		
		dao.checkListDelOk(checklist_code);
		
		return "redirect:Milestone.action";
		
	}
	
	
	@RequestMapping(value = "/member_Evaluation.action", method = RequestMethod.GET)
	public String memberEvaluInsertAction(HttpServletRequest request)
	{
		IMilestoneDAO dao = sqlSession.getMapper(IMilestoneDAO.class);
		
		String evaSkillScore = request.getParameter("skill-evaluation-score");
		String evaMannerScore = request.getParameter("manner-evaluation-score");
		String a_ma_code = request.getParameter("a_ma_code");
		String p_ma_code = request.getParameter("p_ma_code");
		
		int skillScore = 0;
		int mannerScore = 0;
		
		System.out.println("평가자[A] 멤버 지원 코드 수신 : " + a_ma_code);
		System.out.println("평가자[P] 멤버 지원 코드 수신 : " + p_ma_code);
		System.out.println("실력 점수 수신 : " + evaSkillScore);
		System.out.println("매너 점수 수신 : " + evaMannerScore);
		
		if (evaSkillScore == null)
		{
//			System.out.println("실력 점수 평가하지 않음.");
			skillScore = 3;
		}
		else
		{
			skillScore = Integer.parseInt(evaSkillScore);
		}
		
		if (evaMannerScore == null)
		{
//			System.out.println("매너 점수 평가하지 않음.");
			mannerScore = 3;
		}
		else
		{
			mannerScore = Integer.parseInt(evaMannerScore);
		}
		
		// [실력 점수 INSERT]
		dao.memberEvaluScore(a_ma_code, p_ma_code, "ED0001", skillScore);
		
		// [매너 점수 INSERT]
		dao.memberEvaluScore(a_ma_code, p_ma_code, "ED0002", mannerScore);
		
		
		return "redirect:Milestone.action";
	}
	

}
