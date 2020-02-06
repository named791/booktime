<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp" %>

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="#">관리 홈</a>
          </li>
          <li class="breadcrumb-item active">주문관리</li>
        </ol>

        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            주문 목록</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>구분</th>
                    <th>아이디</th>
                    <th>주문 번호</th>
                    <th>도로명 주소</th>
                    <th>상세 주소</th>
                    <th>우편번호</th>
                    <th>결제일</th>
                    <th>취소일</th>
                    <th>주문 가격</th>
                    <th>주문상세</th>
                    <th>진행사항</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <th>구분</th>
                    <th>아이디</th>
                    <th>주문 번호</th>
                    <th>도로명 주소</th>
                    <th>상세 주소</th>
                    <th>우편번호</th>
                    <th>결제일</th>
                    <th>취소일</th>
                    <th>주문 가격</th>
                    <th>주문상세</th>
                    <th>진행사항</th>
                  </tr>
                </tfoot>
                <tbody>
                  <tr>
                    <td>회원</td>
                    <td>userid</td>
                    <td>1234</td>
                    <td>서울시 서초구 강남동 11-22</td>
                    <td>서울시 서초구 강남대로 11길</td>
                    <td>서울시 서초구 강남대로 11길</td>
                    <td>2020/01/02</td>
                    <td></td>
                    <td>48,000원</td>
                    <td>
                    <a class="btn btn-info"
					href="#"
					role="button">주문상세</a>
					</td>
                    <td>
                    <select class="form-control">
					  <option>결제 대기</option>
					  <option>결제 완료</option>
					  <option>배송중</option>
					  <option>배송 완료</option>
					  <option>교환/환불 완료</option>
					</select>
					<a class="btn btn-info"
					href="#"
					role="button">저장</a>
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