package com.ez.booktime.payment.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/payment")
public class PaymentController {
	private static final Logger logger
		= LoggerFactory.getLogger(PaymentController.class);
	
	@RequestMapping("/paymentSheet.do")
	public void paymentSheet() {
		logger.info("주문서 작성");
	}
	
}
