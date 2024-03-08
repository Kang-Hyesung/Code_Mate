package com.test.mybatis.dao;

import java.util.HashMap;
import java.util.List;

import com.test.mybatis.dto.PortfolioDTO;

public interface IPortfolioDAO
{	
	// 총 갯수
	public int count();
	
	// 리스트
	public List<PortfolioDTO> getLists();
	
	// 포트폴리오 하나
	public PortfolioDTO getReadData(String article);
	
	// 좋아요 했는지 안했는지 플래그 조회
	public int findLike(String mem_code, String p_code);
	
	// 좋아요 증가/취소
	public int likeUp(String mem_code, String p_code);
	public int likeDown(String p_code, String mem_code);
	
	// 포트폴리오 태그 조회
	public List<HashMap<String, String>> getSkillTagList(String p_code);
	
	// 포트폴리오 좋아요 조회
	public int likeCount(String p_code);
	
	// 조회수 증가
	public int viewsUp(String p_code);
	
	// 팀장 이름 가져오기
	public String findLeader(String p_code);
	
	// 프론트 가져오기
	public List<HashMap<String, String>> findFront(String p_code);
	
	// 백 가져오기
	public List<HashMap<String, String>> findBack(String p_code);
}
