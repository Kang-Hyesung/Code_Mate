package com.test.mybatis.dao;

import java.util.ArrayList;

import com.test.mybatis.dto.Milestone_CheckListDTO;
import com.test.mybatis.dto.Milestone_MemberEvaluDTO;

public interface IMilestoneDAO
{
	// [마일스톤 체크리스트 항목들을 반환]
	public ArrayList<Milestone_CheckListDTO> milestone_checkList(String prj_cp_code, String step);
	
	// [개설확정코드, 로그인한 회원의 멤버코드로 직위 반환]
	public String whatIsMyMemberRole(String cp_code, String mem_code);
	
	
	// [마일스톤 체크리스트 체크여부 확인]
	public int isChecked(String checklist_code);
	
	
	// [마일스톤 체크리스트 체크 혹은 체크 해제 액션]
	public void checkingAction(String checklist_code, String is_checked_code);
	
	
	// [마일스톤 항목 추가 입력 액션 - 프로시저 사용]
	public void checkListInserting(String v_cp_code, String v_ma_code, String v_step, String v_content);
	
	
	// [수정 버튼 클릭시, 매개변수로 받은 CK_CODE 에 해당하는 텍스트 내용을 반환]
	public String searchCheckList(String checklist_code);
	
	
	// [마일스톤 항목 수정 액션]
	public void checkListEditOk(String checklist_code, String ma_code, String checklist_content);
	

	// [마일스톤 항목 삭제 액션]
	public void checkListDelOk(String checklist_code);
	
	
	// [개설 확정 코드와, 멤버 코드로 멤버지원코드 반환받기]
	public String searchMyMaCode(String mem_code, String prj_cp_code);

	
	// [개설 확정 코드로 개설 신청 코드 반환받기]
	public String searchPjApCode(String cp_code);
	
	
	// [체크리스트 코드를 이용하여, 대분류 단계명, 프로젝트 개설확정 코드 반환받기]
	public String ckCodeToStepCpCode(String checklist_code);
	

	// [마일스톤의 대분류 항목 각각의 완료 퍼센트(%) 반환 받기]
	public String milestoneOkPercent(String step, String prj_cp_code);
	
	
	// [마일스톤의 대분류 항목 전체 완료 퍼센트의 총합값 반환 받기]
	public int allMileStoneTotalPercent(String prj_cp_code);
	
	
	// [마일스톤 대분류 항목 전체 완료시 보여질 팀원 평가에 보여질 내용을 DTO로 반환]
	public ArrayList<Milestone_MemberEvaluDTO> milestoneMemberEvaluation(String cp_code, String p_mem_code);
	
	
	// [멤버 평가 실력 점수, 매너 점수 입력]
	public void memberEvaluScore(String a_ma_code, String p_ma_code, String ed_code, int evalu_score);
	
	

}
