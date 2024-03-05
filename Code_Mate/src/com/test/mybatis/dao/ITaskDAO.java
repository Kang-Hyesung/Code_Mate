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
	public String getWriter(String ma_code);
}
