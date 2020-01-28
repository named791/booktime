<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<style type="text/css">
.top_div {
    margin-bottom: 75px;
}
table.box2 {
    margin: 0 auto;
    width: 94%;
    font-size: 12px;
}
hr.top_hr {
    margin-bottom: 4px;
    background: #929292;
}
hr.bottom_hr {
    margin-top: 4px;
    background: #929292;
}
table.box2 {
    margin: 0 auto;
    width: 94%;
    text-align: center;
}

.ss_book_box {
    margin-bottom: 10px;
    padding-bottom: 10px;
}
ul.book {
    list-style: none;
}
.button_search_cart_new {
    display: inline-block;
  /*   *zoom: 1;
    *display: inline; */
    padding: 0;
    vertical-align: middle;
    border: 1px solid;
    border-color: #c82370;
    text-align: center;
    overflow: hidden;
    text-decoration: none!important;
    cursor: pointer;
    /* -webkit-border-radius: 3px;
    -moz-border-radius: 3px; */
    border-radius: 3px;
    background: #df307f;
    margin-bottom: 5px;
    height: 32px;
    width: 60px;
    padding-top: 6px;
}
.button_search_buyitnow_new {
    display: inline-block;
    *zoom: 1;
    *display: inline;
    padding: 0;
    vertical-align: middle;
    border: 1px solid;
    border-color: #cd394d;
    text-align: center;
    overflow: hidden;
    text-decoration: none!important;
    cursor: pointer;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
    background: #e24457;
    margin-bottom: 5px;
    height: 32px;
    width: 60px;
    padding-top: 6px;
}
.button_search_storage {
    display: inline-block;
    *zoom: 1;
    *display: inline;
    padding: 0;
    vertical-align: middle;
    border: 1px solid;
    border-color: #7ab4da;
    text-align: center;
    overflow: hidden;
    text-decoration: none!important;
    cursor: pointer;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
    background: #FFF;
 	height: 32px;
    width: 60px;
    padding-top: 6px;
}
.br2010_subt{
	font-size: 17px;
    padding-right: 525px;
}
.ss_line4{
	margin-bottom: 10px;
}
.ss_book_table{
	margin-bottom: 20px;
}
img.img_all {
    resize: both;
    max-width: 54.5px;
    position: relative;
    top: -4px;
}
input#txtBrowse-Search-Category {
    padding: -40px -4px;
    height: 25px;
    width: 174px;
    margin-bottom: 15px;
    margin-right: 9px;
}
img#btnBrowse-Search-Category {
    position: relative;
    top: -9px;
}
img.image_circle {
    position: relative;
    top: -2px;
}

.bookBestSection {
    margin-left: 6px;
}
.bookBestTable {
    float: left;
}
.divPage {
    margin-bottom: 10px;
    text-align: center;
}
.search_t_g{
	margin-top: 10px;
}
a.bk66 {
    font-size: 13.2px;
}
span.author {
    font-size: 13px;
}
td.bookBestContent {
    font-size: 13px;
}
.br2010_p2 {
	font-size:13px;
}
.book .bo3{
	font-size:16px;
}
.book li{
	font-size:13px;
}
a{
	color:black;
} 
.button_search_cart_new{
	text-decoration:none;
}

</style>

