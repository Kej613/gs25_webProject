<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
<title>상품 등록</title>
<link href="${pageContext.request.contextPath}/resources/css/register.css" rel="stylesheet" type="text/css">
</head>
<style>
   .d2{
   background-color: black;
    padding:8px;
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
	<h1 style="font-size:30px; text-align:center;">상품 등록하기</h1><hr style="border:2px">
		<form action="/item_register_success" method="post">
		<div class="form-group" >
		<p> <label>상품이름:<br>
		<input type="text" name="name" id="name" value="${item_registerRequest.name}">
		</label> </p></div>
		<div class="form-group" >
		<p> <label>상품가격:<br>
		<input type="text" name="price" id="price" value="${item_registerRequest.price}">
		</label> </p></div>
		<div class="form-group" >
		<p> <label>입고수량:<br>
		<input type="text" name="stock" id="stock" value="${item_registerRequest.stock }">
		</label> </p></div>
		<div class="form-group" >
		<p> <label> 카테고리:<br>
		<select name="category"  id="category" >
							<option value="냉장식품">냉장식품</option>
							<option value="냉동식품">냉동식품</option>
							<option value="유제품">유제품</option>
							<option value="음료/주류">음료/주류</option>
							<option value="스낵">스낵</option>
							<option value="라면">라면</option>
						</select>
		</label> </p></div>
		<div class="form-group" >
		<p> <label> 등록자:<br>
		<input type="text" name="wname" id="wname" value="${item_registerRequest.wname}">
		</label> </p></div>
		<div class="form-group" >
		<input type="submit"  id="btn"  value="등록하기"></div>
</form>
</body>
</html>