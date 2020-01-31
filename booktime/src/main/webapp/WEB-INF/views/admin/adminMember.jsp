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
					<c:if test="${empty list}">
						<td colspan="8">회원 조회결과가 없습니다.</td>
					</c:if>

					<!-- 자유게시판 반복문 시작 -->
					<c:if test="${!empty list}">
						<c:forEach var="vo" items="${list }">
							<tr>
								<td>${vo.name }</td>
								<td>${vo.userid }</td>
								<td>${vo.email1 }</td>
								<td>${vo.phone }</td>
								<td>${vo.zipcode }</td>
								<td>${vo.birth }</td>
					<th>
                    <a class="btn btn-info"
					href="#"
					role="button">수정</a>
					</th>
                    <th>
                    <a class="btn btn-danger"
					href="#"
					role="button">탈퇴</a>
					</th>		
							</tr>
						</c:forEach>
					</c:if>
					<!-- 자유게시판 반복문 끝 -->
				</tbody>
                  </tbody>
              </table>
            </div>
            <div class="col text-center">
        <a class="btn btn-info"
					href="${pageContext.request.contextPath}/admin/adminMemberExport.do"
					role="button">엑셀 파일로 받기</a>
        </div>
          </div>
          <div class="card-footer small text-muted">마지막 업데이트 11:59 PM</div>
        </div>

      </div>
      <!-- /.container-fluid -->

     <%@ include file="inc/bottom.jsp" %>