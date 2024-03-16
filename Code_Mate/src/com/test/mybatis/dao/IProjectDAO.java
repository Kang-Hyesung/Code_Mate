package com.test.mybatis.dao;

import com.test.mybatis.dto.ProjectDTO;

public interface IProjectDAO
{
	public ProjectDTO getProject(String ap_code);
}