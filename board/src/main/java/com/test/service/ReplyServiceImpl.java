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

	//댓글 수정
	@Override
	public void updateReply(Reply reply) throws Exception {
		replyDao.updateReply(reply);
	}

	//댓글 삭제
	@Override
	public void deleteReply(int rno) throws Exception {
		replyDao.deleteReply(rno);
	}

	//댓글 갯수 조회
	@Override
	public int replyCount() throws Exception {
		return replyDao.replyCount();
	}

	//댓글 비번 체크
	@Override
	public String replyPwd(int rno) throws Exception {
		return replyDao.replyPwd(rno);
	}

	//댓글 갯수 조회
//	@Override
//	public int countReply() throws Exception {
//		return replyDao.countReply();
//		
//	}
//	
//	

	

}
