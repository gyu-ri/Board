package com.test.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.test.domain.Board;
import com.test.domain.Criteria;
import com.test.domain.PageMaker;
import com.test.domain.SearchCriteria;
import com.test.service.BoardService;

@RestController
@RequestMapping("/restBoard/*")
public class BoardRestController {
	
	@Autowired
	BoardService boardService;
	
	//비밀번호 체크
	@RequestMapping(value="pwdCheck", method=RequestMethod.POST)
	public int pwdCheck(@RequestBody Board board,Model model, @RequestParam("no") int no) throws Exception{
		System.out.println("board rest controller 시작");
		Board board01 = boardService.getContent(no);
		if(board.getPassword()==(board01.getPassword())){
			return 0;
		}else {
			return 1;
		}
		
	}

}
