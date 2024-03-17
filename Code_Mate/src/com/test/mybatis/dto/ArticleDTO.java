package com.test.mybatis.dto;

public class ArticleDTO
{
	private String code, title, content, kdate, mem_code, nickname;
	
	private int views;
	
	// getter / setter 구성

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
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

	public int getViews()
	{
		return views;
	}

	public void setViews(int views)
	{
		this.views = views;
	}
	
	
	
	
}
