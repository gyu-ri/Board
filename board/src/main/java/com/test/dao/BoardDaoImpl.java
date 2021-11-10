package com.test.dao;

import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.domain.Board;
import com.test.domain.Criteria;
import com.test.domain.SearchCriteria;



@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Inject
	private SqlSession sqlsession;
	
	
	//글작성
	@Override
	public void addContent(Board board) throws Exception{
		sqlsession.insert("boardMapper.addContent", board);
	}
	
	//답글 작성
	@Override
	public void addContentReply(Board board) throws Exception {
		sqlsession.update("boardMapper.updateGroupOrder", board);
		sqlsession.insert("boardMapper.addContentReply", board);
	}
	
	//답글 작성시 groupOrder 증가
	@Override
	public void updateGroupOrder(Board board) throws Exception {
		sqlsession.update("boardMapper.updateGroupOrder",board);
		
	}
	
	//답글 그룹의 갯수
	@Override
	public int groupNoCount(int groupNo) throws Exception {
	return	sqlsession.selectOne("boardMapper.groupNoCount",groupNo);
	}
	
	//목록보기
	@Override
	public List<Board> contentList() throws Exception{
		
		return sqlsession.selectList("boardMapper.contentList");
	}
	
	//상세보기
	@Override
	public Board getContent(int no) throws Exception{
		
		return sqlsession.selectOne("boardMapper.getContent", no);
	}

	//글수정
	@Override
	public void updateContent(Board board) throws Exception{
		sqlsession.update("boardMapper.updateContent", board);
		
	}
	
	// 글삭제 답글 구현 전 후 같음
	@Override
	public void deleteContent(int no) throws Exception {
		sqlsession.delete("boardMapper.deleteContent", no);

	}

	//글목록 + 페이징
	@Override
	public List<Board> listPage(Criteria criteria) throws Exception {
		return sqlsession.selectList("boardMapper.listPage", criteria);
	}

	//게시물 총 갯수
	@Override
	public int listCount() throws Exception {
		return sqlsession.selectOne("boardMapper.listCount");
	}

	//목록 + 페이징 + 검색
	@Override
	public List<Board> listSearch(SearchCriteria searchCriteria) throws Exception {
		System.out.println("daoimpl"+searchCriteria);
		return sqlsession.selectList("boardMapper.listSerach", searchCriteria);
	}

	//검색 결과 갯수 
	@Override
	public int searchCount(SearchCriteria searchCriteria) throws Exception {
		return sqlsession.selectOne("boardMapper.searchCount",searchCriteria);
	}

	//비밀번호 체크
	@Override
	public Board pwdCheck(Board board) throws Exception {
		return sqlsession.selectOne("boardMapper.pwdCheck", board);
	}





	
	

}
