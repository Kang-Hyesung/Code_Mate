package com.test.mybatis.dao;

import java.util.ArrayList;

import com.test.mybatis.dto.SearchViewDTO;

public interface ISearchViewDAO
{
	// 전체 프로젝트 리스트
	public ArrayList<SearchViewDTO> pjlist(String searchcon);
	
	// 전체 qna 리스트
	public ArrayList<SearchViewDTO> qnalist(String searchcon);
	
	// 검색 프로젝트 댓글수
	public ArrayList<SearchViewDTO> pjcomment();
	
	// 검색 qna 댓글수
	public ArrayList<SearchViewDTO> qnacomment();
	
	// 태그
	public ArrayList<SearchViewDTO> tag();
	
	
	// 핫 10위
	public ArrayList<SearchViewDTO> hotpj();
	
	//프젝 카운트
	public int pjcount(String searchcon);
	
	// qna 카운트
	public int qnacount(String searchcon);
	
	
}
