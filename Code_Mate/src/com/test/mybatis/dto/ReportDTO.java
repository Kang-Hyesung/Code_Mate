package com.test.mybatis.dto;

public class ReportDTO
{
	private String title, summary, state, kdate, mem_code, nickname, content, task_code, br_code, ma_code;
	public String getMa_code()
	{
		return ma_code;
	}
	public void setMa_code(String ma_code)
	{
		this.ma_code = ma_code;
	}
	private int num;
	
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getSummary()
	{
		return summary;
	}
	public void setSummary(String summary)
	{
		this.summary = summary;
	}
	public String getState()
	{
		return state;
	}
	public void setState(String state)
	{
		this.state = state;
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
	public String getNickname()
	{
		return nickname;
	}
	public void setNickname(String nickname)
	{
		this.nickname = nickname;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getTask_code()
	{
		return task_code;
	}
	public void setTask_code(String task_code)
	{
		this.task_code = task_code;
	}
	public String getBr_code()
	{
		return br_code;
	}
	public void setBr_code(String br_code)
	{
		this.br_code = br_code;
	}
	public int getNum()
	{
		return num;
	}
	public void setNum(int num)
	{
		this.num = num;
	}

}
