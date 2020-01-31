package com.ez.booktime.payment.model;

import java.util.List;

import com.ez.booktime.mileage.model.MileageVO;

public interface PaymentService {
	int insertPayment(PaymentVO vo);
	PaymentVO selectPayment(PaymentVO vo);
	List<PaymentVO> selectPaymentList(PaymentDateVO vo);
	int totalPaymentList(PaymentDateVO vo);
	int updateProgress(PaymentVO vo, MileageVO mVo);
}
