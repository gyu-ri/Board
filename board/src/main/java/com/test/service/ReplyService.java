package com.test.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.test.domain.Reply;


@Mapper
public interface ReplyService {
	
	//댓글 조회
	public List<Reply> getReply(int no) throws Exception;
	
	//댓글 작성
	public void addReply(Reply reply) throws Exception;
	

	

}