/*====================
 *   Sample.java
 *   - 컨트롤러 객체
 ===================*/

package com.test.mvc;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.mybatis.dao.IMemberDAO;
import com.test.mybatis.dao.IMyPageDAO;
import com.test.mybatis.dao.IProjectListDAO;
import com.test.mybatis.dao.IProjectPageDAO;
import com.test.mybatis.dao.IQnaListDAO;
import com.test.mybatis.dto.MemberDTO;
import com.test.mybatis.dto.Milestone_MemberEvaluDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.test.mybatis.MyPageMethod;
import com.test.mybatis.dto.ProjectPageDTO;

@Controller
public class MainController
{	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/Code_Mate.action", method=RequestMethod.GET)
	public String hello(Model model, HttpServletRequest request, HttpSession session)
	{	
		IProjectListDAO pjdao = sqlSession.getMapper(IProjectListDAO.class);
		IQnaListDAO qnadao = sqlSession.getMapper(IQnaListDAO.class);
		
		// 점수 
		IMyPageDAO myDao = sqlSession.getMapper(IMyPageDAO.class);
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		int backendScore;
		int frontendScore;
		
		if (member != null)
		{
			backendScore = myDao.backendScore(member.getMem_code());
			frontendScore = myDao.frontendScore(member.getMem_code());
			
			// 로그인한 회원의 백엔드 / 프론트엔드 점수 모델에 저장.
			model.addAttribute("backendScore", backendScore);
			model.addAttribute("frontendScore", frontendScore);
			
		}
		// 점수 끝
		
		model.addAttribute("list", pjdao.list());
		model.addAttribute("qnalist", qnadao.qnalist());
		
		return "/WEB-INF/view/main/main.jsp";
	}
	
	@RequestMapping(value="/Login.action", method=RequestMethod.GET)
	public String login(Model model)
	{	
		return "/WEB-INF/view/main/Login.jsp";
	}
	
	// 회원가입버튼 누를 경우
	@RequestMapping(value="/join.action", method=RequestMethod.GET)
	public String join(String email, String id, String pw, HttpServletRequest request)
	{	
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		dao.memberJoin(id, pw, email);
		
		MemberDTO member = dao.login(id, pw);
		
		HttpSession session = request.getSession();
	    session.setAttribute("member", member);
	    session.setMaxInactiveInterval(60 * 60);
	    
		return "redirect:Code_Mate.action";
	}
	
	@RequestMapping(value="/login-in.action", method=RequestMethod.POST)
	public String login_in(String id, String pw, HttpServletRequest request)
	{
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		// 아이디와 비밀번호가 일치하는 member를 받아옴
		MemberDTO member = dao.login(id.toUpperCase(), pw.toUpperCase());
		
		if(member == null)	// 로그인 실패
			return "/WEB-INF/view/main/arr.jsp";
		else
		{
			HttpSession session = request.getSession();
			
			//member 란 이름으로 member 객체 set 해줌
		    session.setAttribute("member", member);
		    // 세션 유지시간 5분
		    session.setMaxInactiveInterval(60 * 60);
		}
			
		return "redirect:Code_Mate.action";
	}
	
	
	//=================================[마이 페이지]====================================
	
