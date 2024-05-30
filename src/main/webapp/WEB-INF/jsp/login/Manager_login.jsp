<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>관리자페이지</title>
    <link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="d2">
<% 
        LocalDate currentDate = LocalDate.now();
        int year = currentDate.getYear();
        int month = currentDate.getMonthValue();
        int day = currentDate.getDayOfMonth();
    %>
    <p style="text-align:left; color:white;"><%= year %>년 <%= month %>월 <%= day %>일 </p>
    </div>
    <h1 style="text-align:center">관리자 페이지</h1>
  <div class="d1">
      <table>
        <tr>
        <td>	<p class="p1" ><a style="color:white; text-decoration:none;" href="/item" > 상품판매</a></p></td>
        <td>	<p class="p1" ><a style="color:white; text-decoration:none;" href="/item_register" > 상품등록</a></p></td>
        <td>	<p class="p1" ><a style="color:white; text-decoration:none;" href="/item_list" > 상품관리</a></p></td>
 
        </tr>
        <tr>
            <td><p class="p1"><a style="color:white; text-decoration:none;" href="/list" > 직원 리스트</a></p></td>
            <td><p class="p1"><a style="color:white; text-decoration:none;"href="/register/step2" > 직원 등록하기</a></p></td>
            <td><p class="p1"><a style="color:white; text-decoration:none;" href="/members" > 직원조회 </a></p></td>
        </tr>
        
    </table>
</div>
</body>
</html>