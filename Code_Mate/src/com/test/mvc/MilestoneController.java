package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.mybatis.dao.IMilestoneDAO;
import com.test.mybatis.dto.MemberDTO;
import com.test.mybatis.dto.Milestone_CheckListDTO;

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
		
		//MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		model.addAttribute("planCheckList", dao.milestone_checkList("CP0001", "기획"));
		model.addAttribute("designCheckList", dao.milestone_checkList("CP0001", "설계"));
		model.addAttribute("implementCheckList", dao.milestone_checkList("CP0001", "구현"));
		model.addAttribute("settlementCheckList", dao.milestone_checkList("CP0001", "결산"));
		
		return "/WEB-INF/view/project/MileStoneDB.jsp";
		
	}
	
	//=================================================================================================
	// [체크리스트 항목 체크시, 업데이트 실행]
	//=================================================================================================
	@RequestMapping(value = "/check.action", method = RequestMethod.POST)
	public void checkingAction(String checklist_code)
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
		
		System.out.println("체크리스트 변경 완료~!!!");
		
	}
	
	
	//=================================================================================================
	// [체크리스트 항목을 추가하는 액션 처리]
	//=================================================================================================
	@RequestMapping(value = "/checklist_insert.action", method = RequestMethod.POST)
	public String checklistInsertingAction(String v_cp_code, String v_ma_code, String v_step, String v_content)
	{
		//(String v_cp_code, String v_ma_code, String v_step, String v_content)
		IMilestoneDAO dao = sqlSession.getMapper(IMilestoneDAO.class);
		
		System.out.println("컨트롤러 동작 확인");
		
		System.out.println("개설확정코드 : " + v_cp_code);
		System.out.println("멤버지원코드 : " + v_ma_code);
		System.out.println("단계 : " + v_step);
		System.out.println("내용 : " + v_content);

		dao.checkListInserting(v_cp_code, v_ma_code, v_step, v_content);
		
		
		return "redirect:Milestone.action";
	}
	
	
}
