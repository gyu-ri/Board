package com.test.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.test.domain.Reply;



@Repository
public class ReplyDaoImpl implements ReplyDao {
	
	@Inject
	private SqlSession sqlsession;
	
	//댓글 조회
	@Override
	public List<Reply> getReply(int no) throws Exception{
		return sqlsession.selectList("replyMapper.getReply",no);
	}

	//댓글 작성
	@Override
	public void addReply(Reply reply) throws Exception {
		sqlsession.insert("replyMapper.addReply", reply);
	}

	//댓글 수정
	@Override
	public void updateReply(Reply reply) throws Exception {
		sqlsession.update("replyMapper.updateReply", reply);
	}

	//댓글 삭제
	@Override
	public void deleteReply(int rno) throws Exception {
		sqlsession.delete("replyMapper.deleteReply", rno);
		
	}

	//댓글 갯수 조회
	@Override
	public int replyCount() throws Exception {
		return sqlsession.selectOne("replyMapper.replyCount");
	}

	//댓글 비번 체크
	@Override
	public String replyPwd(int rno) throws Exception {
		return sqlsession.selectOne("replyMapper.replyPwd", rno);
	}

	//댓글 갯수 조회
//	@Override
//	public int countReply() throws Exception {
//		System.out.println("어디가 문제일까");
//		return sqlsession.selectOne("replyMapper.countReply");
//	}
//	
	
	

}
