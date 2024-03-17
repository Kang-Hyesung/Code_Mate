package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.mybatis.dao.IAdmin1v1DAO;
import com.test.mybatis.dao.IAdminDAO;
import com.test.mybatis.dao.IInquiryDAO;
import com.test.mybatis.dto.AdminDTO;
import com.test.mybatis.dto.Admin_PenaltyDTO;
import com.test.mybatis.dto.IReplyDTO;
import com.test.mybatis.dto.PagingVO;
import com.test.mybatis.dto.PenaltyInsertDTO;
import com.test.mybatis.dto.Prj_memberDTO;

@Controller
public class AdminController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 관리자 메인 페이지
	@RequestMapping(value="/Code_Mate_admin.action", method=RequestMethod.GET)
	public String hello(Model model)
	{	
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		// 게시판 전체 조회
		model.addAttribute("app_count", dao.app_count());
		model.addAttribute("te_count", dao.te_count());
		model.addAttribute("cq_count", dao.cq_count());
		model.addAttribute("po_count", dao.po_count());
		
		// 전체 회원 글 수
		model.addAttribute("all_count", dao.all_count());
		model.addAttribute("report_count", dao.report_count());
		model.addAttribute("project_count", dao.project_count());
		
		
		// 차트 일일 신고수 조회
		model.addAttribute("post_count", dao.post_count());
		model.addAttribute("comment_count", dao.comment_count());
		model.addAttribute("reply2_count", dao.reply2_count());
		model.addAttribute("team_count", dao.team_count());
		
		
		// 차트 전체 프로젝트 조회
		model.addAttribute("prod_list", dao.prod_list());
		model.addAttribute("prow_list", dao.prow_list());
		model.addAttribute("prom_list", dao.prom_list());
		
		// 차트 전체 신고건수 조회
		model.addAttribute("reportd_list", dao.reportd_list());
		model.addAttribute("reportw_list", dao.reportw_list());
		model.addAttribute("reportm_list", dao.reportm_list());
		
		// 차트 전체 회원수 조회
		model.addAttribute("memd_list", dao.memd_list());
		model.addAttribute("memw_list", dao.memw_list());
		model.addAttribute("memm_list", dao.memm_list());
		
		return "/WEB-INF/view/admin/Admin_Main.jsp";
	}
	
	// 전체 회원 조회 페이지 
	@RequestMapping(value = "/Member.action", method = RequestMethod.GET)
	public String member(HttpServletRequest request, PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage)
	{
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		//ArrayList<AdminDTO> list = dao.list();
		
		// 차트 일일 신고수 조회
		model.addAttribute("post_count", dao.post_count());
		model.addAttribute("comment_count", dao.comment_count());
		model.addAttribute("reply2_count", dao.reply2_count());
		model.addAttribute("team_count", dao.team_count());
		
		
		// 차트 전체 프로젝트 조회
		model.addAttribute("prod_list", dao.prod_list());
		model.addAttribute("prow_list", dao.prow_list());
		model.addAttribute("prom_list", dao.prom_list());
		
		// 차트 전체 신고건수 조회
		model.addAttribute("reportd_list", dao.reportd_list());
		model.addAttribute("reportw_list", dao.reportw_list());
		model.addAttribute("reportm_list", dao.reportm_list());
		
		// 차트 전체 회원수 조회
		model.addAttribute("memd_list", dao.memd_list());
		model.addAttribute("memw_list", dao.memw_list());
		model.addAttribute("memm_list", dao.memm_list());
		
		// 전체 회원 글 수
		model.addAttribute("all_count", dao.all_count());
		model.addAttribute("report_count", dao.report_count());
		model.addAttribute("project_count", dao.project_count());
		
		// mbti 전체 리스트 뽑아오기 
		model.addAttribute("mbti_list", dao.mbti_list());
		
		//request.setAttribute("list", list);
		
		// 페이징 처리
		int count = dao.all_count();
		request.setAttribute("count", count);
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		vo = new PagingVO(count, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("list", dao.allmem_pageing(vo));
		
		return "/WEB-INF/view/admin/Admin_All_Members.jsp";
		
	}	 

	
	// 업데이트 액션처리
	@RequestMapping(value = "/Member_update.action", method = RequestMethod.GET)
	public String member_update(Model model, AdminDTO a)
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		dao.mem_modify(a);
		
		return "redirect:/Member.action";
	}
	
	// 탈퇴 액션처리
	@RequestMapping(value = "/Member_delete.action", method = RequestMethod.GET)
	public String member_delete(Model model, String mem_code, Admin_PenaltyDTO p)
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		dao.mem_delete(p);
		
		return "redirect:/Member.action";
	}
	
	// 패널티 당한 회원 조회 페이지 
	@RequestMapping(value = "/Member_penalty.action", method = RequestMethod.GET)
	public String member_penalty(HttpServletRequest request, PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage)
	{
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		// 전체 회원 글 수
		model.addAttribute("all_count", dao.all_count());
		model.addAttribute("report_count", dao.report_count());
		model.addAttribute("project_count", dao.project_count());

		//model.addAttribute("list_penalty", dao.list_penalty());
		
		// 페이징 처리
		int count = dao.pen_count();
		request.setAttribute("count", count);
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		vo = new PagingVO(count, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("list_penalty", dao.allpen_paging(vo));
		
		return "/WEB-INF/view/admin/Admin_Penalty_Member.jsp";
	}
	
	// 탈퇴한 회원 조회 페이지 
	@RequestMapping(value = "/Member_close.action", method = RequestMethod.GET)
	public String member_close(HttpServletRequest request, PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage)
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		// 전체 회원 글 수
		model.addAttribute("all_count", dao.all_count());
		model.addAttribute("report_count", dao.report_count());
		model.addAttribute("project_count", dao.project_count());
		
		//model.addAttribute("list_close", dao.list_close());
		
		// 페이징 처리
		int count = dao.close_count();
		request.setAttribute("count", count);
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		vo = new PagingVO(count, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("list_close", dao.close_paging(vo));
		
		
		return "/WEB-INF/view/admin/Admin_Close_Member.jsp";
	}
	
	// 신고 받은 메인 페이지
	@RequestMapping(value = "/Member_report.action", method = RequestMethod.GET)
	public String member_report(HttpServletRequest request, PagingVO vo
			, PagingVO vo2, PagingVO vo3, PagingVO vo4, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage)
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		// 전체 회원 글 수
		model.addAttribute("all_count", dao.all_count());
		model.addAttribute("report_count", dao.report_count());
		model.addAttribute("project_count", dao.project_count());
		
		// 기술 게시판 관련해 들어온 신고 처리 가능 리스트 조회
		//model.addAttribute("mem_penalg", dao.mem_penalg());

		// 프로젝트 게시판 관련해 들어온 신고 처리 가능 리스트 조회
		//model.addAttribute("mem_penalpg", dao.mem_penalpg());
		
		// 커리어 게시판 관련해 들어온 신고 처리 가능 리스트 조회
		//model.addAttribute("mem_penalcg", dao.mem_penalcg());
		
		// 포트폴리오 게시판 관련해 들어온 신고 처리 가능 리스트 조회
		//model.addAttribute("mem_penalpog", dao.mem_penalpog());
		
		
		// 관리자 리스트 받을 페이지
		model.addAttribute("admin_list", dao.admin_list());
		
		// 패널티 리스트 받을 페이지
		model.addAttribute("admin_penalty", dao.admin_penalty());
		
		// 패널티 리스트 받을 페이지
		model.addAttribute("admin_target", dao.admin_target());
		
		// 패널티 사유 리스트 받을 페이지
		model.addAttribute("p_reason", dao.p_reason());
		
		// ---------------------------------- 페이징 처리 
		// 개설 신청
		int count = dao.proreport_count();
		request.setAttribute("count", count);
		
		//기술 
		int count2 = dao.tqreport_count();
		request.setAttribute("count", count2);
		
		//커리어
		int count3 = dao.cqreport_count();
		request.setAttribute("count", count3);
		
		//포트폴리오
		int count4 = dao.ptreport_count();
		request.setAttribute("count", count4);
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		vo = new PagingVO(count, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		
		vo2 = new PagingVO(count2, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging2", vo2);
		
		vo3 = new PagingVO(count3, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging3", vo3);
		
		vo4 = new PagingVO(count4, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging4", vo4);
		
		model.addAttribute("mem_penalpg", dao.paing_lpg(vo));
		model.addAttribute("mem_penalg", dao.paging_lg(vo2));
		model.addAttribute("mem_penalcg", dao.paging_lcg(vo3));
		model.addAttribute("mem_penalpog", dao.paging_pog(vo4));

		
		return "/WEB-INF/view/admin/Admin_report.jsp";
	}
	
	// 패널티 처리 페이지
	@RequestMapping(value = "/Member_report_insert.action", method = RequestMethod.POST)
	public String penertyInsert(PenaltyInsertDTO p, HttpServletRequest request)
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		// 개설 게시판 모든 신고 처리
		if(p.getCode().substring(0, 3).equals("AOR")) {
			
			dao.ao_insert(p);
			
		} else if (p.getCode().substring(0, 3).equals("ACR")) {

			dao.aoc_insert(p);
			
		} else if (p.getCode().substring(0, 3).equals("A2R")) {

			dao.ao2_insert(p);

		}
		
		// 기술 모든 신고 처리
		if (p.getCode().substring(0, 3).equals("TQR")){
			
			dao.tq_insert(p);
			
		} else if (p.getCode().substring(0, 3).equals("QCR")) {
			
			dao.tqc_insert(p);	
			
		} else if (p.getCode().substring(0, 3).equals("Q2R")) {
			
			dao.tq2_insert(p);
		}
		
		// 커리어 모든 신고 처리 
		if(p.getCode().substring(0, 2).equals("QR")) {
			
			dao.cq_insert(p);
			
		} else if(p.getCode().substring(0, 2).equals("CR")) {
			
			dao.cqc_insert(p);
			
		} else if (p.getCode().substring(0, 2).equals("C2")) {

			dao.cq2_insert(p);

		}
		
		// 포트폴리오 모든 신고 처리 
		if (p.getCode().substring(0, 2).equals("PR")) {
			
			dao.p_insert(p);
			
		} else if (p.getCode().substring(0,3).equals("PCR")) {
			
			dao.pc_insert(p);
			
		} else if (p.getCode().substring(0,3).equals("P2R")) {
			
			dao.p2_insert(p);
		}
		
		return "redirect:/Member_report.action";
		
	}
	
	
	// 신고 처리  목록 조회 페이지
	@RequestMapping(value = "/Member_report_process.action", method = RequestMethod.GET)
	public String member_report_process(HttpServletRequest request, PagingVO vo
			, PagingVO vo2, PagingVO vo3, PagingVO vo4, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage)
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		// 전체 회원 글 수
		model.addAttribute("all_count", dao.all_count());
		model.addAttribute("report_count", dao.report_count());
		model.addAttribute("project_count", dao.project_count());

		// 개설 신청에서 패널티 받은 사람 조회
		model.addAttribute("prop_list",dao.prop_list());

		// 기술 게시판에서 패널티 받은 사람 조회 
		model.addAttribute("prot_list",dao.prot_list());
		
		// 커리어 게시판에서 패널티 받은 사람 조회
		model.addAttribute("proc_list",dao.proc_list());
		
		// 포트폴리오 게시판에서 패널티 받은 사람 조회
		model.addAttribute("proport_list",dao.proport_list());
		
		//------------------- 페이징 처리
		
		// 관리자 리스트 받을 페이지
		model.addAttribute("admin_list", dao.admin_list());
		
		// 패널티 리스트 받을 페이지
		model.addAttribute("admin_penalty", dao.admin_penalty());
		
		// 패널티 리스트 받을 페이지
		model.addAttribute("admin_target", dao.admin_target());
		
		// 패널티 사유 리스트 받을 페이지
		model.addAttribute("p_reason", dao.p_reason());
		
		// ---------------------------------- 페이징 처리 
		// 개설 신청
		int count = dao.prop_count();
		request.setAttribute("count", count);
		
		//기술 
		int count2 = dao.prot_count();
		request.setAttribute("count", count2);
		
		//커리어
		int count3 = dao.proc_count();
		request.setAttribute("count", count3);
		
		//포트폴리오
		int count4 = dao.proport_count();
		request.setAttribute("count", count4);
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		
		vo = new PagingVO(count, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		
		vo2 = new PagingVO(count2, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging2", vo2);
		
		vo3 = new PagingVO(count3, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging3", vo3);
		
		vo4 = new PagingVO(count4, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging4", vo4);
		
		model.addAttribute("prop_list", dao.prop_paging(vo));
		model.addAttribute("prot_list", dao.prot_paging(vo2));
		model.addAttribute("proc_list", dao.proc_paging(vo3));
		model.addAttribute("proport_list", dao.proport_paging(vo4));

		
		return "/WEB-INF/view/admin/Admin_report_process.jsp";
	}
	
	// 커뮤니티 처리 페이지
	@RequestMapping(value = "/Admin_Communiity.action", method = RequestMethod.GET)
	public String admin_community(HttpServletRequest request, PagingVO vo
			, PagingVO vo2, PagingVO vo3, PagingVO vo4, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage)
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		// 전체 회원 글 수
		model.addAttribute("all_count", dao.all_count());
		model.addAttribute("report_count", dao.report_count());
		model.addAttribute("project_count", dao.project_count());
		
		//model.addAttribute("board_app",dao.board_app());
		//model.addAttribute("board_te",dao.board_te());
		//model.addAttribute("board_cq",dao.board_cq());
		//model.addAttribute("board_p",dao.board_p());
		
		// ---------------------------------- 페이징 처리 
		// 개설 신청
		int count = dao.pagingApp_count();
		request.setAttribute("count", count);
		
		
		//기술 
		int count2 = dao.pagingTe_count();
		request.setAttribute("count", count2);
		
		//커리어
		int count3 = dao.pagingCq_count();
		request.setAttribute("count", count3);
		
		//포트폴리오
		int count4 = dao.pagingP_count();
		request.setAttribute("count", count4);
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		
		vo = new PagingVO(count, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		
		vo2 = new PagingVO(count2, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging2", vo2);
		
		vo3 = new PagingVO(count3, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging3", vo3);
		
		vo4 = new PagingVO(count4, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging4", vo4);
		
		model.addAttribute("board_app", dao.paging_app(vo));
		model.addAttribute("board_te", dao.paging_te(vo2));
		model.addAttribute("board_cq", dao.paging_cq(vo3));
		model.addAttribute("board_p", dao.paging_p(vo4));
		
		
		return "/WEB-INF/view/admin/Admin_Commuity.jsp";
	}
	
	// 프로젝트 처리 페이지
	@RequestMapping(value = "/Admin_Project.action", method = RequestMethod.GET)
	public String admin_project(HttpServletRequest request, PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage)
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		// 전체 회원 글 수
		model.addAttribute("all_count", dao.all_count());
		model.addAttribute("report_count", dao.report_count());
		model.addAttribute("project_count", dao.project_count());
		
		model.addAttribute("project_list",dao.project_list());
		
		//----------------------------- 페이징 처리 
		// 페이징 처리
		
		int count = dao.projectPaging_count();
		request.setAttribute("count", count);
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		vo = new PagingVO(count, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("project_list", dao.project_paging(vo));
		
		return "/WEB-INF/view/admin/Admin_Project.jsp";
	}
	
	@ResponseBody
	@RequestMapping(value = "/Project_team.action")
	public String ProjectTeam(Model model, String cp_code) {
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		ArrayList<Prj_memberDTO> dto = dao.project_team(cp_code); 
		
		StringBuffer str = new StringBuffer();
		
		str.append("[");
		 
		for(int i = 0; i<dto.size(); i++) {
			
			// { "nickname": "값1", "member_role" : "값2"
			//  , "backScore" : "값3", "frontScore" : "값4" }
			str.append("{\"nickname\" : ");
			str.append("\"" + dto.get(i).getP_nickname() + "\"");
			
			str.append(", \"member_role\" : ");
			str.append("\"" + dto.get(i).getP_member_role() + "\"");
			
			str.append(", \"backScore\" : ");
			str.append("\"" + dto.get(i).getBackend_score() + "\"");
			
			str.append(", \"frontScore\" : ");
			
			if (i != dto.size() - 1)
			{
				str.append("\"" + dto.get(i).getFrontend_score() + "\"}, ");
			}
			else
			{
				str.append("\"" + dto.get(i).getFrontend_score() + "\"} ");
				
			}
		}
		
		str.append("]");
		
		
		return	str.toString();
	}
	
	@RequestMapping(value = "/Inquiry_Faq.action", method = RequestMethod.GET)
	public String admin_faq(ModelMap model)
	{
		IInquiryDAO dao = sqlSession.getMapper(IInquiryDAO.class);
		
		model.addAttribute("count", dao.count());
		model.addAttribute("list", dao.list());
		
		return "/WEB-INF/view/admin/Inquiry_Faq.jsp";
	}
	// 1대1 문의 - 1대1 문의
	@RequestMapping(value = "/Inquiry_1v1.action", method = RequestMethod.GET)
	public String admin_1v1(Model model)
	{
		IAdmin1v1DAO dao = sqlSession.getMapper(IAdmin1v1DAO.class);
		
		model.addAttribute("count", dao.count());
		model.addAttribute("list", dao.list());		
		
		return "/WEB-INF/view/admin/Inquiry_1v1.jsp";
	}
	
	// 1대1 문의 - 신고 관련 문의
	@RequestMapping(value = "/Inquiry_Report.action", method = RequestMethod.GET)
	public String admin_Report(Model model)
	{
		return "/WEB-INF/view/admin/Inquiry_Report.jsp";
	}	
	
	// 1대1 문의 상세 내용
	@RequestMapping(value = "/Inquiry_Board.action", method = RequestMethod.GET)
	public String inquiry_board(Model model, String iq_code)
	{
		IAdmin1v1DAO dao = sqlSession.getMapper(IAdmin1v1DAO.class);
		
		model.addAttribute("count", dao.count());
		model.addAttribute("listselect", dao.listselect(iq_code));		
		
		return "/WEB-INF/view/admin/Inquiry_Board.jsp";
	}	
	
	// 1대1 문의 - 답글
	@RequestMapping(value = "/Inquiry_Reply.action", method = RequestMethod.GET)
	public String Inquiry_reply(@RequestParam("content") String content,
								@RequestParam("iq_code") String iq_code,
								IReplyDTO d)
	{
		IAdmin1v1DAO dao = sqlSession.getMapper(IAdmin1v1DAO.class);
		
		  System.out.println(d.getContent());
		  System.out.println(d.getIq_code());
		  
		  
		dao.insert(d);
		 
		
		return "redirect:Inquiry_Board.action?iq_code=" + iq_code;
		
	}
}
