/*=======================
 *   IMemberDAO.java
 *   - 인터페이스
 ======================*/

package com.test.mybatis.dao;

import java.util.ArrayList;

import com.test.mybatis.dto.InquiryDTO;

public interface IInquiryDAO
{
	public ArrayList<InquiryDTO> list();
	public int count();
	
}
