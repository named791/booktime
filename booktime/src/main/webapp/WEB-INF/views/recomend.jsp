<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
    
<c:forEach var="list" items="${list2 }">

<div class="col-lg-3 col-sm-6 portfolio-item">
        <div class="card">
          <a href='<c:url value="/book/bookDetail.do?ItemId=${list.isbn}"/>'>
          <img class="card-img-top" src="${list.cover}" alt="bookcover"></a>
        	<div class="card-body">
	            <p class="card-title">
	              <a href='<c:url value="/book/bookDetail.do?ItemId=${list.isbn}"/>'>
	              ${list.bookName}
	              </a>
	            </p>
	           
	            <p class="card-text">
	           ${list.writer}
					지음 | ${list.publisher} <br>
					<fmt:formatNumber value="${list.price}" />
					원
	            </p>
	             
	         </div>
        </div>
      </div>

</c:forEach>