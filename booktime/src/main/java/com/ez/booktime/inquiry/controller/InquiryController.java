package com.ez.booktime.inquiry.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class InquiryController {
	private static final Logger logger
		= LoggerFactory.getLogger(InquiryController.class);
	
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value="/inquiry/inquiryPage.do", method = RequestMethod.GET )
	public String inquiry_get() {
		logger.info("1:1 문의 화면 보여주기");
		
		return "inquiry/inquiryPage";
	}
	
	@RequestMapping(value="/mail/mailSending.do", method = RequestMethod.POST)
	public String mailSending(HttpServletRequest request) {
		String tomail  = "yjwyhg@gmail.com";     // 받는 사람 이메일
		String setfrom = request.getParameter("email");         
		String title   = request.getParameter("title");      // 제목
		String type = request.getParameter("qType");
		String name = request.getParameter("name");
		String userid = request.getParameter("userid");
		String msg = request.getParameter("message");
		
	    String content = "\r\n문의 유형 : "+ type + 
	    				"\r\n" + "\r\n"
	    				+ "아이디 : "+ userid + 
	    				"\r\n" + "\r\n"
	    				+ "이름 : "+name+
	    				"\r\n" + "\r\n"
	    				+ "이메일 : "+ setfrom + 
	    				"\r\n" + "\r\n"
	    				+ "내용 : "+ msg;// 내용
	   
	    setfrom = setfrom.toLowerCase();
	    tomail = tomail.toLowerCase();
	    
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper 
	                        = new MimeMessageHelper(message, true, "UTF-8");
	      
	      messageHelper.setTo(tomail);     // 받는사람 이메일
	      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	      messageHelper.setText(type);
	      messageHelper.setText(name);
	      messageHelper.setText(userid);
	      messageHelper.setText(content);  // 메일 내용
	     
	      mailSender.send(message);
	    } catch(Exception e){
	      System.out.println(e);
	    }
	   
	    return "redirect:/inquiry/inquiryPage.do";
	  }
}
