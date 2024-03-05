package com.test.mybatis;

import java.util.ArrayList;

public interface IMeetingDAO
{
	public ArrayList<MeetingDTO> list(String ma_code);
}
