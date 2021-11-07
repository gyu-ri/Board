package com.test.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.test.dao.ReplyDao;
import com.test.domain.Reply;


@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Inject
	private ReplyDao replyDao;

	//댓글 조회
	@Override
	public List<Reply> getReply(int no) throws Exception {
		return replyDao.getReply(no);
	}

	//댓글 작성
	@Override
	public void addReply(Reply reply) throws Exception {
		replyDao.addReply(reply);
		
	}
	
	

	

}
