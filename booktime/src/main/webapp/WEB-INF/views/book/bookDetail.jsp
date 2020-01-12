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
		box-shadow: 2px 2px 15px lightGray;
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
	.cmt{
		width: 45%;
		border: 3px solid lightGray;
		border-radius: 5px;
		margin: 0 5px;
		padding: 10px;
	}
	#info div.pull-left{
		width: 200px;
	}
	#btCart{
		background-color: #17a2b8;
	}
	#btCart:hover{
		background-color:#77ecff; 
		color: #17a2b8;
	}
	
	#btOrder{
		background-color: #b81717;	
	}
	#btOrder:hover{
		background-color:#ff5151;
		color: #b81717;
	}
	#dummy{
		width: 160px;
		max-width:160px;
		height: 160px;
		border: 2px solid lightGray;
		float: left;
		padding: 0;
	}
	
</style>
<script type="text/javascript">
	$(function(){
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
	
				reader.onload = function(e) {
					$('#image_section').attr('src', e.target.result);
				}
	
				reader.readAsDataURL(input.files[0]);
			}
		}
	
		$("#imgInput").change(function() {
			readURL(this);
			
			var lb = $(this).prev().find("label");
			if($(this).val()==null || $(this).val().length<1){
				lb.find("img").fadeOut(500,function(){
					lb.find("span").fadeIn();
				});
			}else{
				lb.find("span").fadeOut(500,function(){
					lb.find("img").fadeIn();
				});
			}
			
		});
		
	});
</script>

<br><br><br>
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
					<div style="height: 90%;" id="info">
						<div class="pull-left">정가</div>
						<div>15,000원</div><br>
						
						<div class="pull-left"><b>할인가</b></div>
						<div class="sellPrice" style="color: red;font-size: 1.3em;">13,500원 
							<small>(10% 할인)</small>
						</div><br>
						
						<div class="pull-left">적립 마일리지</div>
						<div>130원(10%)</div><br>
						
						<div class="pull-left">배송비</div>
						<div>무료</div><br>
						
						<div class="pull-left">수량</div>
						<input type="number" min="1" value="1" name="qty" id="qty" style="width: 50px;">
					</div>
					
					<div class="btn-group" style="position: absolute;bottom: 0;">
						<input type="button" id="btFavorite"
							class="btn col" value="즐겨찾기 등록"
							style="border: 2px solid lightgray;width: 25%;color: #555;">
						<input type="submit" class="btn col" id="btCart" value="장바구니 담기"
							style="width: 25%;">
						<input type="submit" class="btn col" id="btOrder" value="바로구매">
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
	<div class="card my-4">
		<h5 class="card-header">리뷰 남기기</h5>
		<div class="card-body">
			<form name="reviewFrm" action="" method="post" enctype="multipart/form-data">
				<div class="form-group row">
					<div class="col">
						<input type="text" name="title" class="form-control" placeholder="제목을 입력하세요">
					</div>
					<div class="col text-center" style="max-width: 225px;">
						<c:import url="/book/bookGradePicker.do"/>
					</div>
				</div>
				<div class="form-group">
					<div class="container">
						<div class="row">
		   					<div id="dummy" class="col text-center">
			   					<label for="imgInput" style="line-height: 150px;">
			   						<img id="image_section" alt="미리보기" style="width: 150px;height: 150px;display:none;"/>
			   						<span>이미지 업로드</span>
			   					</label>
		   					</div>
		   					<div class="col" style="padding-right: 0;">
								<textarea placeholder="내용을 입력하세요" style="width: 100%;height: 160px;" translate="no" class=" form-control"></textarea>
							</div>
						</div>
					</div>
					<input type='file' id="imgInput" name="upImage" value="" style="visibility: hidden;"/>
				</div>
				<input type="submit" value="등록" class="btn btn-primary">
			</form>
		</div>
	</div>
	
	<a href="#" class="btn">최신순</a> | <a href="#" class="btn">오래된순</a><br>
	<div class="container" >
		
		<!-- 반복 시작 -->
		<div class="row zone" style="margin-bottom: 10px;">
			<!-- row 1개당 2개씩 -->
			<div class="media col cmt">
				<img class="d-flex mr-3 " src="http://placehold.it/150x150" alt="">
				<div class="media-body">
					<h5 class="mt-0">리뷰 제목</h5>
					<small>작성자 : 이름</small><br>
					Cras sit amet nibh libero, in
					gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras
					purus odio, vestibulum in vulputate at, tempus viverra turpis.
					Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia
					congue felis in faucibus.
				</div>
			</div>

			<div class="media col cmt">
				<img class="d-flex mr-3 " src="http://placehold.it/150x150" alt="">
				<div class="media-body">
					<h5 class="mt-0">리뷰 제목</h5>
					<small>작성자 : 이름</small><br>
					Cras sit amet nibh libero, in
					gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras
					purus odio, vestibulum in vulputate at, tempus viverra turpis.
					Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia
					congue felis in faucibus.
				</div>
			</div>

		</div>
		<div class="row" style="margin-bottom: 10px;">
			<!-- row 1개당 2개씩 -->
			<div class="media col cmt">
				<img class="d-flex mr-3 " src="http://placehold.it/150x150" alt="">
				<div class="media-body">
					<h5 class="mt-0">리뷰 제목</h5>
					<small>작성자 : 이름</small><br>
					Cras sit amet nibh libero, in
					gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras
					purus odio, vestibulum in vulputate at, tempus viverra turpis.
					Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia
					congue felis in faucibus.
				</div>
			</div>

			<div class="media col cmt">
				<img class="d-flex mr-3 " src="http://placehold.it/150x150" alt="">
				<div class="media-body">
					<h5 class="mt-0">리뷰 제목</h5>
					<small>작성자 : 이름</small><br>
					Cras sit amet nibh libero, in
					gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras
					purus odio, vestibulum in vulputate at, tempus viverra turpis.
					Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia
					congue felis in faucibus.
				</div>
			</div>

		</div>
		<div class="row" style="margin-bottom: 10px;">
			<!-- row 1개당 2개씩 -->
			<div class="media col cmt">
				<img class="d-flex mr-3 " src="http://placehold.it/150x150" alt="">
				<div class="media-body">
					<h5 class="mt-0">리뷰 제목</h5>
					<small>작성자 : 이름</small><br>
					Cras sit amet nibh libero, in
					gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras
					purus odio, vestibulum in vulputate at, tempus viverra turpis.
					Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia
					congue felis in faucibus.
				</div>
			</div>


		</div>
		<!-- 반복 끝-->
	</div>
</div>

<%@include file="../inc/bottom.jsp" %>