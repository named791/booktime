<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<style type="text/css">
td.td1 {
    position: relative;
    left: -4em;
    top: 16px;
}
td.td2 {
    position: relative;
    left: -3em;
    top: 13px;
    height: 0px;
}
.top_div {
    margin-bottom: 75px;
}
table.box2 {
    margin: 0 auto;
    width: 94%;
}
hr.top_hr {
    margin-bottom: 7px;
    background: red;
}
hr.bottom_hr {
    margin-top: 9px;
    background: red;
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
.space {
    height: 5em;
    background: #17a2b8;
}


</style>

<script type="text/javascript">
	$(function(){
		$("#btDelMulti").click(function(){
			if($("tbody input[type=checkbox]:checked").length>0){			
				$('form[name=frmList]').prop("action",
						"<c:url value='/admin/product/deleteMulti.do'/>");	
				$('form[name=frmList]').submit();	
				
				//document.frmList.action="";
				//document.frmList.submit();
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

<!-- Page Content -->
<div class="container" id="container_div">
	<!-- Content Row -->
	<div class="row">
		<c:import url="/inc/categoryBar.do"></c:import>	
	      	
    <!-- Content Column -->
    <div class="col-lg-10 mt-3">
    <div class="top_div">
		<table border="0" align="right" cellpadding="0" cellspacing="0">
			<tbody>
				<tr>
					<td class="td1"><input id="txtBrowse-Search-Category" type="text"
						class="br2010_fbox watermark"></td>
					<td class="td2"><img id="btnBrowse-Search-Category"
						src="//image.aladin.co.kr/img/browse/2010/bu_search.gif" alt="검색"
						style="cursor: pointer;"></td>
			</tbody>
		</table>
	</div>


		<!-- 테이블 -->
			<div class="ss_line5" style="padding-top: 10px;">
				<table width="100%" cellspacing="0" cellpadding="0" border="0">
					<tbody>
						<tr>
							<td height="19">
								<c:if test="">
									<div class="search_t_g" style="float: left;">
										이 분야에 <strong>814</strong>개의 상품이 있습니다.
									</div>
								</c:if>
								<%-- <c:if test="">
									<div class="search_t_g">
										<span class="result_l">"나의 히어로 아카데미아 24"</span> 총 <span
											class="ss_f_g_l">3</span>개의 상품이 검색되었습니다.
									</div>
								</c:if> --%>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="divList">
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
			</div>
			<div class="space"></div>
			<div class="ss_line4">
				<div style="height: 21px; float: right;">
					<table border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td><img src="//image.aladin.co.kr/img/search/btn_all.jpg"
									border="0" onclick="revcheck(this.form);"
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
									alt="체크한 상품를 모두 마이리스트에 담습니다."
									src="//image.aladin.co.kr/img/search/btn_mylist_s.jpg"
									border="0"></td>

							</tr>
						</tbody>
					</table>
				</div>
				<br style="clear: both;">
			</div>

			<!-- 책종류 테이블 -->

			<div class="ss_book_box" itemid="226667290">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
							<td width="25" align="left" valign="top"
								style="padding-right: 5px;">
								<table width="18" border="0" cellspacing="0" cellpadding="0">
									<tbody>
										<tr>
											<td><div style="text-align: center;">1.</div></td>
										</tr>
										<tr>
											<td><div style="text-align: center;">
													<input name="chkCart.K692636032" type="checkbox">
												</div></td>
										</tr>
									</tbody>
								</table>

							</td>
							<td width="170" align="left" valign="top">
								<table width="150" border="0" cellpadding="0" cellspacing="0">
									<tbody>
										<tr>
											<td style=""><div style="position: relative;">
													<a 
														href="#" id="book_a"><img
														src="https://image.aladin.co.kr/product/22666/72/cover150/k692636032_1.jpg"
														width="150" border="0" class="i_cover"></a>
												</div></td>
										</tr>
										<tr>
											<td style="text-align: left;"><a
												href="http://www.aladin.co.kr/shop/wproduct.aspx?ItemId=226667290"
												target="_blank"><img
													src="//image.aladin.co.kr/img/search/icon_new2.gif"
													border="0"></a></td>
										</tr>
									</tbody>
								</table>

							</td>
							<td width="*" align="left" valign="top">
								
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tbody>
												<c:forEach var="map" items="${list }">
										<tr>
											<td width="*" valign="top">
													<div class="ss_book_list">
														<ul class="book">
															<li><a href=
															"<c:url value='#'/>"
																class="bo3"><b>${map['title'] }</b></a>&nbsp;</li>
															<li><a href=
															"<c:url value='#'/>">
																${map['author'] }</a> (지은이) 
																| 
																<a href="<c:url value='#'/>">${map['publisher'] }</a>
																| ${map['pubDate'] }</li>
															<li><span class="">${map['priceStandard'] }</span>원 → <span
																class="ss_p2"><b><span class="">4,500</span>원</b></span>
																(<span class="ss_p">10%</span>할인), 마일리지 <span
																class="ss_p">250</span>원 (<span class="ss_p">5%</span>
																적립)</li>
															<li>세일즈포인트 :<b> 1,210</b></li>
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
																</div></li>
														</ul>
													</div>
												


											</td>
											<td width="80" valign="top">
												<div class="book_Rfloat_02">
													<div class="button_search_cart_new">
														<a href="/shop/wbasket.aspx?AddBook=K692636032"
															onclick="return SafeBasket_ListOneAddByAjax('K692636032', document.getElementById('divBasketAddResult_K692636032'), {top: 0, left: -55});">장바구니</a>
													</div>
													<div id="divBasketAddResult_K692636032"></div>
													<div class="button_search_buyitnow_new">
														<a
															href="https://www.aladin.co.kr/order/worder_chk_order.aspx?CartType=4&amp;ISBN=K692636032"
															onclick="return QuickBuyCheck('K692636032');">바로구매</a>
													</div>
													<div class="Search3_Result_SafeBasketArea"
														isbn="K692636032" style="position: relative;">
														<div class="button_search_storage">
															<a href="javascript:void(0);">보관함 <img alt=""
																src="//image.aladin.co.kr/img/search/btn_bg5_arrow.png"></a>
														</div>
														<ul class="mylist Search3_Result_SafeBasketLayer"
															isbn="K692636032" style="display: none;">
															<li><a href="javascript:void(0);"
																onclick="return AddSafeBasket('K692636032');">보관함</a></li>
															<li><a href="javascript:void(0);"
																onclick="return AddMyList('K692636032');">마이리스트</a></li>
														</ul>
													</div>
												</div>
											</td>
										</tr>
											</c:forEach> 
										<tr>
											<td colspan="2"></td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			



		</div>
			
<%@include file="../inc/bottom.jsp" %>