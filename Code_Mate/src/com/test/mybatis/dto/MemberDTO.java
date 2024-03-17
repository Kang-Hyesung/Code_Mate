/*========================================
 *   MemberDTO.java
 *   - 데이터 저장 및 전송 전용 객체.
 =======================================*/

package com.test.mybatis.dto;

public class MemberDTO
{	
	private String mem_code, id, pw, nickname, kdate, mbti_code, admin_code;
	

	public String getAdmin_code()
	{
		return admin_code;
	}

	public void setAdmin_code(String admin_code)
	{
		this.admin_code = admin_code;
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

	public String getMbti_code()
	{
		return mbti_code;
	}

	public void setMbti_code(String mbti_code)
	{
		this.mbti_code = mbti_code;
	}	
	
	
}
