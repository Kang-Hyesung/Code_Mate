package com.test.mybatis.dao;

import java.util.ArrayList;

import com.test.mybatis.dto.MeetingDTO;


public interface IMeetingDAO
{
	public ArrayList<MeetingDTO> list(String ma_code);
}
