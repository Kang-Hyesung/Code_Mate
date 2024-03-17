/*====================
 *   Sample.java
 *   - 컨트롤러 객체
 ===================*/

package com.test.mvc;

import java.util.ArrayList;
import java.util.Map;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.mybatis.dao.IProjectApplyDAO;
import com.test.mybatis.dao.IProjectJoinDAO;
import com.test.mybatis.dto.MemberDTO;
import com.test.mybatis.dto.ProjectJoinDTO;



@Controller
public class ProjectApplyController
{	
	@Autowired
	private SqlSession sqlSession;
	
		
		
	// 개설 신청 클릭시
	@RequestMapping(value="/projectapplyform.action", method=RequestMethod.GET)
	public String projectapplyform(ModelMap model, HttpSession session, HttpServletRequest request)
	{	
			MemberDTO member = (MemberDTO)session.getAttribute("member");
		
			request.setAttribute("member", member);
			
			if (member == null)
			{
				return "redirect:Login.action";
			}
			else
			{
				return "/WEB-INF/view/projectApply/createProjectPage.jsp";
			}
	}
	
	// 신청하기 클릭시
	@RequestMapping(value="/projectapply.action", method=RequestMethod.GET)
	public String projectapply(ModelMap model, HttpSession session, HttpServletRequest request) throws ScriptException
	{	
			IProjectApplyDAO dao = sqlSession.getMapper(IProjectApplyDAO.class);
			MemberDTO member = (MemberDTO)session.getAttribute("member");
		
			request.setAttribute("member", member);
			
			String titletextarea = request.getParameter("titletextarea");
			String projectnametextarea = request.getParameter("projectnametextarea");
			String subcontextarea = request.getParameter("subcontextarea");
			String sdate = request.getParameter("sdate"); // 2024-03-12
			String edate = request.getParameter("edate"); // 2024-03-12
			String basic = request.getParameter("basic"); //[{"value":"rkrkrkrk"},{"value":"djdjdjdjd"}] 태그
			String back = request.getParameter("back");	  // 3  인원수(개설신청)
			String front = request.getParameter("front"); // 5	인원수(개설신청)
			String contextarea = request.getParameter("contextarea"); // 내용(개설신청)
			String skillscore1 = ""; // 백엔드
			String skillscore2 = ""; // 프론트
			String gender = "";
			String age = "";
			String inpnum = ""; // 43.3
			int num = 0;
			String mem_code = member.getMem_code();
			
			if (request.getParameter("skillscore1") != null || request.getParameter("skillscore2") != null || request.getParameter("gender") != null
				|| request.getParameter("age") != null || request.getParameter("inpnum") != null)
			{
				skillscore1 = request.getParameter("skillscore1");	//백엔드
				skillscore2 = request.getParameter("skillscore2"); // 프론트
				gender = request.getParameter("gender");
				age = request.getParameter("age");
				inpnum = request.getParameter("inpnum");
				num = Integer.parseInt(back)+ Integer.parseInt(front)+1; // 전체 인원수
			}
			System.out.println(back);
			
			dao.apinsert(titletextarea, subcontextarea, sdate, edate, contextarea, num, mem_code, projectnametextarea);
			
			
			String ap_code = dao.apselect(mem_code, titletextarea, subcontextarea);
			
			ScriptEngineManager sem = new ScriptEngineManager();
	        ScriptEngine engine = sem.getEngineByName("javascript");
	        
        	String testReform = basic.replace("[", "").replaceAll("]", "");
	        
	        String[] testJsonArr = testReform.split(",");
	        
	        String saveValue = "";
	        
	        for (String a : testJsonArr)
	        {
	        	
	        	//System.out.println("testJsonArr : " + a);
	        	//--==>> testJsonArr : {"value":"rkrkrkrk"}
	        	
	        	String script = "Java.asJSONCompatible(" + a + ")";
	        	Object result = engine.eval(script);
	        	Map<String, String> contents = (Map)result;
	        	
	        	saveValue = (String) contents.get("value");
	        	
	        	dao.taginsert(ap_code, saveValue);
	        	
	        }
			
	        // 백엔드 등급
	        
	        	 // 백엔드 등급 분류
		        String backgrade_code ="";
		       
		        
		        if (skillscore1.equals("1"))
				{
		        	backgrade_code = "GRADE0001";
				}
		        else if(skillscore1.equals("2"))
		        {
		        	backgrade_code = "GRADE0002";
		        }
		        else if(skillscore1.equals("3"))
		        {
		        	backgrade_code = "GRADE0003";
		        }
		        else if(skillscore1.equals("4"))
		        {
		        	backgrade_code = "GRADE0004";
		        }
		        else if(skillscore1.equals("5"))
		        {
		        	backgrade_code = "GRADE0005";
		        }
		        else if(skillscore1.equals("6"))
		        {
		        	backgrade_code = "GRADE0006";
		        }
		        else if(skillscore1.equals("7"))
		        {
		        	backgrade_code = "GRADE0007";
		        }
		        else
		        {
		        	backgrade_code = "";
		        }
			if (!skillscore1.equals(""))
			{
				dao.backgradeinsert(backgrade_code, ap_code);
				
			}	
			
			
	        
	        // 프론트  등급
	        	       
		        
		        // 프론트 분류
		        String frontgrade_code ="";
		        
		        
		        if (skillscore2.equals("1"))
		        {
		        	frontgrade_code = "GRADE0001";
		        }
		        else if(skillscore2.equals("2"))
		        {
		        	frontgrade_code = "GRADE0002";
		        }
		        else if(skillscore2.equals("3"))
		        {
		        	frontgrade_code = "GRADE0003";
		        }
		        else if(skillscore2.equals("4"))
		        {
		        	frontgrade_code = "GRADE0004";
		        }
		        else if(skillscore2.equals("5"))
		        {
		        	frontgrade_code = "GRADE0005";
		        }
		        else if(skillscore2.equals("6"))
		        {
		        	frontgrade_code = "GRADE0006";
		        }
		        else if(skillscore2.equals("7"))
		        {
		        	frontgrade_code = "GRADE0007";
		        }
		        else
		        {
		        	frontgrade_code = "";
		        }
		    if (!skillscore2.equals(""))
			{
		    	dao.frontgradeinsert(frontgrade_code, ap_code);
				
			}    
			
	        // 성별
	        
	        	 // 성별 분류
		        if (gender.equals("male"))
				{
					gender = "GENDER0001";
				}
		        else if (gender.equals("female"))
		        {
		        	gender = "GENDER0002";
		        }
		        else
		        {
		        	gender = "";
		        }
		        
	        if (!gender.equals(""))
			{
	        	dao.genderinsert(gender, ap_code);
				
			}	
			
	        // 연령대
        	
        		//연령대 구분
    	        if (age.equals("10"))
    			{
    				age = "AA0001";
    			}
    	        else if(age.equals("20"))
    	        {
    	        	age = "AA0002";
    	        }
    	        else if(age.equals("30"))
    	        {
    	        	age = "AA0003";
    	        }
    	        else if(age.equals("40"))
    	        {
    	        	age = "AA0004";
    	        }
    	        else if(age.equals("50"))
    	        {
    	        	age = "AA0005";
    	        }
    	        else if(age.equals("60"))
    	        {
    	        	age = "AA0006";
    	        }
    	        else
    	        {
    	        	age = "";
    	        }
        	if (!age.equals(""))
			{
        		dao.ageinsert(ap_code, age);
				
			}	
			
        	
	        // 매너
        	if (!inpnum.equals(""))
			{
        		
        		
	        	double inpnum1 = Double.parseDouble(inpnum); 
	        	dao.mannerinsert(inpnum1, ap_code);
			}
			
        	
        	// 직무 추가
        	if (!back.equals(""))
			{
				
        		int intback = Integer.parseInt(back);
        		int intfront = Integer.parseInt(front);
        		
        		//dao.leaderins(ap_code);
        		dao.backins(intback, ap_code);
        		dao.frontins(intfront, ap_code);
			}
			 
			
			return "redirect:ProjectList.action";
	}
	
