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

import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
public class EmailSender {
	
	@Autowired
	private JavaMailSender mailSender;
	
	public void sendMail(String subject, String content
			, String receiver, String sender){
		MimeMessage mimeMsg = mailSender.createMimeMessage();
		try {
			mimeMsg.setSubject(subject);
			mimeMsg.setRecipient(RecipientType.TO, new InternetAddress(receiver));
			mimeMsg.setFrom(new InternetAddress(sender));
		
			StringBuilder jspContent = new StringBuilder();
			if(content.startsWith("http://")) {	//jsp응답 결과 소스를 받아오기
				
					URL url = new URL(content);
					
					URLConnection con =url.openConnection();
					InputStreamReader reader = new InputStreamReader (con.getInputStream(), "UTF-8");
					
		            BufferedReader buff = new BufferedReader(reader);
		            
		            String pageContents = "";
		            while((pageContents = buff.readLine())!=null){
		            	jspContent.append(pageContents);
		            	jspContent.append("\r\n");
		            }
		 
		            buff.close();
		            
		            Document doc = new Document(content);
		            System.out.println("%%%"+doc.html(jspContent));
		            
				mimeMsg.setContent(doc.html(jspContent),"text/html");
			}else {
				mimeMsg.setContent(content,"text/html;charset=UTF-8");
			}//if
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		mailSender.send(mimeMsg);
	}
	
}
