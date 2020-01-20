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
			, HttpSession session, Model model) {
		String userid=(String)session.getAttribute("userid");
		if(userid==null || userid.isEmpty()) {
			userid = "#"+session.getId();	//비회원
		}
		
		logger.info("선택한 항목만 주문서 작성 파라미터 vo={}, userid={}",vo, userid);
		
		List<FavoriteVO> list = vo.getVoList();
		
		List<FavoriteVO> voList = new ArrayList<FavoriteVO>();
		for(FavoriteVO fVo:list) {
			if(fVo.getFavoriteNo()!=0) {
				voList.add(favoriteservice.selectOneFavorite(fVo.getFavoriteNo()));
			}
		}
		
		List<Map<String, Object>> infoList = new ArrayList<Map<String,Object>>();
		for(FavoriteVO fVo : voList) {
			try {
				Map<String, Object> info = aladinApi.selectBook(fVo.getIsbn());
				
				infoList.add(info);	//세부정보 표지등 가져오기..
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		logger.info("선택된 항목으로 주문서 작성 가져오기 결과 list.size={}",voList.size());
		
		model.addAttribute("infoList", infoList);
		model.addAttribute("list", voList);
		model.addAttribute("userVo", userService.selectByUserid(userid));
		
		return "payment/paymentSheet";
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