	// 취소 클릭시
	@RequestMapping(value="/projectapplycancel.action", method=RequestMethod.GET)
	public String projectapplycancel(ModelMap model, HttpSession session, HttpServletRequest request)
	{	
			MemberDTO member = (MemberDTO)session.getAttribute("member");
		
			request.setAttribute("member", member);
			

			return "redirect:ProjectList.action";
	}
	
	// 프로젝트 클릭시
	@RequestMapping(value="/project.action", method=RequestMethod.GET)
	public String projectselect(ModelMap model, HttpSession session, HttpServletRequest request, String ap_code)
	{	
			MemberDTO member = (MemberDTO)session.getAttribute("member");
			System.out.println("-2");
			request.setAttribute("member", member);
			System.out.println("-1");
			IProjectJoinDAO dao = sqlSession.getMapper(IProjectJoinDAO.class);
			System.out.println("0");
			// 프로젝트
			
			model.addAttribute("project",dao.project(ap_code));
			System.out.println("1");
			
			// 뷰 업데이트
			
			model.addAttribute("updatepj",dao.updatepj(ap_code));
			System.out.println("2");
			
			// 태그
			
			model.addAttribute("tag",dao.tag());
			System.out.println("3");
			
			// 프론트 백 인원수 가져오기
			
			model.addAttribute("frontnum",dao.frontnum(ap_code)); // 프론트
			
			model.addAttribute("backnum",dao.backnum(ap_code)); // 백
			
			System.out.println("4");
			
			// 댓글
			
			model.addAttribute("comment",dao.comment());
			System.out.println("5");
			
			// 핫한 프로젝트
			
			model.addAttribute("hotpj",dao.hotpj());
			System.out.println("6");
			
			// 새로운 프젝
			
			model.addAttribute("newpj",dao.newpj());
			System.out.println("7");
			
			// 왼쪽 태그들
			model.addAttribute("lefttag",dao.lefttag());
			System.out.println("8");
			
			// 점수들
			
			String mem_code = dao.project(ap_code).getMem_code();
			
			model.addAttribute("score",dao.score(mem_code));
			System.out.println("9");
			// 조건
			int age = 0;
			String front = "";
			String back = "";
			String gender = ""; 
			double manner = 0.0;
			
			// 나이 조건
			if (Integer.toString(dao.agecondition(ap_code))!=null)
			{
				model.addAttribute("agecondition",dao.agecondition(ap_code));
				
			}
			else {
				model.addAttribute("agecondition",age);
				
			}
			System.out.println("10");
			
			// 프론트 조건
			if (dao.frontcondition(ap_code)!=null)
			{
				model.addAttribute("frontcondition",dao.frontcondition(ap_code));
				
			}
			else
			{
				model.addAttribute("frontcondition",front);
			}
			System.out.println("11");
			
			// 백엔드 조건
			if (dao.backcondition(ap_code)!=null)
			{
				model.addAttribute("backcondition",dao.backcondition(ap_code));
				
			}
			else
			{
				model.addAttribute("backcondition",back);
			}
			System.out.println("12");
			
			// 성별 조건
			if (dao.gendercondition(ap_code)!=null)
			{
				model.addAttribute("gendercondition",dao.gendercondition(ap_code));
				
			}
			else
			{
				model.addAttribute("gendercondition",gender);
			}
			System.out.println("13");
			
			// 매너 점수 조건
			if (Double.toString(dao.mannercondition(ap_code))!=null)
			{
				model.addAttribute("mannercondition",dao.mannercondition(ap_code));
				
			}
			else
			{
				model.addAttribute("mannercondition",gender);
			}
			System.out.println("14");
			
			// RC코드, 인원수 (프론트)
			ProjectJoinDTO frcnumlists = dao.frcnumlists(ap_code);
			String frc_code = frcnumlists.getRc_code();
			int fnum = frcnumlists.getRc_number();
			
			// RC코드, 인원수 (백엔드)
			ProjectJoinDTO brcnumlists = dao.brcnumlists(ap_code);
			String brc_code = brcnumlists.getRc_code();
			int bnum = brcnumlists.getRc_number();
			
			System.out.println("15");
			
			// 멤버 지원 추가 (프론트)프론트 rc 넣기
			//model.addAttribute("fmemapply",dao.fmemapply(ap_code, frc_code));
			
			// 멤버 지원 추가 (백엔드)백엔드 rc 넣기
			//model.addAttribute("bmemapply",dao.bmemapply(ap_code, brc_code));
			
			// 리스트(미정)
			model.addAttribute("lists",dao.lists(ap_code));
			
			// 리스트(확정)
			model.addAttribute("haplists",dao.haplists(ap_code));
			
			// 멤버 지원 -> 확정(백엔드)
			//model.addAttribute("bmemupdate",dao.bmemupdate(ap_code, brc_code));
			
			
			// 멤버 지원 -> 확정(프론트)
			//model.addAttribute("fmemupdate",dao.fmemupdate(ap_code, frc_code));
			
			// 확정 인원수(백엔드)
			model.addAttribute("bcount",dao.bcount(ap_code));
			
			// 확정 인원수(프론트)
			model.addAttribute("fcount",dao.fcount(ap_code));
			
			model.addAttribute("ap_code",ap_code);
			
			System.out.println("16");
			
			return "/WEB-INF/view/projectApply/projectJoinPage.jsp";
	}
	
	
	// 프론트 추가
	@RequestMapping(value="/frontinsert.action", method=RequestMethod.POST)
	public String frontinsert(ModelMap model, HttpSession session, HttpServletRequest request)
	{	
			MemberDTO member = (MemberDTO)session.getAttribute("member");
		
			IProjectJoinDAO dao = sqlSession.getMapper(IProjectJoinDAO.class);
			String ap_code = request.getParameter("front");
			
			//System.out.println(ap_code);
			
			ProjectJoinDTO frcnumlists = dao.frcnumlists(ap_code);
			String frc_code = frcnumlists.getRc_code();
			System.out.println(frc_code);
			System.out.println(member.getMem_code());
			
			// 멤버 지원 추가 (프론트)프론트 rc 넣기
			dao.fmemapply(member.getMem_code(), frc_code);
			System.out.println("성공");
			return "redirect:project.action?ap_code="+ap_code;
			
	}
	
