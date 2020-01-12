package com.ez.booktime.book.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/book")
public class BookContoller {
	private static final Logger logger
		= LoggerFactory.getLogger(BookContoller.class);
	
	@RequestMapping("/bookDetail.do")
	public void productDetail(String isbn13) {
		logger.info("상품 디테일 파라미터 isbn13={}",isbn13);
		
	}
	
	@RequestMapping("/bookGrade.do")
	public void productGrade() {
		logger.info("평점 보여주기");
	}
	
	@RequestMapping("/bookGradePicker.do")
	public void productGradePicker() {
		logger.info("평점 picker 보여주기");
	}
}
