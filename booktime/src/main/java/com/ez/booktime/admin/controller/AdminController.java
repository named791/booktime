package com.ez.booktime.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.booktime.controller.IndexController;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger
	=LoggerFactory.getLogger(IndexController.class);
	
	@RequestMapping("/adminLogin.do")
	public void adminLogin() {
		logger.info("관리자 로그인 화면 보여주기");
	}
	
	@RequestMapping("/adminJoin.do")
	public void adminJoin() {
		logger.info("관리자 등록 화면 보여주기");
	}
	
	@RequestMapping("/adminPassword.do")
	public void adminPassword() {
		logger.info("관리자 암호찾기 화면 보여주기");
	}
	
	@RequestMapping("/adminMember.do")
	public void adminMember() {
		logger.info("관리자 회원관리 화면 보여주기");
	}
	
	@RequestMapping("/adminEvent.do")
	public void adminEvent() {
		logger.info("관리자 이벤트관리 화면 보여주기");
	}
	
	@RequestMapping("/adminRe.do")
	public void adminRe() {
		logger.info("관리자 노출관리 화면 보여주기");
	}
	
	@RequestMapping("/adminBoard.do")
	public void adminBoard() {
		logger.info("관리자 게시글관리 화면 보여주기");
	}
	
	@RequestMapping("/adminCart.do")
	public void adminCart() {
		logger.info("관리자 주문관리 화면 보여주기");
	}
}
