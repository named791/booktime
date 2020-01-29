package com.ez.booktime.payment.model;

import java.util.List;

public interface PaymentService {
	int insertPayment(PaymentVO vo);
	PaymentVO selectPayment(PaymentVO vo);
	List<PaymentVO> selectPaymentList(PaymentDateVO vo);
}
