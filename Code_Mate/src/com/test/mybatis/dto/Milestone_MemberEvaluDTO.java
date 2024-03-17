package com.test.mybatis.dto;

public class Milestone_MemberEvaluDTO
{
	/*
		이름             널?       유형           
		-------------- -------- ------------ 
		AP_CODE                 VARCHAR2(10) 
		CP_CODE                 VARCHAR2(10) 
		P_MEM_CODE     NOT NULL VARCHAR2(10) 
		P_MA_CODE               VARCHAR2(10) 
		P_NICKNAME              VARCHAR2(50) 
		P_MEMBER_ROLE           VARCHAR2(50) 
		BACKEND_SCORE           NUMBER       
		FRONTEND_SCORE          NUMBER       
		MANNER_SCORE            NUMBER	
	*/
	
    
	private String ap_code, cp_code, p_mem_code, p_ma_code, p_nickname, p_member_role;
	private int  backend_score, frontend_score;
	private double manner_score;
	private String backGradeIcon, frontGradeIcon;
	private String evalu_ok;
	
	
	
	
	public String getEvalu_ok()
	{
		return evalu_ok;
	}
	public void setEvalu_ok(String evalu_ok)
	{
		this.evalu_ok = evalu_ok;
	}
	public String getAp_code()
	{
		return ap_code;
	}
	public void setAp_code(String ap_code)
	{
		this.ap_code = ap_code;
	}
	public String getCp_code()
	{
		return cp_code;
	}
	public void setCp_code(String cp_code)
	{
		this.cp_code = cp_code;
	}
	public String getP_mem_code()
	{
		return p_mem_code;
	}
	public void setP_mem_code(String p_mem_code)
	{
		this.p_mem_code = p_mem_code;
	}
	public String getP_ma_code()
	{
		return p_ma_code;
	}
	public void setP_ma_code(String p_ma_code)
	{
		this.p_ma_code = p_ma_code;
	}
	public String getP_nickname()
	{
		return p_nickname;
	}
	public void setP_nickname(String p_nickname)
	{
		this.p_nickname = p_nickname;
	}
	public String getP_member_role()
	{
		return p_member_role;
	}
	public void setP_member_role(String p_member_role)
	{
		this.p_member_role = p_member_role;
	}
	public int getBackend_score()
	{
		return backend_score;
	}
	public void setBackend_score(int backend_score)
	{
		this.backend_score = backend_score;
	}
	public int getFrontend_score()
	{
		return frontend_score;
	}
	public void setFrontend_score(int frontend_score)
	{
		this.frontend_score = frontend_score;
	}
	public double getManner_score()
	{
		return manner_score;
	}
	public void setManner_score(double manner_score)
	{
		this.manner_score = manner_score;
	}
	public String getBackGradeIcon()
	{
		return backGradeIcon;
	}
	public void setBackGradeIcon(String backGradeIcon)
	{
		this.backGradeIcon = backGradeIcon;
	}
	public String getFrontGradeIcon()
	{
		return frontGradeIcon;
	}
	public void setFrontGradeIcon(String frontGradeIcon)
	{
		this.frontGradeIcon = frontGradeIcon;
	}
	
	
	
	
	
	
}
