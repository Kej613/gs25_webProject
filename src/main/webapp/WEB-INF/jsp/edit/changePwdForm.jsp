<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��й�ȣ ����</title>
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
    <p style="text-align:left; color:white; font-size:20px;"><b><%= year %>�� <%= month %>�� <%= day %>��</b>
  </p>
   </div>
	<h1 style="font-size:30px; text-align:center;">��й�ȣ ����</h1><hr style="border:2px">
<form action="/edit/changePassword" method="post"> <!-- Specify the form action -->
				<div class="form-group" >
		<label for="currentPassword">���� ��й�ȣ: </label><br>
	    <input type="password" id="currentPassword" name="currentPassword" /><br></div>
	    <c:if test="${not empty currentPasswordErrors}">
	        <span class="error">${currentPasswordErrors}</span>
	    </c:if>
	    	<div class="form-group" >
	    <label for="newPassword">�� ��й�ȣ: </label><br>
	   <input type="password" id="newPassword" name="newPassword" /><br></div>
		<c:if test="${not empty newPasswordErrors}">
			<span class="error">${newPasswordErrors}</span><br>
		</c:if>
		<div class="form-group" >
		<input type="submit" id="btn" value="�����ϱ�" /></div>
	</form>
</body>
</html>