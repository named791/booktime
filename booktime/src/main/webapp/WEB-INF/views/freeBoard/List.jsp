<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>

<div class="container">
	<br>
	<h2>게시판</h2>	
	
		<ul class="nav nav-tabs">
		<li class="nav-item" id="list1"><a class="nav-link active" data-toggle="tab"
			href="#qwe">공지사항</a></li>
		<li class="nav-item" id="list2"><a class="nav-link" data-toggle="tab"
			href="#asd">이벤트</a></li>
		<li class="nav-item" id="list3"><a class="nav-link" data-toggle="tab"
			href="#zxc">자유게시판</a></li>
		</ul>
		
		<div class="tab-content">
		<div class="tab-pane fade show active" id="qwe">
			<c:import url="/freeBoard/Tab1.do"></c:import>	
		</div>
		<div class="tab-pane fade" id="asd">
			<c:import url="/freeBoard/Tab2.do"></c:import>	
		</div>
		<div class="tab-pane fade" id="zxc">
			<c:import url="/freeBoard/Tab3.do"></c:import>	
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
</div>
<br>

<!-- Page level plugin JavaScript-->
  <script src="<c:url value='/resources/vendor/chart.js/Chart.min.js' />"></script>
  <script src="<c:url value='/resources/vendor/datatables/jquery.dataTables.js' />"></script>
  <script src="<c:url value='/resources/vendor/datatables/dataTables.bootstrap4.js' />"></script>

<!-- Demo scripts for this page-->
  <script src="<c:url value='/resources/js/demo/datatables-demo.js' />"></script>
    
<%@include file="../inc/bottom.jsp"%>