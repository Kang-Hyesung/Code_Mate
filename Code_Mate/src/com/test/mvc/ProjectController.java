/*====================
 *   Sample.java
 *   - 컨트롤러 객체
 ===================*/

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.mybatis.dao.IMeetingDAO;
import com.test.mybatis.dao.IMemberDAO;
import com.test.mybatis.dao.IReportDAO;
import com.test.mybatis.dao.ITaskDAO;
import com.test.mybatis.dto.MeetingDTO;
import com.test.mybatis.dto.MemberDTO;
import com.test.mybatis.dto.ReportDTO;
import com.test.mybatis.dto.TaskDTO;

@Controller
public class ProjectController
{	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/projectProgress.action")
	public String projectProgress(HttpServletRequest request, ModelMap model)
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
			data += "'end' :'" + dto.getEndDate() + "',"; 
			data += "'color' :'" + dto.getColor() + "'},"; 
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
		
		
		
		// 멤버리스트
		ArrayList<MemberDTO> leader = memberDao.getLeader("AP0006", "MR0001");
		ArrayList<MemberDTO> frontList = memberDao.getFront("AP0006", "MR0001");
		ArrayList<MemberDTO> backList = memberDao.getBack("AP0006", "MR0001");
		
		request.setAttribute("leader", leader);
		request.setAttribute("frontList", frontList);
		request.setAttribute("backList", backList);
		
		return "/WEB-INF/view/project/taskView.jsp";
	}
	
	@RequestMapping(value = "/taskInsert.action")
	public String taskInsert(TaskDTO dto, ModelMap model)
	{
		IMemberDAO memberDao = sqlSession.getMapper(IMemberDAO.class);
		ITaskDAO taskDao = sqlSession.getMapper(ITaskDAO.class);
		
		String ma_codep = memberDao.getMacode(dto.getMa_codep(), "CP0002");
		String ma_codea = memberDao.getLeader_ma("AP0006");
		
		dto.setMa_codea(ma_codea);
		dto.setMa_codep(ma_codep);
		dto.setCp_code("CP0002");
		System.out.println(dto.getColor());
		
		taskDao.addTask(dto);
		
		return "redirect:taskView.action";
	}
	
	@RequestMapping(value = "/myTask.action")
	public String myTask(TaskDTO dto, ModelMap model)
	{
		IMemberDAO memberDao = sqlSession.getMapper(IMemberDAO.class);
		ITaskDAO taskDao = sqlSession.getMapper(ITaskDAO.class);
		IReportDAO reportDao = sqlSession.getMapper(IReportDAO.class);
		
		String ma_codep = "MA0011";
		
		ArrayList<ReportDTO> reportList = reportDao.getReport(ma_codep);
		
		System.out.println(reportList.size());
		
		model.addAttribute("reportList", reportList);
		
		// 내 task 날짜별로 분류
		ArrayList<TaskDTO> getMyIng = taskDao.getMyIng("CP0002", "MA0011");
		ArrayList<TaskDTO> getMyWill = taskDao.getMyWill("CP0002", "MA0011");
		ArrayList<TaskDTO> getMyEnd = taskDao.getMyEnd("CP0002", "MA0011");
		
		model.addAttribute("getMyIng", getMyIng);
		model.addAttribute("getMyWill", getMyWill);
		model.addAttribute("getMyEnd", getMyEnd);
		
		
		
		return "/WEB-INF/view/project/myTask.jsp";
	}
	
	@RequestMapping(value = "/insertReport.action")
	public String insertReport(ReportDTO dto, ModelMap model)
	{
		IReportDAO reportDao = sqlSession.getMapper(IReportDAO.class);
		
		
		
		//reportDao.addReport(dto.getTask_code(), dto.getContent(), dto.getSummary());
		
		return "redirect:myTask.action";
	}
	
	@RequestMapping(value = "/Report.action")
	public String Report(ReportDTO dto, ModelMap model)
	{
		IReportDAO reportDao = sqlSession.getMapper(IReportDAO.class);
		IMemberDAO memberDao = sqlSession.getMapper(IMemberDAO.class);
		
		ArrayList<ReportDTO> reportList = reportDao.list("CP0002");
		
		model.addAttribute("reportList", reportList);
		
		ArrayList<MemberDTO> memberList = memberDao.getMember("AP0006");
		
		model.addAttribute("memberList", memberList);
		
		return "/WEB-INF/view/project/Report.jsp";
	}
	
	// 보고서 승인됨
	@RequestMapping(value = "/reportpass.action")
	public String Reportpass(String br_code, ModelMap model)
	{
		IReportDAO reportDao = sqlSession.getMapper(IReportDAO.class);
		
		reportDao.setpass(br_code);
		
		return "redirect:Report.action";
	}
	
	// 보고서 거절됨
	@RequestMapping(value = "/reportnonepass.action")
	public String Reportnonepass(String br_code, ModelMap model)
	{
		IReportDAO reportDao = sqlSession.getMapper(IReportDAO.class);
		
		reportDao.setnonepass(br_code);
		
		return "redirect:Report.action";
	}
//	
//	@ResponseBody
//	@RequestMapping(value = "/getReport.action", method = RequestMethod.GET)
//	public String getReport(String task_code, HttpServletResponse response, ModelMap model) throws UnsupportedEncodingException
//	{
//		response.setCharacterEncoding("UTF-8");
//		
//		IReportDAO reportDao = sqlSession.getMapper(IReportDAO.class);
//		
//		ArrayList<ReportDTO> reportList = reportDao.getReport("MA0011");
//		
//		StringBuffer sb = new StringBuffer();
//		
//		sb.append("<table class='table'>");
//		sb.append("		<tr>");
//		sb.append("			<th>CONTENT</th>");
//		sb.append("			<th>SUMMARY</th>");
//		sb.append("			<th>DATE</th>");
//		sb.append("			<th>RESULT</th>");
//		sb.append("		</tr>");
//		           																
//		for(LastDTO dto:reportList)
//		{
//			sb.append("<tr>");
//			sb.append("		<td>" + dto.getContent() + "</td>");
//			sb.append("		<td>" + dto.getSummary() + "</td>");
//			sb.append("		<td>" + dto.getKdate() + "</td>");
//			sb.append("		<td>" + dto.getState() + "</td>");
//			sb.append("</tr>");
//		}
//		
//		sb.append("</table>");
//		
//		model.addAttribute("data", sb.toString());
//		
//		System.out.println(sb.toString());
//		
//		String str = sb.toString();
//		
//		String query = new String(str.getBytes("8859_1"), "UTF-8");
//		
//		return query;
//	}
}

































