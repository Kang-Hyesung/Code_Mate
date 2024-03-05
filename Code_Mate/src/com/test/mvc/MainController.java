/*====================
 *   Sample.java
 *   - 컨트롤러 객체
 ===================*/

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.mybatis.dao.IMeetingDAO;
import com.test.mybatis.dao.IMemberDAO;
import com.test.mybatis.dao.IMyPageDAO;
import com.test.mybatis.dao.IReportDAO;
import com.test.mybatis.dao.ITaskDAO;
import com.test.mybatis.dto.MeetingDTO;
import com.test.mybatis.dto.MemberDTO;
import com.test.mybatis.dto.MyPageMethod;
import com.test.mybatis.dto.ReportDTO;
import com.test.mybatis.dto.TaskDTO;

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
	    
		return "redirect:Code_Mate.action";
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
	
	
	//=================================[마이 페이지]====================================
	
		@RequestMapping(value="/mypage.action", method=RequestMethod.GET)
		public String mypage(ModelMap model, HttpSession session, HttpServletRequest request)
		{
			IMyPageDAO dao = sqlSession.getMapper(IMyPageDAO.class);
			MyPageMethod mpm = new MyPageMethod();
			
			MemberDTO member = (MemberDTO)session.getAttribute("member");
			
			request.setAttribute("member", member);
			
			String mem_code = member.getMem_code();
			
			model.addAttribute("nickName", dao.nickName(mem_code));
			model.addAttribute("mbti", dao.mbti(mem_code));
			model.addAttribute("skillTag", dao.skillTag(mem_code));
			model.addAttribute("backendScore", dao.backendScore(mem_code));
			model.addAttribute("frontendScore", dao.frontendScore(mem_code));
			model.addAttribute("mannerScore", dao.mannerScore(mem_code));

			//=======================================================
			// 개인정보 공개 / 비공개 설정 가능 항목 처리
			//=======================================================
			
			int emailOpen = dao.emailOpen(mem_code);
			int genderOpen = dao.genderOpen(mem_code);
			int birthDayOpen = dao.birthDayOpen(mem_code);
			
			String email = dao.email(mem_code);
			String gender = dao.gender(mem_code);
			String birthDay = dao.birthDay(mem_code);
			
			email = mpm.nullOrBlindCheck(email, emailOpen, "이메일");
			gender = mpm.nullOrBlindCheck(gender, genderOpen, "성별");
			birthDay = mpm.nullOrBlindCheck(birthDay, birthDayOpen, "생년월일");
			
			model.addAttribute("email", email);
			model.addAttribute("gender", gender);
			model.addAttribute("birthDay", birthDay);
			//=======================================================
			
			// 경력
			model.addAttribute("careerList", dao.careerList(mem_code));
			
			// 프로젝트 이력
			model.addAttribute("pjHistoryList", dao.pjHistoryList(mem_code));
			
			
			//▦▦▦▦▦▦▦▦[ 2 페이지 - 본인이 작성한 게시글 ]▦▦▦▦▦▦▦▦
				
			model.addAttribute("postList", dao.postList(mem_code));
			System.out.println("postList 추가 완료");
			
			//▦▦▦▦▦▦▦▦[ 3 페이지 - 본인이 작성한 댓글 ]▦▦▦▦▦▦▦▦▦
			
			model.addAttribute("commentList", dao.commentList(mem_code));
			System.out.println("commentList 추가 완료");
			
			
			
			return "/WEB-INF/view/main/MyPage_DB.jsp";
		}
		
 @Scheduled(fixedDelay = 1000)
 public void hello() {
	 
	 System.out.println("test");
 }
}



