package com.ez.booktime.user.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

@Controller
public class loginController {
	private static final Logger logger 
		= LoggerFactory.getLogger(loginController.class);
	
	@Autowired
	private UserService userService; 
	
	@RequestMapping(value="/login/login.do", method = RequestMethod.GET)
	public void login_get() {
		logger.info("로그인 화면");
	}
	
	@RequestMapping(value="/login/login.do", method = RequestMethod.POST)
	public String login_post(@RequestParam String userid,
			@RequestParam String pwd, @RequestParam(required = false) String idSave,
			Model model, HttpServletRequest request, HttpServletResponse response ) { //로그인에 필요한 아이디와 비밀번호 아이디기억여부 받아오기
		logger.info("로그인 처리하기, 파라미터 userid={}, pwd={}",userid, pwd);
		logger.info("idSave={}", idSave);
		
		//serivce유효성 검사를 마침 =>db작업 차례
		int result=userService.userGetPwd(userid, pwd);
		logger.info("로그인 처리 결과 result={}", result);
		
		String msg="", url="/login/login.do";
		if(result==userService.LOGIN_OK) { //로그인 완료시
			//세션생성(request,response 필요) - 쿠키에 아이디 저장
			HttpSession session=request.getSession();
			session.setAttribute("userid", userid);
			
			Cookie ck= new Cookie("ck_userid", userid); //name은 session과 다르게 줄것
			ck.setPath("/");
			if(idSave!=null) { //id저장하기 체크를 한경우
				ck.setMaxAge(1000*24*60*60); //1000일 동안
				response.addCookie(ck);
			}else { //체크 안한경우
				ck.setMaxAge(0); //쿠키제거하깅
				response.addCookie(ck);
			}
			msg+="[ "+userid+" ]님 로그인 되었습니다.";
			url="/index.do";
		}else if(result==userService.ID_NONE) { //아이디가 없을 떄
			msg="존재하지 않는 사용자입니다.";
			url="/login/login.do";
		}else if(result==userService.PWD_DISAGREE) { //비번 없을때
			msg="비밀번호가 일치하지 않습니다.";
			url="/login/login.do";
		}else {
			msg="로그인 실패!";
			url="/login/login.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/login/logout.do")
	public String logout(HttpSession session) {
		logger.info("로그아웃 처리 성공");
		session.invalidate();
		
		return "redirect:/index.do";
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
