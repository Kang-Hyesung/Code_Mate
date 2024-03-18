package com.test.mybatis.dto;

public class FinalReport_ReportDTO
{
	/*
	 SELECT FR.FR_CODE    AS "FR_CODE"
     , P.P_CODE           AS "P_CODE"
     , OPMV.개설신청코드  AS "AP_CODE"
     , OPMV.개설확정코드  AS "CP_CODE"
     
     , OPMV.회원코드      AS "LEADER_MEM_CODE"
     , OPMV.멤버지원코드  AS "LEADER_MA_CODE"
     
     , OPMV.프로젝트명    AS "PROJECT_NAME"
     , FR.TITLE           AS "REPORT_TITLE"
     , FR.CONTENT         AS "REPORT_CONTENT"
	 */
	
	private String fr_code, p_code, ap_code, cp_code
				 , leader_mem_code, leader_ma_code
				 , project_name
				 , report_title, report_content;

	
	public String getFr_code()
	{
		return fr_code;
	}

	public void setFr_code(String fr_code)
	{
		this.fr_code = fr_code;
	}

	public String getP_code()
	{
		return p_code;
	}

	public void setP_code(String p_code)
	{
		this.p_code = p_code;
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

	public String getLeader_mem_code()
	{
		return leader_mem_code;
	}

	public void setLeader_mem_code(String leader_mem_code)
	{
		this.leader_mem_code = leader_mem_code;
	}

	public String getLeader_ma_code()
	{
		return leader_ma_code;
	}

	public void setLeader_ma_code(String leader_ma_code)
	{
		this.leader_ma_code = leader_ma_code;
	}

	public String getProject_name()
	{
		return project_name;
	}

	public void setProject_name(String project_name)
	{
		this.project_name = project_name;
	}

	public String getReport_title()
	{
		return report_title;
	}

	public void setReport_title(String report_title)
	{
		this.report_title = report_title;
	}

	public String getReport_content()
	{
		return report_content;
	}

	public void setReport_content(String report_content)
	{
		this.report_content = report_content;
	}
	
	

}
