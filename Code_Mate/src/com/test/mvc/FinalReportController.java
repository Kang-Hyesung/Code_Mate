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
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.mybatis.dao.IFinalReportDAO;
import com.test.mybatis.dao.IMyPageDAO;
import com.test.mybatis.dto.FinalReport_PTagDTO;
import com.test.mybatis.dto.FinalReport_ReportDTO;
import com.test.mybatis.dto.MemberDTO;

@Controller
public class FinalReportController
{
	@Autowired
	private SqlSession sqlSession;

	// [결산 보고서 페이지 접근 요청]=============================================
	@RequestMapping(value = "/finalReportPage.action", method = RequestMethod.GET)
	public String finalReportPage(ModelMap model, HttpSession session, String cp_code)
	{
		//=======================
		// ※ 임시 정적 데이터
		//=======================
		//cp_code = "CP0001";
		//=======================
		
		IFinalReportDAO dao = sqlSession.getMapper(IFinalReportDAO.class);
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		
		
		int backendScore;
		int frontendScore;
		
		IMyPageDAO myDao = sqlSession.getMapper(IMyPageDAO.class);
		
		if (member != null)
		{
			backendScore = myDao.backendScore(member.getMem_code());
			frontendScore = myDao.frontendScore(member.getMem_code());
			
			// 로그인한 회원의 백엔드 / 프론트엔드 점수 모델에 저장.
			model.addAttribute("backendScore", backendScore);
			model.addAttribute("frontendScore", frontendScore);
			
		}
		// 점수 끝
		
		String mem_code = "";
		
		if (member != null)
		{
			mem_code = member.getMem_code();
		}
		else
		{
			//=======================
			// ※ 임시 정적 데이터
			//=======================
			//mem_code = "MEM0001";
			//=======================
		}
		
		//*******************************************************************
		// ● [결산 보고서를 이미 작성하였는지 확인]
		//*******************************************************************
		String isFinalReportExist = dao.didYouFinalReportWrite(cp_code);

		
		System.out.println("[결산 리포트 페이지 요청] 결산 보고서 작성 여부 : " + isFinalReportExist);
		//--==>> [페이지요청] 결산 보고서 작성 여부 : 미작성
		

		//*******************************************************************
		// ● [작성자가 팀장인지 확인]
		//*******************************************************************
		String memberRole = dao.whatIsMyMemberRole(cp_code, mem_code);
		
		System.out.println("[결산 리포트 페이지 요청] 이 페이지에 접근한 멤버 직위 : " + memberRole);
		
		model.addAttribute("cp_code", cp_code);
		model.addAttribute("isFinalFinalReportExist", isFinalReportExist);
		model.addAttribute("memberRole", memberRole);
		
		//***************************************************************
		// 결산 보고서 DTO 객체를 모델맵에 저장.
		//***************************************************************
		FinalReport_ReportDTO finalReport = dao.finalReportShow(cp_code);
		model.addAttribute("finalReport", finalReport);
		
		
		//***************************************************************
		// 결산 보고서 스킬 태그 리스트를 모델맵에 저장.
		//***************************************************************
		ArrayList<FinalReport_PTagDTO> pTagList = dao.finalReportTagList(cp_code);
		model.addAttribute("pTagList", pTagList);
		
		
		return "/WEB-INF/view/project/FinalReport.jsp";
	}
	
	
	// [결산 보고서 Insert 액션]==================================================
	@RequestMapping(value = "/finalReport_write.action", method = RequestMethod.GET)
	public String finalReportWriteAction(HttpServletRequest request, HttpServletResponse response
									 , HttpSession session , String cp_code, ModelMap model) throws UnsupportedEncodingException, ScriptException
	{
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		
		IFinalReportDAO dao = sqlSession.getMapper(IFinalReportDAO.class);
		
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		
    	//cp_code = (String)request.getAttribute("cp_code");
		
		String hidden_cp_code = request.getParameter("cp_code");
    	
    	System.out.println(hidden_cp_code);
		int backendScore;
		int frontendScore;
		
		IMyPageDAO myDao = sqlSession.getMapper(IMyPageDAO.class);
		
		if (member != null)
		{
			backendScore = myDao.backendScore(member.getMem_code());
			frontendScore = myDao.frontendScore(member.getMem_code());
			
			// 로그인한 회원의 백엔드 / 프론트엔드 점수 모델에 저장.
			model.addAttribute("backendScore", backendScore);
			model.addAttribute("frontendScore", frontendScore);
			
		}
		// 점수 끝
		
		String mem_code = null;
		
		if (member != null)
		{
			mem_code = member.getMem_code();
		}
		else
		{
			//=======================
			// ※ 임시 정적 데이터
			//=======================
			//mem_code = "MEM0001";
			//=======================
		}
		
		//=======================
		// ※ 임시 정적 데이터
		//=======================
		//cp_code = "CP0001";
		//=======================
		
		
		ScriptEngineManager sem = new ScriptEngineManager();
		ScriptEngine engine = sem.getEngineByName("javascript");
		


		String report_title = request.getParameter("report_title"); 
		String report_content = request.getParameter("report_content"); 
		String all_skill_tagList = request.getParameter("all_skill_tagList");
		
		
		System.out.println("결산 보고서 제목 : " + report_title);
		System.out.println("결산 보고서 내용 : " + report_content);
		System.out.println("결산 보고서 전체 스킬 태그 json Object : " + all_skill_tagList);
		
		//================================================================
		// ① [결산 보고서 INSERT]
		//================================================================
		dao.finalReportWrite(cp_code, report_title, report_content);
		//================================================================

		//================================================================
		// ② [이번 포트폴리오 코드 구하기]
		//================================================================
		String now_p_code = "";
		
		now_p_code = dao.nowPortfolioCode();
		//================================================================
		
		//================================================================
		// ③ [포트폴리오 INSERT]
		//================================================================
		dao.portFolioWrite(now_p_code, hidden_cp_code, mem_code, report_title, report_content);
		//================================================================
		
		
		//================================================================
		// ④ [포트폴리오 태그 INSERT]
		//================================================================
		
		all_skill_tagList = all_skill_tagList.replace("[", "").replaceAll("]", "");
		
		String[] all_skill_tagArr = all_skill_tagList.split(",");
		
		String one_skill_tag = "";
		
		for (String tag : all_skill_tagArr)
		{
			String script = "Java.asJSONCompatible(" + tag + ")";
			Object result = engine.eval(script);
			Map tagMap = (Map) result;
			
			one_skill_tag = (String) tagMap.get("value");
			
			// [클라이언트가 입력한 태그를 INSERT]====================
			dao.portFolioAddTag(now_p_code, one_skill_tag);
			//========================================================
			
			System.out.println("하나의 스킬 태그 : " + one_skill_tag);
			
		}
		
	
		
		return "redirect:finalReportPage.action?cp_code=" + cp_code;
		
		
	}
}
