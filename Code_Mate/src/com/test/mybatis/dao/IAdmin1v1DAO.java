/*=======================
 *   IAdmin1v1DAO

 ======================*/

package com.test.mybatis.dao;

import java.util.ArrayList;

import com.test.mybatis.dto.Admin1v1DTO;
import com.test.mybatis.dto.IReplyDTO;

public interface IAdmin1v1DAO
{
	public ArrayList<Admin1v1DTO> list();
	public ArrayList<Admin1v1DTO> listselect(String iq_code);
	public int count();
	
	public int insert(IReplyDTO d);
}

