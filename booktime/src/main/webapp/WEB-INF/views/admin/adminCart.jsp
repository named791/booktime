<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="inc/top.jsp" %>

<style type="text/css">
	.table td, .table thead th, .table tfoot th{
		text-align: center;
		vertical-align: middle;
	}
	.details{
		border: 2px solid lightGray;
		text-align: center;
		vertical-align: middle;
		position: absolute;
		background-color: white;
		display: none;
		width: 80%;
	}
	
	
</style>
<script type="text/javascript">
	$(function(){
		$(".card-body").fadeIn();
		
		$(".detailLink").click(function(){
			var payNo = $(this).parent().next("input[name=payNo]").val();
		});
		
		$("#dataTable tbody").on("change", "tr select", function(){
			var tr = $(this).parents("tr");
			
			tr.find("input[type=checkbox]").prop("checked",true);
			tr.css("background-color","#fffbc5");
			
			if($(this).val()=='구매확정'){
				var point = tr.find(".details .savePoint").text();
				
				tr.find(".savingPoint").val(Number(point.replace(",","") ) );
			}
		});
		
		$("#dataTable tbody").on("mousedown", "a.detailLink", function(){
			$(this).next(".details").show();
		});
		$("#dataTable tbody").on("mouseup", "a.detailLink", function(){
			$(this).next(".details").hide();
		});
		
		$(".changer").click(function(){
			var cnt = $("input[type=checkbox]:checked").length;
			
			if(confirm("현재 페이지의 "+cnt+"개의 데이터만 수정됩니다.")){
				
				var frmData = $("form[name=frm]").serialize();
				
				alert(frmData);
				$.ajax({
					data: frmData,
					url : "<c:url value='/admin/adminCartEdit.do'/>",
					type:"POST",
					dataType: "text",
					success: function(res){
						if(parseInt(res)>0){
							
						}
					},
					error:function(xhr, status, error){
						alert("ERROR!!"+xhr.status);
					}
					
				});
				
				//성공시
				$("tr").css("background-color", "")
					.find("input[type=checkbox]").prop("checked", false);
			}
		});
	});
	
</script>

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
          
          <div class="card-body" style="display: none;">
            <div class="table-hover">
            <form name="frm">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>번호</th>
							<th>아이디</th>
							<th>주문 번호<br><small>(비회원 주문번호)</small></th>
							<th>도로명 주소<br><small>(지번)</small></th>
							<th>결제일</th>
							<th>취소일</th>
							<th>주문 가격(원)</th>
							<th>진행사항</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>번호</th>
							<th>아이디</th>
							<th>주문 번호<br><small>(비회원 주문번호)</small></th>
							<th>도로명 주소<br><small>(지번)</small></th>
							<th>결제일</th>
							<th>취소일</th>
							<th>주문 가격(원)</th>
							<th>진행사항</th>
						</tr>
					</tfoot>
					<tbody>
						<c:forEach var="vo" items="${list}" varStatus="i">
							<tr>
								<td class="align-middle">${i.count}</td>
								<td class="align-middle">
									<c:if test="${fn:indexOf(vo.userid,'#')>=0}">
										비회원
									</c:if>
									<c:if test="${fn:indexOf(vo.userid,'#')<0}">
										${vo.userid }
									</c:if>
								</td>
								<td class="align-middle">
									<div>
										<a class="detailLink btn">
											${vo.payNo }
											<c:if test="${vo.nonMember!='0'}">
												<br><small>(${vo.nonMember })</small>
											</c:if>
										</a>
										<div class="details">
											<c:import url="/payment/paymentWindow.do?payNo=${vo.payNo }"/>
										</div>
									</div>
									<input type="checkbox" value="${vo.payNo}" hidden="true"
										name="voList[${i.index}].payNo" >
								</td>
								<td class="align-middle">${vo.newAddress }<br><small>(${vo.parselAddress})</small><br>${vo.addressDetail }</td>
								<td class="align-middle">
									<fmt:formatDate value="${vo.payDate }" pattern="yyyy년 MM월 dd일"/><br>
									<small><fmt:formatDate value="${vo.payDate }" pattern="a hh시 mm분 ss초"/></small>
								</td>
								<td class="align-middle">
									<div class="text-danger">
										<fmt:formatDate value="${vo.cancleDate }" pattern="yyyy년 MM월 dd일"/><br>
										<small><fmt:formatDate value="${vo.cancleDate }" pattern="a hh시 mm분 ss초"/></small>
									</div>
								</td>
								<td class="align-middle">
									<fmt:formatNumber value="${vo.price }" pattern="#,###"/><br>
									<c:if test="${vo.usePoint>0 }">
										<small class="text-danger">(<fmt:formatNumber value="${vo.usePoint}" pattern="#,###"/>P 사용)</small>
										
										<input type="hidden" name="mList[${i.index}].payNo" value="${vo.payNo }">
										<input type="hidden" name="mList[${i.index}].usePoint" value="${vo.usePoint }">
										<input type="hidden" name="mList[${i.index}].reason" value="환불 반환">
									</c:if>
								</td>
								<td class="align-middle">
										<select class="form-control" name="voList[${i.index}].progress" 
											<c:if test="${vo.progress=='구매확정' }"> disabled="disabled"</c:if>>
												<option <c:if test="${vo.progress=='결제대기' }">selected="selected"</c:if>
													value="결제대기">결제대기</option>
												<option <c:if test="${vo.progress=='결제완료' }">selected="selected"</c:if>
													value="결제완료">결제완료</option>
												<option <c:if test="${vo.progress=='배송중' }">selected="selected"</c:if>
													value="배송중">배송중</option>
												<option <c:if test="${vo.progress=='배송완료' }">selected="selected"</c:if>
													value="배송완료">배송완료</option>
												<option <c:if test="${vo.progress=='교환 신청중' }">selected="selected"</c:if>
													value="교환 신청중">교환 신청중</option>
												<option <c:if test="${vo.progress=='환불 신청중' }">selected="selected"</c:if>
													value="환불 신청중">환불 신청중</option>
												<option <c:if test="${vo.progress=='환불 처리됨' }">selected="selected"</c:if>
													value="환불 처리됨">환불 처리됨</option>
												<option <c:if test="${vo.progress=='구매확정' }">selected="selected"</c:if>
													value="구매확정" >구매확정</option>
										</select>
									<input type="hidden" class="savingPoint" name="mList[${i.index}].savingPoint" value="0">
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
            <div class="col text-center">
            <a class="btn btn-info changer"
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