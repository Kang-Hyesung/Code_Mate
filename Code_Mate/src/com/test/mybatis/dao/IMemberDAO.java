/*=======================
 *   IMemberDAO.java
 *   - 인터페이스
 ======================*/

package com.test.mybatis.dao;

import java.util.ArrayList;

import com.test.mybatis.dto.MemberDTO;

public interface IMemberDAO
{
	public ArrayList<MemberDTO> list();
	public int count();
	public int add(MemberDTO m);
	public int remove(int mem_code);
	public MemberDTO login(String art0, String arg1);
	public void memberJoin(String id, String pw, String email);
	public ArrayList<MemberDTO> getLeader(String ap_code, String mr_code);
	public ArrayList<MemberDTO> getFront(String ap_code, String mr_code);
	public ArrayList<MemberDTO> getBack(String ap_code, String mr_code);
	public String getMacode(String mem_code, String cp_code);
	public String getLeader_ma(String ap_code);
	
	public ArrayList<MemberDTO> getMember(String ap_code);
}
