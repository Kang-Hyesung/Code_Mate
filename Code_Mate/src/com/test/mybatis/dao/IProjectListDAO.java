package com.test.mybatis.dao;

import java.util.ArrayList;

import com.test.mybatis.dto.ProjectListDTO;

public interface IProjectListDAO
{
	public ArrayList<ProjectListDTO> list();
}
