package com.test.dao;

import java.util.List;

import com.test.domain.Board;
import com.test.domain.Criteria;
import com.test.domain.SearchCriteria;


public interface BoardDao {
	
	//글작성
	public void addContent(Board board) throws Exception;
	
	//글목록
	public List<Board> contentList() throws Exception;
	
	//글목록 + 페이징
	public List<Board> listPage(Criteria criteria) throws Exception;
	
	//게시물 총 갯수
	public int listCount() throws Exception;
	
	//상세보기
	public Board getContent(int no) throws Exception;
	
	//글수정
	public void updateContent(Board board) throws Exception;
	
	//삭제
	public void deleteContent(int no) throws Exception;
	
	//목록 + 페이징 + 검색
	public List<Board> listSearch(SearchCriteria searchCriteria) throws Exception;
	
	//검색 결과 갯수 
	public int searchCount(SearchCriteria searchCriteria) throws Exception;
	
	//비밀번호 체크
	public Board pwdCheck(Board board) throws Exception;
}
