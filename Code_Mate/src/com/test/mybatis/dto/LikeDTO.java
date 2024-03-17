package com.test.mybatis.dto;

public class LikeDTO
{
	private String nickname;
	
	private int total, likes;
	
	// getter / setter 구성

	public int getLikes()
	{
		return likes;
	}

	public void setLikes(int likes)
	{
		this.likes = likes;
	}

	public String getNickname()
	{
		return nickname;
	}

	public void setNickname(String nickname)
	{
		this.nickname = nickname;
	}

	public int getTotal()
	{
		return total;
	}

	public void setTotal(int total)
	{
		this.total = total;
	}
	
	
}
