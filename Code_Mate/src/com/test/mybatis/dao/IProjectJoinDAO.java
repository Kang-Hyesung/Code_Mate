package com.test.mybatis.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.test.mybatis.dto.ProjectJoinDTO;


public interface IProjectJoinDAO
{
	// 프로젝트
	public ProjectJoinDTO project(String ap_code);
	
	// 뷰 업데이트
	public int updatepj(String ap_code);
	
	// 태그
	public ArrayList<ProjectJoinDTO> tag();
	
	// 댓글
	public ArrayList<ProjectJoinDTO> comment();
	
	// 핫한 프로젝트
	public ArrayList<ProjectJoinDTO> hotpj();
	
	// 새로운 프젝
	public ArrayList<ProjectJoinDTO> newpj();
	
	// 왼쪽 태그들
	public ArrayList<ProjectJoinDTO> lefttag();
	
	// 프론트 인원수
	public int frontnum(String ap_code);
	
	// 백 인원수
	public int backnum(String ap_code);
	
	// 점수들
	public ProjectJoinDTO score(String mem_code);
	
	// 나이 조건
	public int agecondition(String ap_code);
	
	// 백엔드 조건
	public String backcondition(String ap_code);
	
	// 프론트 조건
	public String frontcondition(String ap_code);
	
	// 성별 조건
	public String gendercondition(String ap_code);
	
	// 매너 점수 조건
	public double mannercondition(String ap_code);
	
	// 리스트(미정)
	public ArrayList<ProjectJoinDTO> lists(String ap_code);
	
	// 리스트(확정)
	public ArrayList<ProjectJoinDTO> haplists(String ap_code);
	
	// RC코드, 인원수 (프론트)
	public ProjectJoinDTO frcnumlists(String ap_code);
	
	// RC코드, 인원수 (백엔드)
	public ProjectJoinDTO brcnumlists(String ap_code);
	
	// 멤버 지원 추가 (프론트)프론트 rc 넣기
	public int fmemapply(String mem_code, String rc_code);
	
	// 멤버 지원 추가 (백엔드)백엔드 rc 넣기
	public int bmemapply(String mem_code, String rc_code);
	
	// 멤버 지원 -> 확정(백엔드)
	public int bmemupdate(String rc_code, String mem_code);
	
	// 멤버 지원 -> 확정(프론트)
	public int fmemupdate(String rc_code, String mem_code);
	
	// 확정 인원수(백엔드)
	public int bcount(String ap_code);
	
	// 확정 인원수(프론트)
	public int fcount(String ap_code);
	
	// RC코드, 인원수 (프론트)
	public String rccode(String mr_code,String ap_code);
}
