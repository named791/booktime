<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp" %>

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="#">관리 홈</a>
          </li>
          <li class="breadcrumb-item active">회원관리</li>
        </ol>

        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            회원 목록</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>이름</th>
                    <th>아이디</th>
                    <th>이메일</th>
                    <th>전화번호</th>
                    <th>주소</th>
                    <th>생년월일</th>
                    <th>수정</th>
                    <th>탈퇴</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <th>이름</th>
                    <th>아이디</th>
                    <th>이메일</th>
                    <th>전화번호</th>
                    <th>주소</th>
                    <th>생년월일</th>
                    <th>수정</th>
                    <th>탈퇴</th>
                  </tr>
                </tfoot>
                <tbody>
                  <tr>
                    <td>홍길동</td>
                    <td>userid</td>
                    <td>hong@naver.com</td>
                    <td>010-8888-9999</td>
                    <td>서울시 서초구 강남대로 11길</td>
                    <td>1976/07/30</td>
                    <td>
                    <a class="btn btn-info"
					href="#"
					role="button">수정</a>
					</td>
                    <td>
                    <a class="btn btn-danger"
					href="#"
					role="button">탈퇴</a>
					</td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="col text-center">
        <a class="btn btn-info"
					href="#"
					role="button">엑셀 파일로 받기</a>
        </div>
          </div>
          <div class="card-footer small text-muted">마지막 업데이트 11:59 PM</div>
        </div>

      </div>
      <!-- /.container-fluid -->

     <%@ include file="inc/bottom.jsp" %>