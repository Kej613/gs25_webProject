<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �Ϸ�</title>
<link href="${pageContext.request.contextPath}/resources/css/register.css" rel="stylesheet" type="text/css">
</head>
<style>
   .d2{
   background-color: black;
    padding:8px;
    }
    a {
    text-align:center; 
    text-decoration:none; 
    color: black;
    } 
    </style>
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
<h1> ��й�ȣ ������ �Ϸ��߽��ϴ�. </h1>
<a href="/logout" > [�ٽ� �α����ϱ�]</a>
</body>
</html>