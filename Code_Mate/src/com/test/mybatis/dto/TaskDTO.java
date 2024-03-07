package com.test.mybatis.dto;

public class TaskDTO
{
	private String task_code, title, content, startDate, endDate, ma_codep, kdate, ma_codea, cp_code, color;
	
	

	public String getColor()
	{
		return color;
	}

	public void setColor(String color)
	{
		this.color = color;
	}

	public String getCp_code()
	{
		return cp_code;
	}

	public void setCp_code(String cp_code)
	{
		this.cp_code = cp_code;
	}

	public String getMa_codea()
	{
		return ma_codea;
	}

	public void setMa_codea(String ma_codea)
	{
		this.ma_codea = ma_codea;
	}

	private String mem_code, nickname;

	public String getMem_code()
	{
		return mem_code;
	}

	public void setMem_code(String mem_code)
	{
		this.mem_code = mem_code;
	}

	public String getNickname()
	{
		return nickname;
	}

	public void setNickname(String nickname)
	{
		this.nickname = nickname;
	}

	public String getKdate()
	{
		return kdate;
	}

	public void setKdate(String kdate)
	{
		this.kdate = kdate;
	}

	public String getMa_codep()
	{
		return ma_codep;
	}

	public void setMa_codep(String ma_codep)
	{
		this.ma_codep = ma_codep;
	}

	public String getTask_code()
	{
		return task_code;
	}

	public void setTask_code(String task_code)
	{
		this.task_code = task_code;
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

	public String getStartDate()
	{
		return startDate;
	}

	public void setStartDate(String startDate)
	{
		this.startDate = startDate;
	}

	public String getEndDate()
	{
		return endDate;
	}

	public void setEndDate(String endDate)
	{
		this.endDate = endDate;
	}
	
	
}
