package com.test.mybatis.dto;

public class QnaListDTO
{
	String cq_code, title, content, kdate, mem_code, tq_code;
	int views;
	public String getCq_code()
	{
		return cq_code;
	}
	public void setCq_code(String cq_code)
	{
		this.cq_code = cq_code;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getKdate()
	{
		return kdate;
	}
	public void setKdate(String kdate)
	{
		this.kdate = kdate;
	}
	public String getMem_code()
	{
		return mem_code;
	}
	public void setMem_code(String mem_code)
	{
		this.mem_code = mem_code;
	}
	public String getTq_code()
	{
		return tq_code;
	}
	public void setTq_code(String tq_code)
	{
		this.tq_code = tq_code;
	}
	public int getViews()
	{
		return views;
	}
	public void setViews(int views)
	{
		this.views = views;
	}
	
	
}
