/*====================
 *   Sample.java
 *   - 컨트롤러 객체
 ===================*/

package com.test.mybatis;

import java.util.ArrayList;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController
{	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/Code_Mate.action", method=RequestMethod.GET)
	public String hello(Model model, HttpServletRequest request)
	{	
		return "/WEB-INF/view/main/Template.jsp";
	}
	
	@RequestMapping(value="/Login.action", method=RequestMethod.GET)
	public String login(Model model)
	{	
		return "/WEB-INF/view/main/Login.jsp";
	}
	
	// 회원가입버튼 누를 경우
	@RequestMapping(value="/join.action", method=RequestMethod.GET)
	public String join(String email, String id, String pw, HttpServletRequest request)
	{	
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		dao.memberJoin(id, pw, email);
		
		MemberDTO member = dao.login(id, pw);
		
		HttpSession session = request.getSession();
	    session.setAttribute("member", member);
	    session.setMaxInactiveInterval(5 * 60);
	    
		return "/WEB-INF/view/main/Template.jsp";
	}
	
	@RequestMapping(value="/login-in.action", method=RequestMethod.POST)
	public String login_in(String id, String pw, HttpServletRequest request)
	{
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		// 아이디와 비밀번호가 일치하는 member를 받아옴
		MemberDTO member = dao.login(id, pw);
		
		if(member == null)	// 로그인 실패
			return "/WEB-INF/view/main/arr.jsp";
		else
		{
			HttpSession session = request.getSession();
			
			//member 란 이름으로 member 객체 set 해줌
		    session.setAttribute("member", member);
		    // 세션 유지시간 5분
		    session.setMaxInactiveInterval(5 * 60);
		}
			
		return "redirect:Code_Mate.action";
	}
	
	@RequestMapping(value = "/projectProgress.action")
	public String projectProgress(HttpServletRequest request)
	{
		IMemberDAO memberDao = sqlSession.getMapper(IMemberDAO.class);
		ITaskDAO taskDao = sqlSession.getMapper(ITaskDAO.class);
		
		// 멤버리스트
		ArrayList<MemberDTO> leader = memberDao.getLeader("AP0006", "MR0001");
		ArrayList<MemberDTO> frontList = memberDao.getFront("AP0006", "MR0001");
		ArrayList<MemberDTO> backList = memberDao.getBack("AP0006", "MR0001");
		
		request.setAttribute("leader", leader);
		request.setAttribute("frontList", frontList);
		request.setAttribute("backList", backList);
		
		// Task
		ArrayList<TaskDTO> taskList = taskDao.list("CP0002");
		
		request.setAttribute("taskList", taskList);
		
		return "/WEB-INF/view/project/prjActPage.jsp";
	}
}



