<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>

<div class="container">
	<div class="page-header">
	  <h1>책제목 <small>-부제목</small></h1>
	</div>
	<p>지은이 / 옮긴이 | 출판사 | 출판일 </p>
	<c:import url="/book/bookGrade.do"></c:import>
	<hr>
</div>

<%@include file="../inc/bottom.jsp" %>