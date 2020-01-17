package com.ez.booktime.admin.index;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.booktime.controller.IndexController;

@Controller
@RequestMapping("/admin")
public class AdminIndexController {
	private static final Logger logger
	=LoggerFactory.getLogger(IndexController.class);

	@RequestMapping("/adminMain.do")
	public String index() {
		logger.info("관리자 메인 화면 보여주기");
		return "admin/adminMain";
	}
	
}
