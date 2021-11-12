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
	
	//댓글 수정
	public void updateReply(Reply reply) throws Exception;
	
	//댓글 삭제
	public void deleteReply(int rno) throws Exception;
	

	

}
