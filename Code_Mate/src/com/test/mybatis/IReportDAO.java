package com.test.mybatis;

import java.util.ArrayList;

public interface IReportDAO
{
	public ArrayList<ReportDTO> list(String cp_code);
	public ArrayList<ReportDTO> rank(String cp_code);
}
