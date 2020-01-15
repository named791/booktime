package com.ez.booktime.freeBoard.controller;


import java.util.List;

<<<<<<< HEAD
import javax.servlet.http.HttpSession;

=======
>>>>>>> branch 'develope' of https://github.com/named791/booktime
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.booktime.freeBoard.model.FreeBoardService;
import com.ez.booktime.freeBoard.model.FreeBoardVO;
<<<<<<< HEAD
import com.ez.booktime.user.model.UserService;
=======
>>>>>>> branch 'develope' of https://github.com/named791/booktime

@Controller
@RequestMapping("/freeBoard")
public class freeBoardController {
	private static final Logger logger
		 = LoggerFactory.getLogger(freeBoardController.class);
	
	@Autowired
	private FreeBoardService boardService;
	
<<<<<<< HEAD
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/Write.do",method=RequestMethod.GET)
	public void freeBoardWrite_get(HttpSession session,
			Model model) {
		String userid=(String)session.getAttribute("userid");
=======
	@RequestMapping(value="/Write.do",method=RequestMethod.GET)
	public void freeBoardWrite_get() {
		logger.info("자유게시판 글쓰기 화면");
	}
	
	@RequestMapping(value="/Write.do",method=RequestMethod.POST)
	public String freeBoardWrite_post(@ModelAttribute FreeBoardVO boardVo,
			Model model) {
		//나중에 id 세션 받아오자
		boardVo.setCategory("자유"); //카테고리 히든으로?
		boardVo.setUserid("test123");
		
		logger.info("자유게시판 글쓰기 파라미터 boardVo={}",boardVo);
		
		String msg="", url="";
		int cnt=boardService.insertBoard(boardVo);
		logger.info("글등록 결과, cnt={}", cnt);
		
		if(cnt>0) {
			msg="글등록되었습니다.";
			url="/freeBoard/List.do";
		}else {
			msg="글등록 실패!";
			url="/freeBoard/Write.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	@RequestMapping("/List.do")
	public void freeBoardList(Model model) {
		logger.info("자유게시판 목록");
>>>>>>> branch 'develope' of https://github.com/named791/booktime
		
<<<<<<< HEAD
		logger.info("자유게시판 글쓰기 화면");
		logger.info("아이디={}",userid);
		
		FreeBoardVO boardVo=boardService.selectById(userid);
		
		model.addAttribute("boardVo",boardVo);
=======
		List<FreeBoardVO> list=boardService.selectFreeBoardAll();
		logger.info("자유게시판 리스트 크기={}",list.size());
		
		model.addAttribute("list",list);
>>>>>>> branch 'develope' of https://github.com/named791/booktime
	}
	
<<<<<<< HEAD
	@RequestMapping("/chkUser.do")
	public String freeBoardChkUser(HttpSession session,
			Model model) {
		String userid=(String)session.getAttribute("userid");
		logger.info("회원 여부 체크, 회원 아이디={}",userid);
		
		String msg="", url="";
		
		if(userid!=null && !userid.isEmpty()) {
			msg="자유게시판 글쓰기";
			url="/freeBoard/Write.do";
		}else {
			msg="회원만 자유게시판 글쓰기가 가능합니다. 이용시 가입 부탁드립니다.";
			url="/user/register.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/Write.do",method=RequestMethod.POST)
	public String freeBoardWrite_post(@ModelAttribute FreeBoardVO boardVo,
			HttpSession session,
			Model model) {
		
		String userid=(String)session.getAttribute("userid");
		
		boardVo.setCategory("자유");
		boardVo.setUserid(userid);
		
		logger.info("자유게시판 글쓰기 파라미터 boardVo={}",boardVo);
		
		String msg="", url="";
		int cnt=boardService.insertBoard(boardVo);
		logger.info("글등록 결과, cnt={}", cnt);
		
		if(cnt>0) {
			msg="글등록되었습니다.";
			url="/freeBoard/List.do";
		}else {
			msg="글등록 실패!";
			url="/freeBoard/Write.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	@RequestMapping("/List.do")
	public void freeBoardList(Model model) {
		logger.info("자유게시판 목록");

		List<FreeBoardVO> list=boardService.selectFreeBoardAll();
		logger.info("자유게시판 리스트 크기={}",list.size());
		
		model.addAttribute("list",list);
=======
	@RequestMapping(value="/Edit.do", method=RequestMethod.GET)
	public String freeBoardEdit(@RequestParam(defaultValue ="0") int boardNo,
			Model model) {
		//로그인 만들면 세션 받아오고, sql문에 아이디 조건도 포함하기
		logger.info("자유게시판 글 수정하기  파라미터 boardNo={}",boardNo);
		
		if(boardNo==0) {
			model.addAttribute("msg"," 잘못된 url입니다.");
			model.addAttribute("msg"," 잘못된 url입니다.");
			
			return "common/message";
		}
		
		FreeBoardVO boardVo=boardService.selectByNo(boardNo);
		logger.info("상세보기 결과 boardVo={}",boardVo);
		
		model.addAttribute("boardVo",boardVo);
		
		return "freeBoard/Edit";
>>>>>>> branch 'develope' of https://github.com/named791/booktime
	}
	
	@RequestMapping("/Detail.do")
	public String freeBoardDetail(@RequestParam(defaultValue ="0") int boardNo,
<<<<<<< HEAD
			HttpSession session,
			Model model) {
		logger.info("자유게시판 글 상세보기 파라미터 boardNo={}",boardNo);
		String userid=(String)session.getAttribute("userid");
		
		if(boardNo==0) {
			model.addAttribute("msg"," 잘못된 url입니다.");
			model.addAttribute("msg"," 잘못된 url입니다.");
			
			return "common/message";
		}
		
		FreeBoardVO boardVo=boardService.selectByNo(boardNo);
		logger.info("상세보기 결과 boardVo={}",boardVo);
		
		model.addAttribute("boardVo",boardVo);
		model.addAttribute("chkid",userid);
		
		return "freeBoard/Detail";
	}
	

	@RequestMapping(value="/Edit.do", method=RequestMethod.GET)
	public String freeBoardEdit_get(@RequestParam(defaultValue ="0") int boardNo,
			Model model) {
		
		logger.info("자유게시판 글 수정하기  파라미터 boardNo={}",boardNo);
		
		if(boardNo==0) {
			model.addAttribute("msg"," 잘못된 url입니다.");
			model.addAttribute("msg"," 잘못된 url입니다.");
			
			return "common/message";
		}
		
		FreeBoardVO boardVo=boardService.selectByNo(boardNo);
		logger.info("상세보기 결과 boardVo={}",boardVo);
		
		model.addAttribute("boardVo",boardVo);
		
		return "freeBoard/Edit";
	}
	
	@RequestMapping(value="/Edit.do", method=RequestMethod.POST)
	public String freeBoardEdit_post(@ModelAttribute FreeBoardVO freeBoardVo,
			Model model) {
		logger.info("글 수정 파라미터 freeBoardVo={}",freeBoardVo);
		
		String msg="", url="";
		int cnt=boardService.updateBoard(freeBoardVo);
		logger.info("글수정 결과, cnt={}", cnt);
		
		if(cnt>0) {
			msg="게시글 수정 되었습니다.";
			url="/freeBoard/List.do";
		}else {
			msg="게시글 수정이 실패했습니다";
			url="/freeBoard/Edit.do?boardNo="+freeBoardVo.getBoardNo();
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/Delete.do")
	public String freeBoardDelete(@RequestParam int boardNo,
			Model model) {
		logger.info("게시글 삭제 화면");
		
		String msg="", url="";
		int cnt=boardService.drawBoard(boardNo);
		logger.info("글수정 결과, cnt={}", cnt);
		
		if(cnt>0) {
			msg="게시글 삭제 되었습니다.";
			url="/freeBoard/List.do";
		}else {
			msg="게시글 삭제가 실패했습니다";
			url="/freeBoard/Detail.do?boardNo="+boardNo;
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
=======
			Model model) {
		logger.info("자유게시판 글 상세보기 파라미터 boardNo={}",boardNo);
		
		if(boardNo==0) {
			model.addAttribute("msg"," 잘못된 url입니다.");
			model.addAttribute("msg"," 잘못된 url입니다.");
			
			return "common/message";
		}
		
		FreeBoardVO boardVo=boardService.selectByNo(boardNo);
		logger.info("상세보기 결과 boardVo={}",boardVo);
		
		model.addAttribute("boardVo",boardVo);
		
		return "freeBoard/Detail";
>>>>>>> branch 'develope' of https://github.com/named791/booktime
	}
}
