package com.ez.booktime.user.controller;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class loginController {
	private static final Logger logger 
		= LoggerFactory.getLogger(loginController.class);
	
	@RequestMapping(value="/login/login.do", method = RequestMethod.GET)
	public void login_get() {
		logger.info("로그인 화면");
	}
	
	@RequestMapping(value="/login/nonLogin.do", method = RequestMethod.GET)
	public void nonLogin_get() {
		logger.info("비회원 주문조회 화면 보여주기");
	}
	
	@RequestMapping(value="/login/searchID.do", method = RequestMethod.GET)
	public void searchID(){
		logger.info("아이디 찾기 화면");
	}
	//후에 post로 변경예정
	@RequestMapping(value="/login/getId.do", method = RequestMethod.GET)
	public void getId() {
		logger.info("아이디 찾기 결과 화면");
	}
	
	@RequestMapping(value="/login/searchPWD.do", method = RequestMethod.GET)
	public void searchPWD(){
		logger.info("비밀번호 찾기 화면");
	}
	
	/*
	@RequestMapping("/mypage/memberInfo.do")
	public String memberInfo() {
		logger.info("회원정보");
		
		return "mypage/memberInfo";
	}
	*/

}
