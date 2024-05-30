<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>등록 완료</title>
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
    <p style="text-align:left; color:white; font-size:20px;"><b><%= year %>년 <%= month %>월 <%= day %>일</b>
  </p>
   </div>
   <h1 style="text-align:center;"> 상품등록이 완료 되었습니다. </h1><br>
   <p style="text-align:center;"><a href="/main" >[메인으로]</a>
   <a href="/item" >[상품판매]</a>
   <a href="/item_register" >[상품등록]</a> </p>
</body>
</html>