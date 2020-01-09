package com.ez.booktime.inquiry.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InquiryController {
	private static final Logger logger
		= LoggerFactory.getLogger(InquiryController.class);
	
	@RequestMapping(value="/inquiry/inquiryPage.do")
	public String inquiry_get() {
		logger.info("1:1 문의 화면 보여주기");
		
		return "inquiry/inquiryPage";
	}
}
