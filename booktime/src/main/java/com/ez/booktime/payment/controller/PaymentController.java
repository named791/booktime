package com.ez.booktime.payment.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
import com.ez.booktime.category.model.BookCategoryService;
import com.ez.booktime.category.model.BookCategoryVO;
import com.ez.booktime.common.PaginationInfo;
import com.ez.booktime.favorite.model.FavoriteService;
import com.ez.booktime.favorite.model.FavoriteVO;
import com.ez.booktime.freeBoard.model.FreeBoardService;
import com.ez.booktime.payment.model.PaymentDateVO;
import com.ez.booktime.payment.model.PaymentDetailVO;
import com.ez.booktime.payment.model.PaymentService;
import com.ez.booktime.payment.model.PaymentVO;
import com.ez.booktime.user.model.UserService;

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
	
	@Autowired
	private PaymentService paymentService;
	
	@Autowired
	private BookCategoryService cateService;
	
	@Autowired
	private FreeBoardService boardService;
	
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
				
				BookCategoryVO cateVo
					= cateService.selectCategoryInfoByName((String) info.get("cateName"));
				info.put("cateCode",cateVo.getCateCode());	//카테고리 번호
				
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
	
	@RequestMapping("/directPayment.do")
	public String directPayment(@ModelAttribute FavoriteVO vo
			, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		if(userid==null || userid.isEmpty()) {
			userid = "#"+session.getId();
		}
		vo.setUserid(userid);
		logger.info("디테일페이지에서 구매하기 처리 파라미터 vo={}");
		
		int cnt = favoriteservice.insertFavorite(vo);
		logger.info("주문서 페이지로 넘어가기전 장바구니에 넣기 결과 cnt={}",cnt);
		
		return "redirect:/payment/paymentSheet.do";
	}
	
	
	@RequestMapping("/paymentProcess.do")
	public String paymentProcess(@ModelAttribute PaymentVO vo
			, HttpSession session, Model model) {
		String userid = (String)session.getAttribute("userid");
		if(userid==null || userid.isEmpty()) {
			userid = "#"+session.getId();
		}
		vo.setUserid(userid);
		
		logger.info("주문처리 파라미터 vo={}",vo);
		
		int cnt = paymentService.insertPayment(vo);
		if(cnt<0) {
			model.addAttribute("msg", "주문이 비정상적으로 처리되었습니다.");
			model.addAttribute("url", "/favorite/cart.do");
			
			return "common/message";
		}else if(cnt>0) {
			
		}
		
		return "redirect:/payment/paymentResult.do?payNo="+vo.getPayNo()+"&nonMember="+vo.getNonMember();
	}
	
	@RequestMapping("/paymentResult.do")
	public String paymentResult(HttpSession session
			,@ModelAttribute PaymentVO vo
			, Model model) {
		String userid = (String)session.getAttribute("userid");
		if(userid==null || userid.isEmpty()) {
			userid = "#"+session.getId();
		}
		vo.setUserid(userid);
		logger.info("주문 결과 보여주기, 파라미터 vo={}",vo);
		
		if((vo.getPayNo()==null || vo.getPayNo().trim().isEmpty() 
				|| vo.getPayNo().equals("0"))
				&& (vo.getNonMember()==null || vo.getNonMember().trim().isEmpty()
				|| vo.getNonMember().equals("0"))) {
			model.addAttribute("msg", "잘못된 URL입니다.");
			model.addAttribute("url", "/index.do");
			
			return "common/message";
		}//아직 조회전
		
		vo = paymentService.selectPayment(vo);
		
		if(vo==null) {
			model.addAttribute("msg", "주문정보가 없습니다.");
			model.addAttribute("url", "/index.do");
			
			return "common/message";
		}
		
		List<PaymentDetailVO> detailList = vo.getDetails();
		List<Map<String, Object>> infoList = new ArrayList<Map<String,Object>>();
		for(PaymentDetailVO dVo : detailList) {
			try {
				Map<String, Object> map = aladinApi.selectBook(dVo.getIsbn());
				BookCategoryVO cateVo = cateService.selectCategoryInfoByName((String)map.get("cateName"));
				map.put("cateCode", cateVo.getCateCode());
				
				infoList.add(map);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		logger.info("주문완료 상품 상제정보 infoList.size={}",infoList.size());
		
		model.addAttribute("vo", vo);
		model.addAttribute("infoList", infoList);
		
		return "payment/paymentResult";
	}
	
	@RequestMapping("/paymentList.do")
	public String paymentList(HttpSession session
			,@ModelAttribute PaymentDateVO vo
			,Model model) {
		String userid = (String)session.getAttribute("userid");
		vo.setUserid(userid);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(vo.getEndDay()==null || vo.getEndDay().isEmpty()) {
			vo.setEndDay(sdf.format(new Date()));
		}
		
		logger.info("주문내역 조회, 파라미터 vo={}",vo);
		
		if((userid==null || userid.isEmpty()) 
				&& (vo.getPayNo()==null || vo.getPayNo().isEmpty())) {
			model.addAttribute("msg", "잘못된 URL입니다.");
			model.addAttribute("url", "/index.do");
			return "common/message";
		}
		
		
		//페이징
		final int blockSize = 5;
		final int recordCountPerPage = 3;
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(blockSize);
		pagingInfo.setCurrentPage(vo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(recordCountPerPage);
		
		vo.setRecordCountPerPage(recordCountPerPage);
		vo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		vo.setLastRecordIndex(pagingInfo.getLastRecordIndex());
		
		if(userid!=null && !userid.isEmpty()) {
			pagingInfo.setTotalRecord(paymentService.totalPaymentList(vo));
		}
		
		logger.info("주문내역 vo세팅후={}, pagingInfo={}",vo, pagingInfo);

		//실제 뿌려줄 결과
		List<PaymentVO> list = paymentService.selectPaymentList(vo);
		
		//디테일정보
		List<Map<String, Object>> detailMapList = new ArrayList<Map<String,Object>>();
		if(list!=null && !list.isEmpty()) {
			for(PaymentVO pVo:list) {
				List<PaymentDetailVO> dList = pVo.getDetails();
				
				for(PaymentDetailVO dVo : dList) {
					try {
						Map<String, Object> detailMap = aladinApi.selectBook(dVo.getIsbn());
						
						if(userid!=null && !userid.isEmpty()
								&& pVo.getProgress().equals("구매확정")) {
							Map<String, Object> map = new HashMap<String, Object>();
							map.put("userid", userid);
							map.put("isbn", dVo.getIsbn());
							
							int cnt = boardService.countReview(map);
							boolean reviewd = false;
							if(cnt>0) reviewd = true;
							
							detailMap.put("reviewed", reviewd);
						}	// 리뷰작성했는지 체크
						
						detailMapList.add(detailMap);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
		logger.info("주문내역 조회결과 list.size={}, detailMapList.size={}",list.size(),detailMapList.size());
		
		model.addAttribute("list", list);
		model.addAttribute("dList", detailMapList);
		model.addAttribute("dateInfo", vo);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "payment/paymentList";
	}
}
