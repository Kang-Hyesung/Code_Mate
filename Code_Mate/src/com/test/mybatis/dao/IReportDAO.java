package com.test.mybatis.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.test.mybatis.dto.LastDTO;
import com.test.mybatis.dto.ReportDTO;


public interface IReportDAO
{
	public ArrayList<ReportDTO> list(String cp_code);
	public ArrayList<ReportDTO> rank(String cp_code);
	public void addReport(@Param("task_code")String task_code, @Param("content")String content, @Param("summary")String summary);
	public ArrayList<ReportDTO> getReport(String ma_codep);
	
	public void setpass(String br_code);
	public void setnonepass(String br_code);
}
