<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %> 
<!-- Page Content -->
  <div class="container">
	<input type="hidden" id="boardNo" name="boardNo" value="${boardVo.boardNo }" />
    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">${boardVo.title }
      <small>by
        <a href="#">${boardVo.name }</a>
      </small>
    </h1>

    <div class="row">

      <!-- Post Content Column -->
      <div class="col-lg-8">

        <!-- Preview Image -->
        <!-- <img class="img-fluid rounded" src="http://placehold.it/900x300" alt=""> -->

        <hr>

        <!-- Date/Time -->
        <p><fmt:formatDate value="${boardVo.regdate }" pattern="yyyy-MM-dd HH:mm:ss" /> </p>

        <hr>

        <!-- Post Content -->
		 ${boardVo.content }

        <hr>
        <!-- 본인 체크하고 본인에게만 수정/삭제 보여주기 -->
        <c:if test="${boardVo.userid == chkid}">
			<a class="btn btn-info"
						href="${pageContext.request.contextPath}/freeBoard/Edit.do?boardNo=${boardVo.boardNo }"
						role="button">수정하기</a>
			<a class="btn btn-info"
						onclick="next()"
						role="button">삭제하기</a>			
		</c:if>
        <%@include file="reply/replyWrite.jsp" %><!-- 댓글 작성란 -->

        <%@include file="reply/replyList.jsp" %><!-- 댓글 목록 -->

      </div>

      <!-- Sidebar Widgets Column -->
      <div class="col-md-4">

        <!-- Search Widget 
        <div class="card mb-4">
          <h5 class="card-header">Search</h5>
          <div class="card-body">
            <div class="input-group">
              <input type="text" class="form-control" placeholder="Search for...">
              <span class="input-group-btn">
                <button class="btn btn-secondary" type="button">Go!</button>
              </span>
            </div>
          </div>
        </div>-->

        <!-- Categories Widget -->
        <div class="card my-4">
          <h5 class="card-header">게시글</h5>
          <div class="card-body">
            <div class="row">
              <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                  <li>
                    <a href="freeBoard/List.do">공지사항</a>
                  </li>
                  <li>
                    <a href="freeBoard/List.do">이벤트</a>
                  </li>
                  <li>
                    <a href="freeBoard/List.do">자유게시판</a>
                  </li>
                </ul>
              </div>
              <!-- <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                  <li>
                    <a href="#">JavaScript</a>
                  </li>
                  <li>
                    <a href="#">CSS</a>
                  </li>
                  <li>
                    <a href="#">Tutorials</a>
                  </li>
                </ul>
              </div> -->
            </div>
          </div>
        </div>

        <!-- Side Widget -->
        <div class="card my-4">
          <h5 class="card-header">신간 이벤트</h5>
          <div class="card-body">
            12월 신간 도서를 구입하고 후기를 남기면 마일리지를 드립니다!
          </div>
        </div>

      </div>

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->
 
 <!-- 각 게시판 탭 링크 -->
 <<script type="text/javascript">

</script>
 
 <!-- 글 삭제 모달창 --> 
<script>
function next(){
	var no=document.getElementById("boardNo").getAttribute('value');
	
	if(confirm("정말로 삭제하시겠습니까?"))
	 {
  		location.href="/booktime/freeBoard/Delete.do?boardNo="+no;
 	}
}
</script>
  
  <%@include file="../inc/bottom.jsp" %>