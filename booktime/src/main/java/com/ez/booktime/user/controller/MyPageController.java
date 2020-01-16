package com.ez.booktime.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyPageController {
	private static final Logger logger
	=LoggerFactory.getLogger(MyPageController.class);
	
	@RequestMapping(value="/mypage/mypage.do", method = RequestMethod.GET)
	public void mypage() {
		logger.info("회원정보 화면 보여주기");
	}

	@RequestMapping(value="/mypage/memberInfo.do", method = RequestMethod.GET)
	public void memberInfo() {
		logger.info("마이페이지 화면 보여주기");
	}
	
}
