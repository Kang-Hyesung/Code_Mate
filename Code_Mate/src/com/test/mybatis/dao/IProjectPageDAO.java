package com.test.mybatis.dao;

import java.util.ArrayList;
import java.util.HashMap;

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
	
}
