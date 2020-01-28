package com.ez.booktime.mileage.model;

import java.sql.Timestamp;

public class MileageVO {
	private int mileageNo;
	private String userid;
	private Timestamp savingDate;
	private int savingPoint;
	private int payNo;
	private int usePoint;
	private Timestamp endDate;
	
	public int getMileageNo() {
		return mileageNo;
	}
	public void setMileageNo(int mileageNo) {
		this.mileageNo = mileageNo;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Timestamp getSavingDate() {
		return savingDate;
	}
	public void setSavingDate(Timestamp savingDate) {
		this.savingDate = savingDate;
	}
	public int getSavingPoint() {
		return savingPoint;
	}
	public void setSavingPoint(int savingPoint) {
		this.savingPoint = savingPoint;
	}
	public int getPayNo() {
		return payNo;
	}
	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}
	public int getUsePoint() {
		return usePoint;
	}
	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
	}
	public Timestamp getEndDate() {
		return endDate;
	}
	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}
	
	@Override
	public String toString() {
		return "MileageVO [mileageNo=" + mileageNo + ", userid=" + userid + ", savingDate=" + savingDate
				+ ", savingPoint=" + savingPoint + ", payNo=" + payNo + ", usePoint=" + usePoint + ", endDate="
				+ endDate + "]";
	}
		
}
