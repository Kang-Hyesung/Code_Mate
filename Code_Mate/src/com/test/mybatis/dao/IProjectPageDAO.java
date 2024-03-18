package com.test.mybatis.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.test.mvc.PagingVO;
import com.test.mybatis.dto.ProjectPageDTO;

public interface IProjectPageDAO
{
	// 내가 하고있는 프로젝트
	public ArrayList<ProjectPageDTO> pjdto(String mem_code);
	
	// 전체보기
	public ArrayList<ProjectPageDTO> allpjlist();
	
	
	// 모집중
	public ArrayList<ProjectPageDTO> ingpjlist();
	
	// 모집완료
	public ArrayList<ProjectPageDTO> endpjlist();
	
	// 태그
	public ArrayList<ProjectPageDTO> tag();
	
	// 댓글
	public ArrayList<ProjectPageDTO> comment();
	
	// 핫한 프로젝트
	public ArrayList<ProjectPageDTO> hotpj();
	
	// 새로운 프젝
	public ArrayList<ProjectPageDTO> newpj();
	
	// 왼쪽 태그들
	public ArrayList<ProjectPageDTO> lefttag();
	
	// 전체 카운트
	public int allcount();
	
	// 진행중 카운트
	public int ingcount();
	
	// 진행완료 카운트
	public int endcount();
	
	// 내가 진행중 카운트
	public int mycount(String mem_code);
	
	// 전체 페이징 처리
	public List<ProjectPageDTO> pagelist(PagingVO vo);
	
	// 전체 페이징 처리
	public List<ProjectPageDTO> ingpagelist(PagingVO vo);
	
	// 전체 페이징 처리
	public List<ProjectPageDTO> endpagelist(PagingVO vo);
	
	// 신고
	public ProjectPageDTO reportmem(String mem_code);
	
	// 신고
	public int reportcount(String mem_code);
	
}
