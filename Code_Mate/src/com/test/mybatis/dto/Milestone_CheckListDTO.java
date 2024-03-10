package com.test.mybatis.dto;

public class Milestone_CheckListDTO
{
	//-- 『is_checked』 → 0 : 체크 안 함, 1: 체크함
	/*
	   M.MEM_CODE       AS "MEM_CODE"
     , MA.MA_CODE       AS "MA_CODE"
     , M.NICKNAME       AS "NICKNAME"
     , MR.ROLE          AS "MEMBER_ROLE"
     , MR.MR_CODE       AS "MEMBER_ROLE_CODE"
     , MS.MS_CODE       AS "MILESTONE_CODE"
     , ST.STEP          AS "STEP"
     , ST.ST_CODE       AS "STEP_CODE"
     , CK.CK_CODE       AS "CHECKLIST_CODE"
     , CK.CONTENT       AS "CHECKLIST_CONTENT"
     , CC.CHECKS        AS "IS_CHECKED" 
     , CC.CC_CODE       AS "IS_CHECKED_CODE"
     , AP.PRJ_NAME      AS "PRJ_NAME"
     , CP.CP_CODE       AS "PRJ_CP_CODE" 
	*/

	private String mem_code, ma_code, nickname, member_role, member_role_code;
	private String milestone_code, step, step_code, checklist_code, checklist_content, is_checked_code;
	private String prj_name, prj_cp_code;
	private int is_checked;
	
	
	public String getChecklist_code()
	{
		return checklist_code;
	}
	public void setChecklist_code(String checklist_code)
	{
		this.checklist_code = checklist_code;
	}
	public String getMem_code()
	{
		return mem_code;
	}
	public void setMem_code(String mem_code)
	{
		this.mem_code = mem_code;
	}
	public String getMa_code()
	{
		return ma_code;
	}
	public void setMa_code(String ma_code)
	{
		this.ma_code = ma_code;
	}
	public String getNickname()
	{
		return nickname;
	}
	public void setNickname(String nickname)
	{
		this.nickname = nickname;
	}
	public String getMember_role()
	{
		return member_role;
	}
	public void setMember_role(String member_role)
	{
		this.member_role = member_role;
	}
	public String getMember_role_code()
	{
		return member_role_code;
	}
	public void setMember_role_code(String member_role_code)
	{
		this.member_role_code = member_role_code;
	}
	public String getMilestone_code()
	{
		return milestone_code;
	}
	public void setMilestone_code(String milestone_code)
	{
		this.milestone_code = milestone_code;
	}
	public String getStep()
	{
		return step;
	}
	public void setStep(String step)
	{
		this.step = step;
	}
	public String getStep_code()
	{
		return step_code;
	}
	public void setStep_code(String step_code)
	{
		this.step_code = step_code;
	}
	public String getChecklist_content()
	{
		return checklist_content;
	}
	public void setChecklist_content(String checklist_content)
	{
		this.checklist_content = checklist_content;
	}
	public String getIs_checked_code()
	{
		return is_checked_code;
	}
	public void setIs_checked_code(String is_checked_code)
	{
		this.is_checked_code = is_checked_code;
	}
	public String getPrj_name()
	{
		return prj_name;
	}
	public void setPrj_name(String prj_name)
	{
		this.prj_name = prj_name;
	}
	public String getPrj_cp_code()
	{
		return prj_cp_code;
	}
	public void setPrj_cp_code(String prj_cp_code)
	{
		this.prj_cp_code = prj_cp_code;
	}
	public int getIs_checked()
	{
		return is_checked;
	}
	public void setIs_checked(int is_checked)
	{
		this.is_checked = is_checked;
	}
	
	
}
