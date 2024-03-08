package com.test.mybatis.dao;

import java.util.ArrayList;

import com.test.mybatis.dto.AdminDTO;
import com.test.mybatis.dto.Admin_ChartDTO;
import com.test.mybatis.dto.Admin_CloseDTO;
import com.test.mybatis.dto.Admin_PenaltyDTO;
import com.test.mybatis.dto.Admin_TargetDTO;
import com.test.mybatis.dto.Admin_listDTO;
import com.test.mybatis.dto.Member_PenaltyDTO;
import com.test.mybatis.dto.PenaltyInsertDTO;
import com.test.mybatis.dto.Penalty_listDTO;
import com.test.mybatis.dto.PreasonDTO;

public interface IAdminDAO
{
	public ArrayList<AdminDTO>list();					// 전체 회원 조회
	public ArrayList<Admin_PenaltyDTO>list_penalty();	// 패널티 당한 회원 전체 조회 
	public ArrayList<Admin_CloseDTO>list_close();		// 탈퇴한 회원 전체 조회
	
// --------------------------------------------------------------
	
	public int app_count();		// 개설 신청 게시글 수 
	public int te_count();		// 기술 게시판 게시글 수 
	public int cq_count();		// 커리어 게시판 게시글 수 
	public int po_count();		// 포트폴리오 게시판 수
	
	public int all_count();		// 전체 회원 수 
	public int report_count();	// 전체 들어온 신고 접수 수
	public int project_count();	// 진행중인 프로젝트 수
	
	public int post_count();	// 오늘 들어온 전체 게시글 신고 수
	public int comment_count();	// 오늘 들어온 전체 댓글 신고 수 
	public int reply2_count();	// 오늘 들어온 전체 대댓글 신고 수 
	public int team_count();	// 오늘 들어온 팀 신고 수
	
	public Admin_ChartDTO prod_list();	// 일별 전체 프로젝트 조회구문 
	public Admin_ChartDTO prow_list();	// 주별 전체 프로젝트 조회구문 
	public Admin_ChartDTO prom_list();	// 월별 전체 프로젝트 조회구문 
	
	public Admin_ChartDTO reportd_list();	// 일별 전체 신고건수 조회구문 
	public Admin_ChartDTO reportw_list();	// 주별 전체 신고건수 조회구문 
	public Admin_ChartDTO reportm_list();	// 월별 전체 신고건수 조회구문 
	
	public Admin_ChartDTO memd_list();	// 일별 전체 회원수 조회구문 
	public Admin_ChartDTO memw_list();	// 주별 전체 회원수 조회구문 
	public Admin_ChartDTO memm_list();	// 월별 전체 회원수 조회구문 
	
	// -------------------------------------------------------------------
	
	public ArrayList<Member_PenaltyDTO>mem_penalg();	// 기술 신고 들어온 리스트 조회
	public ArrayList<Member_PenaltyDTO>mem_penalpg();	// 프로젝트 신고 들어온 리스트 조회
	public ArrayList<Member_PenaltyDTO>mem_penalcg();	// 커리어 신고 들어온 리스트 조회
	public ArrayList<Member_PenaltyDTO>mem_penalpog();	// 포트폴리오 신고 들어온 리스트 조회
	
	public ArrayList<Admin_listDTO>admin_list();	// 관리자 리스트 조회
	public ArrayList<Penalty_listDTO>admin_penalty();	// 관리자 리스트 조회
	public ArrayList<Admin_TargetDTO>admin_target();	// 타깃 리스트 조회
	public ArrayList<PreasonDTO>p_reason();	// 타깃 리스트 조회
	
	public int ao_insert(PenaltyInsertDTO p);	// 기술 게시판 신고처리 추가
	public int aoc_insert(PenaltyInsertDTO p);	// 기술 게시판 신고처리 추가
	public int ao2_insert(PenaltyInsertDTO p);	// 기술 게시판 신고처리 추가
	
	public int tq_insert(PenaltyInsertDTO p);	// 기술 게시판 신고처리 추가
	public int tqc_insert(PenaltyInsertDTO p);	// 기술 게시판 댓글 신고처리 추가
	public int tq2_insert(PenaltyInsertDTO p);	// 기술 게시판 댓글 신고처리 추가
	
	public int cq_insert(PenaltyInsertDTO p);	// 커리어 게시판 신고처리 추가
	public int cqc_insert(PenaltyInsertDTO p);	// 커리어 게시판 댓글 신고처리 추가
	public int cq2_insert(PenaltyInsertDTO p);	// 커리어 게시판 대댓글 신고처리 추가
	
	public int p_insert(PenaltyInsertDTO p);	// 포트폴리오 게시판 신고처리 추가
	public int pc_insert(PenaltyInsertDTO p);	// 포트폴리오 게시판 댓글 신고처리 추가
	public int p2_insert(PenaltyInsertDTO p);	// 포트폴리오 게시판 대댓글 신고처리 추가

}
