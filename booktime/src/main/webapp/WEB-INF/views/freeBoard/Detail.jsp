<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %> 
<!-- Page Content -->
  <div class="container">

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
        <p><fmt:formatDate value="${boardVo.regdate }" pattern="yyyy-MM-dd" /> </p>

        <hr>

        <!-- Post Content -->
		 ${boardVo.content }

        <hr>
		<a class="btn btn-info"
					href="${pageContext.request.contextPath}/freeBoard/Edit.do?boardNo=${boardVo.boardNo }"
					role="button">수정하기</a>
		<a class="btn btn-info"
					href=""
					role="button">삭제하기</a>			
		
        <!-- Comments Form -->
        <div class="card my-4">
          <h5 class="card-header">댓글:</h5>
          <div class="card-body">
            <form>
              <div class="form-group">
                <textarea class="form-control" rows="3"></textarea>
              </div>
              <button type="submit" class="btn btn-primary">작성완료</button>
            </form>
          </div>
        </div>

        <!-- Single Comment -->
        <div class="media mb-4">
          <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
          <div class="media-body">
            <h5 class="mt-0">댓글러1</h5>
            	잘 읽었습니다 
          </div>
        </div>

        <!-- Comment with nested comments -->
        <div class="media mb-4">
          <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
          <div class="media-body">
            <h5 class="mt-0">댓글러2</h5>
            	책 중간에 나오는 부분이 이해가 안돼요

            <div class="media mt-4">
              <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
              <div class="media-body">
                <h5 class="mt-0">댓글러3</h5>
                	어느 부분인지 구체적으로 말씀해 주시겠어요?
              </div>
            </div>

            <div class="media mt-4">
              <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
              <div class="media-body">
                <h5 class="mt-0">댓글러2</h5>
                214부터 227 페이지 까지의 내용이요
              </div>
            </div>

          </div>
        </div>

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
                    <a href="#">공지사항</a>
                  </li>
                  <li>
                    <a href="#">이벤트</a>
                  </li>
                  <li>
                    <a href="#">자유게시판</a>
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
  <%@include file="../inc/bottom.jsp" %>