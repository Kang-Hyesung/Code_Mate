package com.test.mybatis.dto;

public class BoardDTO
{
	private String code, title, content, kdate, mem_code, nickname;
	
	private int views, comments, count, rn;	
	
	// getter / setter 구성
	
	public int getCount()
	{
		return count;
	}

	public int getRn()
	{
		return rn;
	}

	public void setRn(int rn)
	{
		this.rn = rn;
	}

	public void setCount(int count)
	{
		this.count = count;
	}

	public String getNickname()
	{
		return nickname;
	}

	public void setNickname(String nickname)
	{
		this.nickname = nickname;
	}

	public String getCode()
	{
		return code;
	}

	public void setCode(String code)
	{
		this.code = code;
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

	public int getViews()
	{
		return views;
	}

	public void setViews(int views)
	{
		this.views = views;
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
