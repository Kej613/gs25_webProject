<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
    <title>상품수정</title>
    <link href="${pageContext.request.contextPath}/resources/css/register.css" rel="stylesheet" type="text/css">
    <style>
         .d2{
				   background-color: black;
				    padding:8px;
    }
    </style>
</head>
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
    <h1 style="font-size:30px; text-align:center;">상품 수정</h1><hr style="border:2px">
    <form action="/edit/${item.name}" method="post">
    <div class="form-group" >
        <label for="name">상품 이름:</label>
        <input type="text" id="name" name="name" value="${item.name}" required><br></div>
        <div class="form-group" >
        <label for="price">가격:</label>
        <input type="text" id="price" name="price" value="${item.price}" required><br></div>
        <div class="form-group" >
        <label for="stock">재고:</label>
        <input type="text" id="stock" name="stock" value="${item.stock}" required><br></div>
       <div class="form-group" >
        <label for="category">카테고리:</label>
        		<select name="category"  id="category" >
							<option value="냉장식품">냉장식품</option>
							<option value="냉동식품">냉동식품</option>
							<option value="유제품">유제품</option>
							<option value="음료/주류">음료/주류</option>
							<option value="스낵">스낵</option>
							<option value="라면">라면</option>
						</select> <br></div>
       <div class="form-group" >
        <label for="wname">등록자:</label>
        <input type="text" id="wname" name="wname" value="${item.wname}" required><br></div>
         <div class="form-group" >
        <input type="submit" id="btn" value="저장"></div>
    </form>
</body>
</html>
