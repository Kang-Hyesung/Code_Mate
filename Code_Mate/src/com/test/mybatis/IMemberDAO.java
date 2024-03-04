/*=======================
 *   IMemberDAO.java
 *   - 인터페이스
 ======================*/

package com.test.mybatis;

import java.util.ArrayList;

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
}
