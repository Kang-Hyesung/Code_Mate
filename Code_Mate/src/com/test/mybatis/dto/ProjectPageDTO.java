package com.test.mybatis.dto;

public class ProjectPageDTO
{
	private String ap_code, title, summary, sdate, edate, content, kdate, mem_code, nickname, tag_name, status;
	private int numbers, views, count;
	
	public String getStatus()
	{
		return status;
	}
	public void setStatus(String status)
	{
		this.status = status;
	}
	public String getTag_name()
	{
		return tag_name;
	}
	public void setTag_name(String tag_name)
	{
		this.tag_name = tag_name;
	}
	public String getAp_code()
	{
		return ap_code;
	}
	public void setAp_code(String ap_code)
	{
		this.ap_code = ap_code;
	}
	public String getNickname()
	{
		return nickname;
	}
	public void setNickname(String nickname)
	{
		this.nickname = nickname;
	}
	public int getCount()
	{
		return count;
	}
	public void setCount(int count)
	{
		this.count = count;
	}
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
	public String getSdate()
	{
		return sdate;
	}
	public void setSdate(String sdate)
	{
		this.sdate = sdate;
	}
	public String getEdate()
	{
		return edate;
	}
	public void setEdate(String edate)
	{
		this.edate = edate;
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
	public int getNumbers()
	{
		return numbers;
	}
	public void setNumbers(int numbers)
	{
		this.numbers = numbers;
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
