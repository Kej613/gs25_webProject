<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 변경</title>
<link href="${pageContext.request.contextPath}/resources/css/register.css" rel="stylesheet" type="text/css">

</head>

<style>
   .d2{
   background-color: black;
    padding:8px;
    }</style>
<body>
<div class="d2">
<% 
        LocalDate currentDate = LocalDate.now();
        int year = currentDate.getYear();
        int month = currentDate.getMonthValue();
        int day = currentDate.getDayOfMonth();
    %>
    <p style="text-align:left; color:white; font-size:20px;"><b><%= year %>년 <%= month %>월 <%= day %>일</b>
  </p>
   </div>
	<h1 style="font-size:30px; text-align:center;">비밀번호 변경</h1><hr style="border:2px">
<form action="/edit/changePassword" method="post"> <!-- Specify the form action -->
				<div class="form-group" >
		<label for="currentPassword">현재 비밀번호: </label><br>
	    <input type="password" id="currentPassword" name="currentPassword" /><br></div>
	    <c:if test="${not empty currentPasswordErrors}">
	        <span class="error">${currentPasswordErrors}</span>
	    </c:if>
	    	<div class="form-group" >
	    <label for="newPassword">새 비밀번호: </label><br>
	   <input type="password" id="newPassword" name="newPassword" /><br></div>
		<c:if test="${not empty newPasswordErrors}">
			<span class="error">${newPasswordErrors}</span><br>
		</c:if>
		<div class="form-group" >
		<input type="submit" id="btn" value="변경하기" /></div>
	</form>
</body>
</html>