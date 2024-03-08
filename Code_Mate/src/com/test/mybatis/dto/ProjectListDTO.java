package com.test.mybatis.dto;

public class ProjectListDTO
{
	private String ap_code, title, pj_name, summary, sdate, edate, content, kdate, memcode;
	//			   개설신청  제목   프젝제목  요약   시작일 종료일  상세내용 신청일 회원코드
	
	private int number, views;
	//			 인원수  조회수

	public String getAp_code()
	{
		return ap_code;
	}

	public void setAp_code(String ap_code)
	{
		this.ap_code = ap_code;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getPj_name()
	{
		return pj_name;
	}

	public void setPj_name(String pj_name)
	{
		this.pj_name = pj_name;
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

	public String getMemcode()
	{
		return memcode;
	}

	public void setMemcode(String memcode)
	{
		this.memcode = memcode;
	}

	public int getNumber()
	{
		return number;
	}

	public void setNumber(int number)
	{
		this.number = number;
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
