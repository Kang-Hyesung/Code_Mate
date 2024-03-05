package com.test.mybatis.dao;

import java.util.ArrayList;

import com.test.mybatis.dto.ReportDTO;


public interface IReportDAO
{
	public ArrayList<ReportDTO> list(String cp_code);
	public ArrayList<ReportDTO> rank(String cp_code);
}
