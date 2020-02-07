package com.ez.booktime.admin.index;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.booktime.common.model.CommonService;
import com.ez.booktime.controller.IndexController;

@Controller
@RequestMapping("/admin")
public class AdminIndexController {
	private static final Logger logger
	=LoggerFactory.getLogger(AdminIndexController.class);

	@Autowired
	private CommonService commonService;
	
	@RequestMapping("/adminMain.do")
	public void index(Model model) {
		logger.info("관리자 메인 화면 보여주기");
		
		Map<String, Object> map = commonService.countInfo();
		logger.info("관리자 메인, 토탈 값 읽어오기 map={}",map);
		
		model.addAttribute("map", map);
	}
	
}
