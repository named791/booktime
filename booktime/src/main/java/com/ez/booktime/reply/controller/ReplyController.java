package com.ez.booktime.reply.controller;

import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.booktime.reply.model.ReplyService;
import com.ez.booktime.reply.model.ReplyVO;

@Controller
@RequestMapping("/freeBoard/reply")
public class ReplyController {
	private static final Logger logger
	 = LoggerFactory.getLogger(ReplyController.class);
	
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping("/replyWrite.do")
	public void replyInput() {
		logger.info("댓글 쓰기 화면");
	}
	
	@RequestMapping("/replyList.do")
	public void replyList(@RequestParam int boardNo,
			Model model) {
		logger.info("댓글 목록 화면");
		
		ReplyVO replyVo=new ReplyVO();
		replyVo.setBoardNo(boardNo);
		
		List<ReplyVO> list=replyService.selectReplyList();
		logger.info("자유게시판 리스트 크기={}",list.size());
		
		model.addAttribute("list",list);
	}
}
