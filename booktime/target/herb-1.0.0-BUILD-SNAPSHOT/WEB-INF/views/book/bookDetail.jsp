<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<style type="text/css">
	.pull-left{
		float: left;
	}
	.pull-right{
		float: right;
	}
	th{
		background-color: #EEE;
	}
	.cover{
		width: 100%;
	}
	.btn-group{
		width: 100%;
	}
	.btn-group input{
		width: 50%;
		height: 50px;
		font-weight: bold;
		color: white;
	}
</style>

<div class="container">
	<div class="row">
		<div class="col-md-5">
			<img class="cover" alt="cover"
				src='https://image.aladin.co.kr/product/21959/69/cover500/8967356897_1.jpg'>
		</div>
	
		<div class="col-md-7">
			<div class="bookInfo" style="height: 100%;position: relative;">
				<div style="height: 150px;">
					<div class="page-header">
					  <h1>책제목 <small>-부제목</small></h1>
					</div>
					<p>지은이 / 옮긴이 | 출판사 | 출판일 </p>
					<c:import url="/book/bookGrade.do"></c:import>
					<hr style="margin-bottom: 0;">
				</div>
				
				<form name="frmPayment" method="post" action=""
					style="height: 300px;">
					<div style="height: 90%;">
						<div class="pull-left">정가</div>
						<div>15,000원</div>
						<div class="pull-left">할인가</div>
						<div>13,000원</div>
						<div class="pull-left">적립 마일리지</div>
						<div>130원(10%)</div>
						<div class="pull-left">배송비</div>
						<div>무료</div>
						<div class="pull-left">수량</div>
						<input type="number" min="1" value="1" name="qty" id="qty">
					</div>
					
					<div class="btn-group" style="position: absolute;bottom: 0;">
						<input type="button" id="btFavorite"
							class="btn col" value="즐겨찾기 등록"
							style="border: 2px solid lightgray;width: 25%;color: #555;">
						<input type="submit" class="btn col" id="btCart" value="장바구니 담기"
							style="background-color: #17a2b8;width: 25%;">
						<input type="submit" class="btn col" id="btOrder" value="바로구매"
							style="background-color: #b81717">
					</div>
					
				</form>
			</div>
		</div>
	</div>
	<hr>
	
	<h3>도서정보</h3>
	<table title="도서정보" class="table table-bordered">
		<tr>
			<th>출간일</th>
			<td>2019년 12월 30일</td>
		</tr>
		<tr>
			<th>쪽수, 무게, 크기</th>
			<td>248쪽 | 416g | 145*210*20mm</td>
		</tr>
		<tr>
			<th>ISBN13</th>
			<td>9788901238753</td>
		</tr>
	</table>
	
	<h3>분류</h3>
	<p>100 - 도서</p>
	<hr>
	
	<h3>이벤트</h3>
	<div>
		<img alt="이벤트 이미지" class="pull-left"
			src="http://image.yes24.com/images/13_EventWorld/162028_01(1).jpg">
		<div>
			<b>2020년 나의 대박 운세는?</b><br>
			2020년 운세 확인하고 1천원 상품권 받자!<br>
			2020년 01월 01일 ~ 2020년 01월 31일
		</div>
		<hr style="clear: both;">
	</div>
	
	<h3>회원 리뷰(2건)</h3>
	우수리뷰를 작성해주시는 회원분들께 마일리지 1000원을 드립니다.
</div>

<%@include file="../inc/bottom.jsp" %>