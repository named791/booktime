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

<div class="bk-grade">
	<c:forEach var="i" begin="1" end="5">
		<img class="star" alt="star" src='<c:url value="/resources/images/icons/starEmpty.png"/>'>
	</c:forEach>
	<b id="grade">3.0</b>
	| 회원리뷰(2건)
</div>