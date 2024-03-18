package com.test.mybatis.dto;

public class FinalReport_PTagDTO
{
	/*
	SELECT P.P_CODE     AS "P_CODE"
     	 , PT.PT_CODE   AS "PT_CODE"
     	 , PT.TAG_NAME  AS "TAG_NAME"
	*/
	
	private String p_code, pt_code, tag_name;
	

	public String getP_code()
	{
		return p_code;
	}

	public void setP_code(String p_code)
	{
		this.p_code = p_code;
	}

	public String getPt_code()
	{
		return pt_code;
	}

	public void setPt_code(String pt_code)
	{
		this.pt_code = pt_code;
	}

	public String getTag_name()
	{
		return tag_name;
	}

	public void setTag_name(String tag_name)
	{
		this.tag_name = tag_name;
	}
	
	
	
}
