<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<div class="container">
	<div class="page-header my-4 p-2"
		style="border: 2px solid lightGray;">
		<h3>장바구니</h3>
		<small>장바구니 상품은 30일간만 보관됩니다.</small>
	</div>
	
	<div class="table-responsive">
		<form name="frmCart" method="post"
					action='<c:url value=""/>'>
					
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
					</tr>
				</thead>
				
				<tbody>
					<!-- 반복 시작 -->
					<tr>
						<th scope="row">
							<div class="p-2">
								<label for="ck1"><!-- 번호매기기 -->
									<img
										src="https://res.cloudinary.com/mhmd/image/upload/v1556670479/product-1_zrifhn.jpg"
										alt="" width="70" class="img-fluid rounded shadow-sm">
								</label>
								
								<div class="ml-3 d-inline-block align-middle">
									<h5 class="mb-0">
										<a href="<c:url value='/book/bookDetail.do?isbn='/>" 
											class="text-dark d-inline-block align-middle"><b>상품명</b></a>
									</h5>
									<a href="#"><small class="text-muted font-italic d-block">카테고리 : 도서</small></a>
								</div>
								
							</div>
						</th>
						<td class="align-middle text-center"><strong>15.000 원</strong></td>
						<td class="align-middle text-center"><strong>3</strong></td>
						<td class="align-middle text-center"><strong>45.000 원</strong></td>
					</tr>
					<!-- 반복 끝 -->
					
					<!-- dummy 삭제하기 -->
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
				
				<tbody>
					<!-- 반복 시작 -->
					<tr>
						<th scope="row">
							<div class="p-2">
								<label for="ck1"><!-- 번호매기기 -->
									<img
										src="https://res.cloudinary.com/mhmd/image/upload/v1556670479/product-1_zrifhn.jpg"
										alt="" width="70" class="img-fluid rounded shadow-sm">
								</label>
								
								<div class="ml-3 d-inline-block align-middle">
									<h5 class="mb-0">
										<a href="<c:url value='/book/bookDetail.do?isbn='/>" 
											class="text-dark d-inline-block align-middle"><b>상품명</b></a>
									</h5>
									<a href="#"><small class="text-muted font-italic d-block">카테고리 : 도서</small></a>
								</div>
								
							</div>
						</th>
						<td class="align-middle text-center"><strong>15.000 원</strong></td>
						<td class="align-middle text-center"><strong>3</strong></td>
						<td class="align-middle text-center"><strong>45.000 원</strong></td>
					</tr>
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
				
				<tbody>
					<!-- 반복 시작 -->
					<tr>
						<th scope="row">
							<div class="p-2">
								<label for="ck1"><!-- 번호매기기 -->
									<img
										src="https://res.cloudinary.com/mhmd/image/upload/v1556670479/product-1_zrifhn.jpg"
										alt="" width="70" class="img-fluid rounded shadow-sm">
								</label>
								
								<div class="ml-3 d-inline-block align-middle">
									<h5 class="mb-0">
										<a href="<c:url value='/book/bookDetail.do?isbn='/>" 
											class="text-dark d-inline-block align-middle"><b>상품명</b></a>
									</h5>
									<a href="#"><small class="text-muted font-italic d-block">카테고리 : 도서</small></a>
								</div>
								
							</div>
						</th>
						<td class="align-middle text-center"><strong>15.000 원</strong></td>
						<td class="align-middle text-center"><strong>3</strong></td>
						<td class="align-middle text-center"><strong>45.000 원</strong></td>
					</tr>
					
				</tbody>
			</table>
			<hr>
			
			<div class="text-center mb-5">
					<input type="button" id="selAll" value="전체선택" class="btn btn-primary">
					<input type="button" id="selOff" value="선택 해제" class="btn btn-light" style="border: 1px solid lightGray;">
					<input type="submit" value="선택한 상품 삭제" class="btn btn-light" style="border: 1px solid lightGray;">
					<input type="button" id="cart" value="선택한 상품  구매하기" class="btn btn-primary">
			</div>
			
		</form>
	</div>
</div>

<%@include file="../inc/bottom.jsp"%>