package com.ez.booktime.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.booktime.user.model.UserService;
import com.ez.booktime.user.model.UserVO;

@Controller
public class UserController {
	@Autowired
	private static final Logger logger
	=LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	//약관화면
	@RequestMapping("/user/provision.do")
	public void provision() {
		logger.info("약관화면");
	}
	//약관화면 보여주기
	@RequestMapping("/user/agreement.do")
	public String  agreement_get() {
		logger.info("회원약관 화면 보여주기");
		
		return "/user/agreement";
	}
	//회원가입 화면 보여주기
	@RequestMapping("/user/register.do")
	public String user_get() {
		logger.info("회원가입 화면 보여주기");
		
		return "/user/register";
	}
	
	@RequestMapping("/user/userWrite.do")
	public String insertUser(@ModelAttribute UserVO userVo,@RequestParam String hp1,
			@RequestParam String hp2, @RequestParam String hp3, @RequestParam String email3,
			Model model) {
		logger.info("회원가입 처리하기, 파라미터 userVo={}, hp1={}", userVo, hp1);
		logger.info("hp2={}, hp3={}",hp2, hp3 );
		logger.info("email3={}", email3);
		
		String phone="";
		if(hp2!=null && !hp2.isEmpty() && hp3!=null && !hp3.isEmpty()) {
			phone=hp1+"-"+hp2+"-"+hp3;
		}
		userVo.setPhone(phone);
		
		String email1=userVo.getEmail1();
		String email2=userVo.getEmail2();
		
		if(email1==null || email1.isEmpty()) {
			email1="";
			email2="";
		}else {
			if(email2.equals("etc")) {
				email2=email3;
			}
		}
		userVo.setEmail1(email1);
		userVo.setEmail2(email2);
		
		logger.info("파라미터 저장후 userVo={}", userVo);
		
		int cnt=userService.insertUser(userVo);
		String msg="", url="/user/login.do";
		if(cnt>0) {
			msg="회원가입이 완료되었습니다.";
		}else {
			msg="회원가입에 실패했습니다!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "/common/message";
	}
	
	@RequestMapping("/user/chkId.do")
	public String chkId(@RequestParam String userid, Model model ) {
		logger.info("아이디 중복체크, 파라미터 userid={}", userid);
		
		boolean result=false;
		if(userid!=null && !userid.isEmpty()) {
			result=userService.chkUserid(userid);
			logger.info("아이디 중복확인 결과 result={}", result);
		}
		
		model.addAttribute("result", result);
		return "/user/chkId";
	}
	
	
	
	
}
