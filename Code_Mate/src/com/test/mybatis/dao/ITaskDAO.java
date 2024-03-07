/*=======================
 *   IMemberDAO.java
 *   - 인터페이스
 ======================*/

package com.test.mybatis.dao;

import java.util.ArrayList;

import com.test.mybatis.dto.TaskDTO;


public interface ITaskDAO
{
	public ArrayList<TaskDTO> list(String cp_code);
	public ArrayList<TaskDTO> getWeek(String cp_code);
	public ArrayList<TaskDTO> getMyWeek(String cp_code, String ma_codep);
	
	public ArrayList<TaskDTO> getIng(String cp_code);
	public ArrayList<TaskDTO> getMyIng(String cp_code, String ma_codep);
	
	public ArrayList<TaskDTO> getWill(String cp_code);
	public ArrayList<TaskDTO> getMyWill(String cp_code, String ma_codep);
	
	public ArrayList<TaskDTO> getMyEnd(String cp_code, String ma_codep);
	
	public String getWriter(String ma_code);
	public void addTask(TaskDTO dto);
}
