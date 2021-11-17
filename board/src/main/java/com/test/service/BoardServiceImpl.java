package com.test.service;

import java.util.Collections;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.test.dao.BoardDao;
import com.test.dao.ReplyDao;
import com.test.domain.Board;
import com.test.domain.Criteria;
import com.test.domain.SearchCriteria;


@Service
public class BoardServiceImpl implements BoardService{
	
	@Inject
	private BoardDao boardDao;
	
	
	
	//글 작성
	@Override
	public void addContent(Board board) throws Exception{
		boardDao.addContent(board);
	}
	
	//답글 작성
	@Override
	public void addContentReply(Board board) throws Exception {
		boardDao.addContentReply(board);
	}
	
	//답글 작성시 groupOrder 증가
	@Override
	public void updateGroupOrder(Board board) throws Exception {
		boardDao.updateGroupOrder(board);
	}
	
	//답글 그룹의 갯수
	@Override
	public int groupNoCount(int groupNo) throws Exception {
		return boardDao.groupNoCount(groupNo);
	}
	
	@Override
	public List<Board> contentList() throws Exception{
		
		return boardDao.contentList();
	}
	
	@Override
	public Board getContent(int no) throws Exception{
		
		return boardDao.getContent(no);
	}

	
	@Override
	public void updateContent(Board board) throws Exception{
		boardDao.updateContent(board);
		
	}
	
	
	@Override
	public void deleteContent(int no) throws Exception{
		boardDao.deleteContent(no);
		
	}

	//글목록 + 페이징
	@Override
	public List<Board> listPage(Criteria criteria) throws Exception {
		return boardDao.listPage(criteria);
	}

	//게시물 총 갯수
	@Override
	public int listCount() throws Exception {
		return boardDao.listCount();
	}


	//목록 + 페이징 + 검색
	@Override
	public List<Board> listSearch(SearchCriteria searchCriteria) throws Exception {
		return boardDao.listSearch(searchCriteria);
	}


	//검색 결과 갯수
	@Override
	public int searchCount(SearchCriteria searchCriteria) throws Exception {
		return boardDao.searchCount(searchCriteria);
	}


	//비밀번호 체크
	@Override
	public Board pwdCheck(Board board) throws Exception {
		return boardDao.pwdCheck(board);
	}







	

}
