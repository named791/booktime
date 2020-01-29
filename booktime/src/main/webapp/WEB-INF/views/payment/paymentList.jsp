<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<%@include file="../mypage/includeMy.jsp" %>
<style type="text/css">
	.bookImg{
		min-width: 250px;
	    display: inline-block;
	    text-align: left;
	}
	table{
		border-top: 2px solid lightGray;
		border-bottom: 2px solid lightGray;
	}
	
	table tr:nth-of-type(odd) {
		background-color: #00000005;
	}
	.target{
		position: relative;
    	top: -70px;
	}
</style>
<script type="text/javascript">
	$(function(){
		var today = new Date();
		$("#endDay").val("${dateInfo.endDay}");
		$("#startDay").val("${dateInfo.startDay}");
		
		$("form[name=frmDate]").submit(function(){
			if(!ckDateFormat($("#startDay").val())){
				alert("조회시작날짜를 입력해주세요.")
				$("#startDay").focus();
				event.preventDefault();
			}else if(!ckDateFormat($("#endDay").val())){
				alert("조회마침날짜를 입력해주세요.")
				$("#endDay").focus();
				event.preventDefault();
			}
		});
	});
	
	function ckDateFormat(str){
		var datePattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
		return datePattern.test(str);
	}
</script>
<div class="container target
	<c:if test="${!empty sessionScope.userid }">col-lg-9</c:if>">
	<div class="page-header">
		<h2>주문내역 조회</h2>
		<small>최근 주문내역을 조회합니다.</small>
	</div>
	
	<c:if test="${!empty sessionScope.userid }">
		<form name="frmDate" method="post" class="my-1"
			action="<c:url value='/payment/paymentList.do'/>">
			<!-- 조회기간 include -->
			<%@include file="../mypage/Mileage/dateTerm.jsp"%>
	
			<input type="submit" value="조회">
		</form>
	</c:if>
	
	<table title="주문내역" class="table">
		<colgroup>
			<col width="10%">
			<col width="40%">
			<col width="10%">
			<col width="20%">
			<col width="20%">
		</colgroup>
		
		<tr>
			<th scope="col" class="text-center bg-light py-1">주문번호</th>
			<th scope="col" class="text-center bg-light py-1">도서정보</th>
			<th scope="col" class="text-center bg-light py-1">수량</th>
			<th scope="col" class="text-center bg-light py-1">결제금액</th>
			<th scope="col" class="text-center bg-light py-1">상태</th>
		</tr>
		
		<c:set var="idx" value="0"/>
		<c:forEach var="i" begin="0" end="${fn:length(list)-1}">
			<tr>
				<td class="text-center align-middle">
					<b>${list[i].payNo }</b><br>
					<small><fmt:formatDate value="${list[i].payDate}" 
						pattern="yyyy년 MM월 dd일"/></small>
				</td>
				
				<td class="text-center align-middle p-0">
					<c:forEach var="dVo" items="${list[i].details}">
						<c:set var="bookName" value="${dVo.bookName }"/>
						<c:if test="${fn:length(bookName)>15 }">
							<c:set var="bookName" value="${fn:substring(bookName, 0, 15) }..."/>
						</c:if>
						
						<div style="min-height: 80px;line-height: 4.8em;" class="align-middle">
							<a href="<c:url value="/book/bookDetail.do?ItemId=${dVo.isbn }"/>" class="bookImg">
								<img alt="${dVo.bookName }" src="${dList[idx]['cover']}" width="50px;">
								${bookName}
							</a>
							<c:set var="idx" value="${idx+1}"/>
						</div>
					</c:forEach>
					
					<c:set var="idx" value="${idx-(fn:length(list[i].details))}"/>
				</td>
				<td class="text-center">
					<c:forEach var="dVo" items="${list[i].details}">
						<div style="line-height: 80px;">${dVo.qty }</div>
					</c:forEach>
				</td>
				
				<td class="text-center align-middle">
					<fmt:formatNumber value="${list[i].price}" pattern="#,###"/>원
					
					<c:set var="savingPoint" value="0"/>
					<c:forEach var="dVo" items="${list[i].details}">
						<c:set var="savingPoint" value="${savingPoint+(dList[idx]['mileage']*dVo.qty) }"/>
												
						<c:set var="idx" value="${idx+1}"/>
					</c:forEach>
					
					<c:if test="${!empty sessionScope.userid && list[i].progress=='구매확정'}">
						<c:set var="idx" value="${idx-(fn:length(list[i].details))}"/>
					</c:if>
					
					<br><small class="text-danger">
						<fmt:formatNumber value="${savingPoint }" pattern="#,###"/>점 적립예정
					</small>
					<input type="hidden" name="savingPoint" value="${savingPoint}">
				</td>
				<td class="text-center align-middle">
					${list[i].progress }
					<br>
					<c:if test="${list[i].progress=='결제완료' }">
						<a href="#" class="btn btn-sm btn-info">환불/교환 신청</a>
					</c:if>
					<c:if test="${list[i].progress=='환불/교환 신청중' }">
					
					</c:if>
					<c:if test="${list[i].progress=='배송중' || list[i].progress=='배송완료'}">
						<a href="#" class="btn btn-sm btn-info">구매확정</a>
					</c:if>
					
					<c:if test="${!empty sessionScope.userid && list[i].progress=='구매확정'}">
						<c:forEach var="dVo" items="${list[i].details }">
							<a href="<c:url value="/book/bookDetail.do?ItemId=${dVo.isbn}&mode=review"/>" 
								class="btn btn-sm btn-info mb-4">
									<i class="fa fa-arrow-left">
									<c:if test="${dList[idx]['reviewed'] }">
										리뷰보러가기
									</c:if>
									<c:if test="${!dList[idx]['reviewed'] }">
										리뷰쓰러가기
									</c:if>
									</i></a>
							<c:set var="idx" value="${idx+1}"/>
						</c:forEach>
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
</div>
</div>
<%@include file="../inc/bottom.jsp"%>