<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="inc/top.jsp" %>
<style>
.btn-blog {
    color: #ffffff;
    background-color: #37d980;
    border-color: #37d980;
    border-radius:0;
    margin-bottom:10px
}
.btn-blog:hover,
.btn-blog:focus,
.btn-blog:active,
.btn-blog.active,
.open .dropdown-toggle.btn-blog {
    color: white;
    background-color:#34ca78;
    border-color: #34ca78;
}
 h2{color:#1c1c1c;}
 .margin10{margin-bottom:10px; margin-right:10px;}
</style>  
  
  <!--검색 Navbar-->
<nav class="navbar navbar-expand-lg">

  <!-- Collapsible content -->
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <form class="form-inline mx-auto" action="">
      <input class="form-control-lg" type="text" placeholder="${param.searchKeyword }" aria-label="검색어를 입력하세요">
      <button class="btn btn-primary btn-lg" type="submit">검색</button>
    </form>

  </div>
  <!-- Collapsible content -->

</nav>
<!--/.Navbar-->
<div class="container">
<!-- Content Row -->
    <div class="row">
      <!-- Sidebar Column -->
      <div class="col-lg-2 mb-4">
        <div class="list-group">
          <a href="category.do?cateNo=1" class="list-group-item">소설/시</a> <!-- 1 -->
          <a href="category.do?cateNo=55889" class="list-group-item">에세이</a> <!-- 55889 -->
          <a href="category.do?cateNo=656" class="list-group-item">인문</a> <!-- 656 -->
          <a href="category.do?cateNo=1230" class="list-group-item">가정/생활/요리</a> <!-- 1230 -->
          <a href="category.do?cateNo=53556" class="list-group-item">건강</a> <!-- 53556 -->
          <a href="category.do?cateNo=55890" class="list-group-item">취미/레저</a> <!-- 55890 -->
          <a href="category.do?cateNo=170" class="list-group-item">경제/경영</a> <!-- 170 -->
          <a href="category.do?cateNo=336" class="list-group-item">자기계발</a> <!-- 336 -->
          <a href="category.do?cateNo=798" class="list-group-item">사회</a> <!-- 798 -->
          <a href="category.do?cateNo=74" class="list-group-item">역사/문화</a> <!-- 74 -->
          <a href="category.do?cateNo=1237" class="list-group-item">종교</a> <!-- 1237 -->
          <a href="category.do?cateNo=517" class="list-group-item">예술/대중문화</a> <!-- 517 -->
          <a href="category.do?cateNo=76001" class="list-group-item">학습/참고서</a> <!-- 76001 -->
          <a href="category.do?cateNo=1322" class="list-group-item">국어/외국어</a> <!-- 1322 -->
          <a href="category.do?cateNo=4395" class="list-group-item">사전</a> <!-- 4395 -->
          <a href="category.do?cateNo=987" class="list-group-item">과학/공학</a> <!-- 987 -->
          <a href="category.do?cateNo=1383" class="list-group-item">취업/수험서</a> <!-- 1383 -->
          <a href="category.do?cateNo=1196" class="list-group-item">여행/지도</a> <!-- 1196 -->
          <a href="category.do?cateNo=351" class="list-group-item">컴퓨터/IT</a> <!-- 351 -->
          <a href="category.do?cateNo=2913" class="list-group-item">잡지</a> <!-- 2913 -->
          <a href="category.do?cateNo=112011" class="list-group-item">장르소설</a> <!-- 112011 -->
          <a href="category.do?cateNo=13789" class="list-group-item">유아</a> <!-- 13789 -->
          <a href="category.do?cateNo=1108" class="list-group-item">어린이</a> <!-- 1108 -->
          <a href="category.do?cateNo=2551" class="list-group-item">만화</a> <!-- 2551 -->
          <a href="category.do?cateNo=90834" class="list-group-item">해외도서</a> <!-- 90834 -->
        </div>
      </div>
      
      <!-- Content Column -->
      <div class="col-lg-10 mb-4">
       <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">FAQ
      <small>자주 묻는 질문</small>
    </h1>
	
	<br>
	<br>
    <div class="mb-4" id="accordion" role="tablist" aria-multiselectable="true">
      <div class="card">
        <div class="card-header" role="tab" id="headingOne">
          <h5 class="mb-0">
            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">#1 품절, 절판 상품은 구입할 수 없습니까?</a>
          </h5>
        </div>

        <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne">
          <div class="card-body">
            상품 페이지에 품절, 일시품절, 절판, 구판절판 등으로 표시된 상품은 현재로서는 구입하실 수 없는 상품이니 이점 양해하여 주십시오.
          </div>
        </div>
      </div>
      <div class="card">
        <div class="card-header" role="tab" id="headingTwo">
          <h5 class="mb-0">
            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">#2 주문 후 입금 전(입금확인 전)인데, 언제쯤 배송됩니까?
            </a>
          </h5>
        </div>
        <div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo">
          <div class="card-body">
           주문완료 후 주문조회 페이지 상단의 주문처리 일정표로 확인하실 수 있습니다.
상품 준비예상일, 출고예상일 및 수령예상일 정보를 참고해주십시오.
단, 결제완료 상태를 전제로 한 일정이며, 입금 전이면 입금확인 완료(입금 후 약 30분-1시간 내 확인)후 해당 시점의 재고 유무, 각 배송사 집하마감 시간 경과 여부 등을 기준으로 주문처리 일정이 재계산되므로, 입금대기 상태의 일정과 달라질 수 있습니다. 입금완료 후 주문 일정을 반드시 참고해주시기 바랍니다.
또한, 상품 추가,배송지 혹은 배송방법 변경 등의 경우에도 상황에 따라 일정 변경이 발생될 수 있으므로 변경 후 새로 세팅된 일정을 참고하시기 바랍니다.
          </div>
        </div>
      </div>
      <div class="card">
        <div class="card-header" role="tab" id="headingThree">
          <h5 class="mb-0">
            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">#3 수령예상일이 지났는데 아직 못 받았습니다.</a>
          </h5>
        </div>
        <div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree">
          <div class="card-body">
            출고완료 후 통상 1-2일 내에는 배송이 됩니다만, 배송 물량이 급증하거나 해당 지역의 배송 상황에 다른 문제가 있다면 예정일 보다 지연될 수 있습니다.
우선, 주문조회 후 해당 주문의 "배송상황추적"클릭 후 배송상황이나 영업소 확인을 해 보세요. 영업소에 의뢰하시면 자세한 안내와 배송 예상시점 등을 확인하실 수 있습니다.
영업소와의 연락이 어려운 경우에는 해당 주문 조회 후  미배송신고해 주시면 신속 배송 되도록 조치해드립니다.
          </div>
        </div>
      </div>
      <div class="card">
        <div class="card-header" role="tab" id="headingFour">
          <h5 class="mb-0">
            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">#4 입금했는데 왜 아직 "입금대기" 상태입니까?</a>
          </h5>
        </div>
        <div id="collapseFour" class="collapse" role="tabpanel" aria-labelledby="headingFour">
          <div class="card-body">
            주문내역서의 입금예정 정보(입금액/입금은행/입금자명)와 100% 동일하게 입금하셨다면 "입금 후 40분-1시간 내" 입금확인이 완료되고 주문처리 단계는 상품준비중으로 이행하며 상품 준비가 시작됩니다. 아직 입금확인 소요시간이 경과하지 않았다면 조금만 기다려주십시오.
단, 1시간 이상 지나도록 입금 확인이 안될 경우에는 주문내역서 입금예정 정보와 실제 입금 정보가 다른 경우인데요,. 이 경우 실제 입금내역 조회 후 1대1 고객상담>결제>입금신고 이용해 입금정보를 신고해주시면 신속히 확인해 드립니다.
          </div>
        </div>
      </div>
      <div class="card">
        <div class="card-header" role="tab" id="headingFive">
          <h5 class="mb-0">
            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">#5 마일리지를 주문에 사용하고 싶습니다.</a>
          </h5>
        </div>
        <div id="collapseFive" class="collapse" role="tabpanel" aria-labelledby="headingFive">
          <div class="card-body">
           마이페이지>마일리지에는 마일리지가 보관되어 있습니다. 주문접수 과정에서 결제페이지 상단 "추가할인 받기" 코너에서 보유하고 계신 내역 조회 및 사용이 가능합니다. 먼저 보유하시는 수단을 사용하시고 나머지 금액을 신용카드/온라인송금 등으로 추가 결제하시면 알뜰하게 구매하실 수 있습니다.
주문접수 이후 온라인송금 주문에 한해 주문에 반영하실 수 있습니다.
마일리지는 우선 "적립금"으로 전환하신 후 적립금 형태로 주문 결제에 사용 가능합니다. 마일리지는 10원이상 적립 후 적립금 전환이 가능합니다.
          </div>
        </div>
      </div>
    </div>
	<div>
	찾으시는 질문이 없나요?
	<a href=""> 1:1 문의하기</a>
	</div>
    </div>
 
</div>

</div>
  <!-- Footer -->
  <%@include file="inc/bottom.jsp" %>