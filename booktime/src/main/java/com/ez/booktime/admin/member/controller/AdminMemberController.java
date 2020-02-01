package com.ez.booktime.admin.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.booktime.user.model.UserService;
import com.ez.booktime.user.model.UserVO;

@Controller
@RequestMapping("/admin")
public class AdminMemberController {
	private static final Logger logger
	=LoggerFactory.getLogger(AdminMemberController.class);
	
	@Autowired
	private UserService userService;
	
	//관리자 등록하기
	@RequestMapping(value="/adminJoin.do", method=RequestMethod.POST)
	public String adminJoin_post(@ModelAttribute UserVO userVo,@RequestParam String hp1,
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
		String msg="", url="/admin/adminLogin.do";
		if(cnt>0) {
			msg="관리자 등록이 완료되었습니다.";
		}else {
			msg="관리자 등록에 실패했습니다!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "/common/message";
	}
	
	//관리자 등록할 때 아이디 중복확인하는 Ajax
	@RequestMapping("/ajaxCheckId.do")
	@ResponseBody
	public boolean ajaxCheckId(@RequestParam String userid) {
		logger.info("아이디 중복확인, 파라미터 userid={}", userid);
		
		boolean result=userService.chkUserid(userid);
		logger.info("아이디 중복확인 결과, result={}", result);

		
		boolean bool=false;
		if(result==false) {
			bool=true; //이미 존재
		}else if(result==true) {
			bool=false;	//사용가능
		}
		return bool;		
	}
}
