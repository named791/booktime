package com.ez.booktime.favorite.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/favorite")
public class FavoriteController {
	private static final Logger logger
		= LoggerFactory.getLogger(FavoriteController.class);
	
	@RequestMapping("/favorite.do")
	public void favorite() {
		logger.info("즐겨찾기 리스트");
	}
	
	@RequestMapping("/cart.do")
	public void cart() {
		logger.info("장바구니 리스트");
	}
}
