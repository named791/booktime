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
	#cover{
		display: none;
	    background-color: rgba(100, 100, 100, 0.3);
	    width: 100%;
	    height: 100%;
	    position: fixed;
	    z-index: 10;
	}
	#FavoriteOk{
		width: 400px;
	    margin: 0 auto;
	    top: 25%;
	}
	#cover .card-header, #cover a{
		color: white;
		font-weight: bold;
	}
	#cover .details{
		transition-duration: 1s;
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
		
		$("input[type=button]").click(function(){
			var id = $(this).attr("id");
			
			if(id=="btFavorite" || id=="btCart"){
				if(id=="btFavorite"){
					$("input[name=group]").val("FAVORTITE");
				}else if(id=="btCart"){
					$("input[name=group]").val("CART");
				}
				
				$.ajax({
					url:"<c:url value='/favorite/addFavorite.do'/>",
					type:"post",
					data:$("form[name=frmPayment]").serialize(),
					dataType:"json",
					success:function(res){
						if(res>0){
							$(".details").css("filter", "blur(10px)");
							$("#cover").fadeIn();
							
							var group = $("input[name=group]").val();
							if(group=="FAVORTITE"){
								$(".addResult").text("즐겨찾기");
							}else if(group=="CART"){
								$(".addResult").text("장바구니");
								$(".btn-goFavorite").attr("href"
										, "<c:url value='/favorite/cart.do'/>");
							}
						}
					},
					error:function(xhr, status, error){
						alert("ERROR : "+status+", "+error);
					}
				});		
				
			}
		});
		
		$("#hide").click(function(){
			$("#cover").fadeOut();
			$(".details").css("filter", "blur(0px)");
		});

	});
</script>

<div id="cover">
	<div id="FavoriteOk" class="card border-primary" >
		<div class="card-header bg-primary text-center"><b><span class="addResult"></span>를 추가했습니다</b></div>
		<div class="card-body text-center">
			<a href="<c:url value="/favorite/favorite.do"/>" 
				class="btn btn-info btn-goFavorite"><span class="addResult"></span> 확인</a>
			<a href="#" id="hide"
				class="btn btn-info">더 둘러보기</a>
		</div>
	</div>
</div>

