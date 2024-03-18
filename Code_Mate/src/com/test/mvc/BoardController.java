package com.test.mvc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.mybatis.dao.IBoardDAO;
import com.test.mybatis.dao.IMyPageDAO;
import com.test.mybatis.dao.IPortfolioDAO;
import com.test.mybatis.dto.ArticleDTO;
import com.test.mybatis.dto.BoardDTO;
import com.test.mybatis.dto.CommentDTO;
import com.test.mybatis.dto.FlagDTO;
import com.test.mybatis.dto.LikeDTO;
import com.test.mybatis.dto.MemberDTO;
import com.test.mybatis.dto.ReasonDTO;
import com.test.mybatis.dto.ReplyDTO;
import com.test.mybatis.dto.VoteDTO;

@Controller
public class BoardController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/boardlist.action", method=RequestMethod.GET)
	public String hello(HttpServletRequest request, PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			, HttpSession session)
	{	
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
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
		
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		//List<BoardDTO> list = dao.getLists();
		//request.setAttribute("list", list);
		
		int count = dao.getTotalCount();
		request.setAttribute("count", count);
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new PagingVO(count, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("list", dao.getPageList(vo));
		
		List<LikeDTO> RList = dao.getLikeRanking();
		request.setAttribute("RList", RList);
		
		List<BoardDTO> trendList = dao.getTrend();
		request.setAttribute("trendList", trendList);
						
		return "/WEB-INF/view/board/Board.jsp";
	}
	
	@RequestMapping(value="/techlist.action", method=RequestMethod.GET)
	public String techView(HttpServletRequest request, PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			, HttpSession session)
	{	
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
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
		
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		//List<BoardDTO> list = dao.getTechLists();
		//request.setAttribute("list", list);
		
		int count = dao.getTechCount();
		request.setAttribute("count", count);
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new PagingVO(count, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("list", dao.getCPageList(vo));
		
		List<LikeDTO> RList = dao.getTechLikeRanking();
		request.setAttribute("RList", RList);
		
		List<BoardDTO> trendList = dao.getTechTrend();
		request.setAttribute("trendList", trendList);
		
		return "/WEB-INF/view/board/TechBoard.jsp";
	}
	
	@RequestMapping(value="/careerlist.action", method=RequestMethod.GET)
	public String carView(HttpServletRequest request, PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			, HttpSession session)
	{	
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
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
		
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		//List<BoardDTO> list = dao.getCarLists();
		//request.setAttribute("list", list);
		
		int count = dao.getCarCount();
		request.setAttribute("count", count);
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new PagingVO(count, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("list", dao.getTPageList(vo));
		
		List<LikeDTO> RList = dao.getCarLikeRanking();
		request.setAttribute("RList", RList);
		
		List<BoardDTO> trendList = dao.getCarTrend();
		request.setAttribute("trendList", trendList);
		
		return "/WEB-INF/view/board/CareerBoard.jsp";
	}
	
	@RequestMapping(value="/article.action", method=RequestMethod.GET)
	public String articleView(HttpServletRequest request, HttpSession session, String code, ModelMap model)
	{	
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
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
		
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		// 커리어 게시물
		if (code.contains("CQ"))
		{	
			if(member != null)
			{
				request.setAttribute("member", member);
				mem_code = member.getMem_code();
							
				List<FlagDTO> flagList = dao.getCFlag(code, mem_code);
				request.setAttribute("flagList", flagList);
				
				List<String> jsonList = new ArrayList<>();
				for (FlagDTO flagDTO : flagList) {
				    jsonList.add("{\"cqcCode\": \"" + flagDTO.getCocode() + "\", \"flag\": " + flagDTO.getFlag() + "}");
				}
				
				request.setAttribute("jsonList", jsonList);
			}
			
			// 조회수 증가
			dao.carViewsUp(code);
			
			ArticleDTO dto =  dao.getCarArticle(code);
			request.setAttribute("dto", dto);
			
			List<CommentDTO> commentList = dao.getCarComment(code);
			request.setAttribute("commentList", commentList);
			
			List<HashMap<String, String>> cqcCodeList = dao.findCComment(code);
			
			List<ReplyDTO> replyList = new ArrayList<>();
								
			for (HashMap<String, String> map : cqcCodeList) 
			{
			    String cqcCode = map.get("CQC_CODE");
			    List<ReplyDTO> replies = dao.getCReply(cqcCode);
			    replyList.addAll(replies);
			}
			/*
			 * for (ReplyDTO reply : replyList) { System.out.println("R_CODE: " +
			 * reply.getR_code()); System.out.println("KDATE: " + reply.getKdate());
			 * System.out.println("REPLY: " + reply.getReply());
			 * System.out.println("CQC_CODE: " + reply.getCqc_code());
			 * System.out.println("MEM_CODE: " + reply.getCqc_code());
			 * System.out.println("NICKNAME: " + reply.getNickname());
			 * System.out.println("----------------------------------"); }
			 */
			request.setAttribute("replyList", replyList);
			
			List<ReasonDTO> reasonList = dao.getReason();
			request.setAttribute("reasonList", reasonList);
			
			VoteDTO voteTitle = dao.getVoteTitle(code);
			request.setAttribute("voteTitle", voteTitle);
			
			List<VoteDTO> voteContent = dao.getVoteContent(code);
			request.setAttribute("voteContent", voteContent);
			
			return "/WEB-INF/view/board/CArticle.jsp";
		}
		// 기술 게시물
		else
		{	
			if(member != null)
			{
				request.setAttribute("member", member);
				mem_code = member.getMem_code();
				
				List<FlagDTO> flagList = dao.getTFlag(mem_code, code);
				request.setAttribute("flagList", flagList);
				
				List<String> jsonList = new ArrayList<>();
				for (FlagDTO flagDTO : flagList) {
				    jsonList.add("{\"cqcCode\": \"" + flagDTO.getCocode() + "\", \"flag\": " + flagDTO.getFlag() + "}");
				}
				
				request.setAttribute("jsonList", jsonList);
			}
			
			// 조회수 증가
			dao.techViewsUp(code);
			
			ArticleDTO dto =  dao.getTechArticle(code);
			request.setAttribute("dto", dto);
			
			List<CommentDTO> commentList = dao.getTarComment(code);
			request.setAttribute("commentList", commentList);
			
			//
			List<HashMap<String, String>> cqcCodeList = dao.findTComment(code);
			
			List<ReplyDTO> replyList = new ArrayList<>();
								
			for (HashMap<String, String> map : cqcCodeList) 
			{
			    String cqcCode = map.get("CQC_CODE");
			    List<ReplyDTO> replies = dao.getTReply(cqcCode);
			    replyList.addAll(replies);
			}
			request.setAttribute("replyList", replyList);
			
			List<ReasonDTO> reasonList = dao.getReason();
			request.setAttribute("reasonList", reasonList);
			
			
			return "/WEB-INF/view/board/TArticle.jsp";
		}
		
		
	}
	
	// 커리어 좋아요 취소
	@RequestMapping(value="/likeCDown.action", method=RequestMethod.GET)
	@ResponseBody
	public String likeDown(HttpServletRequest request, HttpSession session, String cqc_code, String mem_code)
	{	
		String result = "";
				
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		dao.carLikeDown(cqc_code, mem_code);
		result = String.valueOf(dao.finCLike(cqc_code));
						
		return result;	
	}
	
	// 커리어 좋아요 증가
	@RequestMapping(value="/likeCUp.action", method=RequestMethod.GET)
	@ResponseBody
	public String likeUp(HttpServletRequest request, HttpSession session, String cqc_code, String mem_code)
	{	
		String result = "";
		
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		dao.carLikeUp(cqc_code, mem_code);
		result = String.valueOf(dao.finCLike(cqc_code));
						
		return result;	
	}
	
	// 기술 좋아요 취소
	@RequestMapping(value="/likeTDown.action", method=RequestMethod.GET)
	@ResponseBody
	public String likeDownT(HttpServletRequest request, HttpSession session, String cqc_code, String mem_code)
	{	
		String result = "";
				
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		dao.techLikeDown(cqc_code, mem_code);
		result = String.valueOf(dao.finTLike(cqc_code));
						
		return result;	
	}
	
	// 기술 좋아요 증가
	@RequestMapping(value="/likeTUp.action", method=RequestMethod.GET)
	@ResponseBody
	public String likeUpT(HttpServletRequest request, HttpSession session, String cqc_code, String mem_code)
	{	
		String result = "";
		
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		dao.techLikeUp(cqc_code, mem_code);
		result = String.valueOf(dao.finTLike(cqc_code));
						
		return result;	
	}
	
	// 커리어 게시판 대댓글 인서트
	@RequestMapping(value="/creplyinsert.action", method=RequestMethod.POST)
	@ResponseBody
	public String cReplyInsert(HttpSession session, String cqc_code, String reply, String mem_code)
	{	
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		//System.out.println(cqc_code);
		//System.out.println(reply);
		//System.out.println(mem_code);
		dao.cReplyInsert(reply, cqc_code, mem_code);
		
		return null;
	}
	
	// 기술 게시판 대댓글 인서트
	@RequestMapping(value="/treplyinsert.action", method=RequestMethod.POST)
	@ResponseBody
	public String tReplyInsert(HttpSession session, String cqc_code, String reply, String mem_code)
	{	
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		//System.out.println(cqc_code);
		//System.out.println(reply);
		//System.out.println(mem_code);
		dao.tReplyInsert(reply, cqc_code, mem_code);
		
		return null;
	}
	
	// 커리어 게시판 댓글 인서트
	@RequestMapping(value="/ccommentinsert.action", method=RequestMethod.POST)
	@ResponseBody
	public String cCommentInsert(HttpSession session, String cq_code, String comment, String mem_code)
	{	
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		//System.out.println(cq_code);
		//System.out.println(comment);
		//System.out.println(mem_code);
		dao.cCommentInsert(comment, cq_code, mem_code);
		
		return null;
	}
	
	// 기술 게시판 댓글 인서트
	@RequestMapping(value="/tcommentinsert.action", method=RequestMethod.POST)
	@ResponseBody
	public String tCommentInsert(HttpSession session, String cq_code, String comment, String mem_code)
	{	
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		//System.out.println(cq_code);
		//System.out.println(comment);
		//System.out.println(mem_code);
		dao.tCommentInsert(comment, cq_code, mem_code);
		
		return null;
	}

	// 게시물 인서트
	@RequestMapping(value="/qnainsert.action", method=RequestMethod.GET)
	public String qnaInsert(HttpSession session, String titletextarea, String contextarea, String skillscore1, String mem_code)
	{	
		//System.out.println(titletextarea);
		//System.out.println(contextarea);
		//System.out.println(skillscore1);
		//System.out.println(mem_code);
		
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		if (skillscore1.equals("1"))
		{
			dao.cInsert(titletextarea, contextarea, mem_code);
		}
		else
		{
			dao.tInsert(titletextarea, contextarea, mem_code);
		}
		
		return "redirect:boardlist.action";
	}
	
	@RequestMapping(value="/qinsertform.action", method=RequestMethod.GET)
	public String insertView(HttpSession session)
	{
		return "/WEB-INF/view/board/QInsertForm.jsp";
	}
	
	// 게시물 신고
	@RequestMapping(value="/reportInsert.action", method=RequestMethod.GET)
	public String reportInsert(HttpSession session, String content, String mem_code, String code, String reason)
	{	
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		if (code.contains("CQ"))
		{	
			dao.cReportInsert(content, code, reason, mem_code);			
		}
		else
		{
			dao.tReportInsert(content, code, reason, mem_code);
		}
		
		return "redirect:boardlist.action";
	}
	
	@RequestMapping(value="/votep.action", method=RequestMethod.GET)
	@ResponseBody
	public String votePInsert(HttpSession session, String vs_code, String mem_code)
	{	
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		//System.out.println(vs_code);
		//System.out.println(mem_code);
		dao.voteP(vs_code, mem_code);

		
		return null;
	}
	
	
}
