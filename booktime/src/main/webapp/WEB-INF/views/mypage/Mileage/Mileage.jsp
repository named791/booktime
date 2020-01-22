<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../inc/top.jsp"%>
<%@include file="../includeMy.jsp" %>
<script>
$(function(){		
	$("form[name=frm1]").submit(function(){
		if($("#startDay").val().length<1){
			alert("시작일을 입력하세요");
			$("#startDay").focus();
			event.preventDefault();
		}else if($("#endDay").val().length<1){
			alert("종료일을 입력하세요");
			$("#endDay").focus();
			event.preventDefault();
		}
	});
		
});

function pageFunc(curPage){
	document.frmPage.currentPage.value=curPage;
	
	document.frmPage.submit();
}
</script>

<div class="col">
	<br>
	<h1>마일리지</h1>
	<table style="border: 1px solid #bcbcbc;">
		<tr>
			<td>
			<p style="margin:20px;">
			[도움말]<br>
<br> ▶ 주문하신 상품이 발송된 다음날, 마일리지가 누적됩니다.
<br> ▶ 적립금으로 전환할 수 있는 기간은 마일리지 누적일로부터 12개월 이내입니다.
<br> ▶ 마일리지 포인트는 현금성 결제수단으로 결제하신 금액에 대해서만 적립됩니다.
<br> ▶ 마일리지에서 전환된 결제액은 마일리지 적립대상에서 제외됩니다.
<br> ▶ 마일리지가 10원 이상이면 "마일리지로 결제하기"버튼이 표시됩니다.
<br> ▶ 이 버튼을 누르시면 보유하신 마일리지를 원하시는 금액(또는 전액)만큼 결제액 전환 후 주문 결제시 사용하실 수 있습니다.
			</p>
			</td>
		</tr>
	</table>
	<!-- 페이징 처리 관련 form -->
	<form action="<c:url value='/mypage/Mileage/List.do'/>" name="frmPage"
		method="post">
		<input type="hidden" name="searchCondition"
			value="${param.searchCondition}"> <input type="hidden"
			name="searchKeyword" value="${param.searchKeyword}"> <input
			type="hidden" name="currentPage">
	</form>
	
	<form name="frm1" method="post"
		action="<c:url value='/mypage/Mileage/searchList.do'/>">
		<!-- 조회기간 include -->
		<%@include file="dateTerm.jsp"%>

		<input type="submit" value="조회">
	</form>
	<br>

	<table class="table" id="mileageList">
		<thead class="thead-light">
			<tr>
				<th scope="col">적립일</th>
				<th scope="col">적립 포인트</th>
				<th scope="col">결제 번호</th>
				<th scope="col">결제 포인트</th>
				<th scope="col">만료일 </th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list}">
				<td colspan="5">보유 마일리지가 없습니다.</td>
			</c:if>

			<!-- 자유게시판 반복문 시작 -->
			<c:if test="${!empty list}">
			
			<c:set var="savingPoint" value="0" />
			<c:set var="usePoint" value="0" />
			<c:set var="tmp1" value="0" />
			<c:set var="tmp2" value="0" />
			<c:set var="sumPoint" value="0" />
			<c:set var="minusPoint" value="0" />
			<c:set var="totalPoint" value="0" />
			
				<c:forEach var="vo" items="${list }">
				
				<c:set var="savingPoint" value="${vo.savingPoint }" />
				<c:set var="usePoint" value="${vo.usePoint }" />
					<tr>
						<td><fmt:formatDate value="${vo.savingDate }"
								pattern="yyyy-MM-dd" /></td>
						<td>${vo.savingPoint }</td>
						<td>${vo.payNo }</td>
						<td>${vo.usePoint }</td>
						<td><fmt:formatDate value="${vo.endDate }"
								pattern="yyyy-MM-dd" /></td>
				<c:set var="sumPoint" value="${savingPoint+tmp1 }" />
				<c:set var="minusPoint" value="${usePoint+tmp2 }" />

				<c:set var="tmp1" value="${sumPoint }" />
				<c:set var="tmp2" value="${useminusPoint }" />	
					
					</tr>
				</c:forEach>
			</c:if>
			<!-- 자유게시판 반복문 끝 -->
		</tbody>
	</table>

	<br>
	<c:set var="totalPoint" value="${tmp1-tmp2 }" />
	
	<div class="text-right">
	<span>보유한 마일리지 총액 : </span>
	<span style="color:orange;font-weight:bold;font-size:3em;">${totalPoint }</span>
	<span> 원</span>
	</div>
	<br>
	<div class="row justify-content-center" id="paging">
		<nav aria-label="Page navigation example">
			<ul class="pagination">

				<!-- 이전블럭으로 이동 -->
				<c:if test="${pagingInfo.firstPage>1 }">
					<li class="page-item"><a class="page-link" href="#"
						onclick="pageFunc(${pagingInfo.firstPage-1})"
						aria-label="Previous">&laquo;<span class="sr-only">Previous</span>
					</a></li>
				</c:if>


				<!-- 페이지 번호 추가 -->
				<!-- bootstrap pagination -->
				<c:forEach var="i" begin="${pagingInfo.firstPage }"
					end="${pagingInfo.lastPage }">
					<c:if test="${i==pagingInfo.currentPage }">
						<li class="page-item active"><a class="page-link" href="#">${i}<span
								class="sr-only">(current)</span></a></li>
					</c:if>
					<c:if test="${i!=pagingInfo.currentPage }">
						<li class="page-item"><a class="page-link" href="#"
							onclick="pageFunc(${i})"> ${i}</a></li>
					</c:if>
				</c:forEach>
				<!--  페이지 번호 끝 -->

				<!-- 다음블럭으로 이동 -->
				<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
					<li class="page-item"><a class="page-link" href="#"
						onclick="pageFunc(${pagingInfo.lastPage+1})" aria-label="Next">
							&raquo; <span class="sr-only">Next</span>
					</a></li>
				</c:if>
			</ul>
		</nav>
	</div>
</div>

<br>
</div>
</div>
<%@include file="../../inc/bottom.jsp"%>