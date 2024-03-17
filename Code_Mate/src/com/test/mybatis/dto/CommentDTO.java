package com.test.mybatis.dto;

public class CommentDTO
{
	private String cqc_code, kdate, comments, mem_code, nickname;
	
	private int likes;
	
	

	public int getLikes()
	{
		return likes;
	}

	public void setLikes(int likes)
	{
		this.likes = likes;
	}

	public String getCqc_code()
	{
		return cqc_code;
	}

	public void setCqc_code(String cqc_code)
	{
		this.cqc_code = cqc_code;
	}

	public String getKdate()
	{
		return kdate;
	}

	public void setKdate(String kdate)
	{
		this.kdate = kdate;
	}

	public String getComments()
	{
		return comments;
	}

	public void setComments(String comments)
	{
		this.comments = comments;
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
