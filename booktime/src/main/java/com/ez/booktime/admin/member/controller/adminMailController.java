package com.ez.booktime.admin.member.controller;

import javax.mail.MessagingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.booktime.common.ResetPwdMail;
import com.ez.booktime.user.model.UserService;
import com.ez.booktime.user.model.UserVO;

@Controller
@RequestMapping("/admin")
public class adminMailController {
	private static final Logger logger
	=LoggerFactory.getLogger(adminMailController.class);

	@Autowired ResetPwdMail mail;

	@Autowired
	private UserService userService;

	@RequestMapping(value="/adminPassword.do", method=RequestMethod.GET)
	public void adminPassword() {
		logger.info("관리자 암호찾기 화면 보여주기");
	}

	@RequestMapping(value="/adminPassword.do", method=RequestMethod.POST)
	public String adminResetPwd(@RequestParam String inputEmail){

		logger.info("보내는 사람 메일 주소={}",inputEmail);

		try {
			String newPassword=mail.mailSending(inputEmail);
			logger.info("이메일 발송 성공");
			
			//이메일 주소 파싱
			String email1=inputEmail.substring(0, inputEmail.indexOf("@"));
			System.out.println("이메일 아이디"+email1);
			String email2=inputEmail.substring(inputEmail.lastIndexOf("@")+1);
			System.out.println("이메일 주소"+email2);
			
			UserVO userVo=new UserVO();
			userVo.setEmail1(email1);
			userVo.setEmail2(email2);
			
			//비밀번호 변경하기(재설정 유저가)
			
			String userid=userService.selectByEmail(userVo);//유저 아이디 검색
			
			userVo.setUserid(userid);
			userVo.setPwd(newPassword);
			int cnt=userService.resetPwd(userVo);//비밀번호 변경
			
			if(cnt>0) {
				System.out.println("비밀번호 변경 성공");
			}else {
				System.out.println("비밀번호 변경 실패");
			}
			
		} catch (MessagingException e) {
			logger.info("이메일 발송 실패!!");
			e.printStackTrace();
		}

		return "redirect:/admin/adminLogin.do";

	}
}
