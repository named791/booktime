package com.ez.booktime.payment.model;

public interface PaymentService {
	int insertPayment(PaymentVO vo);
	PaymentVO selectPayment(PaymentVO vo);
}
