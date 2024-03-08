package com.test.mybatis.dto;

public class PortfolioDTO
{
	private int count;
	
	private String p_code, prj_name, title, content, mem_code, skill_tag, nickname;
	
	public String getNickname()
	{
		return nickname;
	}

	public void setNickname(String nickname)
	{
		this.nickname = nickname;
	}

	public String getSkill_tag()
	{
		return skill_tag;
	}

	public void setSkill_tag(String skill_tag)
	{
		this.skill_tag = skill_tag;
	}

	public String getMem_code()
	{
		return mem_code;
	}

	public void setMem_code(String mem_code)
	{
		this.mem_code = mem_code;
	}

	private int views, hearts;
	
	// getter / setter 구성
	
	public String getP_code()
	{
		return p_code;
	}

	public void setP_code(String p_code)
	{
		this.p_code = p_code;
	}

	public String getPrj_name()
	{
		return prj_name;
	}

	public void setPrj_name(String prj_name)
	{
		this.prj_name = prj_name;
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

	public int getViews()
	{
		return views;
	}

	public void setViews(int views)
	{
		this.views = views;
	}

	public int getHearts()
	{
		return hearts;
	}

	public void setHearts(int hearts)
	{
		this.hearts = hearts;
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
