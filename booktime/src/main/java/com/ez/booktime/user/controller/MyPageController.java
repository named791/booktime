package com.ez.booktime.user.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
			msg="비밀번호 확인";
			url="/mypage/myinfo/userInfo.do";
		}else {
			msg="비밀번호가 다릅니다.";
			url="/mypage/myinfo/selectPWD.do";
		}
		
		UserVO vo=userService.selectByUserid(userid);
		logger.info("회원정보 조회하기 vo={}", vo);
		session.setAttribute("birth", vo.getBirth());
		session.setAttribute("gender", vo.getGender());
		session.setAttribute("email1", vo.getEmail1());
		session.setAttribute("email2", vo.getEmail2());
		session.setAttribute("phone", vo.getPhone());
		session.setAttribute("newaddress", vo.getNewaddress());
		session.setAttribute("addressDetail", vo.getAddressdetail());
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	//회원정보 수정(이메일, 전화번호, 주소, 비밀번호 )
		@RequestMapping(value="/mypage/myinfo/editUser.do", method = RequestMethod.POST)
		public String editUser(Model model) {
			
			String msg="넘어가는 것만 확인", url="/mypage/index.do";
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
			return "common/message";
		}
	
	/*//회원정보 수정(이메일, 전화번호, 주소, 비밀번호 )
	@RequestMapping("/mypage/myinfo/editUser.do")
	public String editUser(
			HttpSession session,
			@RequestParam(required = false)String hp1,
			@RequestParam(required = false)String hp2,
			@RequestParam(required = false)String hp3,
			@RequestParam(required = false)String zipcode,
			@RequestParam(required = false)String newaddress,
			@RequestParam(required = false)String parseladdress,
			@RequestParam(required = false)String addressdetail,
			@RequestParam(required = false)String email1,
			@RequestParam(required = false)String email2,
			@RequestParam(required = false)String email3,
			@RequestParam(required = true) String pwd,
			Model model) {
		
		String userid=(String) session.getAttribute("userid");
		
		logger.info("비밀번호 찾기를 위한 userid={}", userid);
		logger.info("회원정보 수정하기, 파라미터 hp1={}, hp2={}",hp1, hp2);
		logger.info("h3={}, zipcode={}", hp3, zipcode);
		logger.info("newaddress={}, parseladdress={}", newaddress, parseladdress);
		logger.info("addressdetail={}, email1={}", addressdetail, email1);
		logger.info("email2={}, email3={}", email2, email3);
		logger.info("비밀번호 pwd={}", pwd);
		
		String dbpwd=userService.selectPWD(userid);
		UserVO userVo=new UserVO();
		
		String phone="";
		if(hp2!=null && !hp2.isEmpty() && hp3!=null && !hp3.isEmpty()) {
			phone=hp1+"-"+hp2+"-"+hp3;
		}
		userVo.setPhone(phone);
		
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
		
		userVo.setZipcode(zipcode);
		userVo.setParseladdress(parseladdress);
		userVo.setNewaddress(newaddress);
		userVo.setAddressdetail(addressdetail);
		userVo.setUserid(userid);
		
		logger.info("셋팅후 userVo={}",userVo);
		
		String msg="", url="/mypage/myinfo/userInfo.do";
		if(dbpwd.equals(pwd)) {
			int cnt=userService.updateUser(userVo);
			logger.info("회원정보 수정 결과 cnt={}", cnt);
			msg="회원정보가 수정되었습니다.";
			url="/mypage/mypage.do";
		}else{
			msg="비밀번호가 다릅니다.";
			url="/mypage/myinfo/userInfo.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}*/
}
