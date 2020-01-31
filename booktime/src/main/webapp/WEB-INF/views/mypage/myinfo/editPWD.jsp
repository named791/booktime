<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function(){
		$("#btn2").click(function(){
			if($("#originPwd").val().length>0 && $("#newPwd").val().length>0 && $("#newPwdOk").val().length>0){
				if($("#newPwd").val()!=$("#newPwdOk").val()){
					alert("새로운 비밀번호를 확인해주세요!");
					event.preventDefault();
					$("#newPwd").focus();
				}
			}
		});
	});
</script>
</head>
<body>
<form class="frmpwd" name="frmpwd" method="post" action="<c:url value='/mypage/myinfo/editPwd.do'/>">
	<div id="editform">
		<div class="pwdChk">
			<p id="p2">비밀번호 수정</p>
			<fieldset id="editPWD1">
				<label><img src="<c:url value='/resources/images/icons/check.png'/>">기존 비밀번호</label>
				<input type="password" id="originPwd" name="originPwd" required>
			</fieldset>
			
			<fieldset id="editPWD2">
				<label><img src="<c:url value='/resources/images/icons/check.png'/>">새 비밀번호</label>
				<input type="password" id="newPwd" name="newPwd" required>
			</fieldset>
			
			<fieldset id="editPWD3">
				<label><img src="<c:url value='/resources/images/icons/check.png'/>">새 비밀번호 확인</label>
				<input type="password" id="newPwdOk" required>
			</fieldset>
			<fieldset id="causion">
				<p id="sub"><strong>주의하세요!</strong>
			아이디와 같은 비밀번호나 주민등록번호, 생일, 학번, 전화번호 등 개인정보와 관련된 숫자나 연속된 숫자,
			통일 반복된 숫자 등 다른 사람이 쉽게 알아 낼 수 있는 비밀번호는 사용하지 않도록 주의하여 주시기 바랍니다.</p>
			</fieldset>
			<button type="submit" id="btn2">비밀번호 변경</button>
		</div>
	</div>
</form>
</body>
</html>