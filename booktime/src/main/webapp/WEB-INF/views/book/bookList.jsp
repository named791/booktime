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
    height: 38px;
    width: 76px;
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
     height: 38px;
    width: 76px;
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
 	height: 38px;
    width: 76px;
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
		
	});
	
	function pageFunc(curPage){		
		$("input[name=currentPage]").val(curPage);
		$("form[name=frmPage]").submit();
	}
	
</script>	

<!-- 페이징 처리 관련 form -->
<form action="<c:url value='/reBoard/list.do'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="searchCondition" 
		value="${param.searchCondition}">
	<input type="hidden" name="searchKeyword" 
		value="${param.searchKeyword}">
	<input type="hidden" name="currentPage" >
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
				<table align="right" cellpadding="0" 
				action="<c:url value='/book/bookList.do'/>">
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
        							type="text" class="br2010_fbox watermark"
        							placeholder="분야 내 검색"
        							value=${param.searchKeyword }>
        					</td>
        					<td>
        						<img id="btnBrowse-Search-Category" 
        						src="//image.aladin.co.kr/img/browse/2010/bu_search.gif"
        						alt="검색" style="cursor: pointer;">
        					</td>
    					</tr>
					</tbody>
				</table>
				
				<!-- 신간베스트 -->
				<div class="bookBestSection">
					<c:import url="/book/bookBestList.do"></c:import>	
				</div>
			<!-- 테이블 -->
				<div class="ss_line5" style="padding-top: 10px;">
					<table width="100%">
						<tbody>
							<tr>
								<td height="19">
									<div class="search_t_g" style="float: left;">
										이 분야에 <strong>814</strong>개의 상품이 있습니다.
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
										<img class="img_all"src="<c:url value='/resources/images/button/btn_all.jpg'/>"
										onclick="revcheck(this.form);"
										style="cursor: pointer;"></td>
	
									<td style="padding: 0px 0px 0px 5px;"><input
										onclick="return SafeBasket_ListOneAddByAjax(null, this, {top: 25, left:-50});"
										type="image" alt="체크한 도서를 모두 장바구니에 담습니다."
										src="//image.aladin.co.kr/img/search/btn_basket_2.jpg"
										border="0" name="Submit.AddBookAll"></td>
	
									<td style="padding: 0px 0px 0px 5px;"><input type="image"
										name="submit.AddSafeBasketAll"
										onclick="return AddSafeBasketAll();"
										alt="체크한 상품를 모두 보관함에 담습니다."
										src="//image.aladin.co.kr/img/search/btn_keep_s.jpg" border="0"></td>
									
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
	
				<!-- 책종류 테이블 -->
	
				<div class="ss_book_box">
					<c:forEach var="map" items="${list }">
						<table width="100%" class="ss_book_table">
							<tbody>
								<tr>
									<td width="25" align="left" valign="top"
										style="padding-right: 5px;">
										<table width="18" border="0" cellspacing="0" cellpadding="0">
											<tbody>
												<tr>
													<td>
														<div style="text-align: center;">
															<input name="chkCart.K692636032" type="checkbox">
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
															<a href="#" id="book_a">
															<img src="${map['cover'] }"
																width="150" border="0" class="i_cover"></a>
														</div>
													</td>
												</tr>
												<tr>
													<td style="text-align: left;">
														<a href="http://www.aladin.co.kr/shop/wproduct.aspx?ItemId=226667290"
														target="_blank">
														<img src="//image.aladin.co.kr/img/search/icon_new2.gif"
															border="0"></a>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td width="*" align="left" valign="top">
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tbody>
												<tr>
													<td width="*" valign="top">
														<div class="ss_book_list">
															<ul class="book">
																<li><a href=
																	"<c:url value='#'/>" class="bo3" style="color:#3399FF">
																		<b>${map['title'] }</b>
																	</a>&nbsp;</li>
																<li><a href=
																	"<c:url value='#'/>">
																		${map['author'] }</a> (지은이) 
																		| 
																		<a href="<c:url value='#'/>">${map['publisher'] }</a>
																		| ${map['pubDate'] }</li>
																<li><span class="">${map['priceStandard'] }</span>원 → <span
																		class="ss_p2"><b>
																		<span style="color:red">
																		<fmt:formatNumber value=
																		"${map['priceStandard']-(map['priceStandard']/100*10) }"/>
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
														<div class="book_Rfloat_02">
															<div class="button_search_cart_new">
																<a href="/shop/wbasket.aspx?AddBook=K692636032" style="color:white"
																	onclick="return SafeBasket_ListOneAddByAjax('K692636032', document.getElementById('divBasketAddResult_K692636032'), {top: 0, left: -55});">장바구니</a>
															</div>
															<div id="divBasketAddResult_K692636032"></div>
															<div class="button_search_buyitnow_new">
																<a href="https://www.aladin.co.kr/order/worder_chk_order.aspx?CartType=4&amp;ISBN=K692636032" style="color:white"
																	onclick="return QuickBuyCheck('K692636032');">바로구매</a>
															</div>
															<div class="Search3_Result_SafeBasketArea"
																isbn="K692636032" style="position: relative;">
																<div class="button_search_storage">
																	<a href="javascript:void(0);" style="color:#3399FF">즐겨찾기 <img alt=""
																		src="//image.aladin.co.kr/img/search/btn_bg5_arrow.png"></a>
																</div>
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
					</c:forEach> 
				</div>
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
										<img class="img_all"src="<c:url value='/resources/images/button/btn_all.jpg'/>"
										onclick="revcheck(this.form);"
										style="cursor: pointer;"></td>
	
									<td style="padding: 0px 0px 0px 5px;"><input
										onclick="return SafeBasket_ListOneAddByAjax(null, this, {top: 25, left:-50});"
										type="image" alt="체크한 도서를 모두 장바구니에 담습니다."
										src="<c:url value='/resources/images/button/btn_basket_2.jpg'/>"
										name="Submit.AddBookAll"></td>
	
									<td style="padding: 0px 0px 0px 5px;"><input type="image"
										name="submit.AddSafeBasketAll"
										onclick="return AddSafeBasketAll();"
										alt="체크한 상품를 모두 보관함에 담습니다."
										src="<c:url value='/resources/images/button/btn_keep_s.jpg'/>" ></td>
									
									<td style="padding: 0px 0px 0px 5px;"><input type="image"
										name="submit.AddMyListAll" onclick="return AddMyListAll();"
										alt="체크한 상품을 즐겨찾기에 등록합니다."
										src="<c:url value='/resources/images/button/btn_mylist_s.jpg'/>"></td>
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