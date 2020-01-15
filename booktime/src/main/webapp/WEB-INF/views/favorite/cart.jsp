<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<script type="text/javascript">
	$(function(){
		$("input[type=button]").click(function(){
			var attr = $(this).attr("id");
			if(attr=="selAll"){
				$("input[type=checkbox]").prop("checked",true);
			}else if(attr=="selOff"){
				$("input[type=checkbox]").prop("checked",false);
			}else if(attr=="cart"){
				
			}
			
		});
		
		
	});
</script>
<div class="container">
	<div class="page-header my-4 p-3"
		style="border: 2px solid lightGray;">
		<h3><i class="fa fa-shopping-cart"></i> 장바구니</h3>
		<small>장바구니 상품은 30일간만 보관됩니다.</small>
	</div>
	
	<div class="table-responsive">
					
			<table class="table" title="즐겨찾기 목록">
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
						<th scope="col" class="border-0 bg-light text-center">
							<div class="py-2">삭제</div>
						</th>
					</tr>
				</thead>
				
				<tbody>
					<!-- 반복 시작 -->
					<c:forEach var="i" begin="0" end="${fn:length(list)-1}">
						<tr>
							<th scope="row">
								<div class="p-2">
									<input type="checkbox" id="ck${i}" name="favoriteNo" val="" class="align-middle mr-3">
									<label for="ck${i}"><!-- 번호매기기 -->
										<img
											src="${infoList[i]['cover']}"
											alt="" width="70" class="img-fluid rounded shadow-sm">
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
										<a href="categoryId=${infoList[i]['cateCode']}">
											<small class="text-muted font-italic d-block">
												카테고리 : ${infoList[i]['cateName']}
											</small>
										</a>
									</div>
									
								</div>
							</th>
							<td class="align-middle text-center">
								<strong>
									<fmt:formatNumber value="${list[i].price}"
										pattern="#,###"/>원
								</strong>
							</td>
							
							<td class="align-middle text-center">
								<form name="frmQty" method="post"
									action="<c:url value='/favorite/updateCart.do'/>">
									<input type="hidden" name="favoriteNo" value="${list[i].favoriteNo }">
									<div class="input-group">
										<input type="number" min="1" name="qty"
											value="${list[i].qty }" class="text-right" style="width: 50px;">
										&nbsp;<input type="submit" value="수정" class="btn btn-primary btn-sm">
									</div>
								</form>
							</td>
							
							<td class="align-middle text-center">
								<strong>
									<fmt:formatNumber value="${list[i].price*list[i].qty}"
										pattern="#,###"/>원
								</strong>
							</td>
							<td class="align-middle text-center">
								<a href="#" class="text-dark"><i class="fa fa-trash"></i></a>
							</td>
						</tr>
					</c:forEach>
					<!-- 반복 끝 -->
					
				</tbody>
			</table>
			<hr>
			
			<div class="text-center mb-5">
					<input type="button" id="selAll" value="전체선택" class="btn btn-primary">
					<input type="button" id="selOff" value="선택 해제" class="btn btn-light" style="border: 1px solid lightGray;">
					<input type="button" value="선택한 상품 삭제" class="btn btn-light" style="border: 1px solid lightGray;">
					<input type="button" id="cart" value="선택한 상품  구매하기" class="btn btn-primary">
			</div>
			
	</div>
</div>
<%@include file="../inc/bottom.jsp"%>