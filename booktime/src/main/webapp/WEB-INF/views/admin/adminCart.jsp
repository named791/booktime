<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="inc/top.jsp" %>

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="<c:url value="/admin/adminMain.do"/>">관리 홈</a>
          </li>
          <li class="breadcrumb-item active">주문관리</li>
        </ol>

        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            	주문 목록
          </div>
          
          <div class="card-body">
            <div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
				<thead>
					<tr>
						<th>구분</th>
						<th>아이디</th>
						<th>주문 번호</th>
						<th>지번 주소</th>
						<th>도로명 주소</th>
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
						<th>지번 주소</th>
						<th>도로명 주소</th>
						<th>결제일</th>
						<th>취소일</th>
						<th>주문 가격</th>
						<th>주문상세</th>
						<th>진행사항</th>
					</tr>
				</tfoot>
				<tbody>
					<c:forEach var="vo" items="${list}">
						<tr>
							<td>
								<c:if test="${vo.nonMember!='0' }">비회원</c:if>
								<c:if test="${vo.nonMember=='0' }">회원</c:if>
							</td>
							<td>
								<c:if test="${fn:indexOf(vo.userid,'#')>=0}">
									비회원
								</c:if>
								<c:if test="${fn:indexOf(vo.userid,'#')<0}">
									${vo.userid }
								</c:if>
							</td>
							<td>
								${vo.payNo }
								<c:if test="${vo.nonMember!='0'}">
								<br>(비회원용 : ${vo.nonMember })
								</c:if>
							</td>
							<td>${vo.parselAddress}<br>${vo.addressDetail }</td>
							<td>${vo.newAddress }<br>${vo.addressDetail }</td>
							<td>
								<fmt:formatDate value="${vo.payDate }" pattern="yyyy년 MM월 dd일"/>
								<fmt:formatDate value="${vo.payDate }" pattern="a hh시 mm분 ss초"/>
							</td>
							<td>
								<fmt:formatDate value="${vo.cancleDate }" pattern="yyyy년 MM월 dd일"/>
								<fmt:formatDate value="${vo.cancleDate }" pattern="a hh시 mm분 ss초"/>
							</td>
							<td><fmt:formatNumber value="${vo.price }" pattern="#,###"/>원</td>
							<td><a class="btn btn-info" href="#" role="button">주문상세</a>
							</td>
							<td>
								<select class="form-control">
									<option>결제대기</option>
									<option>결제완료</option>
									<option>배송중</option>
									<option>배송완료</option>
									<option>교환 신청중</option>
									<option>환불 신청중</option>
									<option>교환 처리됨</option>
									<option>환불 처리됨</option>
									<option>구매확정</option>
								</select>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
            <div class="col text-center">
            <a class="btn btn-info"
					href="#"
					role="button">진행사항 변경 저장</a>
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