<br><br><br>
<div class="container details" >
	<div class="row">
		<div class="col-md-5">
			<img class="cover" alt="cover"
				src='${map["cover"]}'>
		</div>
	
		<div class="col-md-7">
			<div class="bookInfo" style="height: 100%;position: relative;">
				<div style="height: 45%;">
					<div class="page-header">
					  <h2>${fn:substring(map['title'], 0, fn:indexOf(map['title'], '-')) }
					  	<c:if test="${!empty map['subTitle'] }">
						  	<small>- ${map['subTitle'] }</small>
					  	</c:if>
					  </h2>
					</div>
					
					<c:set var="pubDate" value="${fn:split(map['pubDate'],'-') }"/>
					<p>
						<c:set var="author" value="${fn:split(map['author'],',') }"/>
						<c:forEach var="i" begin="0" end="${fn:length(author)}">
							
							<c:set value="${fn:trim(fn:substring(author[i], 0, fn:indexOf(author[i], '('))) }"
								var="authorKeyword"/>
							<a href="<c:url
								value="&QueryType=Author&searchKeyword=${authorKeyword }"/>">
								${author[i]}
							</a>
								
							<c:if test="${i<fn:length(author)-1 }">,</c:if>
						</c:forEach>
						<br>
						
						<c:set value="${fn:trim(fn:substring(map['publisher'], 0, fn:indexOf(map['publisher'], '('))) }"
							var="publisherKeyword"/>
						<a href="<c:url
								value="&QueryType=Publisher&searchKeyword=${publisherKeyword }"/>">
							${map['publisher'] }
						</a>
						<br>
						
						${pubDate[0]}년 ${pubDate[1]}월 ${pubDate[2]}일
					</p>
					
					<c:import url="/book/bookGrade.do"></c:import>
					<hr style="margin-bottom: 0;">
				</div>
				
				<form name="frmPayment" method="post" action="/favorrite/order.do"
					style="height: 300px;">
					<input type="hidden" name="bookName" value="${map['title'] }">
					<input type="hidden" name="isbn" value="${map['isbn13'] }">
					<input type="hidden" name="writer" value="${map['author'] }">
					<input type="hidden" name="publisher" value="${map['publisher'] }">
					<input type="hidden" name="price"  value="${map['priceSales'] }">
					<input type="hidden" name="group"  value="CART">
					
					<div style="height: 90%;" id="info">
						<div class="pull-left">정가</div>
						<div>
							<fmt:formatNumber value="${map['priceStandard'] }" 
								pattern="#,###"/>원
						</div><br>
						
						<div class="pull-left"><b>할인가</b></div>
						<div class="sellPrice" style="color: red;font-size: 1.3em;">
							<fmt:formatNumber value="${map['priceSales'] }" 
								pattern="#,###"/>원
							<small>
								(${(map['priceStandard']-map['priceSales'])/map['priceStandard']*100 }% 할인)
							</small>
						</div><br>
						
						<div class="pull-left">적립 마일리지</div>
						<div>${map['mileage'] }원</div><br>
						
						<div class="pull-left">배송비</div>
						<c:if test="${map['priceSales']<30000 }">
							<div>2,500원</div><br>
						</c:if>
						<c:if test="${map['priceSales']>=30000 }">
							<div class="text-danger">무료</div><br>
						</c:if>
						
						<div class="pull-left">수량</div>
						<input type="number" min="1" value="1" name="qty" id="qty" style="width: 50px;">
					</div>
					
					<div class="btn-group" style="position: absolute;bottom: 0;">
						<c:if test="${!empty sessionScope.userid }"> <!-- 로그인 되어 있을때 -->
							<input type="button" id="btFavorite"
								class="btn col" value="즐겨찾기 등록"
								style="border: 2px solid lightgray;width: 25%;color: #555;">
						</c:if>
						
						<c:if test="${empty map['stockstatus'] }"> <!-- 재고가 있으면 -->
							<input type="button" class="btn col" id="btCart" value="장바구니 담기"
								style="width: 25%;">
							<input type="submit" class="btn col" id="btOrder" value="바로구매">
						</c:if>
						<c:if test="${!empty map['stockstatus'] }"> <!-- 재고가 없으면 -->
							<input type="submit" class="btn col" id="btOrder" value="지금은 구매할 수 없습니다."
								style="width: 50%;" disabled="disabled">
						</c:if>
					</div>
					
				</form>
			</div>
		</div>
	</div>
	<hr>
	
	<h3>책소개</h3>
	<p class="container">${map['description'] }</p>
	<hr>
	
	<h3>도서정보</h3>
	<table title="도서정보" class="table table-bordered">
		<c:if test="${!empty map['originalTitle'] }">
			<tr>
				<th>원제</th>
				<td>${map['originalTitle'] }</td>
			</tr>
		</c:if>
		
		<tr>
			<th>출간일</th>
			<td>${pubDate[0]}년 ${pubDate[1]}월 ${pubDate[2]}일</td>
		</tr>
		<tr>
			<th>판형, 쪽수, 무게, 크기</th>
			<td>${map['styleDesc'] } | ${map['itemPage'] }쪽 | ${map['weight'] }g 
				| ${map['sizeWidth'] }*${map['sizeHeight'] }*${map['sizeDepth'] }mm</td>
		</tr>
		<tr>
			<th>ISBN13</th>
			<td>${map['isbn13'] }</td>
		</tr>
	</table>
	
	<h3>분류</h3>
	<a href="<c:url value='/book/bookListByCate.do?categoryId=${map["cateCode"]}'/>">
		${map['cateCode'] } - ${map['cateName'] }
	</a>
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
	
	<h3 id="review">회원 리뷰(2건)</h3>
	우수리뷰를 작성해주시는 회원분들께 마일리지 1000원을 드립니다.
	
	<c:if test="${false }">	<!-- 구입내역 없으면  -->
		<div class="card my-4">
		<h5 class="card-header">구매자 리뷰</h5>
		<div class="card-body text-center">구매기록이 없으면 작성할 수 없습니다.</div>
		</div>
	</c:if>
	
	<c:if test="${true}">	<!-- 구입내역 있고, 리뷰를 처음 작성할 때  -->
		<div class="card my-4">
			<h5 class="card-header">구매자 리뷰</h5>
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
						<input type='file' id="imgInput" name="upImage" style="visibility: hidden;"
							accept="image/*"/>
					</div>
					<input type="submit" value="등록" class="btn btn-primary">
				</form>
			</div>
		</div>
	</c:if>
	
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