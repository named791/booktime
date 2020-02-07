<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin/adminRecomand.jsp</title>

<script type="text/javascript"
	src="<c:url value='https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous'/> "></script>
<script type="text/javascript">
	$(function() {
		$("#btnChoose").click(function(){
			var checked = $("input[type=checkbox]:checked");

			//ajax 통신으로 isbn,제목,가격,출판사,가격,표지 보낼것
			
			$.ajax({
			url : "<c:url value='/admin/adminRecommendAdd.do'/> ",
			type : "post",
			data : {
				"isbn": $("#isbn").val(),
				"bookName": $("#bookName").val(),
				"price": $("#price").val(),
				"publisher": $("#publisher").val(),
				"writer": $("#writer").val(),
				"cover": $("#cover").val()
			},
			success : function(result){
				alert("추천도서 등록 완료");
			},
			error:function(xhr, status, error){
				alert("Error:"+ status+"=>"+ error);
			}
				
		});
			opener.location.reload();
			self.close();		
	});
});
	function pageFunc(curPage){		
		$("input[name=start]").val(curPage);
		$("form[name=frmPage]").submit();
	}
	
</script>

<style type="text/css">
p, label {
	font-size: 0.9em;
}

.box2 {
	width: 600px;
}

#divTable {
	width: 700px;
	margin: 15px 0;
}

h1 {
	font-size: 1.5em;
	margin-bottom: 25px;
}

.error {
	color: red;
	display: none;
}

#page {
	margin: 10px 0;
	text-align: center;
}
</style>

</head>
<body>
	<h1>추천도서 검색</h1>
	<p>찾고 싶은 책 제목을 입력해 주세요</p>

<!-- 페이징 처리 관련 form -->
<form action="<c:url value='/admin/adminRecomand.do'/>" 
	name="frmPage" method="post">
	
	<!-- 한 페이지당 게시글 수  -->
	<input type= "hidden" name="MaxResults" value="10">
	<!-- 한 블럭당 페이지 수 -->
	<input type="hidden" name="blockSize" value="10">
	<!-- 전체 개수 -->
	<input type="hidden" name="totalResults" value="${pagingInfo.totalRecord }">
	<input type="hidden" name="start" value="${pagingInfo.currentPage }">
	<input type="hidden" value="${pagingInfo.firstPage }">
	<input type="hidden" value="${pagingInfo.lastPage }">

	<label for="title">책 제목</label>
	<input class="form-control" type="text" name="title" id="title" value="${param.title }">
	<button class="btn btn-primary" id="btSearch" type="submit" title="search">찾기</button>
	<span class="error">제목을 입력하세요</span>
</form>
	<c:if test="${list!=null }">
		<div id="divTable">
			<table class="box2" summary="알라딘 도서 검색 결과" style="padding:10px">
				<colgroup>
					<col style="width: 20%">
					<col style="width: *">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">책 표지</th>
						<th scope="col">책 제목</th>
						<th scope="col">지은이</th>
						<th scope="col">선택</th>
					</tr>
				</thead>

				<tbody>
					<c:if test="${empty list }">
						<tr style="text-align: center">
							<td colspan="4">검색 결과가 없습니다</td>
						</tr>
					</c:if>
					<c:if test="${!empty list }">
					
						<!-- 반복시작 -->
						<c:forEach var="map" items="${list }">
							<tr>
								<td><img src="${map['cover'] }" alt="cover" style="width: 100px"></td>
								<td><a
									href='<c:url value="/book/bookDetail.do?ItemId=${map['isbn13'] }"/>'
									target="_blank"> ${map['title'] } </a></td>
								<td>${map['author'] }</td>
								<td style="width: 50px"><input class="form-check-input" id="btnChoose"
								type="checkbox" value="${vo.isbn13 }"></td>
								<input type="hidden" id="isbn" value="${map['isbn13'] }">
								<input type="hidden" id="bookName" value="${map['title'] }">
								<input type="hidden" id="price" value="${map['priceSales'] }">
								<input type="hidden" id="publisher" value="${map['publisher'] }">
								<input type="hidden" id="writer" value="${map['author'] }">
								<input type="hidden" id="cover" value="${map['cover'] }">
							</tr>
						</c:forEach>
						<!-- 반복끝 -->
					</c:if>
				</tbody>
			</table>
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
		</div>
	</c:if>
</body>
</html>
