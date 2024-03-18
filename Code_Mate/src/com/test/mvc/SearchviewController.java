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
import com.test.mybatis.dao.IProjectPageDAO;
import com.test.mybatis.dao.ISearchViewDAO;
import com.test.mybatis.dto.MemberDTO;
import com.test.mybatis.dto.ProjectJoinDTO;



@Controller
public class SearchviewController
{	
	@Autowired
	private SqlSession sqlSession;
	
		
		
	// 검색 버튼 클릭시
	@RequestMapping(value="/search.action", method=RequestMethod.GET)
	public String search(ModelMap model, HttpSession session, HttpServletRequest request, String searchcon)
	{	
			MemberDTO member = (MemberDTO)session.getAttribute("member");
			
			ISearchViewDAO dao = sqlSession.getMapper(ISearchViewDAO.class);
			
			// 검색어
			model.addAttribute("searchcon",searchcon);
			
			// 프로젝트 검색
			model.addAttribute("pjlist",dao.pjlist(searchcon));
			
			// QNA 검색
			model.addAttribute("qnalist",dao.qnalist(searchcon));
			
			// 프로젝트 댓글
			model.addAttribute("pjcomment",dao.pjcomment());
			
			// QNA 댓글
			model.addAttribute("qnacomment",dao.qnacomment());
			
			// 핫한 프로젝트
			model.addAttribute("hotpj",dao.hotpj());
			
			// 태그
			model.addAttribute("tag",dao.tag());
			System.out.println("1");
			
			// 프젝 카운트
			model.addAttribute("pjcount",dao.pjcount(searchcon));
			System.out.println("2");
			
			// qna 카운트
			model.addAttribute("qnacount",dao.qnacount(searchcon));
			System.out.println("3");
			
			int pjcount = dao.pjcount(searchcon);
			int qnacount = dao.qnacount(searchcon);
			int allcount = pjcount + qnacount;
			
			
			System.out.println("4");
			
			// 전체 카운트
			model.addAttribute("allcount",allcount);
			
			System.out.println("5");
			
			return "/WEB-INF/view/projectApply/searchView.jsp";
	}
	
	
		
 @Scheduled(fixedDelay = 1000)
 public void hello() {
	 
	 System.out.println("test");
 }
}



