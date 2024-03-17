package com.test.mybatis.dto;

public class AdminDTO
{
	private String mem_code, id, pw, nickname, kdate, mbti;
	private int post, comments, rn;
	
	
	public int getRn()
	{
		return rn;
	}
	public void setRn(int rn)
	{
		this.rn = rn;
	}
	public String getMem_code()
	{
		return mem_code;
	}
	public void setMem_code(String mem_code)
	{
		this.mem_code = mem_code;
	}
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getPw()
	{
		return pw;
	}
	public void setPw(String pw)
	{
		this.pw = pw;
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
	public String getMbti()
	{
		return mbti;
	}
	public void setMbti(String mbti)
	{
		this.mbti = mbti;
	}
	public int getPost()
	{
		return post;
	}
	public void setPost(int post)
	{
		this.post = post;
	}
	public int getComments()
	{
		return comments;
	}
	public void setComments(int comments)
	{
		this.comments = comments;
	}

	
}
