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
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.mybatis.dao.IProjectApplyDAO;
import com.test.mybatis.dao.IProjectListDAO;
import com.test.mybatis.dto.MemberDTO;

import jdk.nashorn.internal.parser.JSONParser;


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
			String skillscore = request.getParameter("skillscore"); // 1 닫아도 값이 나온다
			String gender = request.getParameter("gender");
			String age = request.getParameter("age");
			String inpnum = request.getParameter("inpnum"); // 43.3
			int num = Integer.parseInt(back)+ Integer.parseInt(front)+1; // 전체 인원수
			
			if (titletextarea!=null && subcontextarea!=null && sdate!=null && edate!=null && contextarea!=null && back!=null && front!=null && projectnametextarea!=null
				&& titletextarea!="" && subcontextarea!="" && sdate!="" && edate!="" && contextarea!="" && back!="" && front!="" && projectnametextarea!="")
			{
				dao.apinsert(titletextarea, subcontextarea, sdate, edate, contextarea, num, member.getMem_code(), projectnametextarea);
				
				
				String ap_code = dao.apselect(member.getMem_code(), titletextarea, subcontextarea);
				
				
				ScriptEngineManager sem = new ScriptEngineManager();
		        ScriptEngine engine = sem.getEngineByName("javascript");
		        if (basic!=null || basic !="")
				{
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
				}
		        
		        
		        
		        // 등급 분류
		        String grade_code ="";
		        
		        if (skillscore.equals("1"))
				{
		        	grade_code = "GRADE0001";
				}
		        else if(skillscore.equals("2"))
		        {
		        	grade_code = "GRADE0002";
		        }
		        else if(skillscore.equals("3"))
		        {
		        	grade_code = "GRADE0003";
		        }
		        else if(skillscore.equals("4"))
		        {
		        	grade_code = "GRADE0004";
		        }
		        else if(skillscore.equals("5"))
		        {
		        	grade_code = "GRADE0005";
		        }
		        else if(skillscore.equals("6"))
		        {
		        	grade_code = "GRADE0005";
		        }
		        else if(skillscore.equals("7"))
		        {
		        	grade_code = "GRADE0005";
		        }
		        
		        // 등급		MR_CODE 어떻게 할지?
		        if (skillscore != null || skillscore !="")
				{
					dao.gradeinsert(grade_code, ap_code);
				}
		        
		        
		        
		        // 성별 분류
		        if (gender.equals("male"))
				{
					gender = "GENDER0001";
				}
		        else
		        {
		        	gender = "GENDER0002";
		        }
		        
		        // 성별
		        if (gender != null || gender !="")
		        {
		        	dao.genderinsert(gender, ap_code);
		        }
		        
		        
		        
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
		        
		        // 연령대
		        if (age != null || age !="")
		        {
		        	dao.ageinsert(ap_code, age);
		        }
		        
		        
		        	        
		        
		        // 매너
		        if (inpnum != null || inpnum !="")
		        {
		        	double inpnum1 = Double.parseDouble(inpnum); 
		        	dao.mannerinsert(inpnum1, ap_code);
		        }
				
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
	
		
 @Scheduled(fixedDelay = 1000)
 public void hello() {
	 
	 System.out.println("test");
 }
}



