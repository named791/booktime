package com.ez.booktime.admin.controller;

import java.util.List;

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

import com.ez.booktime.controller.IndexController;
import com.ez.booktime.favorite.model.FavoriteVO;
import com.ez.booktime.user.model.UserService;
import com.ez.booktime.user.model.UserVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger
	=LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/adminLogin.do", method=RequestMethod.GET)
	public void adminLogin_get() {
		logger.info("관리자 로그인 화면 보여주기");
	}
	
	@RequestMapping(value="/adminLogin.do", method=RequestMethod.POST)
	public String adminLogin_post(@RequestParam String userid,
			@RequestParam String pwd, @RequestParam(required = false) String idSave,
			Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("로그인 처리하기, 파라미터 userid={}, pwd={}",userid, pwd);
		logger.info("idSave={}", idSave);

		int result=userService.userGetPwd(userid, pwd);
		logger.info("로그인 처리 결과 result={}", result);
		
		
		UserVO userVo=userService.selectByUserid(userid);
		String grade=userVo.getGrade();
		
		String msg="", url="/login/login.do";
		if(result==userService.LOGIN_OK) {
			
			HttpSession session=request.getSession();
			session.setAttribute("userid", userid);

			Cookie ck= new Cookie("ck_userid", userid);
			ck.setPath("/");
			if(idSave!=null) { //id저장
				ck.setMaxAge(1000*24*60*60);
				response.addCookie(ck);
			}else { 
				ck.setMaxAge(0); 
				response.addCookie(ck);
			}
			
			if(grade.equals("A")) {
				msg+="[ "+userid+" ]님 로그인 되었습니다.";
				url="/admin/adminMain.do";
			}else {
				msg="관리자 아이디가 아닙니다.";
				url="/admin/adminLogin.do";
			}
		}else if(result==userService.ID_NONE) { //아이디가 없을 떄
			msg="존재하지 않는 관리자입니다.";
			url="/admin/adminLogin.do";
		}else if(result==userService.PWD_DISAGREE) { //비번 없을때
			msg="비밀번호가 일치하지 않습니다.";
			url="/admin/adminLogin.do";
		}else {
			msg="로그인 실패!";
			url="/admin/adminLogin.do";
		}
				
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/adminLogout.do")
	public String logout(HttpSession session) {
		logger.info("로그아웃 처리 성공");
		session.invalidate();
		
		return "redirect:/admin/adminLogin.do";
	}
	
	@RequestMapping(value="/adminJoin.do", method=RequestMethod.GET)
	public void adminJoin() {
		logger.info("관리자 등록 화면 보여주기");
	}
	
	@RequestMapping("/adminMember.do")
	public void adminMember(Model model) {
		logger.info("관리자 회원관리 화면 보여주기");
		
		List<UserVO> list=userService.selectAllUser();
		logger.info("리스트 크기={}",list.size());
		
		model.addAttribute("list",list);
		
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
