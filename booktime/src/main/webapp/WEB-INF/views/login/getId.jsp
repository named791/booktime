<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- post방식으로 이메일, 아이디, 가입일을 가져옴 -->
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/icons/favicon.ico">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
<!--===============================================================================================-->
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function btOk() {
		self.close();
	}		
</script>
<style type="text/css">
#getIdForm{
	border-radius: 1px solid green;
}
#p1{
	font-size: 0.8em;
	color: red;
}
.div1 button{
	width: 300px;
}
.div1{
	text-align: center;	
}
</style>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
				<form class="login100-form validate-form flex-sb flex-w">
					<span class="login100-form-title p-b-51">
						아이디 찾기
					</span>
					<!-- if문 사용 -->
					<p id="p1">입력하신 E-mail 주소로 가입된 계정이 있습니다.</p>
					<div class="wrap-login100 p-t-50 p-b-90">
						<span>E-mail 주소</span>
						<div class="wrap-input100 validate-input m-b-16" data-validate = "Username is required">
							<label class="email">nohyelin96@naver.com</label>
						</div>
						<span>아이디</span>
						<div class="wrap-input100 validate-input m-b-16" data-validate = "Username is required">
							<label class="userid">nohyelin96</label>
						</div>
						<span>가입일</span>
						<div class="wrap-input100 validate-input m-b-16" data-validate = "Username is required">
							<label class="regdate">2015년 05월 25일</label>
						</div>
						<div class="div1">
						<button type="button" class="btn btn-info" onclick="btOk()">확인</button>
						</div>
					</div>
					
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