	// 백엔드 추가
	@RequestMapping(value="/backinsert.action", method=RequestMethod.POST)
	public String backinsert(ModelMap model, HttpSession session, HttpServletRequest request)
	{	
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		IProjectJoinDAO dao = sqlSession.getMapper(IProjectJoinDAO.class);
		String ap_code = request.getParameter("back");
		
		ProjectJoinDTO brcnumlists = dao.brcnumlists(ap_code);
		String brc_code = brcnumlists.getRc_code();
		
		// 멤버 지원 추가 (백엔드)백엔드 rc 넣기
		dao.bmemapply(member.getMem_code(), brc_code);
		
		return "redirect:project.action?ap_code="+ap_code;
		
	}
	
	// 멤버 확정
	@RequestMapping(value="/update.action", method=RequestMethod.POST)
	public String fbupdate(ModelMap model, HttpSession session, HttpServletRequest request)
	{	
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		IProjectJoinDAO dao = sqlSession.getMapper(IProjectJoinDAO.class);
		
		String ap_code = request.getParameter("update");
		String mem_code = request.getParameter("updatemem");
		String mr_code = request.getParameter("updatemr");
		
		
		
		System.out.println(mem_code);
		System.out.println(mr_code);
		
		
		
		
		String rc_code = dao.rccode(mr_code, ap_code);
		
		
		System.out.println(rc_code);
		
		
		// 업데이트
		dao.bmemupdate(rc_code, mem_code);
		
		
		
		
		return "redirect:project.action?ap_code="+ap_code;
		
	}
		
 @Scheduled(fixedDelay = 1000)
 public void hello() {
	 
	 System.out.println("test");
 }
}



