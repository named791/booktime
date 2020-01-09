<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp" %>

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="#">관리 홈</a>
          </li>
          <li class="breadcrumb-item active">이벤트 관리</li>
        </ol>

        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            이벤트 목록</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>글번호</th>
                    <th>아이디</th>
                    <th>카테고리</th>
                    <th>제목</th>
                    <th>작성일</th>
                    <th>수정</th>
                    <th>삭제</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <th>글번호</th>
                    <th>아이디</th>
                    <th>카테고리</th>
                    <th>제목</th>
                    <th>작성일</th>
                    <th>수정</th>
                    <th>삭제</th>
                  </tr>
                </tfoot>
                <tbody>
                  <tr>
                    <td>1</td>
                    <td>userid</td>
                    <td>이벤트</td>
                    <td>
                    <a href="#">12월 신간도서 리뷰 이벤트</a>
                    </td>
                    <td>2019/11/25</td>
                    <td>
                    <a class="btn btn-info"
					href="#"
					role="button">수정</a>
					</td>
					<td>
                    <a class="btn btn-danger"
					href="#"
					role="button">삭제</a>
					</td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="col text-center">
            <a class="btn btn-info"
					href="#"
					role="button">새 이벤트 작성하기</a>
        <a class="btn btn-info"
					href="#"
					role="button">마일리지 지급하기</a>
        </div>
          </div>
          <div class="card-footer small text-muted">마지막 업데이트 11:59 PM</div>
        </div>

      </div>
      <!-- /.container-fluid -->

     <%@ include file="inc/bottom.jsp" %>