		@RequestMapping(value="/mypage.action", method=RequestMethod.GET)
		public String mypage(ModelMap model, HttpSession session, HttpServletRequest request)
		{
			IMyPageDAO dao = sqlSession.getMapper(IMyPageDAO.class);
			MyPageMethod mpm = new MyPageMethod();
			
			MemberDTO member = (MemberDTO)session.getAttribute("member");
			System.out.println("1");
			request.setAttribute("member", member);
			
			String mem_code = member.getMem_code();
			
			model.addAttribute("nickName", dao.nickName(mem_code));
			model.addAttribute("mbti", dao.mbti(mem_code));
			model.addAttribute("skillTag", dao.skillTag(mem_code));
			model.addAttribute("backendScore", dao.backendScore(mem_code));
			model.addAttribute("frontendScore", dao.frontendScore(mem_code));
			model.addAttribute("mannerScore", dao.mannerScore(mem_code));
			System.out.println("2");
			//=======================================================
			// 개인정보 공개 / 비공개 설정 가능 항목 처리
			//=======================================================
			
			int emailOpen = dao.emailOpen(mem_code);
			int genderOpen = dao.genderOpen(mem_code);
			int birthDayOpen = dao.birthDayOpen(mem_code);
			System.out.println("3");
			String email = dao.email(mem_code);
			String gender = dao.gender(mem_code);
			String birthDay = dao.birthDay(mem_code);
			
			email = mpm.nullOrBlindCheck(email, emailOpen, "이메일");
			gender = mpm.nullOrBlindCheck(gender, genderOpen, "성별");
			birthDay = mpm.nullOrBlindCheck(birthDay, birthDayOpen, "생년월일");
			System.out.println("4");
			model.addAttribute("email", email);
			model.addAttribute("gender", gender);
			model.addAttribute("birthDay", birthDay);
			//=======================================================
			
			// 경력
			model.addAttribute("careerList", dao.careerList(mem_code));
			
			// 프로젝트 이력
			model.addAttribute("pjHistoryList", dao.pjHistoryList(mem_code));
			System.out.println("5");
			
			//▦▦▦▦▦▦▦▦[ 2 페이지 - 본인이 작성한 게시글 ]▦▦▦▦▦▦▦▦
				
			model.addAttribute("postList", dao.postList(mem_code));
			System.out.println("postList 추가 완료");
			
			//▦▦▦▦▦▦▦▦[ 3 페이지 - 본인이 작성한 댓글 ]▦▦▦▦▦▦▦▦▦
			
			model.addAttribute("commentList", dao.commentList(mem_code));
			System.out.println("commentList 추가 완료");
			
			
			
			return "/WEB-INF/view/main/MyPage_DB.jsp";
		}
		
		
		
				// 로그아웃
				@RequestMapping(value="/logout.action", method=RequestMethod.GET)
				public String logout(ModelMap model, HttpSession session, HttpServletRequest request)
				{	
					session.invalidate();
					
					return "Code_Mate.action";
				}
				
