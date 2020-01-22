package com.ez.booktime.user.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.booktime.user.model.UserService;
import com.ez.booktime.user.model.UserVO;
import com.google.api.services.calendar.Calendar.Acl.List;

@Controller
public class MyPageController {
	private static final Logger logger
	=LoggerFactory.getLogger(MyPageController.class);
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/mypage/mypage.do", method = RequestMethod.GET)
	public void mypage() {
		logger.info("회원정보 화면 보여주기");
	}

	@RequestMapping(value="/mypage/memberInfo.do", method = RequestMethod.GET)
	public void memberInfo() {
		logger.info("마이페이지 화면 보여주기");
	}
	
	@RequestMapping(value="/mypage/myinfo/userout.do", method = RequestMethod.GET)
	public void userout() {
		logger.info("회원탈퇴 화면 보여주기");
	}
	
	@RequestMapping(value="/mypage/myinfo/selectPWD.do", method = RequestMethod.GET)
	public void selectPWD() {
		logger.info("비밀번호 확인 창 보여주기");
	}
	
	@RequestMapping(value="/mypage/myinfo/userInfo.do", method = RequestMethod.GET)
	public void userInfo() {
		logger.info("회원정보 화면 보여주기");
	}
	
	@RequestMapping("/mypage/myinfo/userInfo.do")
	public String UserEdit(HttpSession session, @RequestParam String pwd, Model model) {
		String userid=(String) session.getAttribute("userid");
		
		logger.info("비밀번호 확인 후 회원정보 조회 페이지로 이동, 파라미터 pwd={}, userid={}", pwd, userid);
		
		String dbPwd=userService.selectPWD(userid);
		
		String msg="", url="/mypage/myinfo/selectPWD.do";
		if(dbPwd.equals(pwd)) {
			msg="회원정보 페이지로 이동";
			url="/mypage/myinfo/userInfo.do";
		}else {
			msg="비밀번호가 다릅니다.";
			url="/mypage/myinfo/selectPWD.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
