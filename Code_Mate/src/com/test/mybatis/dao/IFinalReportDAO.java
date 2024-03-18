package com.test.mybatis.dao;

import java.util.ArrayList;

import com.test.mybatis.dto.FinalReport_PTagDTO;
import com.test.mybatis.dto.FinalReport_ReportDTO;

public interface IFinalReportDAO
{
	// [결산 보고서 객체 반환받기]
	public FinalReport_ReportDTO finalReportShow(String cp_code);
	
	// [결산 보고서 태그 리스트 반환받기]
	public ArrayList<FinalReport_PTagDTO> finalReportTagList(String cp_code);
	
	
	// [개설 확정 코드와, 멤버 코드로 직위 반환받기]
	public String whatIsMyMemberRole(String cp_code, String mem_code);


	// [개설 확정 코드를 이용해, 결산 보고서가 이미 작성 되었는지를 확인하는 문자열 반환받기]
	public String didYouFinalReportWrite(String cp_code);
	
	
	// [결산 보고서 INSERT 하기]
	public void finalReportWrite(String cp_code, String report_title, String report_content);
	
	
	// [이번에 INSERT 해야 할 포트폴리오의 PRIMARY_KEY 『P_CODE』 반환받기]
	public String nowPortfolioCode();
	
	
	// [포트폴리오 INSERT 하기]
	public void portFolioWrite(String now_p_code, String cp_code, String leader_mem_code, String report_title, String report_content);
	
	
	// [포트폴리오 태그 INSERT 하기]
	public void portFolioAddTag(String now_p_code, String tag_name);
	
	
}
