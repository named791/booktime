package com.ez.booktime.payment.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ez.booktime.mileage.model.MileageService;
import com.ez.booktime.mileage.model.MileageVO;

@Service
public class PaymentServiceImpl implements PaymentService{
	@Autowired
	private PaymentDAO paymentDao;

	@Autowired
	private MileageService mileageService;
	
	@Override
	@Transactional
	public int insertPayment(PaymentVO vo) {
		int cnt = 0;
		
		try {
			cnt = paymentDao.insertPayment(vo);	//주문테이블
			
			if(cnt>0) {
				MileageVO mVo = new MileageVO();
				mVo.setPayNo(vo.getPayNo());
				mVo.setUsePoint(vo.getUsePoint());	//사용 포인트
				mVo.setUserid(vo.getUserid());
				
				cnt = mileageService.insertMileage(mVo);	//마일리지 테이블
				
				if(cnt>0) {
					List<PaymentDetailVO> list = vo.getDetails();
					
					int count = 0;
					for(PaymentDetailVO dVo : list) {
						Map<String, Object> map = new HashMap<String, Object>();
						
						map.put("payNo", vo.getPayNo());
						map.put("isbn", dVo.getIsbn());
						map.put("bookName", dVo.getBookName());
						map.put("price", dVo.getPrice());
						map.put("qty", dVo.getQty());
						
						cnt = paymentDao.insertPaymentDetail(map);	//주문 상세정보 테이블
						if(cnt>0) count++;
					}
					
					if(count==list.size()) cnt=1;
				}
			}
		}catch (RuntimeException e) {
			e.printStackTrace();
			cnt = -1;
		}
		
		
		return cnt;
	}

	@Override
	public PaymentVO selectPayment(PaymentVO vo) {
		PaymentVO pVo = paymentDao.selectPaymentByPayNo(vo);
		
		List<PaymentDetailVO> list
			= paymentDao.selectPaymentDetail(vo.getPayNo());
		
		pVo.setDetails(list);
		
		return pVo;
	}
	
}
