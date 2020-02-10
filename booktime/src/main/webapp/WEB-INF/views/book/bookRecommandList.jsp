<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style type="text/css">
	.list-group {
	    display: -ms-flexbox;
	    display: flex;
	    -ms-flex-direction: column;
	    flex-direction: column;
	    padding-left: 0;
	    margin-bottom: 0;
	}
</style>

<!-- 썸네일 위젯 -->
<div class="widget thumb">
	<!-- 원하는 내용을 입력하세요. -->
	<p>
		<c:forEach var="map" items="${recommandList }" end="3">
			<a href='<c:url value="/book/bookDetail.do?ItemId=${map['isbn13'] }"/>'>
				<img src="${map['cover'] }" />
			</a> ${map['title'] }
		</c:forEach>
	<p>
</div>
<%-- <div class="side_recommand">
	<!-- 신간베스트 for -->
	<c:forEach var="map" items="${recommandList }" end="3">
		<table class="bookRecommandTable" width=25% border="2" >
			<tbody>
				<tr>
	    			<td style="padding:19px 9px 10px 9px;">
						<table width=90% border="0" align="center" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td class="bookBestContent" width="172" valign="top" style="text-align:center;">
   										<div style="position:relative; text-align:center; font-size:1em;">
   											<a href='<c:url value="/book/bookDetail.do?ItemId=${map['isbn13'] }"/>'>
   											<img src="${map['cover'] }"></a>
   										</div><br> 
   										<a href='<c:url value="/book/bookDetail.do?ItemId=${map['isbn13'] }"/>' 
   										class="bk66" style="color:#3399FF">${map['title'] }</a>
			        				</td>
			        				<td width="10">&nbsp;</td>
	       						</tr>
		 					</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
    </c:forEach>
</div> --%>