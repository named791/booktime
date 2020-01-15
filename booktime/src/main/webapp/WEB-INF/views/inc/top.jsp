<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>책 읽기 좋은 시간</title>

  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.css">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/resources/css/modern-business.css" rel="stylesheet">
	
	<!-- 웹폰트 : 나눔명조 -->
	<style>
	@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap');
	</style>

<body>

  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-info fixed-top">
    <div class="container">
      <a class="navbar-brand" href="${pageContext.request.contextPath}/index.do">
      	<img src="<c:url value='/resources/images/logo.png'/>">
      </a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
        
        <c:if test="${empty sessionScope.userid }">
          <li class="nav-item">
            <a class="nav-link" href="<c:url value='/login/login.do'/>">로그인</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<c:url value='/user/agreement.do'/>">회원가입</a>
          </li>
        </c:if>
        <!-- 로그인 되었을때 -->
        <c:if test="${!empty sessionScope.userid }">
        	<li class="nav-item">
            	<a class="nav-link" href="<c:url value='/login/logout.do'/>">로그아웃</a>
          	</li>
        </c:if>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/freeBoard/List.do">게시판</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMypage" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              	마이페이지
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMypage">
              <a class="dropdown-item" href="${pageContext.request.contextPath}/mypage/memberInfo.do">회원정보</a>
              <a class="dropdown-item" href="#">주문내역</a>
              <a class="dropdown-item" href="#">찜하기</a>
              <a class="dropdown-item" href="#">마일리지</a>
              <a class="dropdown-item" href="#">1:1문의</a>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">주문내역</a>
          <!-- </li>
          	 <a class="nav-link" href="#">장바구니</a>  -->
          </li>
        </ul>
      </div>
    </div>
  </nav>

  
  
   <!-- Bootstrap core JavaScript -->
  <script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
  <script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
  <!-- 아이콘용 Font Awesome -->
  <script src="https://kit.fontawesome.com/a73e110cf5.js" crossorigin="anonymous"></script>
  