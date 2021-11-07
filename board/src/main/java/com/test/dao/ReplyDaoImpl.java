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
	
	
	

}
