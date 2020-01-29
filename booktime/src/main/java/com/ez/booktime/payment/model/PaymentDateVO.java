package com.ez.booktime.payment.model;

public class PaymentDateVO extends PaymentVO{
	private String startDay;
	private String endDay;
	
	public String getStartDay() {
		return startDay;
	}
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}
	public String getEndDay() {
		return endDay;
	}
	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}
	
	@Override
	public String toString() {
		return "PaymentDateVO [startDay=" + startDay + ", endDay=" + endDay + ", toString()=" + super.toString() + "]";
	}
	
}
