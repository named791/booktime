<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>  
<script src = "${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<div class="container">
	<br>
	<form>

	<div class="form-group"> <!-- Name field -->
		<label class="control-label " for="name">작성자</label>
		<input class="form-control" id="name" name="name" type="text"/>
	</div>
	
	<div class="form-group"> <!-- Email field -->
		<label class="control-label requiredField" for="email">비밀번호</label>
		<input class="form-control" id="pwd" name="pwd" type="password"/>
	</div>
	
	<div class="form-group"> <!-- Subject field -->
		<label class="control-label " for="subject">제목</label>
		<input class="form-control" id="subject" name="subject" type="text"/>
	</div>
	
	<div class="form-group"> <!-- Message field -->
		<label class="control-label " for="message">내용</label>
		<textarea class="form-control" cols="40" id="message" name="message" rows="10"></textarea>
	<script>
    window.onload = function(){
       ck = CKEDITOR.replace("message");
    };
    </script>	
	</div>
	
	<div class="form-group">
		<button class="btn btn-primary " name="submit" type="submit">글 올리기</button>
		<button class="btn btn-primary " name="btn" type="button">취소</button>
	</div>
	
</form>	
</div>
<%@include file="../inc/bottom.jsp" %>