package com.ez.booktime.common;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
public class MailSender {
	/*
	@Autowired
	private JavaMailSender mailSender;
	
	public void sendMail(String subject, String content
			, String receiver, String sender) throws MessagingException, IOException {
		MimeMessage mimeMsg = mailSender.createMimeMessage();
		mimeMsg.setSubject(subject);
		mimeMsg.setRecipient(RecipientType.TO, new InternetAddress(receiver));
		mimeMsg.setFrom(new InternetAddress(sender));
		
		StringBuilder jspContent = new StringBuilder();
		if(content.startsWith("http://")) {	//jsp응답 결과 소스를 받아오기
			try {
				URL url = new URL(content);
				
				URLConnection con =url.openConnection();
				InputStreamReader reader = new InputStreamReader (con.getInputStream(), "utf-8");
				 
	            BufferedReader buff = new BufferedReader(reader);
	            
	            String pageContents = "";
	            while((pageContents = buff.readLine())!=null){
	            	jspContent.append(pageContents);
	            	jspContent.append("\r\n");
	            }
	 
	            buff.close();
	            
			} catch (MalformedURLException e) {
				e.printStackTrace();
			}
			
			mimeMsg.setContent(jspContent.toString(),"text/html");
		}else {
			mimeMsg.setText(content);
		}//if
		
		mailSender.send(mimeMsg);
	}
	*/
}
