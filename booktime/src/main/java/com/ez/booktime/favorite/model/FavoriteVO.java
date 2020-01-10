package com.ez.booktime.favorite.model;

public class FavoriteVO {
	private int favoriteNo;
	private String userid;
	private String group;
	private String isbn;
	private String bookName;
	private String writer;
	private String publisher;
	private int price;
	
	public int getFavoriteNo() {
		return favoriteNo;
	}
	public void setFavoriteNo(int favoriteNo) {
		this.favoriteNo = favoriteNo;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getGroup() {
		return group;
	}
	public void setGroup(String group) {
		this.group = group;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	@Override
	public String toString() {
		return "FavoriteVO [favoriteNo=" + favoriteNo + ", userid=" + userid + ", group=" + group + ", isbn=" + isbn
				+ ", bookName=" + bookName + ", writer=" + writer + ", publisher=" + publisher + ", price=" + price
				+ "]";
	}
}
