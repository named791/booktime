<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../inc/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/register.css">
<title>회원등록</title>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.js"></script>
<script type="text/javascript">
	$('.form-check-input').prop('indeterminate', true)
</script>
<body>
<form class="needs-validation" novalidate method="post" action="<c:url value='/user/register.do'/>">

    <div class="col-md-4 mb-3">
      <label for="validationTooltip01">아이디</label>
      <input name="id" type="text" class="form-control" id="validationTooltip01" required>
      <div class="invalid-feedback">
        *아이디 중복확인을 해주세요
      </div>
    </div>
    
    <div class="col-md-4 mb-3">
      <label for="validationTooltip02">패스워드</label>
      <input name="pwd" type="text" class="form-control" id="validationTooltip02" required>
      <div class="invalid-feedback">
        *비밀번호는 영 대소문자 8-20자리까지 유효합니다.
      </div>
    </div>
    
    <div class="col-md-4 mb-3">
      <label for="validationTooltipUsername">이름</label>
      <input name="name" type="text" class="form-control" id="validationTooltipUsername" aria-describedby="validationTooltipUsernamePrepend" required>
      	<div class="invalid-feedback">
        *이름은 비워둘 수 없습니다.
      	</div>
    </div>
  
    <div class="col-md-4 mb-3">
      <label for="birth" id="forBirth">생년월일</label><br>
      <input type="date" id="birth">
    </div>
    
    <p class="custom-control-label">성별</p>
   	<div class="custom-control custom-radio custom-control-inline">
		 <input type="radio" id="customRadioInline1" name="customRadioInline1" class="custom-control-input">
		 <label class="custom-control-label" for="customRadioInline1">여성</label>
	</div>
	<div class="custom-control custom-radio custom-control-inline">
		 <input type="radio" id="customRadioInline2" name="customRadioInline1" class="custom-control-input">
		 <label class="custom-control-label" for="customRadioInline2">남성</label>
	</div>
    
    <div><input type="hidden" name="grade" value="일반회원"></div>
    
    <div class="form-row align-items-center">
    <div class="col-auto">
      <label class="sr-only" for="inlineFormInput">Name</label>
      <input type="text" class="form-control mb-2" id="inlineFormInput" placeholder="account..">
    </div>
    <div class="col-auto">
      <div class="input-group mb-2">
        <div class="input-group-prepend">
          <div class="input-group-text">@</div>
      	  <select class="custom-select mr-sm-2" id="inlineFormCustomSelect">
        	<option selected>선택하세요</option>
        	<option value="naver.com">naver.com</option>
        	<option value="etc">직접입력</option>
      	  </select>
        </div>
        <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="직접입력">
      </div>
    </div>
    <div class="custom-control custom-checkbox mb-3">
	    <input type="checkbox" class="custom-control-input" id="customControlValidation1" required>
	    <label class="custom-control-label" for="customControlValidation1">이메일 수신에 동의합니다.</label>
  	</div>
   </div> 
  	
  	
    <div class="col-md-3 mb-3">
      <label for="validationTooltip03">우편번호</label>
      <input type="text" class="form-control" id="validationTooltip03" required>
      <button type="button" class="btn btn-secondary">검색</button>
      <div class="invalid-tooltip">
        *우편번호를 입력해주세요
      </div>
    </div>
    <div class="col-md-6 mb-3">
      <label for="validationTooltip04">도로명주소</label>
      <input type="text" class="form-control" id="validationTooltip04" required>
      <div class="invalid-tooltip">
        *주소는 비워둘 수 없습니다.
      </div>
    </div>
    <div class="col-md-6 mb-3">
      <label for="validationTooltip05" style="display: none;">지번주소</label>
      <input type="hidden" class="form-control" id="validationTooltip05" required>
      <div class="invalid-tooltip">
        *주소는 비워둘 수 없습니다.
      </div>
    </div>
    <div class="col-md-6 mb-3">
      <label for="validationTooltip06">상세주소</label>
      <input type="text" class="form-control" id="validationTooltip06" required>
      <div class="invalid-tooltip">
        *주소는 비워둘 수 없습니다.
      </div>
    </div>
    <div class="form-group col-md-2">
    <label>휴대폰 번호</label>
    </div>
    <div class="form-row">
		<div class="form-group col-md-2">
	    <select id="h1" class="form-control">
	    	<option selected>010</option>
	        <option>...</option>
	    </select>
	    </div>
	    <div class="form-group col-md-2">
	    	<input type="text" class="form-control" id="h2">
	    </div>
	    <div class="form-group col-md-2">
	      	<input type="text" class="form-control" id="h3">
	    </div>
    </div>
  <button class="btn btn-secondary" type="submit">회원가입</button>
</form>
</body>
</html>
<%@include file="../inc/bottom.jsp" %>