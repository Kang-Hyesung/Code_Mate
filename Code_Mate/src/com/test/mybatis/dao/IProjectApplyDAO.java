package com.test.mybatis.dao;

import java.util.HashMap;

public interface IProjectApplyDAO
{
	// 개설 신청 인서트
	public int apinsert(String title, String summary, String sdate, String edate, String content,  int numbers, String mem_code, String prj_name);
	
	// ap코드 찾기
	public String apselect(String mem_code, String title, String summary);
	
	// 태그 인서트
	public int taginsert(String ap_code, String tag_name);
	
	// 성별 필터링
	public int genderinsert(String gender_code, String ap_code);
	
	// 등급 필터링
	public int gradeinsert(String grade_code, String ap_code);
	
	// 연령 필터링
	public int ageinsert(String ap_code, String aa_code);
	
	// 매너 필터링
	public int mannerinsert(double min, String ap_code);
	
}
