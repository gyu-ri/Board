package com.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.domain.Reply;
import com.test.service.ReplyService;

@Controller
@RequestMapping("/reply/*")
public class ReplyController {
	
	@Autowired
	ReplyService replyService;
	
	//댓글 작성
	@RequestMapping(value="addReply", method=RequestMethod.POST)
	public String addReply(Reply reply) throws Exception{
		System.out.println("replyController 실행 됨???");
		
		replyService.addReply(reply);
		
		return "redirect:/getContent?no="+reply.getNo();
	}
	
	
	

}
