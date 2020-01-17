<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage/mypage.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage/mypageMain.css">
<meta charset="UTF-8">
<%@include file="../inc/top.jsp" %>   
<%@include file="includeMy.jsp" %>

	  <!-- 주문내역 (가장 최근 5개)-->
	  <div id="newOrder">
	    <p>최근 주문내역</p>
	    <img alt="쇼핑백 이미지" src="<c:url value='/resources/images/icons/shopBag.png'/>">
	    <button class="btn">추천 도서 보기 ></button>
	  </div>
	  
	  <!-- 위시리스트(가장 최근 5개) -->
	  <div id="mywish">
	    <p><img alt="하트 이미지" src="<c:url value='/resources/images/icons/heart.png'/>">MY WISH</p>
	     <img class="box" alt="박스 이미지" src="<c:url value='/resources/images/icons/box.png'/>">
	  </div>
	  
	  <!-- 나의 현재 등급/마일리지 -->
	  <div id="mygroup">
		  <div id="grade">
		  	<span><img alt="등급" src="<c:url value='/resources/images/icons/grade.png'/>"></span>
		  	<p>내 등급</p>
		  </div>
		  <div id="mileage">
		  	<span>100p</span>
		  	<p>마일리지</p>
		  </div>
	  </div>
	  
	  <!-- 오늘본 도서 목록 -->
	  <div id="today">
		<p>BEST SELLER</p>
		<label id="num">1</label><span class="cont"></span><br>
		<label id="num">2</label><span class="cont"></span><br>
		<label id="num">3</label><span class="cont"></span><br>
		<label id="num">4</label><span class="cont"></span><br>
		<label id="num">5</label><span class="cont"></span><br>
		<label id="num">6</label><span class="cont"></span><br>
		<label id="num">7</label><span class="cont"></span><br>
		<label id="num">8</label><span class="cont"></span><br>
		<label id="num">9</label><span class="cont"></span><br>
	  </div>
   </div>
<%@include file="../inc/bottom.jsp" %>