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
		
		$("input[type=radio]").click(function(){
			if($(this).val()=="1"){
				setPaymentInfo();
			}else if($(this).val()=="2"){
				$("input[name=customerName]").val("");
				$("input[name=hp]").val("");
				$("input[name=email1]").val("");
				$("input[name=email2]").val("");
				$("input[name=zipcode]").val("");
				$("input[name=parselAddress]").val("");
				$("input[name=newAddress]").val("");
				$("input[name=addressDetail]").val("");
				$("input[name=email2]").prop("readOnly", false);
				$("option").each(function(){
					if($(this).val()=="") $(this).prop("selected", true);
				});
			}
		});
		
		var hpWrong = false;
		$("input[name=hp]").keyup(function(){
			if(!hpPattern($(this).val())){
				$(".error").fadeIn(500);
				hpWrong = true;
			}else{
				$(".error").fadeOut(500);
				hpWrong = false;
			}
		});
		
		$("form[name=frmPayment]").submit(function(){
			if(!$("input[name=customerName]").val()){
				shake($("input[name=customerName]"));
				return false;
			}else if(!$("input[name=hp]").val() || hpWrong){
				shake($("input[name=hp]"));
				return false;
			}else if(!$("input[name=email1]").val()){
				shake($("input[name=email1]"));
				return false;
			}else if(!$("input[name=email2]").val()){
				shake($("input[name=email2]"));
				return false;
			}else if(!$("input[name=zipcode]").val()){
				shake($("#btZip"));
				return false;
			}else if(!$("input[name=addressDetail]").val()){
				shake($("input[name=addressDetail]"));
				return false;
			}
		});
		
		var val = $("input[name=price]").val();
		$("input[name=usePoint]").change(function(){
			var price = $("input[name=price]");
			var limit = ${userVo.mileage};
			
			if($(this).val()>limit){
				$(this).val($(this).val()-$(this).val());
			}
			
			price.val(val-$(this).val());
			$("#sum").html(formatNum(val-$(this).val())+"원");
		});
		
		$("select").change(function(){
			var sel = $("option:selected").val();
			if(sel.length<1){
				$("input[name=email2]").prop("readOnly", false);
			}else{
				$("input[name=email2]").prop("readOnly", true);
			}
			
			$("input[name=email2]").val(sel);
			
		});
	})
	
	function setPaymentInfo(){
		$("input[name=customerName]").val("${sessionScope.name}");
		$("input[name=hp]").val("${userVo.phone}");
		$("input[name=email1]").val("${userVo.email1}");
		
		var email2 = "${userVo.email2}";
		if(email2.length>0){
			$("option").each(function(){
				if($(this).val()==email2){
					$(this).prop("selected", true);
					$("input[name=email2]").val(email2).attr("readOnly", "readOnly");
				}
			});
		}
		
		$("input[name=zipcode]").val("${userVo.zipcode}");
		$("input[name=parselAddress]").val("${userVo.parseladdress}");
		$("input[name=newAddress]").val("${userVo.newaddress}");
		$("input[name=addressDetail]").val("${userVo.addressdetail}");
	}
	
	function hpPattern(hp){
		var exp = /^\d{2,3}-\d{3,4}-\d{4}$/;
		
		return exp.test(hp);
	}
	
	function shake(el){
		el.animate({
			"margin-left": "15px"
		}, 100,function(){
			el.animate({
				"margin-left": "0"
			})
		})
		el.focus();
	}
	
	function formatNum(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
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
					<c:set var="sum" value="0"/>
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
								<c:set var="sum" value="${sum+(list[i].price*list[i].qty) }"/>
							</td>
						</tr>
						</c:forEach>
						<!-- 반복 끝 -->
					</c:if>
					
					<tr>
						<td colspan="3" class="text-right">
							<b>총 상품 금액 :<br>
							+ 배송비 :<br>
							<span class="text-danger limit">- 포인트 사용(${userVo.mileage }점 사용가능) : </span><br>
							<span style="font-size: 1.5em;">총 결제 금액 :</span>
							</b>
							
						</td>
						<td class="text-center">
							<b class="text-right d-inline-block">
								<fmt:formatNumber value="${sum}" pattern="#,###"/>원<br>
								<c:if test="${sum>=30000 }">무료</c:if>
								<c:if test="${sum<30000 }">2,500원
									<c:set var="sum" value="${sum+2500}"/>
								</c:if>
								<br>
								<span class="text-danger">
								<input type="number" min="0" max="${userVo.mileage }"
									value="0" class="form-control text-right pr-0 text-danger"
									name="usePoint" style="width: 80px;height: 16px;" step="10">원</span><br>
								<span style="font-size: 1.5em;" id="sum">
									<fmt:formatNumber value="${sum}" pattern="#,###"/>원
								</span>
								<input type="hidden" value="${sum}" name="price">
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
							<label><input type="radio" name="ck" checked="checked" value="1">회원정보</label>&nbsp;
							<label><input type="radio" name="ck" value="2">새로운 주소</label>
						</div>
					</div>
					<div class="row">
						<div class="deliveryInfo header col-md-3">수령인</div>
						<div class="deliveryInfo col-md-9">
							<input type="text" name="customerName" class="form-control" placeholder="수령인 이름">
						</div>
					</div>
					<div class="row">
						<div class="deliveryInfo header col-md-3">연락처</div>
						<div class="deliveryInfo col-md-9">
							<input type="text" name="hp" class="form-control" placeholder="'-'을 포함한 연락처">
							<span class="error text-danger" style="display: none;">'-'를 포함하여 올바른 연락처를 입력해주세요!</span>
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
							<input type="text" name="message" class="form-control" style="width: 100%;"
								placeholder="예)부재시 경비실에 맡겨주세요.">
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