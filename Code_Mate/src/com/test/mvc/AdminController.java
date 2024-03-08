package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.mybatis.dao.IAdminDAO;
import com.test.mybatis.dto.AdminDTO;
import com.test.mybatis.dto.PenaltyInsertDTO;

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
	public String member(Model model, HttpServletRequest request)
	{
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		ArrayList<AdminDTO> list = dao.list();
		
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
		
		request.setAttribute("list", list);
		
		
		return "/WEB-INF/view/admin/Admin_All_Members.jsp";
	}

	// 오늘 접속한 회원 조회 페이지
	@RequestMapping(value = "/Member_today.action", method = RequestMethod.GET)
	public String member_today(Model model)
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

		// 전체 회원 글 수
		model.addAttribute("all_count", dao.all_count());
		model.addAttribute("report_count", dao.report_count());
		model.addAttribute("project_count", dao.project_count());
		
		
		return "/WEB-INF/view/admin/Admin_today_Member.jsp";
	}
	 
	
	// 패널티 당한 회원 조회 페이지 
	@RequestMapping(value = "/Member_penalty.action", method = RequestMethod.GET)
	public String member_penalty(Model model)
	{
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		// 전체 회원 글 수
		model.addAttribute("all_count", dao.all_count());
		model.addAttribute("report_count", dao.report_count());
		model.addAttribute("project_count", dao.project_count());

		model.addAttribute("list_penalty", dao.list_penalty());
		
		return "/WEB-INF/view/admin/Admin_Penalty_Member.jsp";
	}
	
	// 탈퇴한 회원 조회 페이지 
	@RequestMapping(value = "/Member_close.action", method = RequestMethod.GET)
	public String member_close(Model model)
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		// 전체 회원 글 수
		model.addAttribute("all_count", dao.all_count());
		model.addAttribute("report_count", dao.report_count());
		model.addAttribute("project_count", dao.project_count());
		
		model.addAttribute("list_close", dao.list_close());
		
		return "/WEB-INF/view/admin/Admin_Close_Member.jsp";
	}
	
	// 신고 받은 메인 페이지
	@RequestMapping(value = "/Member_report.action", method = RequestMethod.GET)
	public String member_report(Model model)
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		// 전체 회원 글 수
		model.addAttribute("all_count", dao.all_count());
		model.addAttribute("report_count", dao.report_count());
		model.addAttribute("project_count", dao.project_count());
		
		// 기술 게시판 관련해 들어온 신고 처리 가능 리스트 조회
		model.addAttribute("mem_penalg", dao.mem_penalg());

		// 프로젝트 게시판 관련해 들어온 신고 처리 가능 리스트 조회
		model.addAttribute("mem_penalpg", dao.mem_penalpg());
		
		// 커리어 게시판 관련해 들어온 신고 처리 가능 리스트 조회
		model.addAttribute("mem_penalcg", dao.mem_penalcg());
		
		// 포트폴리오 게시판 관련해 들어온 신고 처리 가능 리스트 조회
		model.addAttribute("mem_penalpog", dao.mem_penalpog());
		
		// 관리자 리스트 받을 페이지
		model.addAttribute("admin_list", dao.admin_list());
		
		// 패널티 리스트 받을 페이지
		model.addAttribute("admin_penalty", dao.admin_penalty());
		
		// 패널티 리스트 받을 페이지
		model.addAttribute("admin_target", dao.admin_target());
		
		// 패널티 사유 리스트 받을 페이지
		model.addAttribute("p_reason", dao.p_reason());
		
		
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
	
	
	// 신고 처리 페이지
	@RequestMapping(value = "/Member_report_process.action", method = RequestMethod.GET)
	public String member_report_process(Model model)
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		// 전체 회원 글 수
		model.addAttribute("all_count", dao.all_count());
		model.addAttribute("report_count", dao.report_count());
		model.addAttribute("project_count", dao.project_count());
		
		return "/WEB-INF/view/admin/Admin_report_process.jsp";
	}
	
	// 커뮤니티 처리 페이지
	@RequestMapping(value = "/Admin_Communiity.action", method = RequestMethod.GET)
	public String admin_community(Model model)
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		// 전체 회원 글 수
		model.addAttribute("all_count", dao.all_count());
		model.addAttribute("report_count", dao.report_count());
		model.addAttribute("project_count", dao.project_count());
		
		return "/WEB-INF/view/admin/Admin_Commuity.jsp";
	}
	
	// 프로젝트 처리 페이지
	@RequestMapping(value = "/Admin_Project.action", method = RequestMethod.GET)
	public String admin_project(Model model)
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		// 전체 회원 글 수
		model.addAttribute("all_count", dao.all_count());
		model.addAttribute("report_count", dao.report_count());
		model.addAttribute("project_count", dao.project_count());
		
		return "/WEB-INF/view/admin/Admin_Project.jsp";
	}
	
}
