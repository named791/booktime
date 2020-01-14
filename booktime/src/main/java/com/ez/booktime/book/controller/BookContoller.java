package com.ez.booktime.book.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.booktime.api.AladinAPI;
import com.ez.booktime.category.model.BookCategoryService;
import com.ez.booktime.category.model.BookCategoryVO;

@Controller
@RequestMapping("/book")
public class BookContoller {
	private static final Logger logger
		= LoggerFactory.getLogger(BookContoller.class);
	
	@Autowired
	private AladinAPI aladinApi;
	
	@Autowired
	private BookCategoryService cateService;
	
	@RequestMapping("/bookDetail.do")
	public void productDetail(@RequestParam String ItemId, Model model) {
		logger.info("상품 디테일 파라미터 isbn13={}",ItemId);
		
		Map<String, Object> map = null;
		try {
			 map = aladinApi.selectBook(ItemId);
			 
			 String cateName = (String)map.get("cateName");
			 BookCategoryVO cateVo = cateService.selectCategoryInfoByName(cateName);
			 
			 map.put("cateCode", cateVo.getCateCode());
			 
			 logger.info("상품 상세보기 결과 map={}",map);
			 
			 
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("map", map);
	}
	
	@RequestMapping("/bookGrade.do")
	public void productGrade() {
		logger.info("평점 보여주기");
	}
	
	@RequestMapping("/bookGradePicker.do")
	public void productGradePicker() {
		logger.info("평점 picker 보여주기");
	}
}
