package com.test.mybatis.dto;

public class Admin_PenaltyDTO
{
	private String mem_code, nickname, type
	, kdate, r_content, r_date, penalty, pro_date, process;

	public String getType()
	{
		return type;
	}

	public void setType(String type)
	{
		this.type = type;
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

	public String getKdate()
	{
		return kdate;
	}

	public void setKdate(String kdate)
	{
		this.kdate = kdate;
	}

	public String getR_content()
	{
		return r_content;
	}

	public void setR_content(String r_content)
	{
		this.r_content = r_content;
	}

	public String getR_date()
	{
		return r_date;
	}

	public void setR_date(String r_date)
	{
		this.r_date = r_date;
	}

	public String getPenalty()
	{
		return penalty;
	}

	public void setPenalty(String penalty)
	{
		this.penalty = penalty;
	}

	public String getPro_date()
	{
		return pro_date;
	}

	public void setPro_date(String pro_date)
	{
		this.pro_date = pro_date;
	}

	public String getProcess()
	{
		return process;
	}

	public void setProcess(String process)
	{
		this.process = process;
	}
	
}
