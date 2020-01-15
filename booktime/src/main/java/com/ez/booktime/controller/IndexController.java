package com.ez.booktime.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.booktime.api.AladinAPI;

@Controller
public class IndexController {
	private static final Logger logger
		=LoggerFactory.getLogger(IndexController.class);
	
	
	
	@RequestMapping("/index.do")
	public String index() {
		logger.info("index 화면 보여주기");
		
		return "index";
	}
	
	@RequestMapping("/category.do")
	public String categoryList(@RequestParam(defaultValue="0")
	int cateNo, Model model) throws Exception {
		logger.info("카테고리 번호={}",cateNo);
		
		Category category=new Category();
		List<Map<String, Object>> list=category.categoryFind(cateNo);
		logger.info("카테고리 검색 리스트 크기={}",list.size());
		
		model.addAttribute("list",list);
		
		return "category";
	}
	
	@RequestMapping("/search.do")
	public String showSearchResult(@RequestParam(defaultValue="0")
	String searchKeyword, Model model) throws Exception{
		logger.info("검색어 searchKeyword={}",searchKeyword);
<<<<<<< HEAD

=======
		
		AladinAPI aladinApi=new AladinAPI();
		
		String searchType="QueryType=title&";
		
		List<Map<String, Object>> list=aladinApi.searchBy(searchType, searchKeyword, 1, 10);
		
		model.addAttribute("list",list);
>>>>>>> branch 'develope' of https://github.com/named791/booktime
		return "searchList";
	}
	
	@RequestMapping("/faq.do")
	public void showFAQ() {
		logger.info("자주 묻는 질문");
	}
}
