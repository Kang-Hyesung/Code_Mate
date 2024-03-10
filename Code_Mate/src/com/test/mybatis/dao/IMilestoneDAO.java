package com.test.mybatis.dao;

import java.util.ArrayList;

import com.test.mybatis.dto.Milestone_CheckListDTO;

public interface IMilestoneDAO
{
	// [마일스톤 체크리스트 항목들을 반환]
	public ArrayList<Milestone_CheckListDTO> milestone_checkList(String prj_cp_code, String step);
	
	// [마일스톤 체크리스트 체크여부 확인]
	public int isChecked(String checklist_code);
	
	// [마일스톤 체크리스트 체크 혹은 체크 해제 액션]
	public void checkingAction(String checklist_code, String is_checked_code);
	
	// [마일스톤 항목 추가 입력 액션 - 프로시저 사용]
	/*
	    V_CP_CODE   IN C_PROJECT.CP_CODE%TYPE
	  , V_MA_CODE   IN MEMBER_APPLY.MA_CODE%TYPE
	  , V_STEP      IN STEP.STEP%TYPE
	  , V_CONTENT   IN CHECKLIST.CONTENT%TYPE
	*/
	public void checkListInserting(String v_cp_code, String v_ma_code, String v_step, String v_content);
	
}
