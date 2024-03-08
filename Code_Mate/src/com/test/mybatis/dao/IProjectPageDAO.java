package com.test.mybatis.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.test.mybatis.dto.ProjectPageDTO;

public interface IProjectPageDAO
{
	public ArrayList<ProjectPageDTO> pjdto(String mem_code);
	public ArrayList<ProjectPageDTO> pjtagap(String mem_code);
	
	
}
