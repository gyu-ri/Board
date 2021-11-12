package com.test.controller;

import java.util.List;
import java.util.logging.Logger;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.domain.Board;
import com.test.domain.Criteria;
import com.test.domain.PageMaker;
import com.test.domain.Reply;
import com.test.domain.SearchCriteria;
import com.test.service.BoardService;
import com.test.service.ReplyService;
//@restController -> spring 4.0 이상부터 사용 가능하다 (spring boot) spring 3.0에서 비동기 통신인 ajax를 사용하려면 @RequestBody,@ResponseBody를 사용하여야한다
//@RequestBody : HTTP 요청의 body 내용을 자바 객체로 매핑해준다, HTTP 요청 몸체를 자바 객체로 전달 받는다
//@ResponseBody : 자바 객체를 HTTP 요청의 body 내용으로 매핑한다, 자바 객체를 HTTP 응답 몸체로 전송한다

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	ReplyService replyService;
	
	//글목록
	@RequestMapping(value="/contentList", method=RequestMethod.GET)
	public void contentList(Model model) throws Exception{
		List<Board> contentList=boardService.contentList();
		model.addAttribute("contentList", contentList);
		System.out.println("contentList 확인"+contentList);
		//return "contentList";
	}
	
	//글목록 + 페이징
//	@RequestMapping(value="/listPage", method=RequestMethod.GET)
//	public void listPage(Criteria criteria,Model model) throws Exception{
//		List<Board> contentList=boardService.listPage(criteria);
//		model.addAttribute("contentList", contentList);
//		//return "contentList";
//	}

	//글목록 + 페이징
//	@RequestMapping(value="/listPage", method=RequestMethod.GET)
//	public void listPage(@ModelAttribute("criteria") Criteria criteria,Model model) throws Exception{
//		List<Board> contentList=boardService.listPage(criteria);
//		model.addAttribute("contentList", contentList);
//		System.out.println("dfdffdf");
//		
//		PageMaker pageMaker = new PageMaker();
//		System.out.println("dfdffdf222");
//		pageMaker.setCriteria(criteria);
//		System.out.println("dfdffdf333");
// 		pageMaker.setTotalCount(boardService.listCount());
//		System.out.println("dfdffdf444");
//		model.addAttribute("pageMaker", pageMaker);
//		
//	}
	
	//글목록 + 페이징 + 검색
	@RequestMapping(value="/listPage", method=RequestMethod.GET)
	public void listSearch(@ModelAttribute("searchCriteria") SearchCriteria searchCriteria ,Model model, Criteria criteria, int page) throws Exception{
		List<Board> contentList=boardService.listSearch(searchCriteria);
		model.addAttribute("contentList", contentList);
		
		List<Board> list =boardService.contentList();
		model.addAttribute("list", list);
		criteria.setPage(page);
		model.addAttribute("criteria", criteria);
		
		
		System.out.println("@@@@@@@@"+contentList);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(searchCriteria);
		//pageMaker.setTotalCount(boardService.listCount());
		pageMaker.setTotalCount(boardService.searchCount(searchCriteria));
		model.addAttribute("pageMaker", pageMaker);
		
	}
	
	//글작성
	@RequestMapping(value="/addContent", method=RequestMethod.GET)
	public void addContent() throws Exception{
		// return "redirect:/listPage";
	}
	
	//글작성
	@RequestMapping(value="/addContent", method=RequestMethod.POST)
	public String addContent(Board board,Criteria criteria) throws Exception{
		System.out.println("boardController addContent post 시작");
		boardService.addContent(board);
		return "redirect:/listPage?page="+criteria.getPage();
	}

	//답글 작성
	@RequestMapping(value="/addContentReply", method=RequestMethod.GET)
	public void addContentReply(int no, Model model) throws Exception{
		Board board=boardService.getContent(no);
		model.addAttribute("board", board);
		System.out.println("addContentReply GET 에서 확인 :::::"+board);
		// return "redirect:/listPage";
	}
	
	//답글 작성
	@RequestMapping(value="/addContentReply", method=RequestMethod.POST)
	public String addContentReply(Board board, Criteria criteria ,Model model,int groupNo) throws Exception{
		System.out.println("addContentReply post 시작~~~");
		boardService.addContentReply(board);
		
		//Board board02 = new Board();
	//	board.setGroupNoCount(boardService.groupNoCount(groupNo));
		//System.out.println("@@@@@@@@@@@@@@@@@@@@"+board.getGroupNoCount());
		//boardService.updateGroupOrder(board);
		//System.out.println("addContentReply post 시작~~~4444"+groupOrder);
		
//		if(board.getGroupNoCount() > 1) {
//			boardService.updateGroupOrder(board);
//			System.out.println("@@@@@@@@@@@@@@@@@@@@"+board.getGroupNo());
//		}
		return "redirect:/listPage?page="+criteria.getPage();
	}
	
	
	
	
	//상세보기
	@RequestMapping(value="/getContent", method=RequestMethod.GET)
	public String getContent(Model model, int no) throws Exception{
		Board board=boardService.getContent(no);
		model.addAttribute("board", board);
		System.out.println("getContent Controller 확인"+board);
		
		List<Reply> replyList = replyService.getReply(no);
		model.addAttribute("replyList", replyList);
		System.out.println("getContent에서 replyList 확인 :: "+replyList);
		
		return "getContent";
		
	}
	
	
	//게시물 수정
	@RequestMapping(value="/updateContent", method=RequestMethod.GET)
	public String updateContent(@RequestParam("no") int no, Model model) throws Exception{
		Board board=boardService.getContent(no);
		model.addAttribute("board", board);
		System.out.println("updateContent controller GET 시작"+no);
		
		return "updateContent";
	}
	
	//게시물 수정
	@RequestMapping(value="/updateContent", method=RequestMethod.POST)
	public String updateContent(Model model, Board board) throws Exception{
		boardService.updateContent(board);
		model.addAttribute("board", board);
		System.out.println("updateContent Controller  POST 확인"+board);
		
		return "redirect:/getContent?no="+board.getNo();
		
	}
	
	
	
