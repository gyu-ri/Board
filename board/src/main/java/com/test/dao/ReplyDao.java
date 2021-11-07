package com.test.dao;

import java.util.List;

import com.test.domain.Reply;


public interface ReplyDao {
	
	//댓글 조회
	public List<Reply> getReply(int no) throws Exception;
	
	//댓글 작성
	public void addReply(Reply reply) throws Exception;
	
}
