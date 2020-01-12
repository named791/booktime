package com.ez.booktime.freeBoard.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/freeBoard")
public class freeBoardController {
	private static final Logger logger
		 = LoggerFactory.getLogger(freeBoardController.class);
	
	@RequestMapping("/List.do")
	public String freeBoardList() {
		logger.info("자유게시판 목록");
		
		return "freeBoard/List";
	}
	
	@RequestMapping("/Write.do")
	public void freeBoardWrite() {
		logger.info("자유게시판 글쓰기");
	}
	
	@RequestMapping("/Edit.do")
	public void freeBoardEdit() {
		logger.info("자유게시판 글 수정하기");
	}
	
	@RequestMapping("/Detail.do")
	public void freeBoardDetail() {
		logger.info("자유게시판 글 상세보기");
	}
}
