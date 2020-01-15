package com.ez.booktime.reply.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.booktime.freeBoard.controller.freeBoardController;

@Controller
@RequestMapping("/freeBoard/reply")
public class ReplyController {
	private static final Logger logger
	 = LoggerFactory.getLogger(freeBoardController.class);
	
	@RequestMapping
	public void replyInput() {
		logger.info("댓글 쓰기 화면");
	}
}