<script type="text/javascript">
	$(function(){
		$("#btDelMulti").click(function(){
			if($("tbody input[type=checkbox]:checked").length>0){			
				$('form[name=frmList]').prop("action",
						"<c:url value='/admin/product/deleteMulti.do'/>");	
				$('form[name=frmList]').submit();	
				
			}else{
				alert("삭제할 상품들을 체크하세요");
			}
		});
		
		$("thead input[type=checkbox]").click(function(){
			$("tbody input[type=checkbox]")
				.prop("checked", this.checked);
		});
		
		$("#btnBrowse-Search-Category").click(function(){
			location.href=
				"<c:url value='/book/bookList/searchBook.do?cateNo=${param.cateNo}&searchKeyword="+$("#txtBrowse-Search-Category").val()+"'/>";
		});
		
		$(".img_all").click(function(){
			if($("#checkbox .checkbox").is(":checked") == false){
				$("#checkbox .checkbox").prop("checked", true);
			}else if($("#checkbox .checkbox").is(":checked") == true){
				$("#checkbox .checkbox").prop("checked", false);
			}
		});
		
		$(".btCart").click(function(obj){
			var isbn=$(this).attr("data-isbn");
			console.log($(this).attr("data-isbn"));
			
			$.ajax({
				url:"<c:url value='/book/bookInfo.do'/>",
				type:"post",
				data:$(this).attr("data-isbn").serialize(),
				dataType:"json",
				success:function(res){
					if(res>0){
						$(".details").css("filter", "blur(10px)");
						$("#cover").fadeIn();
						
						var group = $("input[name=group]").val();
						if(group=="FAVORITE"){
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
		}); 
		
		$("input[type=image]").click(function(){
			var id = $(this).attr("id");
			
			if(id=="btFavorite" || id=="btCart"){
				if(id=="btFavorite"){
					$("input[name=group]").val("FAVORITE");
				}else if(id=="btCart"){
					$("input[name=group]").val("CART");
				}
				
				$.ajax({
					url:"<c:url value='/favorite/addFavorite.do'/>",
					type:"post",
					data:$("form[name=frmData]").serialize(),
					dataType:"json",
					success:function(res){
						if(res>0){
							$(".details").css("filter", "blur(10px)");
							$("#cover").fadeIn();
							
							var group = $("input[name=group]").val();
							if(group=="FAVORITE"){
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
		
	});
	
	function pageFunc(curPage){		
		$("input[name=start]").val(curPage);
		$("form[name=frmPage]").submit();
	}
	
</script>	

<!-- 페이징 처리 관련 form -->
<form action="<c:url value='/book/bookList.do'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="cateNo"
		value="${param.cateNo}">
	<input type="hidden" name="searchKeyword" 
		value="${param.searchKeyword }">
		
	<!-- 한 페이지당 게시글 수  -->
	<input type= "text" name="MaxResults" value="20">
	<!-- 한 블럭당 페이지 수 -->
	<input type="text" name="blockSize" value="10">
	<!-- 전체 개수 -->
	<input type="text" name="totalResults" value="${pagingInfo.totalRecord }">
	<input type="text" name="start" value="${pagingInfo.currentPage }">
</form>

<!-- Page Content -->
<div class="container" id="container_div">

	<!-- Content Row -->
	<div class="row">

		<!-- side Bar -->	
		<c:import url="/inc/categoryBar.do"></c:import>	
	      	
    	<!-- Content Column -->
    	<div class="col-lg-10 mt-3">
	    	<div class="top_div">
				<table align="right" cellpadding="0" >
				    <tbody>
				    	<tr>
					        <td>
					        	<h1 class="br2010_subt">
					        		<img class="image_circle" 
					        			src="<c:url value='/resources/images/blet_rec2.gif'/>" 
					        			width="17" height="15">
					        		이 분야 신간 베스트</h1>
					        </td>
        					<td>
        						<input id="txtBrowse-Search-Category" 
        							type="text" name="searchKeyword"
        							class="br2010_fbox watermark"
        							placeholder="분야 내 검색"
        							value=${param.searchKeyword }>
        					</td>
        					<td>
        						<input type="submit">
        						<img id="btnBrowse-Search-Category" 
        						src="//image.aladin.co.kr/img/browse/2010/bu_search.gif"
        						class="searchBt"
        						alt="검색" style="cursor: pointer;">
        					</td>
    					</tr>
					</tbody>
				</table>
				
				<!-- 신간베스트 -->
				<div class="bookBestSection">
					<c:import url="/book/bookBestList.do?cateNo=${param.cateNo }"></c:import>	
				</div>
			<!-- 테이블 -->
				<div class="ss_line5" style="padding-top: 10px;">
					<table width="100%">
						<tbody>
							<tr>
								<td height="19">
									<div class="search_t_g" style="float: left;">
										이 분야에 <strong style="color: red;">
										${pagingInfo.totalRecord }
										</strong>개의 상품이 있습니다.
									</div> 
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- 조건 조회 => api에서 지원하지 않아 조회 불가 -->
				<!-- <div class="divList">
					<hr class="top_hr">
					<table class="box2">
						<thead>
							<tr>
								<th class="col_th"><a href="#">상품명순</a></th>
								<th class="col_th">판매량순</th>
								<th class="col_th">평점순</th>
								<th class="col_th">리뷰순</th>
								<th class="col_th">출간일순</th>
								<th class="col_th">등록일순</th>
								<th class="col_th">저가격순</th>
								<th class="col_th">고가격순</th>
							</tr>
						</thead>
					</table>
					<hr class="bottom_hr">
				</div> -->
				<div class="divPage">
					
					<!-- 이전블럭으로 이동 -->
					<c:if test="${pagingInfo.firstPage>1 }">	
						<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">
							<img src="<c:url value='/resources/images/first.JPG'/>" alt="이전 블럭으로">
						</a>
					</c:if>
					<!-- 페이지 번호 추가 -->						
					<!-- [1][2][3][4][5][6][7][8][9][10] -->
					
					<c:forEach var="i" begin="${pagingInfo.firstPage }" 
						end="${pagingInfo.lastPage }">		
						<c:if test="${i==pagingInfo.currentPage }">
							<span style="color:blue;font-weight: bold">${i}</span>
						</c:if>
						<c:if test="${i!=pagingInfo.currentPage }">
							<a href="#" onclick="pageFunc(${i})">
								[${i}]</a>
						</c:if>
					</c:forEach>
					<!--  페이지 번호 끝 -->
					
					<!-- 다음블럭으로 이동 -->
					<c:if test="${pagingInfo.lastPage<pagingInfo.totalRecord  }">
						<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">	
							<img src="<c:url value='/resources/images/last.JPG'/>" alt="다음 블럭으로">
						</a>
					</c:if>	
				</div>
				<div class="ss_line4">
					<div style="height: 21px; float: right;">
						<table>
							<tbody>
								<tr>
									<td style="padding: 0px 0px 0px 5px;">
										<img class="img_all" src="<c:url value='/resources/images/button/btn_all.jpg'/>"
										alt="체크박스 전체 선택"
										style="cursor: pointer;"></td>
	
									<td style="padding: 0px 0px 0px 5px;"><input id="btCart"
										type="image" alt="체크한 도서를 모두 장바구니에 담습니다."
										src="//image.aladin.co.kr/img/search/btn_basket_2.jpg"
										border="0" name="Submit.AddBookAll"></td>
	
									<td style="padding: 0px 0px 0px 5px;"><input type="image" 
										name="submit.AddMyListAll" id="btFavorite"
										alt="체크한 상품을 즐겨찾기에 등록합니다."
										src="//image.aladin.co.kr/img/search/btn_mylist_s.jpg"
										border="0"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<br style="clear: both;">
				</div>
	
				<!-- 책종류 테이블 -->
				<form name="frmData" >
				<div class="ss_book_box">
					<table width="100%" class="ss_book_table">
						<tbody>
						<c:forEach var="map" items="${list }">
								<tr class="tb_row">
									<td><input name="chkCart.K692636032" type="checkbox" class="checkbox"></td>
									<td>
										<a href='<c:url value="/book/bookDetail.do?ItemId=${map['isbn13'] }"/>' id="book_a">
											<img src="${map['cover'] }" width="150" border="0" class="i_cover">
										</a>
									</td>
									<td>
										<div class="ss_book_list">
											<ul class="book">
												<li><a href=
													'<c:url value="/book/bookDetail.do?ItemId=${map['isbn13'] }"/>' 
													class="bo3" style="color:#3399FF">
														<b>${map['title'] }</b>
													</a>&nbsp;</li>
												<li><a href=
													"<c:url value='/book/bookList/authorBook.do?cateNo=${param.cateNo}&
													author=${fn:substring(map["author"], 0, fn:indexOf(map["author"], "("))}'/>">
														${map['author'] }</a> 
														| 
														<a href=
														"<c:url value='/book/bookList/publBook.do?cateNo=${param.cateNo}&
														publisher=${map["publisher"] }'/>">
														${map['publisher'] }</a>
														| ${map['pubDate'] }</li>
												<li><span class="">${map['priceStandard'] }</span>원 → <span
														class="ss_p2"><b>
														<span style="color:red; font-size:17px">
														${map['priceSales'] }
														</span>원</b></span>
													(<span class="ss_p">10%</span>할인), 마일리지 <span
														class="ss_p">
														<fmt:formatNumber value="${map['priceStandard']/100*5}"/>
														</span>원 
														(<span class="ss_p" style="color:red">5</span>
													% 적립)</li>
											</ul>
										</div>
										<div class="ss_book_list">
											<ul class="book">
												<li>지금 <strong>택배</strong>로 주문하면 <strong>내일</strong>
													수령
													<div>
														최근 1주 88.0% (중구 중림동) <img
															src="//image.aladin.co.kr/img/shop/2012/bu_driveaway_ch.gif"
															onclick="FindZipByList('addInputShop_226667290');"
															style="cursor: pointer; vertical-align: middle; margin: -3px 0 0 0px;"
															alt="지역변경"><span id="addInputShop_226667290"></span>
													</div>
												</li>
											</ul>
										</div>
									</td>
									<td>
										<c:if test="${!empty sessionScope.userid }">
											<div class="button_search_cart_new btCart" data-isbn="${map['isbn13'] }" style="font-size: 13px; color:#fff; " >
												<!-- 로그인 되어 있을때 -->
												장바구니
											</div>
										</c:if>
										<c:if test="${empty map['stockstatus'] }">
												<!-- 재고가 있으면 -->
											<div class="button_search_buyitnow_new" style="font-size: 13px;">
												<a href="https://www.aladin.co.kr/order/worder_chk_order.aspx?CartType=4&amp;ISBN=K692636032" style="color:white"
												>바로구매</a>
											</div>
											<div class="button_search_storage" style="position: relative; font-size: 13px;"
											 id="btFavorite">
													<a href="#" style="color:#3399FF">찜목록 <img alt=""
														src="<c:url value='/resources/images/btn_bg5_arrow.png'/>"></a>
											</div>
										</c:if>
										<c:if test="${!empty map['stockstatus'] }">
											<!-- 재고가 없으면 -->
											<input type="submit" class="btn col" id="btOrder"
												value="지금은 구매할 수 없습니다." style="width: 50%;"
												disabled="disabled">
										</c:if>
										<input type="text" name="bookName" value="${map['title'] }">
										<input type="text" name="isbn" value="${map['isbn13'] }">
										<input type="text" name="writer" value="${map['author'] }">
										<input type="text" name="publisher" value="${map['publisher'] }">
										<input type="text" name="price" value="${map['priceSales'] }">
										<input type="text" name="qty" value="1">
										<input type="text" name="group" value="CART">
									</td>					
								</tr>
						</c:forEach>
						</tbody>
					</table>
				
				
					<%-- <c:forEach var="map" items="${list }">
							<input type="text" name="bookName" value="${map['title'] }">
							<input type="text" name="isbn" value="${map['isbn13'] }">
							<input type="text" name="writer" value="${map['author'] }">
							<input type="text" name="publisher" value="${map['publisher'] }">
							<input type="text" name="price" value="${map['priceSales'] }">
							<input type="text" name="group" value="CART">
						
						
						<table width="100%" class="ss_book_table">
							<tbody>
								<tr>
									<td width="25" align="left" valign="top"
										style="padding-right: 5px;">
										<table width="18" border="0" cellspacing="0" cellpadding="0">
											<tbody>
												<tr>
													<td>
														<div id="checkbox" style="text-align: center;">
															<input name="chkCart.K692636032" type="checkbox" class="checkbox">
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td width="170" align="left" valign="top">
										<table width="150" border="0" cellpadding="0" cellspacing="0">
											<tbody>
												<tr>
													<td style="">
														<div style="position: relative;">
															<a href='<c:url value="/book/bookDetail.do?ItemId=${map['isbn13'] }"/>' 
															id="book_a">
															<img src="${map['cover'] }"
																width="150" border="0" class="i_cover"></a>
														</div>
													</td>
												</tr>
												<tr>
													<td class="btn_author_list" style="text-align: left;">
														<!-- <a href="http://www.aladin.co.kr/shop/wproduct.aspx?ItemId=226667290"
														target="_blank"> -->
														<img src="//image.aladin.co.kr/img/search/icon_new2.gif"
															border="0"></a>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td width="*" align="left" valign="top">
										<table width="83%" border="0" cellspacing="0" cellpadding="0">
											<tbody>
												<tr>
													<td width="*" valign="top">
														<div class="ss_book_list">
															<ul class="book">
																<li><a href=
																	'<c:url value="/book/bookDetail.do?ItemId=${map['isbn13'] }"/>' 
																	class="bo3" style="color:#3399FF">
																		<b>${map['title'] }</b>
																	</a>&nbsp;</li>
																<li><a href=
																	"<c:url value='/book/bookList/authorBook.do?cateNo=${param.cateNo}&
																	author=${fn:substring(map["author"], 0, fn:indexOf(map["author"], "("))}'/>">
																		${map['author'] }</a> 
																		| 
																		<a href=
																		"<c:url value='/book/bookList/publBook.do?cateNo=${param.cateNo}&
																		publisher=${map["publisher"] }'/>">
																		${map['publisher'] }</a>
																		| ${map['pubDate'] }</li>
																<li><span class="">${map['priceStandard'] }</span>원 → <span
																		class="ss_p2"><b>
																		<span style="color:red; font-size:17px">
																		${map['priceSales'] }
																		</span>원</b></span>
																	(<span class="ss_p">10%</span>할인), 마일리지 <span
																		class="ss_p">
																		<fmt:formatNumber value="${map['priceStandard']/100*5}"/>
																		</span>원 
																		(<span class="ss_p" style="color:red">5</span>
																	% 적립)</li>
															</ul>
														</div>
														<div class="ss_book_list">
															<ul class="book">
																<li>지금 <strong>택배</strong>로 주문하면 <strong>내일</strong>
																	수령
																	<div>
																		최근 1주 88.0% (중구 중림동) <img
																			src="//image.aladin.co.kr/img/shop/2012/bu_driveaway_ch.gif"
																			onclick="FindZipByList('addInputShop_226667290');"
																			style="cursor: pointer; vertical-align: middle; margin: -3px 0 0 0px;"
																			alt="지역변경"><span id="addInputShop_226667290"></span>
																	</div>
																</li>
															</ul>
														</div>
													</td>
													<td width="80" valign="top">
														
															<c:if test="${!empty sessionScope.userid }">
																<div class="button_search_cart_new btCart" style="font-size: 13px; color:#fff; " >
																	<!-- 로그인 되어 있을때 -->
																	장바구니
																</div>
															</c:if>
															<c:if test="${empty map['stockstatus'] }">
																	<!-- 재고가 있으면 -->
																<div class="button_search_buyitnow_new" style="font-size: 13px;">
																	<a href="https://www.aladin.co.kr/order/worder_chk_order.aspx?CartType=4&amp;ISBN=K692636032" style="color:white"
																	>바로구매</a>
																</div>
																<div class="button_search_storage" style="position: relative; font-size: 13px;"
																 id="btFavorite">
																		<a href="#" style="color:#3399FF">찜목록 <img alt=""
																			src="<c:url value='/resources/images/btn_bg5_arrow.png'/>"></a>
																</div>
															</c:if>
															<c:if test="${!empty map['stockstatus'] }">
																<!-- 재고가 없으면 -->
																<input type="submit" class="btn col" id="btOrder"
																	value="지금은 구매할 수 없습니다." style="width: 50%;"
																	disabled="disabled">
															</c:if>
															<div class="button_search_cart_new">
																<a href=
																"<c:url value='/favorite/addFavorite.do'/>" style="color:white"
																	>장바구니</a>
															</div>
															<div id="divBasketAddResult_K692636032"></div>
															<div class="button_search_buyitnow_new">
																<a href="https://www.aladin.co.kr/order/worder_chk_order.aspx?CartType=4&amp;ISBN=K692636032" style="color:white"
																	>바로구매</a>
															</div>
															<div class="Search3_Result_SafeBasketArea"
																isbn="K692636032" style="position: relative;">
																<div class="button_search_storage">
																	<a href="javascript:void(0);" style="color:#3399FF">즐겨찾기 <img alt=""
																		src="//image.aladin.co.kr/img/search/btn_bg5_arrow.png"></a>
																</div>
															</div>
													</td>
												</tr>
												<tr>
													<td colspan="2"></td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</c:forEach>  --%>
				</div>
				</form>
				<div class="divPage">
					<!-- 이전블럭으로 이동 -->
					<c:if test="${pagingInfo.firstPage>1 }">	
						<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">
							<img src="<c:url value='/resources/images/first.JPG'/>" alt="이전 블럭으로">
						</a>
					</c:if>
					<!-- 페이지 번호 추가 -->						
					<!-- [1][2][3][4][5][6][7][8][9][10] -->
					<c:forEach var="i" begin="${pagingInfo.firstPage }" 
						end="${pagingInfo.lastPage }">		
						<c:if test="${i==pagingInfo.currentPage }">
							<span style="color:blue;font-weight: bold">${i}</span>
						</c:if>
						<c:if test="${i!=pagingInfo.currentPage }">
							<a href="#" onclick="pageFunc(${i})">
								[${i}]</a>
						</c:if>
					</c:forEach>
					<!--  페이지 번호 끝 -->
					
					<!-- 다음블럭으로 이동 -->
					<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
						<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">	
							<img src="<c:url value='/resources/images/last.JPG'/>" alt="다음 블럭으로">
						</a>
					</c:if>	
				</div>
				<div class="ss_line4">
					<div style="height: 21px; float: right;">
						<table>
							<tbody>
								<tr>
									<td style="padding: 0px 0px 0px 5px;">
										<img class="img_all" src="<c:url value='/resources/images/button/btn_all.jpg'/>"
										alt="체크박스 전체 선택"
										style="cursor: pointer;"></td>
	
									<td style="padding: 0px 0px 0px 5px;"><input
										type="image" alt="체크한 도서를 모두 장바구니에 담습니다."
										src="//image.aladin.co.kr/img/search/btn_basket_2.jpg"
										border="0" name="Submit.AddBookAll"></td>
	
									<td style="padding: 0px 0px 0px 5px;"><input type="image"
										name="submit.AddMyListAll" onclick="return AddMyListAll();"
										alt="체크한 상품을 즐겨찾기에 등록합니다."
										src="//image.aladin.co.kr/img/search/btn_mylist_s.jpg"
										border="0"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<br style="clear: both;">
				</div>
			</div>
		</div>
	</div>
</div>		
<%@include file="../inc/bottom.jsp" %>