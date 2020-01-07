package com.ez.booktime.book.controller;

public class BookGradeVO {
	private int bookGradeNo;
	private String userid;
	private String isbn;
	private int bookGrade;
	
	public int getBookGradeNo() {
		return bookGradeNo;
	}
	public void setBookGradeNo(int bookGradeNo) {
		this.bookGradeNo = bookGradeNo;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public int getBookGrade() {
		return bookGrade;
	}
	public void setBookGrade(int bookGrade) {
		this.bookGrade = bookGrade;
	}
	
	@Override
	public String toString() {
		return "BookGradeVO [bookGradeNo=" + bookGradeNo + ", userid=" + userid + ", isbn=" + isbn + ", bookGrade="
				+ bookGrade + "]";
	}
}
