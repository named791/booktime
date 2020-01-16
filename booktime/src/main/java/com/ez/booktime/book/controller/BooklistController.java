package com.ez.booktime.book.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.booktime.controller.Category;

@Controller
public class BooklistController {
	private static final Logger logger
		= LoggerFactory.getLogger(BooklistController.class);

	@RequestMapping("/book/bookList.do")
	public String bookList_post(@RequestParam(defaultValue="0")
	int cateNo, Model model) throws Exception {
		logger.info("카테고리 번호={}",cateNo);
		
		Category category=new Category();
		List<Map<String, Object>> list=category.categoryFind(cateNo);
		logger.info("카테고리 검색 리스트 크기={}",list.size());
		
		model.addAttribute("list",list);
		
		return "book/bookList";
	}
}
