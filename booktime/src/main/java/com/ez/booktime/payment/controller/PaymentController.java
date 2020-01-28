package com.ez.booktime.payment.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.booktime.api.AladinAPI;
import com.ez.booktime.favorite.model.FavoriteService;
import com.ez.booktime.favorite.model.FavoriteVO;
import com.ez.booktime.user.model.UserService;
import com.ez.booktime.user.model.UserVO;

@Controller
@RequestMapping("/payment")
public class PaymentController {
	private static final Logger logger
		= LoggerFactory.getLogger(PaymentController.class);
	
	@Autowired
	private AladinAPI aladinApi;
	
	@Autowired
	private FavoriteService favoriteservice;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/paymentSheetSend.do")
	public String paymentSheetSend(@ModelAttribute FavoriteVO vo
			, HttpSession session) {
		String userid=(String)session.getAttribute("userid");
		if(userid==null || userid.isEmpty()) {
			userid = "#"+session.getId();	//비회원
		}
		
		logger.info("선택한 항목 장바구니 넣기 처리 파라미터 vo={}, userid={}",vo, userid);
		
		List<FavoriteVO> voList = vo.getVoList();
		
		if(voList!=null && !voList.isEmpty()) {
			for(FavoriteVO fVo :voList) {
				if(fVo.getFavoriteNo()!=0) {
					// 선택하여 구매하기의 경우
					// 선택된 상품들을 장바구니에 추가하기
					fVo.setUserid(userid);
					fVo.setGroup("CART");
					favoriteservice.insertFavorite(fVo);
				}
			}
		}
		
		return "redirect:/payment/paymentSheet.do";
	}
	
	@RequestMapping("/paymentSheet.do")
	public void payMentSheet(HttpSession session
			, Model model) {	
		String userid = (String)session.getAttribute("userid");
		if(userid==null || userid.isEmpty()) {
			userid = "#"+session.getId();	//비회원
		}
		
		logger.info("주문서 작성 파라미터 userid={}",userid);
		
		FavoriteVO vo = new FavoriteVO();
		//장바구니에서 주문서에 넣을 항목 가져오기
		vo.setGroup("CART");
		vo.setUserid(userid);
		List<FavoriteVO> voList = favoriteservice.selectFavorite(vo);
		
		List<Map<String, Object>> infoList = new ArrayList<Map<String,Object>>();
		for(FavoriteVO fVo : voList) {
			try {
				Map<String, Object> info = aladinApi.selectBook(fVo.getIsbn());
				
				infoList.add(info);	//세부정보 표지등 가져오기..
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		logger.info("주문서 작성 가져오기 결과 list.size={}",voList.size());
		
		model.addAttribute("infoList", infoList);
		model.addAttribute("list", voList);
		model.addAttribute("userVo", userService.selectByUserid(userid));
	}
	
	
}
