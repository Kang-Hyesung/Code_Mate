package com.test.mybatis.dto;

public class ReplyDTO
{
	private String R_code, kdate, reply, cqc_code, mem_code, nickname;
	
	// getter / setter 구성
	
	public String getR_code()
	{
		return R_code;
	}

	public void setR_code(String r_code)
	{
		R_code = r_code;
	}

	public String getKdate()
	{
		return kdate;
	}

	public void setKdate(String kdate)
	{
		this.kdate = kdate;
	}

	public String getReply()
	{
		return reply;
	}

	public void setReply(String reply)
	{
		this.reply = reply;
	}

	public String getCqc_code()
	{
		return cqc_code;
	}

	public void setCqc_code(String cqc_code)
	{
		this.cqc_code = cqc_code;
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
	
	
}
