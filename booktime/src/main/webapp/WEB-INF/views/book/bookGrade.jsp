<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
	img.star{
		width: 25px;
	}
	.bk-grade *{
		vertical-align: bottom;
	}
</style>

<div class="bk-grade text-right">
	<c:set var="grade" value="3"/>
	<c:forEach var="i" begin="1" end="${grade}">
		<img class="star" alt="star" src='<c:url value="/resources/images/icons/starFull.png"/>'>
	</c:forEach>
	<c:forEach var="i" begin="1" end="${5-grade}">
		<img class="star" alt="star" src='<c:url value="/resources/images/icons/starEmpty.png"/>'>
	</c:forEach>
	<b>3.0</b>
	<b>|</b> 회원리뷰(2건)
</div>