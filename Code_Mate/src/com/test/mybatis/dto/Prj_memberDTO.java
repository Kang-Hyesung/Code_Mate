
package com.test.mybatis.dto;

public class Prj_memberDTO
{
	private String p_nickname, p_member_role, backend_score, frontend_score;

	public String getP_nickname()
	{
		return p_nickname;
	}

	public void setP_nickname(String p_nickname)
	{
		this.p_nickname = p_nickname;
	}

	public String getP_member_role()
	{
		return p_member_role;
	}

	public void setP_member_role(String p_member_role)
	{
		this.p_member_role = p_member_role;
	}

	public String getBackend_score()
	{
		return backend_score;
	}

	public void setBackend_score(String backend_score)
	{
		this.backend_score = backend_score;
	}

	public String getFrontend_score()
	{
		return frontend_score;
	}

	public void setFrontend_score(String frontend_score)
	{
		this.frontend_score = frontend_score;
	}
	
}
