/*========================================
        IMyPageDAO.java
        - 마이페이지에서 필요한 메소드를 
          추상 메소드로 정의
=========================================*/

/*
--『공개여부 : 0 - 공개, 1 - 비공개』

--○ 프로필 사진
--○ 닉네임 
--○ 이메일 / 이메일 블라인드 여부
--○ 백엔드 스킬 점수, 프론트엔드 스킬 점수, 매너 점수
--○ 성별 / 성별 블라인드 여부
--○ 생년월일 / 생년월일 블라인드 여부
--○ MBTI
--○ Skill 태그
*/
package com.test.mybatis.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.test.mybatis.dto.MyPage_CareerDTO;
import com.test.mybatis.dto.MyPage_CommentDTO;
import com.test.mybatis.dto.MyPage_PjHistoryDTO;
import com.test.mybatis.dto.MyPage_PostDTO;


public interface IMyPageDAO
{
	// [프로필 사진]
	public String profileImg(String memCode);
	
	// [닉네임]
	public String nickName(String memCode);
	
	// [이메일]
	public String email(String memCode);
	
	// [이메일 공개여부]
	public int emailOpen(String memCode);
	
	// [백엔드 스킬 점수]
	public int backendScore(String memCode);
	
	// [프론트엔드 스킬 점수]
	public int frontendScore(String memCode);
	
	// [매너 점수]
	public double mannerScore(String memCode);
	
	// [성별]
	public String gender(String memCode);
	
	// [성별 공개여부]
	public int genderOpen(String memCode);
	
	// [생년월일]
	public String birthDay(String memCode);
	
	// [생년월일 공개여부]
	public int birthDayOpen(String memCode);
	
	// [MBTI]
	public String mbti(String memCode);
	
	// [Skill Tag]
	public ArrayList<String> skillTag(String memCode);
	
	// [경력]
	public ArrayList<MyPage_CareerDTO> careerList(String memCode);
	
	// [포트폴리오 이력]
	public ArrayList<MyPage_PjHistoryDTO> pjHistoryList(String memCode);
	
	// [본인이 작성한 게시글]
	public ArrayList<MyPage_PostDTO> postList(@Param("memCode") String memCode);

	// [본인이 작성한 댓글]
	public ArrayList<MyPage_CommentDTO> commentList(@Param("memCode") String memCode);
	
}