				// 프로필 사진 변경
				@RequestMapping(value="/insertProfileImg.action", method=RequestMethod.POST)
				public String insertProfileImgt(ModelMap model, HttpSession session, HttpServletRequest request)
				{	
					IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
					MemberDTO member = (MemberDTO)session.getAttribute("member");
					
					// 경로
					String uploadPath = "C:\\Users\\user\\git\\Code_Mate\\Code_Mate\\WebContent\\img";
					//String uploadPath ="Code_Mate\\Code_Mate\\File";
					System.out.println("경로 테스트 : " + uploadPath);
					
					// multi.getFilesystemName("uploadFile");
					
					// 최대 파일 크기
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

						// 파일 경로 + 서버에 저장된 파일명
						String path = uploadPath + multi.getFilesystemName("file");
						System.out.println(path);
						// 이용자가 올린 파일명
						String fileName = multi.getOriginalFileName("file");
						
						String uploadpath = "/img/" + multi.getFilesystemName("file");
						
						dao.changeProfile(uploadpath, member.getMem_code());
						
					return "redirect:mypage.action";
				}
				
				
				// TOP 프로젝트 모두보기 클릭시
				@RequestMapping(value="/ProjectList.action", method=RequestMethod.GET)
				public String projectlist(ModelMap model, HttpSession session, HttpServletRequest request,  PagingVO vo
						, @RequestParam(value="nowPage", required=false)String nowPage
						, @RequestParam(value="cntPerPage", required=false)String cntPerPage)
				{	
					IProjectPageDAO dao = sqlSession.getMapper(IProjectPageDAO.class);
					
					MemberDTO member = (MemberDTO)session.getAttribute("member");
					
					LocalDate now = LocalDate.now();
					//System.out.println(now);
					
					int count = dao.allcount(); // 전체 보기
					int ingcount = dao.ingcount(); // 모집중
					int endcount = dao.endcount(); // 모집완료
					
					if (nowPage == null && cntPerPage == null) {
			            nowPage = "1";
			            cntPerPage = "5";
			        } else if (nowPage == null) {
			            nowPage = "1";
			        } else if (cntPerPage == null) {
			            cntPerPage = "5";
			        }
			        
					
					if (member == null)
					{
						request.setAttribute("member", member);
						
						// 전체 프로젝트 정보
						
						//model.addAttribute("pjall",dao.allpjlist());
						
						vo = new PagingVO(count, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				        model.addAttribute("paging", vo);
				        model.addAttribute("pjall", dao.pagelist(vo));
						
						
						// 모집중 정보
						
						//model.addAttribute("pjing",dao.ingpjlist());
				        
				        //vo = new PagingVO(ingcount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				        //model.addAttribute("paging", vo);
				        //model.addAttribute("pjing", dao.pagelist(vo));
						
						
						// 모집 완료 정보
						
						//model.addAttribute("pjend",dao.endpjlist());
				        
				        //vo = new PagingVO(endcount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				        //model.addAttribute("paging", vo);
				        //model.addAttribute("pjend", dao.pagelist(vo));
						
						
						// 전체 카운트
						model.addAttribute("allcount",dao.allcount());
						
						
						// 진행중 카운트
						model.addAttribute("ingcount",dao.ingcount());
						
						
						// 진행완료 카운트
						model.addAttribute("endcount",dao.endcount());
						
						
						// 태그
						
						model.addAttribute("tag",dao.tag());
						
						
						// 댓글
						
						model.addAttribute("comment",dao.comment());
						
						
						// 핫한 프로젝트
						
						model.addAttribute("hotpj",dao.hotpj());
						
						// 새로운 프젝
						
						model.addAttribute("newpj",dao.newpj());
						
						
						// 왼쪽 태그들
						model.addAttribute("lefttag",dao.lefttag());
						
						
						
						
						
						
						return "/WEB-INF/view/main/projectPage.jsp";
					}
					else
					{
						request.setAttribute("member", member);
						
						String mem_code = member.getMem_code();
						
						// 회원일때 참여 프로젝트 정보
						model.addAttribute("pjdto",dao.pjdto(mem_code));
						
						
						// 전체 프로젝트 정보
						
						//model.addAttribute("pjall",dao.allpjlist());
						
						vo = new PagingVO(count, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				        model.addAttribute("paging", vo);
				        model.addAttribute("pjall", dao.pagelist(vo));
						
						
						// 모집중 정보
						
						//model.addAttribute("pjing",dao.ingpjlist());
				        
				        //vo = new PagingVO(ingcount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				        //model.addAttribute("paging", vo);
				        //model.addAttribute("pjing", dao.pagelist(vo));
						
						
						// 모집 완료 정보
						
						//model.addAttribute("pjend",dao.endpjlist());
				        
				        //vo = new PagingVO(endcount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				        //model.addAttribute("paging", vo);
				        //model.addAttribute("pjend", dao.pagelist(vo));
						
						
						// 태그
						
						model.addAttribute("tag",dao.tag());
						
						
						// 댓글
						
						model.addAttribute("comment",dao.comment());
						
						
						// 핫한 프로젝트
						
						model.addAttribute("hotpj",dao.hotpj());
						
						
						// 새로운 프젝
						
						model.addAttribute("newpj",dao.newpj());
						
						
						// 왼쪽 태그들
						model.addAttribute("lefttag",dao.lefttag());
						
						
						// 전체 카운트
						model.addAttribute("allcount",dao.allcount());
						
						
						// 진행중 카운트
						model.addAttribute("ingcount",dao.ingcount());
						
						
						// 진행완료 카운트
						model.addAttribute("endcount",dao.endcount());
						
						
						// 내가진행중 카운트
						model.addAttribute("mycount",dao.mycount(mem_code));
						
						
						// 신고
						ProjectPageDTO reportmem = dao.reportmem(mem_code);
						int reportcount = dao.reportcount(mem_code);
						
						if (reportcount != 0)
						{
							
							if (reportmem.getPrecessing().equals("패널티중")) 
							{
								model.addAttribute("report","pe");
							}
							
						}
						else
						{
							model.addAttribute("report","ee");
						}
						
						
						return "/WEB-INF/view/main/projectPage.jsp";
						
					}
					
				}
				
				// TOP 프로젝트 모집중 클릭시
				@RequestMapping(value="/ProjectList2.action", method=RequestMethod.GET)
				public String ingprojectlist(Model model, HttpSession session, HttpServletRequest request,  PagingVO vo
						, @RequestParam(value="nowPage", required=false)String nowPage
						, @RequestParam(value="cntPerPage", required=false)String cntPerPage)
				{	
					IProjectPageDAO dao = sqlSession.getMapper(IProjectPageDAO.class);
					
					MemberDTO member = (MemberDTO)session.getAttribute("member");
					
					LocalDate now = LocalDate.now();
					//System.out.println(now);
					
					int count = dao.allcount(); // 전체 보기
					int ingcount = dao.ingcount(); // 모집중
					int endcount = dao.endcount(); // 모집완료
					
					if (nowPage == null && cntPerPage == null) {
			            nowPage = "1";
			            cntPerPage = "5";
			        } else if (nowPage == null) {
			            nowPage = "1";
			        } else if (cntPerPage == null) {
			            cntPerPage = "5";
			        }
			        
					
					if (member == null)
					{
						request.setAttribute("member", member);
						
						// 전체 프로젝트 정보
						
						//model.addAttribute("pjall",dao.allpjlist());
						
						//vo = new PagingVO(count, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				        //model.addAttribute("paging", vo);
				        //model.addAttribute("pjall", dao.pagelist(vo));
						
						
						// 모집중 정보
						
						//model.addAttribute("pjing",dao.ingpjlist());
				        
				        vo = new PagingVO(ingcount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				        model.addAttribute("paging", vo);
				        model.addAttribute("pjing", dao.ingpagelist(vo));
						
						
						// 모집 완료 정보
						
						//model.addAttribute("pjend",dao.endpjlist());
				        
				        //vo = new PagingVO(endcount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				        //model.addAttribute("paging", vo);
				        //model.addAttribute("pjend", dao.pagelist(vo));
						
						
						// 전체 카운트
						model.addAttribute("allcount",dao.allcount());
						
						
						// 진행중 카운트
						model.addAttribute("ingcount",dao.ingcount());
						
						
						// 진행완료 카운트
						model.addAttribute("endcount",dao.endcount());
						
						
						// 태그
						
						model.addAttribute("tag",dao.tag());
						
						
						// 댓글
						
						model.addAttribute("comment",dao.comment());
						
						
						// 핫한 프로젝트
						
						model.addAttribute("hotpj",dao.hotpj());
						
						// 새로운 프젝
						
						model.addAttribute("newpj",dao.newpj());
						
						
						// 왼쪽 태그들
						model.addAttribute("lefttag",dao.lefttag());
						
						
						
						
						
						
						return "/WEB-INF/view/main/projectPage2.jsp";
					}
					else
					{
						request.setAttribute("member", member);
						
						String mem_code = member.getMem_code();
						
						// 회원일때 참여 프로젝트 정보
						//model.addAttribute("pjdto",dao.pjdto(mem_code));
						
						
						// 전체 프로젝트 정보
						
						//model.addAttribute("pjall",dao.allpjlist());
						
						//vo = new PagingVO(count, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				        //model.addAttribute("paging", vo);
				        //model.addAttribute("pjall", dao.pagelist(vo));
						
						
						// 모집중 정보
						
						//model.addAttribute("pjing",dao.ingpjlist());
				        
				        vo = new PagingVO(ingcount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				        model.addAttribute("paging", vo);
				        model.addAttribute("pjing", dao.ingpagelist(vo));
						
						
						// 모집 완료 정보
						
						//model.addAttribute("pjend",dao.endpjlist());
				        
				        //vo = new PagingVO(endcount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				        //model.addAttribute("paging", vo);
				        //model.addAttribute("pjend", dao.pagelist(vo));
						
						
						// 태그
						
						model.addAttribute("tag",dao.tag());
						
						
						// 댓글
						
						model.addAttribute("comment",dao.comment());
						
						
						// 핫한 프로젝트
						
						model.addAttribute("hotpj",dao.hotpj());
						
						
						// 새로운 프젝
						
						model.addAttribute("newpj",dao.newpj());
						
						
						// 왼쪽 태그들
						model.addAttribute("lefttag",dao.lefttag());
						
						
						// 전체 카운트
						model.addAttribute("allcount",dao.allcount());
						
						
						// 진행중 카운트
						model.addAttribute("ingcount",dao.ingcount());
						
						
						// 진행완료 카운트
						model.addAttribute("endcount",dao.endcount());
						
						
						// 내가진행중 카운트
						model.addAttribute("mycount",dao.mycount(mem_code));
						
						// 신고
						ProjectPageDTO reportmem = dao.reportmem(mem_code);
						int reportcount = dao.reportcount(mem_code);
						
						if (reportcount != 0)
						{
							
							if (reportmem.getPrecessing().equals("패널티중")) 
							{
								model.addAttribute("report","pe");
							}
							
						}
						else
						{
							model.addAttribute("report","ee");
						}
						
						
						
						return "/WEB-INF/view/main/projectPage2.jsp";
						
					}
					
				}
				
				// TOP 프로젝트 모집완료 클릭시
				@RequestMapping(value="/ProjectList3.action", method=RequestMethod.GET)
				public String endprojectlist(Model model, HttpSession session, HttpServletRequest request,  PagingVO vo
						, @RequestParam(value="nowPage", required=false)String nowPage
						, @RequestParam(value="cntPerPage", required=false)String cntPerPage)
				{	
					IProjectPageDAO dao = sqlSession.getMapper(IProjectPageDAO.class);
					
					MemberDTO member = (MemberDTO)session.getAttribute("member");
					
					LocalDate now = LocalDate.now();
					//System.out.println(now);
					
					int count = dao.allcount(); // 전체 보기
					int ingcount = dao.ingcount(); // 모집중
					int endcount = dao.endcount(); // 모집완료
					
					if (nowPage == null && cntPerPage == null) {
			            nowPage = "1";
			            cntPerPage = "5";
			        } else if (nowPage == null) {
			            nowPage = "1";
			        } else if (cntPerPage == null) {
			            cntPerPage = "5";
			        }
			        
					
					if (member == null)
					{
						request.setAttribute("member", member);
						
						// 전체 프로젝트 정보
						
						//model.addAttribute("pjall",dao.allpjlist());
						
						//vo = new PagingVO(count, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				        //model.addAttribute("paging", vo);
				        //model.addAttribute("pjall", dao.pagelist(vo));
						
						
						// 모집중 정보
						
						//model.addAttribute("pjing",dao.ingpjlist());
				        
				        //vo = new PagingVO(ingcount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				        //model.addAttribute("paging", vo);
				        //model.addAttribute("pjing", dao.pagelist(vo));
						
						
						// 모집 완료 정보
						
						//model.addAttribute("pjend",dao.endpjlist());
				        
				        vo = new PagingVO(endcount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				        model.addAttribute("paging", vo);
				        model.addAttribute("pjend", dao.endpagelist(vo));
						
						
						// 전체 카운트
						model.addAttribute("allcount",dao.allcount());
						
						
						// 진행중 카운트
						model.addAttribute("ingcount",dao.ingcount());
						
						
						// 진행완료 카운트
						model.addAttribute("endcount",dao.endcount());
						
						
						// 태그
						
						model.addAttribute("tag",dao.tag());
						
						
						// 댓글
						
						model.addAttribute("comment",dao.comment());
						
						
						// 핫한 프로젝트
						
						model.addAttribute("hotpj",dao.hotpj());
						
						// 새로운 프젝
						
						model.addAttribute("newpj",dao.newpj());
						
						
						// 왼쪽 태그들
						model.addAttribute("lefttag",dao.lefttag());
						
						
						
						
						
						
						return "/WEB-INF/view/main/projectPage3.jsp";
					}
					else
					{
						request.setAttribute("member", member);
						
						String mem_code = member.getMem_code();
						
						// 회원일때 참여 프로젝트 정보
						//model.addAttribute("pjdto",dao.pjdto(mem_code));
						
						
						// 전체 프로젝트 정보
						
						//model.addAttribute("pjall",dao.allpjlist());
						
						//vo = new PagingVO(count, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				        //model.addAttribute("paging", vo);
				        //model.addAttribute("pjall", dao.pagelist(vo));
						
						
						// 모집중 정보
						
						//model.addAttribute("pjing",dao.ingpjlist());
				        
				        //vo = new PagingVO(ingcount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				        //model.addAttribute("paging", vo);
				        //model.addAttribute("pjing", dao.pagelist(vo));
						
						
						// 모집 완료 정보
						
						//model.addAttribute("pjend",dao.endpjlist());
				        
				        vo = new PagingVO(endcount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				        model.addAttribute("paging", vo);
				        model.addAttribute("pjend", dao.endpagelist(vo));
						
						
						// 태그
						
						model.addAttribute("tag",dao.tag());
						
						
						// 댓글
						
						model.addAttribute("comment",dao.comment());
						
						
						// 핫한 프로젝트
						
						model.addAttribute("hotpj",dao.hotpj());
						
						
						// 새로운 프젝
						
						model.addAttribute("newpj",dao.newpj());
						
						
						// 왼쪽 태그들
						model.addAttribute("lefttag",dao.lefttag());
						
						
						// 전체 카운트
						model.addAttribute("allcount",dao.allcount());
						
						
						// 진행중 카운트
						model.addAttribute("ingcount",dao.ingcount());
						
						
						// 진행완료 카운트
						model.addAttribute("endcount",dao.endcount());
						
						
						// 내가진행중 카운트
						model.addAttribute("mycount",dao.mycount(mem_code));
						
						// 신고
						ProjectPageDTO reportmem = dao.reportmem(mem_code);
						int reportcount = dao.reportcount(mem_code);
						
						if (reportcount != 0)
						{
							
							if (reportmem.getPrecessing().equals("패널티중")) 
							{
								model.addAttribute("report","pe");
							}
							
						}
						else
						{
							model.addAttribute("report","ee");
						}
						
						
						return "/WEB-INF/view/main/projectPage3.jsp";
						
					}
					
				}
				
				// TOP 프로젝트 내가 참여프젝 클릭시
				@RequestMapping(value="/ProjectList4.action", method=RequestMethod.GET)
				public String myprojectlist(Model model, HttpSession session, HttpServletRequest request,  PagingVO vo
						, @RequestParam(value="nowPage", required=false)String nowPage
						, @RequestParam(value="cntPerPage", required=false)String cntPerPage)
				{	
					IProjectPageDAO dao = sqlSession.getMapper(IProjectPageDAO.class);
					
					MemberDTO member = (MemberDTO)session.getAttribute("member");
					
					LocalDate now = LocalDate.now();
					//System.out.println(now);
					
					int count = dao.allcount(); // 전체 보기
					int ingcount = dao.ingcount(); // 모집중
					int endcount = dao.endcount(); // 모집완료
					
					if (nowPage == null && cntPerPage == null) {
			            nowPage = "1";
			            cntPerPage = "5";
			        } else if (nowPage == null) {
			            nowPage = "1";
			        } else if (cntPerPage == null) {
			            cntPerPage = "5";
			        }
			        
					
					if (member == null)
					{
						request.setAttribute("member", member);
						
						// 전체 프로젝트 정보
						
						//model.addAttribute("pjall",dao.allpjlist());
						
						//vo = new PagingVO(count, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				        //model.addAttribute("paging", vo);
				        //model.addAttribute("pjall", dao.pagelist(vo));
						
						
						// 모집중 정보
						
						//model.addAttribute("pjing",dao.ingpjlist());
				        
				        //vo = new PagingVO(ingcount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				        //model.addAttribute("paging", vo);
				        //model.addAttribute("pjing", dao.pagelist(vo));
						
						
						// 모집 완료 정보
						
						//model.addAttribute("pjend",dao.endpjlist());
				        
				        //vo = new PagingVO(endcount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				        //model.addAttribute("paging", vo);
				        //model.addAttribute("pjend", dao.pagelist(vo));
						
						
						// 전체 카운트
						model.addAttribute("allcount",dao.allcount());
						
						
						// 진행중 카운트
						model.addAttribute("ingcount",dao.ingcount());
						
						
						// 진행완료 카운트
						model.addAttribute("endcount",dao.endcount());
						
						
						// 태그
						
						model.addAttribute("tag",dao.tag());
						
						
						// 댓글
						
						model.addAttribute("comment",dao.comment());
						
						
						// 핫한 프로젝트
						
						model.addAttribute("hotpj",dao.hotpj());
						
						// 새로운 프젝
						
						model.addAttribute("newpj",dao.newpj());
						
						
						// 왼쪽 태그들
						model.addAttribute("lefttag",dao.lefttag());
						
						
						
						
						
						
						return "/WEB-INF/view/main/projectPage4.jsp";
					}
					else
					{
						request.setAttribute("member", member);
						
						String mem_code = member.getMem_code();
						
						// 회원일때 참여 프로젝트 정보
						model.addAttribute("pjdto",dao.pjdto(mem_code));
						
						
						// 전체 프로젝트 정보
						
						//model.addAttribute("pjall",dao.allpjlist());
						
						//vo = new PagingVO(count, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				        //model.addAttribute("paging", vo);
				        //model.addAttribute("pjall", dao.pagelist(vo));
						
						
						// 모집중 정보
						
						//model.addAttribute("pjing",dao.ingpjlist());
				        
				        //vo = new PagingVO(ingcount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				        //model.addAttribute("paging", vo);
				        //model.addAttribute("pjing", dao.pagelist(vo));
						
						
						// 모집 완료 정보
						
						//model.addAttribute("pjend",dao.endpjlist());
				        
				        //vo = new PagingVO(endcount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				        //model.addAttribute("paging", vo);
				        //model.addAttribute("pjend", dao.pagelist(vo));
						
						
						// 태그
						
						model.addAttribute("tag",dao.tag());
						
						
						// 댓글
						
						model.addAttribute("comment",dao.comment());
						
						
						// 핫한 프로젝트
						
						model.addAttribute("hotpj",dao.hotpj());
						
						
						// 새로운 프젝
						
						model.addAttribute("newpj",dao.newpj());
						
						
						// 왼쪽 태그들
						model.addAttribute("lefttag",dao.lefttag());
						
						
						// 전체 카운트
						model.addAttribute("allcount",dao.allcount());
						
						
						// 진행중 카운트
						model.addAttribute("ingcount",dao.ingcount());
						
						
						// 진행완료 카운트
						model.addAttribute("endcount",dao.endcount());
						
						
						// 내가진행중 카운트
						model.addAttribute("mycount",dao.mycount(mem_code));
						
						
						// 신고
						ProjectPageDTO reportmem = dao.reportmem(mem_code);
						int reportcount = dao.reportcount(mem_code);
						
						if (reportcount != 0)
						{
							
							if (reportmem.getPrecessing().equals("패널티중")) 
							{
								model.addAttribute("report","pe");
							}
							
						}
						else
						{
							model.addAttribute("report","ee");
						}
						
						
						return "/WEB-INF/view/main/projectPage4.jsp";
						
					}
					
				}
				
				
}



