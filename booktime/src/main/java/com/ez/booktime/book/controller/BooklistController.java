package com.ez.booktime.book.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BooklistController {
	private static final Logger logger
		= LoggerFactory.getLogger(BooklistController.class);
	
	@RequestMapping("/book/bookList.do")
	public String booklist(){
		logger.info("상품 목록 화면");
		
		return "book/bookList";
	}
}
