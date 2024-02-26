/*====================
 *   Sample.java
 *   - 컨트롤러 객체
 ===================*/

package com.test.mybatis;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController
{	
	@RequestMapping(value="/Code_Mate.action", method=RequestMethod.GET)
	public String hello(Model model)
	{	
		return "/WEB-INF/view/main/Template.jsp";
		
	}
	
	@RequestMapping(value="/Login.action", method=RequestMethod.GET)
	public String login(Model model)
	{	
		return "/WEB-INF/view/main/Login.jsp";
	}
	
	@RequestMapping(value="/join.action", method=RequestMethod.GET)
	public String join(String email, String id, String pw)
	{	
		System.out.println(id);
		System.out.println(pw);
		
		MemberDTO dto = new MemberDTO();
		
		dto.setId(id);
		dto.setPw(pw);
		
		// 가장 큰 mem_code 받아와서 그 코드 이용해 회원정보 테이블에 이메일과 같이 넣어줌
		
		
		return "/WEB-INF/view/main/Template.jsp";
	}
}



