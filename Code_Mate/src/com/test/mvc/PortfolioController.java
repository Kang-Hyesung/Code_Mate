/*================================================
 * PortfolioController.java
 *  - 사용자 정의 컨트롤러 클래스 (포트폴리오)
 =================================================*/

package com.test.mvc;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
// ※ Spring 의 Controller 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성한다.
//    cf. Controller Annotation 활용

import com.test.mybatis.dao.IPortfolioDAO;
import com.test.mybatis.dto.MemberDTO;
import com.test.mybatis.dto.PortfolioDTO;

@Controller
public class PortfolioController
{	
	@Autowired
	private SqlSession sqlSession;
	
	// 포트폴리오 리스트
	@RequestMapping(value="/portfoliolist.action", method=RequestMethod.GET)
	public String hello(HttpServletRequest request)
	{	
		IPortfolioDAO dao = sqlSession.getMapper(IPortfolioDAO.class);
		
		List<PortfolioDTO> list = dao.getLists();
		request.setAttribute("list", list);
				
		return "/WEB-INF/view/portfolio/PortfolioList.jsp";
	}
	
	// 포트폴리오 뷰 
	@RequestMapping(value="/portfolioview.action", method=RequestMethod.GET)
	public String viewArticle(HttpServletRequest request, HttpSession session)
	{	
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		String p_code = request.getParameter("article");
		String mem_code = null;
			
		IPortfolioDAO dao = sqlSession.getMapper(IPortfolioDAO.class);
		
		String leader = dao.findLeader(p_code);
		request.setAttribute("leader", leader);
		
		List<HashMap<String, String>> frontList = dao.findFront(p_code);
		request.setAttribute("frontList", frontList);
		
		List<HashMap<String, String>> backList = dao.findBack(p_code);
		request.setAttribute("backList", backList);
		
		dao.viewsUp(p_code);
		
		
		if(member != null)
		{
			request.setAttribute("member", member);
			mem_code = member.getMem_code();
						
			int heartsFlag = dao.findLike(mem_code, p_code);
			request.setAttribute("heartsFlag", heartsFlag);
		}
		
		PortfolioDTO dto = dao.getReadData(p_code);
		
		request.setAttribute("list", dto);
		
		List<HashMap<String, String>> skillTagList = dao.getSkillTagList(p_code);
						
		request.setAttribute("skillTagList", skillTagList);
				
		return "/WEB-INF/view/portfolio/PortfolioView.jsp";
	}
	
	// 포트폴리오 좋아요 취소
	@RequestMapping(value="/likeDown.action", method=RequestMethod.GET)
	@ResponseBody
	public String likeDown(HttpServletRequest request, HttpSession session, String p_code, String mem_code)
	{	
		String result = "";
		
		IPortfolioDAO dao = sqlSession.getMapper(IPortfolioDAO.class);
		
		dao.likeDown(p_code, mem_code);
		result = String.valueOf(dao.likeCount(p_code));
						
		return result;
		
		
	}
	
	// 포트폴리오 좋아요 증가
	@RequestMapping(value="/likeUp.action", method=RequestMethod.GET)
	@ResponseBody
	public String likeUp(HttpServletRequest request, HttpSession session, String p_code, String mem_code)
	{	
		String result = "";
		
		IPortfolioDAO dao = sqlSession.getMapper(IPortfolioDAO.class);
				
		dao.likeUp(p_code, mem_code);
		result = String.valueOf(dao.likeCount(p_code));
						
		return result;
		
		
	}
	
	

	
}
	
	



























