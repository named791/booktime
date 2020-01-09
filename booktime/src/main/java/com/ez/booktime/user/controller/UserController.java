package com.ez.booktime.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {
	@Autowired
	private static final Logger logger
	=LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping(value="/user/register.do", method = RequestMethod.GET)
	public void user_get() {
		logger.info("회원가입 화면 보여주기");
	}
}
