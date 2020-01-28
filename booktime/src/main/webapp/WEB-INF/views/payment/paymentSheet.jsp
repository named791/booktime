<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<style type="text/css">
	.deliveryInfo{
		border-top: 1px solid #dee2e6;
		padding: 5px 15px;
	}
	.header{
		background-color: #f8f9fa;
		text-align: center;
		padding: 10px;
		font-weight: bold;
	}
</style>
<script type="text/javascript">
	$(function(){
		setPaymentInfo();
	})
	
	function setPaymentInfo(){
		$("input[name=customerName]").val("${sessionScope.name}");
		$("input[name=hp]").val();
	}
</script>

<div class="container">
	<div class="page-header my-4 p-3"
		style="border: 2px solid lightGray;">
		<h3><i class="fa fa-pencil"></i> 주문서 작성</h3>
		<small>- 금액을 확인하시고 배송정보를 정확하게 기입해주세요.</small><br>
		<small>- 3만원이상은 배송비 무료입니다.</small>
	</div>
	
	<div class="table-responsive">
		<form name="frmPayment" method="post" class="form-inline"
					action='<c:url value="/payment/paymentSheet.do"/>'>
					
			<table class="table mb-0" title="즐겨찾기 목록">
				<thead>
					<tr>
						<th scope="col" class="border-0 bg-light">
							<div class="p-2 px-3">도서정보</div>
						</th>
						<th scope="col" class="border-0 bg-light text-center">
							<div class="py-2">가격</div>
						</th>
						<th scope="col" class="border-0 bg-light text-center">
							<div class="py-2">수량</div>
						</th>
						<th scope="col" class="border-0 bg-light text-center">
							<div class="py-2">합계</div>
						</th>
					</tr>
				</thead>
				
				<tbody>
					<c:if test="${empty list }">
						<tr><td colspan="4" class="text-center">장바구니에 등록된 상품이 없습니다.</td></tr>
					</c:if>
					<c:if test="${!empty list }">
						<!-- 반복 시작 -->
						<c:forEach var="i" begin="0" end="${fn:length(list)-1}">
						<tr>
							<th scope="row">
								<div class="p-2">
									<label for="ck1"  style="display: initial;"><!-- 번호매기기 -->
										<img
											src="${infoList[i]['cover'] }"
											alt="${list[i].bookName}" width="70" class="img-fluid rounded shadow-sm">
									</label>
									
									<div class="ml-3 d-inline-block align-middle">
										<h5 class="mb-0">
											<c:set var="bookName" value="${list[i].bookName }"/>
											<c:if test="${fn:length(bookName)>30 }">
												<c:set var="bookName" value="${fn:substring(bookName, 0, 30)}<br>${fn:substring(bookName, 30,fn:length(bookName))}"/>
											</c:if>
											
											<a href="<c:url value='/book/bookDetail.do?ItemId=${list[i].isbn }'/>" 
													class="text-dark d-inline-block align-middle"><b>${bookName }</b></a>
										</h5>
										<a href="#"><small class="text-muted font-italic d-block">카테고리 : 도서</small></a>
									</div>
									
								</div>
							</th>
							<td class="align-middle text-center">
								<strong><fmt:formatNumber value="${list[i].price }" pattern="#,###"/>원</strong>
							</td>
							<td class="align-middle text-center"><strong>${list[i].qty }</strong></td>
							<td class="align-middle text-center">
								<strong><fmt:formatNumber value="${list[i].price*list[i].qty }" pattern="#,###"/> 원</strong>
							</td>
						</tr>
						</c:forEach>
						<!-- 반복 끝 -->
					</c:if>
					
					<tr>
						<td colspan="3" class="text-right">
							<b>총 상품 금액 :<br>
							+ 배송비 :<br>
							<span class="text-danger">- 포인트 사용 : </span><br>
							<span style="font-size: 1.5em;">총 결제 금액 :</span>
							</b>
							
						</td>
						<td class="text-center">
							<b class="text-right d-inline-block">
								135,000원<br>
								0원<br>
								<span class="text-danger">
								<input type="number" min="0" value="0" class="form-control text-right pr-0 text-danger"
									style="width: 80px;height: 16px;" >원</span><br>
								<span style="font-size: 1.5em;">135,000원</span>
							</b>
						</td>
					</tr>
				</tbody>
			</table>
			<hr class="mt-0" style="border: 3px solid lightGray;width: 100%;">
			
			<c:if test="${!empty list}">
				<div class="container">
					<h3><i class="fa fa-truck"></i> 배송지 정보</h3>
					<div class="row">
						<div class="deliveryInfo header col-md-3">배송지 선택</div>
						<div class="deliveryInfo col-md-9 form-group">
							<label><input type="radio" name="ck" checked="checked"> 회원정보</label>&nbsp;
							<label><input type="radio" name="ck"> 새로운 주소</label>
						</div>
					</div>
					<div class="row">
						<div class="deliveryInfo header col-md-3">수령인</div>
						<div class="deliveryInfo col-md-9">
							<input type="text" name="customerName" class="form-control" >
						</div>
					</div>
					<div class="row">
						<div class="deliveryInfo header col-md-3">연락처</div>
						<div class="deliveryInfo col-md-9">
							<input type="text" name="hp" class="form-control">
						</div>
					</div>
					<div class="row">
						<div class="deliveryInfo header col-md-3">이메일 주소</div>
						<div class="deliveryInfo col-md-9 form-group">
							<input type="text" name="email1" class="form-control">&nbsp;@&nbsp;
							<input type="text" name="email2" class="form-control">
							&nbsp;
							<select name="email3" class="form-control">
								<option value="">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="daum.net">daum.net</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="deliveryInfo header col-md-3" style="line-height: 150px;">배송지</div>
						<div class="deliveryInfo col-md-9">
							<input type="text" name="zipcode" class="form-control mb-2" style="width: 30%;" placeholder="우편번호">
							<input type="button" id="btZip" value="우편번호 찾기" class="btn btn-primary mb-2">
							<input type="text" name="parselAddress" class="form-control mb-2" style="width: 100%;" placeholder="지번주소" readonly="readonly">
							<input type="text" name="newAddress" class="form-control mb-2" style="width: 100%;" placeholder="도로명주소" readonly="readonly">
							<input type="text" name="addressDetail" class="form-control" style="width: 100%;" placeholder="상세주소">
						</div>
					</div>
					<div class="row" style="border-bottom: 1px solid #dee2e6;">
						<div class="deliveryInfo header col-md-3">요청사항</div>
						<div class="deliveryInfo col-md-9">
							<input type="text" name="message" class="form-control" style="width: 100%;">
						</div>
					</div>
			
					<div class="text-center my-5">
						<a href="<c:url value="/favorite/cart.do"/>" class="btn btn-light" style="border: 1px solid lightGray;">장바구니로 가기</a>
						<input type="submit" value="결제하기" class="btn btn-primary">
					</div>
				</div>
			</c:if>
			<c:if test="${empty list }">
				<div class="text-center my-5" style="width: 100%">
					<a href="<c:url value="#"/>" class="btn btn-light" style="border: 1px solid lightGray;">책 둘러보기</a>
					<a href="<c:url value="/favorite/cart.do"/>" class="btn btn-primary">장바구니로 가기</a>
				</div>
			</c:if>
		</form>
	</div>
</div>

<%@include file="../inc/bottom.jsp"%>