//	
//	//게시물 삭제
//	@RequestMapping(value="/deleteContent" , method=RequestMethod.GET)
//	public String deleteContent() throws Exception{
//		return "deleteContent";
//	}
	
	//게시물 삭제
	@RequestMapping(value="/deleteContent" , method=RequestMethod.POST)
	public String deleteContent(@RequestParam("no") int no, Criteria criteria) throws Exception{
		System.out.println("어디서 오류야1");
		boardService.deleteContent(no);
		System.out.println("어디서 오류야2");
		return "redirect:/listPage?page="+criteria.getPage();
	}
	
	
	
	//댓글 작성
//	@RequestMapping(value="/addReply", method=RequestMethod.POST)
//	public String addReply(Reply reply, Board board) throws Exception{
//		
//		System.out.println("addReply ajax 실행 되나요111111?");
//		replyService.addReply(reply);
//		System.out.println("addReply ajax 실행 되나요2222?");
//		
//		return "redirect:/getContent?no="+board.getNo();
//	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//댓글 작성
	@ResponseBody
	@RequestMapping(value="/addReply", method=RequestMethod.POST)
	public void addReply(@RequestBody Reply reply) throws Exception{
		
		System.out.println("addReply ajax 실행 되나요111111?");
		replyService.addReply(reply);
		System.out.println("addReply ajax 실행 되나요2222?");
	}
	
	//댓글 수정
	@RequestMapping(value="/updateReply", method=RequestMethod.POST)
	public String updateReply(Model model, Reply reply, Board board) throws Exception{
		replyService.updateReply(reply);
		model.addAttribute("reply", reply);
		
		return "redirect:/getContent?no="+board.getNo();
		
	}
	
	//댓글 삭제
		@RequestMapping(value="/deleteReply" , method=RequestMethod.POST)
		public String deleteReply(@RequestParam("rno") int rno, Board board) throws Exception{
			System.out.println("어디서 오류야1");
			replyService.deleteReply(rno);
			System.out.println("어디서 오류야2");
			return "redirect:/getContent?no="+board.getNo();
		}
	
	//댓글 가져오기
//	@ResponseBody
//	@RequestMapping(value="/getReply", method=RequestMethod.GET)
//	public List<Reply> getReply(@RequestParam("no") int no, Model model) throws Exception{
//		
//		System.out.println("getReply ajax 실행 되나요111111?");
//		List<Reply> replyList = replyService.getReply(no);
//		System.out.println("getReply ajax 실행 되나요2222?");
//		
//		model.addAttribute("replyList", replyList);
//		
//		return replyList;
//	}
	
	
	
	
	//=======================reply controller=============================
//	@RequestMapping(value="/getReply", method=RequestMethod.GET)
//	public String getReply(Board board, Model model) throws Exception{
//		
//		return "getContent";
//	}

	
	
}
