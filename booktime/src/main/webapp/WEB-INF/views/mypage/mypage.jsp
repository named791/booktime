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
	    <span>최근 주문내역이 없습니다!</span>
	    <button class="btn">추천 도서 보기 ></button>
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
   </div>
<%@include file="../inc/bottom.jsp" %>