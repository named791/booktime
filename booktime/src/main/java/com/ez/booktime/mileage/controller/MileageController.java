package com.ez.booktime.mileage.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.booktime.common.PageNumber;
import com.ez.booktime.common.PaginationInfo;
import com.ez.booktime.common.SearchVO;
import com.ez.booktime.mileage.model.MileageService;
import com.ez.booktime.mileage.model.MileageVO;

@Controller
@RequestMapping("/mypage/Mileage")
public class MileageController {
	private static final Logger logger
	 = LoggerFactory.getLogger(MileageController.class);
	
	@Autowired
	private MileageService mileageService;
	
	@RequestMapping("/Mileage.do")
	public void MileageList(Model model) {
		
		List<MileageVO> list=mileageService.selectMileageList();
		logger.info("자유게시판 리스트 크기={}",list.size());
		
		
		model.addAttribute("list",list);

	}
}
