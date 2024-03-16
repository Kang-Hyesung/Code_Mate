/*====================
 *   Sample.java
 *   - 컨트롤러 객체
 ===================*/

package com.test.mvc;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.catalina.connector.Request;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.test.mybatis.dao.IMeetingDAO;
import com.test.mybatis.dao.IMemberDAO;
import com.test.mybatis.dao.IProjectDAO;
import com.test.mybatis.dao.IReportDAO;
import com.test.mybatis.dao.ITaskDAO;
import com.test.mybatis.dto.MeetingDTO;
import com.test.mybatis.dto.MemberDTO;
import com.test.mybatis.dto.ProjectDTO;
import com.test.mybatis.dto.ReportDTO;
import com.test.mybatis.dto.TaskDTO;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;




@Controller
public class ProjectController  extends HttpServlet
{	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/projectProgress.action", method = RequestMethod.GET )
	public String projectProgress(HttpServletRequest request, ModelMap model, HttpSession session, String ap_code)
	{
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		IMemberDAO memberDao = sqlSession.getMapper(IMemberDAO.class);
		ITaskDAO taskDao = sqlSession.getMapper(ITaskDAO.class);
		IMeetingDAO meetingDao = sqlSession.getMapper(IMeetingDAO.class);
		IReportDAO reportDao = sqlSession.getMapper(IReportDAO.class);
		IProjectDAO projectDao = sqlSession.getMapper(IProjectDAO.class);
		
		String cp_code = memberDao.getCp_code(ap_code);
		
		request.setAttribute("ap_code", ap_code);
		request.setAttribute("cp_code", cp_code);
		
		ProjectDTO project = projectDao.getProject(ap_code);
		request.setAttribute("project", project);
		
		// 멤버리스트
		ArrayList<MemberDTO> leader = memberDao.getLeader(ap_code, "MR0001");
		ArrayList<MemberDTO> frontList = memberDao.getFront(ap_code, "MR0001");
		ArrayList<MemberDTO> backList = memberDao.getBack(ap_code, "MR0001");
		
		request.setAttribute("leader", leader);
		request.setAttribute("frontList", frontList);
		request.setAttribute("backList", backList);
		
		// Task
		ArrayList<TaskDTO> taskList = taskDao.list(cp_code);
		request.setAttribute("taskList", taskList);
		
		// 회의록
		ArrayList<MeetingDTO> meetingList = meetingDao.list(ap_code);
		request.setAttribute("meetingList", meetingList);
		
		// 업무보고글
		ArrayList<ReportDTO> reportList = reportDao.list(cp_code);
		request.setAttribute("reportList", reportList);
		
		// 활동량
		ArrayList<ReportDTO> rank = reportDao.rank(cp_code);
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
	public String taskCal(HttpServletRequest request, ModelMap model, String ap_code, String cp_code)
	{
		
		
		IMemberDAO memberDao = sqlSession.getMapper(IMemberDAO.class);
		ITaskDAO taskDao = sqlSession.getMapper(ITaskDAO.class);
		
		ArrayList<TaskDTO> taskList = taskDao.list(cp_code);
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
		ArrayList<MemberDTO> leader = memberDao.getLeader(ap_code, "MR0001");
		ArrayList<MemberDTO> frontList = memberDao.getFront(ap_code, "MR0001");
		ArrayList<MemberDTO> backList = memberDao.getBack(ap_code, "MR0001");
		
		request.setAttribute("leader", leader);
		request.setAttribute("frontList", frontList);
		request.setAttribute("backList", backList);
		
		model.addAttribute("data", data);
		
		return "/WEB-INF/view/project/taskCal.jsp";
	}
	
	@RequestMapping(value = "/taskView.action")
	public String task(HttpServletRequest request, ModelMap model, String ap_code, String cp_code)
	{
		IMemberDAO memberDao = sqlSession.getMapper(IMemberDAO.class);
		ITaskDAO taskDao = sqlSession.getMapper(ITaskDAO.class);
		
		// task 날짜별로 분류
		ArrayList<TaskDTO> getWeek = taskDao.getWeek(cp_code);
		ArrayList<TaskDTO> getIng = taskDao.getIng(cp_code);
		ArrayList<TaskDTO> getWill = taskDao.getWill(cp_code);
		
		model.addAttribute("getWeek", getWeek);
		model.addAttribute("getIng", getIng);
		model.addAttribute("getWill", getWill);
		
		
		
		// 멤버리스트
		ArrayList<MemberDTO> leader = memberDao.getLeader(ap_code, "MR0001");
		ArrayList<MemberDTO> frontList = memberDao.getFront(ap_code, "MR0001");
		ArrayList<MemberDTO> backList = memberDao.getBack(ap_code, "MR0001");
		
		request.setAttribute("leader", leader);
		request.setAttribute("frontList", frontList);
		request.setAttribute("backList", backList);
		
		return "/WEB-INF/view/project/taskView.jsp";
	}
	
	@RequestMapping(value = "/taskInsert.action")
	public String taskInsert(TaskDTO dto, ModelMap model, String ap_code, String cp_code)
	{
		IMemberDAO memberDao = sqlSession.getMapper(IMemberDAO.class);
		ITaskDAO taskDao = sqlSession.getMapper(ITaskDAO.class);
		
		String ma_codep = memberDao.getMacode(dto.getMa_codep(), cp_code);
		String ma_codea = memberDao.getLeader_ma(ap_code);
		
		dto.setMa_codea(ma_codea);
		dto.setMa_codep(ma_codep);
		dto.setCp_code(cp_code);
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
	
	@RequestMapping(value = "/insertReport.action" , method = RequestMethod.POST)
	public String insertReport(HttpServletRequest request, HttpServletResponse response, ReportDTO dto, ModelMap model) 
	{
		String uploadPath = "C:\\Downloads";
		int maxFileSize = 1024 * 1024 * 2;
		String encType = "utf-8";
		
		MultipartRequest multi = null;
		
			try{
				System.out.println("업로드 시도");
				multi = new MultipartRequest(request, uploadPath, maxFileSize, encType, new DefaultFileRenamePolicy());
				System.out.println("업로드 완료");
				
				System.out.println("이름 출력 시도");
				String please = multi.getFilesystemName("file");
				System.out.println(please);
				
				System.out.println("서버에 저장된 파일명 : " + multi.getFilesystemName("file"));
				System.out.println("업로드한 파일명 : " + multi.getOriginalFileName("file"));
				System.out.println("파일 타입 : " + multi.getContentType("file"));
				
				
			}
			catch(Exception e)
			{
				System.out.println("업로드 실패");
				System.out.println(e.toString());
			}
		
		IReportDAO reportDao = sqlSession.getMapper(IReportDAO.class);
		
		String savePath = "C://Downloads";
		
		
		
		//reportDao.addReport(dto.getTask_code(), dto.getContent(), dto.getSummary());
		
		return "redirect:myTask.action";
	}
	
	@RequestMapping(value = "/reportView.action")
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

































