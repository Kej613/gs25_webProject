<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��� �Ϸ�</title>
</head>
<style>
   .d2{
   background-color: black;
    padding:5px;
    }
    a {
    text-align:center; 
    text-decoration:none; 
    color: black; 
    margin:10px;
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
   <h1 style="text-align:center;"> ��ǰ����� �Ϸ� �Ǿ����ϴ�. </h1><br>
   <p style="text-align:center;"><a href="/main" >[��������]</a>
   <a href="/item" >[��ǰ�Ǹ�]</a>
   <a href="/item_register" >[��ǰ���]</a> </p>
</body>
</html>