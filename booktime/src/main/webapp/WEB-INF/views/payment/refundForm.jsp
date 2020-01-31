<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교환/환불 신청</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<style type="text/css">
	.page{
		border-radius: 10px;
		margin: 5% 0;
	}
</style>
<script type="text/javascript" src="../resources/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$("a.btn").click(function(){
			if($(this).text()=='닫기'){
				self.close();
			}else if($(this).text()=='제출'){
				var ck = $("input[name=reason]:checked");
				
				if(ck.length<1){
					alert("신청 사유를 선택해 주세요.");
					$("inpu[name=reason]").focus();
					return;
				}
				var ta = $("textarea[name=message]");
				ta.val("/"+ck.val()+" 사유 : "+ta.val()+"/");
				
				//ajax로 update처리하고 닫기
				opener.location.reload();
				self.close();
			}
		});
	});
</script>
</head>
<body class="bg-info">
	<div class="container">
		<div class="container page" style="width: 100%;background-color: white;">
			<div class="page-header pt-2">
				<h2>교환/환불 신청서 작성</h2>
				<small class="text-danger">▶ 교환이나 환불 사유를 작성해주세요.</small><br>
				<small class="text-danger">▶ 정당한 이유없이 교환/환불 신청시 거절될 수 있습니다.</small>
				<hr>
			</div>
			
			<div class="form-group align-middle pb-3">
				<b>신청 사유 : </b>&nbsp;
				
				<label class="radio-inline">
					<input type="radio" name="reason" value="교환"> 교환
				</label>
				<label class="radio-inline">
					<input type="radio" name="reason" value="환불"> 환불
				</label>
				
				<textarea name="message" class="form-control" 
					rows="10" style="width: 100%;resize: none;"></textarea>
				<div class="text-center mt-2">
					<a href="#" class="btn btn-danger">닫기</a>
					<a href="#" class="btn btn-info">제출</a>
				</div>
				<input type="text" name="payNo" value="${param.payNo}">
				<input type="text" name="savingPoint" value="${param.savingPoint }">
				<input type="text" name="progress" value="교환/환불 신청중">
			</div>
		</div>
	</div>
</body>
</html>