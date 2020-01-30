<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>

<div class="container">
	<br>
	<h1>게시판</h1>
		<!-- 페이징 처리 관련 form -->
		<!-- <form action="<c:url value='/freeBoard/List.do'/>" name="frmPage" id="frmPage"
			method="post">-->
		<form name="frmPage" id="frmPage" method="post">	
			<input type="hidden" name="searchCondition" id="searchCondition" value="${param.searchCondition}"> 
			<input type="hidden" name="searchKeyword" id="searchKeyword" value="${param.searchKeyword}"> 
			<input type="hidden" name="currentPage" id="currentPage">
		</form>
		<div id="event_div"></div>
		<div id="boardPagingDiv"></div>
			
		<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link active" data-toggle="tab"
			href="#qwe">공지사항</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#asd">이벤트</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#zxc">자유게시판</a></li>
		</ul>
		
		<div class="tab-content">
		<div class="tab-pane fade show active" id="qwe">
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">작성자</th>
						<th scope="col">제목</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>관리자</td>
						<td><a href="#">설 연휴 배송 안내</a></td>
						<td>2020-01-07</td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>관리자</td>
						<td><a href="#">성탄절 배송 안내</a></td>
						<td>2019-12-05</td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td>관리자</td>
						<td><a href="#">도서,산간 지역 배송 안내</a></td>
						<td>2019-11-11</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="tab-pane fade" id="asd">
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">작성자</th>
						<th scope="col">제목</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>관리자</td>
						<td><a href="#">12월 신간도서 리뷰 이벤트</a></td>
						<td>2019-12-26</td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>관리자</td>
						<td><a href="#">2019 올해의 도서 투표하기</a></td>
						<td>2019-11-01</td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td>관리자</td>
						<td><a href="#">'가을은 독서의 계절' 이벤트 당첨자 안내</a></td>
						<td>2019-10-30</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="tab-pane fade" id="zxc">


              <table class="table table-striped" id="dataTable3" width="100%" cellspacing="0">
                <thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">작성자</th>
						<th scope="col">제목</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list}">
						<td colspan="4">자유게시판에 작성된 글이 없습니다.</td>
					</c:if>

					<!-- 자유게시판 반복문 시작 -->
					<c:if test="${!empty list}">
						<c:forEach var="vo" items="${list }">
							<tr>
								<th scope="row">${vo.boardNo }</th>
								<td>${vo.name }</td>
								<td><a href="Detail.do?boardNo=${vo.boardNo }">
										${vo.title } </a></td>
								<td><fmt:formatDate value="${vo.regdate }"
										pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</c:if>
					<!-- 자유게시판 반복문 끝 -->
				</tbody>
			</table>
			<br>
			<div class="row justify-content-end">
				<a class="btn btn-info"
					href="${pageContext.request.contextPath}/freeBoard/chkUser.do"
					role="button">글쓰기</a>
			</div>
			<br>


	</div>
<!-- 컬럼 -->
</div>
<br>

<!-- Page level plugin JavaScript-->
  <script src="<c:url value='/resources/vendor/chart.js/Chart.min.js' />"></script>
  <script src="<c:url value='/resources/vendor/datatables/jquery.dataTables.js' />"></script>
  <script src="<c:url value='/resources/vendor/datatables/dataTables.bootstrap4.js' />"></script>

<!-- Demo scripts for this page-->
  <script src="<c:url value='/resources/js/demo/datatables-demo.js' />"></script>
    
<%@include file="../inc/bottom.jsp"%>