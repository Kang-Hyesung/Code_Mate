/*====================
 *   Sample.java
 *   - 컨트롤러 객체
 ===================*/

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.mybatis.dao.IMeetingDAO;
import com.test.mybatis.dao.IMemberDAO;
import com.test.mybatis.dao.IMyPageDAO;
import com.test.mybatis.dao.IReportDAO;
import com.test.mybatis.dao.ITaskDAO;
import com.test.mybatis.dto.MeetingDTO;
import com.test.mybatis.dto.MemberDTO;
import com.test.mybatis.dto.MyPageMethod;
import com.test.mybatis.dto.ReportDTO;
import com.test.mybatis.dto.TaskDTO;

@Controller
public class ProjectController
{	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/projectProgress.action")
	public String projectProgress(HttpServletRequest request)
	{
		IMemberDAO memberDao = sqlSession.getMapper(IMemberDAO.class);
		ITaskDAO taskDao = sqlSession.getMapper(ITaskDAO.class);
		IMeetingDAO meetingDao = sqlSession.getMapper(IMeetingDAO.class);
		IReportDAO reportDao = sqlSession.getMapper(IReportDAO.class);
		
		// 멤버리스트
		ArrayList<MemberDTO> leader = memberDao.getLeader("AP0006", "MR0001");
		ArrayList<MemberDTO> frontList = memberDao.getFront("AP0006", "MR0001");
		ArrayList<MemberDTO> backList = memberDao.getBack("AP0006", "MR0001");
		
		request.setAttribute("leader", leader);
		request.setAttribute("frontList", frontList);
		request.setAttribute("backList", backList);
		
		// Task
		ArrayList<TaskDTO> taskList = taskDao.list("CP0002");
		request.setAttribute("taskList", taskList);
		
		// 회의록
		ArrayList<MeetingDTO> meetingList = meetingDao.list("AP0006");
		request.setAttribute("meetingList", meetingList);
		
		// 업무보고글
		ArrayList<ReportDTO> reportList = reportDao.list("CP0002");
		request.setAttribute("reportList", reportList);
		
		// 활동량
		ArrayList<ReportDTO> rank = reportDao.rank("CP0002");
		request.setAttribute("rank", rank);
		
		String data = "" + "[";
		
		
		
		// 캘린더 events 에 들어갈 것
		for(TaskDTO dto: taskList)
		{
			data += "{'title' :'" + dto.getTitle() + "', "; 
			data += "'start' :'" + dto.getStartDate() + "', "; 
			data += "'end' :'" + dto.getEndDate() + "'},"; 
		}
		
		data +=  "]";
		
		request.setAttribute("data", data);
		
		return "/WEB-INF/view/project/prjActPage.jsp";
	}
		
	@RequestMapping(value = "/taskCal.action")
	public String taskCal(HttpServletRequest request, ModelMap model)
	{
		IMemberDAO memberDao = sqlSession.getMapper(IMemberDAO.class);
		ITaskDAO taskDao = sqlSession.getMapper(ITaskDAO.class);
		
		ArrayList<TaskDTO> taskList = taskDao.list("CP0002");
		request.setAttribute("taskList", taskList);
		
		String data = "" + "[";
		
		// 캘린더 events 에 들어갈 것
		for(TaskDTO dto: taskList)
		{
			data += "{'title' :'" + dto.getTitle() + "', "; 
			data += "'start' :'" + dto.getStartDate() + "', ";
			data += "'end' :'" + dto.getEndDate() + "'},"; 
		}
		
		data +=  "]";
		
		// 멤버리스트
		ArrayList<MemberDTO> leader = memberDao.getLeader("AP0006", "MR0001");
		ArrayList<MemberDTO> frontList = memberDao.getFront("AP0006", "MR0001");
		ArrayList<MemberDTO> backList = memberDao.getBack("AP0006", "MR0001");
		
		request.setAttribute("leader", leader);
		request.setAttribute("frontList", frontList);
		request.setAttribute("backList", backList);
		
		model.addAttribute("data", data);
		
		System.out.println(data);
		
		return "/WEB-INF/view/project/taskCal.jsp";
	}
	
	@RequestMapping(value = "/taskView.action")
	public String task(HttpServletRequest request, ModelMap model)
	{
		IMemberDAO memberDao = sqlSession.getMapper(IMemberDAO.class);
		ITaskDAO taskDao = sqlSession.getMapper(ITaskDAO.class);
		
		// task 날짜별로 분류
		ArrayList<TaskDTO> getWeek = taskDao.getWeek("CP0002");
		ArrayList<TaskDTO> getIng = taskDao.getIng("CP0002");
		ArrayList<TaskDTO> getWill = taskDao.getWill("CP0002");
		
		model.addAttribute("getWeek", getWeek);
		model.addAttribute("getIng", getIng);
		model.addAttribute("getWill", getWill);
		
		System.out.println(getWill.size());
		
		// 멤버리스트
		ArrayList<MemberDTO> leader = memberDao.getLeader("AP0006", "MR0001");
		ArrayList<MemberDTO> frontList = memberDao.getFront("AP0006", "MR0001");
		ArrayList<MemberDTO> backList = memberDao.getBack("AP0006", "MR0001");
		
		request.setAttribute("leader", leader);
		request.setAttribute("frontList", frontList);
		request.setAttribute("backList", backList);
		
		return "/WEB-INF/view/project/taskView.jsp";
	}
}



