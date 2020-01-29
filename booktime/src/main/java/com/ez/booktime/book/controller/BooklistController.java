package com.ez.booktime.book.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.booktime.api.AladinAPI;
import com.ez.booktime.common.PaginationInfo;
import com.ez.booktime.controller.Category;

@Controller
@RequestMapping("/book")
public class BooklistController {
	private static final Logger logger
		= LoggerFactory.getLogger(BooklistController.class);

	@Autowired 
	private AladinAPI aladinApi;
	
	@RequestMapping("/bookList.do") 
	public String bookList_post(@RequestParam(defaultValue="0") int cateNo
			, @RequestParam(defaultValue = "1") int start
			, @RequestParam(defaultValue = "20") int maxResult
			, Model model) throws Exception { 
		logger.info("카테고리 번호 cateNo={}, 현재 페이지 currentPage={}", cateNo);
		logger.info("시작 페이지 start={}, 한 페이지당 출력 개수 maxResult={}", start, maxResult);
		
		Category category=new Category();
		List<Map<String, Object>> list=category.categoryFind(cateNo, start, 20);
		logger.info("카테고리 검색 리스트 크기={}",list.size());
		
		PaginationInfo pagingInfo=new PaginationInfo();
		int total = Integer.parseInt(list.get(0).get("totalResult").toString());
		
		pagingInfo.setTotalRecord(total);
		pagingInfo.setBlockSize(10);
		pagingInfo.setCurrentPage(start);
		pagingInfo.setRecordCountPerPage(5);
		
		logger.info("pagingInfo set 결과, pagingInfo={}", pagingInfo);
		  
		model.addAttribute("list",list);
		model.addAttribute("pagingInfo", pagingInfo);
		  
		return "book/bookList"; 
	}
	 
	
	@RequestMapping("/bookList/searchBook.do")
	public String bookList_searchTitle(@RequestParam(required = false) String searchKeyword
			, @RequestParam(defaultValue = "0") int cateNo
			, @RequestParam(defaultValue = "1") int start
			, @RequestParam(defaultValue = "20") int maxResult
			, Model model) {
		logger.info("제목으로 리스트 검색, 파라미터 searchKeyword={}, cateNo={}",searchKeyword, cateNo);
		
		List<Map<String, Object>> searchBookList = null;
		try {
			searchBookList = aladinApi.searchByTitleAndCate(searchKeyword, cateNo, start, 20);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		logger.info("제목 검색 결과 list.size={}",searchBookList.size());
		
		PaginationInfo pagingInfo=new PaginationInfo();
		int total = Integer.parseInt(searchBookList.get(0).get("totalResult").toString());
		
		pagingInfo.setTotalRecord(total);
		pagingInfo.setBlockSize(10);
		pagingInfo.setCurrentPage(start);
		pagingInfo.setRecordCountPerPage(5);
		
		logger.info("pagingInfo set 결과, pagingInfo={}", pagingInfo);
		
		model.addAttribute("list", searchBookList);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "book/bookList";
	}
	
	@RequestMapping("/bookList/authorBook.do")
	public String bookList_author(@RequestParam(required = false) String author
			, @RequestParam(defaultValue = "0") int cateNo
			, @RequestParam(defaultValue = "1") int start
			, Model model) {
		logger.info("특정 저자로 리스트 검색, 파라미터 author={}, cateNo={}",author, cateNo);
		
		List<Map<String, Object>> authorBookList = null;
		try {
			authorBookList = aladinApi.searchByAuthorAndCate(author, cateNo, start, 15);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		logger.info("특정 저자 검색 결과 list.size={}",authorBookList.size());
		
		model.addAttribute("list", authorBookList);
		
		return "book/bookList";
	}

	@RequestMapping("/bookList/publBook.do")
	public String bookList_publ(@RequestParam(required = false) String publisher
			, @RequestParam(defaultValue = "0") int cateNo
			, @RequestParam(defaultValue = "1") int start
			, Model model) {
		logger.info("출판사로 리스트 검색, 파라미터 publisher={}, cateNo={}",publisher, cateNo);
		
		List<Map<String, Object>> publBookList = null;
		try {
			publBookList = aladinApi.searchByPublAndCate(publisher, cateNo, start, 15);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		logger.info("제목 검색 결과 list.size={}",publBookList.size());
		
		model.addAttribute("list", publBookList);
		
		return "book/bookList";
	}
	
	@RequestMapping("/bookBestList.do")
	public String bestBook(@RequestParam(defaultValue="0") int cateNo, 
			Model model) throws Exception {
		logger.info("카테고리 번호={}, isbn13={}", cateNo);
		
		Category category=new Category();
		List<Map<String, Object>> specialList=category.categorySpecial(cateNo);
		logger.info("카테고리 베스트 검색 리스트, specialList.size={}",specialList.size());
		
		model.addAttribute("specialList", specialList);
		
		return "book/bookBestList";
	}
	
	@RequestMapping("/bookInfo.do")
	public String bookInfo(@RequestParam String isbn13, Model model) throws Exception {
		logger.info("isbn 정보, 파라미터 isbn13={}", isbn13);
		
		Map<String, Object> map=aladinApi.selectBook(isbn13);
		logger.info("isbn에 따른 책 정보, map={}", map);
		
		model.addAttribute("map", map);
		
		return "book.bookList";
	
	}
}
