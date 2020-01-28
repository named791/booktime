<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin.css" rel="stylesheet">
</head>
<body class="bg-dark">

  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">관리자 로그인</div>
      <div class="card-body">
        <form>
          <div class="form-group">
              <input type="text" id="userid" class="form-control" placeholder="아이디" required="required" autofocus="autofocus">

          </div>
          <div class="form-group">
              <input type="password" id="inputPassword" class="form-control" placeholder="비밀번호" required="required">
            </div>
          </div>
          <div class="form-group">
            <div class="checkbox">
              <label>
                <input type="checkbox" value="아이디 저장하기" id="idSave">
                아이디 저장하기
              </label>
            </div>
          </div>
          <a class="btn btn-primary btn-block" href="${pageContext.request.contextPath}/admin/adminLogin.do">로그인</a>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="${pageContext.request.contextPath}/index.do">사용자 홈페이지로</a>
          <a class="d-block small" href="${pageContext.request.contextPath}/admin/adminPassword.do">비밀번호를 잊었나요?</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="<c:url value='/resources/vendor/jquery/jquery.min.js' />"></script>
  <script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>

  <!-- Core plugin JavaScript-->
  <script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js' />"></script>

</body>
</html>