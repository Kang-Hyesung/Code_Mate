package com.test.mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.test.mvc.PagingVO;
import com.test.mybatis.dto.ArticleDTO;
import com.test.mybatis.dto.BoardDTO;
import com.test.mybatis.dto.CommentDTO;
import com.test.mybatis.dto.FlagDTO;
import com.test.mybatis.dto.LikeDTO;
import com.test.mybatis.dto.ReasonDTO;
import com.test.mybatis.dto.ReplyDTO;
import com.test.mybatis.dto.VoteDTO;


public interface IBoardDAO
{	
	// 총 갯수
	public int getTotalCount();
	
	// 리스트
	public List<BoardDTO> getLists();
	
	// 전체 좋아요 랭킹
	public List<LikeDTO> getLikeRanking();
	
	// 전체 트렌드 게시물 리스트
	public List<BoardDTO> getTrend();
	
	// 페이징
	// 토탈 페이징 리스트
	public List<BoardDTO> getPageList(PagingVO vo);
	
	// 기술 페이징 리스트
	public List<BoardDTO> getCPageList(PagingVO vo);
	
	// 커리어 페이징 리스트
	public List<BoardDTO> getTPageList(PagingVO vo);
	
	//---------------------------------------------------------------------------------------------------------
	
	// 기술 게시판 갯수
	public int getTechCount();
	
	// 기술 게시판 리스트
	public List<BoardDTO> getTechLists();
	
	// 기술 게시판 좋아요 랭킹
	public List<LikeDTO> getTechLikeRanking();
	
	// 기술 게시판 트렌드 게시물 리스트
	public List<BoardDTO> getTechTrend();
	
	//---------------------------------------------------------------------------------------------------------
	
	// 커리어 게시판 갯수
	public int getCarCount();
	
	// 커리어 게시판 리스트
	public List<BoardDTO> getCarLists();
	
	// 커리어 게시판 좋아요 랭킹
	public List<LikeDTO> getCarLikeRanking();
	
	// 커리어 게시판 트렌드 게시물 리스트
	public List<BoardDTO> getCarTrend();
	
	//---------------------------------------------------------------------------------------------------------
	
	// 커리어 게시물 조회
	public ArticleDTO getCarArticle(String code);
	
	// 커리어 게시물 댓글 조회
	public List<CommentDTO> getCarComment(String code);
	
	// 커리어 게시물 댓글 좋아요 플래그
	public List<FlagDTO> getCFlag(String cocode, String mem_code);
	
	// 커리어 게시물 조회수 증가
	public int carViewsUp(String code);
	
	// 커리어 댓글 좋아요 인서트
	public int carLikeUp(String cqc_code, String mem_code);
	
	// 커리어 댓글 좋아요 딜리트
	public int carLikeDown(String cqc_code, String mem_code);
	
	// 커리어 게시물 특정 댓글에 대한 좋아요 개수
	public int finCLike(String cqc_code);
	
	// 커리어 게시물에 대한 댓글
	public List<HashMap<String, String>> findCComment(String cq_code);
	
	// 커리어 게시물 대댓글 리스트 조회
	public List<ReplyDTO> getCReply(String cqc_code);
	
	// 커리어 게시물 댓글 인서트
	public int cCommentInsert(String comment, String cq_code, String mem_code);
	
	// 커리어 게시물 대댓글 인서트
	public int cReplyInsert(String reply, String cqc_code, String mem_code);
	
	// 커리어 게시물 인서트
	public int cInsert(String title, String content, String mem_code);
	
	//---------------------------------------------------------------------------------------------
	
	// 기술 게시물 조회
	public ArticleDTO getTechArticle(String code);
		
	// 기술 게시물 댓글 조회
	public List<CommentDTO> getTarComment(String code);
	
	// 기술 게시물 댓글 좋아요 플래그
	public List<FlagDTO> getTFlag(String cocode, String mem_code);
	
	// 기술 게시물 조회수 증가
	public int techViewsUp(String code);
	
	// 기술 댓글 좋아요 인서트
	public int techLikeUp(String cqc_code, String mem_code);
	
	// 기술 댓글 좋아요 딜리트
	public int techLikeDown(String cqc_code, String mem_code);
	
	// 기술 게시물 특정 댓글에 대한 좋아요 개수
	public int finTLike(String cqc_code);
	
	// 기술 게시물에 대한 댓글
	public List<HashMap<String, String>> findTComment(String cq_code);
	
	// 기술 게시물 대댓글 리스트 조회
	public List<ReplyDTO> getTReply(String cqc_code);
	
	// 기술 게시물 댓글 인서트
	public int tCommentInsert(String comment, String cq_code, String mem_code);
	
	// 기술 게시물 대댓글 인서트
	public int tReplyInsert(String reply, String cqc_code, String mem_code);
	
	// 기술 게시물 인서트
	public int tInsert(String title, String content, String mem_code);
	
	// 신고 사유 찾기
	public List<ReasonDTO> getReason();
	
	// 커리어 신고 인서트
	public int cReportInsert(String content, String code, String rr_code, String mem_code);
	
	// 기술 신고 인서트
	public int tReportInsert(String content, String code, String rr_code, String mem_code);
	
	// 투표
	
	// 투표 제목
	public VoteDTO getVoteTitle(String cq_code);
	
	// 투표 내용들
	public List<VoteDTO> getVoteContent(String cq_code);
	
	// 투표 참여
	public int voteP(String vs_code, String mem_code);
}
