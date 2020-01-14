<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../inc/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 약관</title>
</head>
<script type="text/javascript" 
src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.js"></script>
<script type="text/javascript"> 
	function send(frmAgree){ 
		if(!frmAgree.chkAgree.checked){ 
			alert("약관에 동의하셔야 합니다!!"); 
			frmAgree.chkAgree.focus(); 
			return false; 
		}
		return true;
	} 
</script>
<body>
<h2>회원 약관</h2><br> 
<iframe src="<c:url value='/user/provision.do'/>" width="900px" height="300px" ></iframe> 
<br><br>
<div style="width:700px"> 
	<form id="frmAgree" name="frmAgree" method="post" 
	action='<c:url value="/user/register.do"/>' 
	onsubmit="return send(this)"> 
	<div style="text-align:right"> 
		<input type="checkbox" name="chkAgree" id="chkAgree"> 
		<label for="chkAgree">약관에 동의합니다.</label> 
	</div> 
	<div style="text-align:center"> 
		<input type="submit" value="확인" > 
		<input type="reset" value="취소">
	</div>
	</form>
</div>
</body>
</html>
<%@include file="../inc/bottom.jsp" %>