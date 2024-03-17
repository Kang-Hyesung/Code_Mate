package com.test.mybatis.dto;

public class VoteDTO
{
	private String v_code, title, cq_code, vs_code, content;
	
	private int count;
	
	// getter / setter 구성

	public String getV_code()
	{
		return v_code;
	}

	public void setV_code(String v_code)
	{
		this.v_code = v_code;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getCq_code()
	{
		return cq_code;
	}

	public void setCq_code(String cq_code)
	{
		this.cq_code = cq_code;
	}

	public String getVs_code()
	{
		return vs_code;
	}

	public void setVs_code(String vs_code)
	{
		this.vs_code = vs_code;
	}

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

	public int getCount()
	{
		return count;
	}

	public void setCount(int count)
	{
		this.count = count;
	}
	
	
	
	
}
