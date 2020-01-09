<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<div class="container">
	<br>
	<h1>게시판</h1>

	<!-- 페이징 처리를 위한 form 시작-->
	<form name="frmPage" method="post">
		<input type="hidden" name="eventName" value=""> <input
			type="hidden" name="currentPage">
	</form>
	<!-- 페이징 처리 form 끝 -->

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
						<td>김철수</td>
						<td><a href="Detail.do">12월 신간도서 리뷰입니다</a></td>
						<td>2019-12-31</td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>이영희</td>
						<td><a href="#">찾는 책이 없는거 같아요</a></td>
						<td>2019-11-26</td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td>박수영</td>
						<td><a href="#">'이벤트' 응모합니다</a></td>
						<td>2019-11-07</td>
					</tr>
				</tbody>
			</table>
			<br>
			<div class="row justify-content-end">
				<a class="btn btn-info"
					href="${pageContext.request.contextPath}/freeBoard/Write.do"
					role="button">글쓰기</a>
			</div>
			<br>
			<div class="divPage">
				<!-- 페이지 번호 추가 -->
				<!-- <c:if test="${pagingInfo.firstPage>1 }">
		<a href="#" onclick="boardList(${pagingInfo.firstPage-1})">			
		    <img src='<c:url value="/resources/images/first.JPG" />'  border="0">	</a>
	</c:if> -->

				<!-- [1][2][3][4][5][6][7][8][9][10] -->
				<!-- <c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
		<c:if test="${i==pagingInfo.currentPage }">
			<span style="color:blue;font-weight:bold">${i }</span>
		</c:if>
		<c:if test="${i!=pagingInfo.currentPage }">						
			<a href="#" onclick="boardList(${i})">
				[${i }]
			</a>
		</c:if>		
	</c:forEach>
	
	<c:if test="${pagingInfo.lastPage<pagingInfo.totalRecord }">
		<a href="#" onclick="boardList(${pagingInfo.lastPage+1})">			
			<img src="<c:url value="/resources/images/last.JPG" />" border="0">
		</a>
	</c:if> -->
				<!--  페이지 번호 끝 -->
			</div>

		</div>
	</div>

	<!-- Navbar Search -->
	<div class="row row justify-content-around">
		<div class="col text-center">
			<form
				class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="제목을 입력하세요"
						aria-label="Search" aria-describedby="basic-addon2">
					<div class="input-group-append">
						<button class="btn btn-primary" type="button">검색</button>
					</div>
				</div>
			</form>
		</div>
		<!-- 컬럼 -->
	</div>

	<br>

</div>
<%@include file="../inc/bottom.jsp"%>