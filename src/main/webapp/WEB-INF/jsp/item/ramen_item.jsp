<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>라면</title>
<style>
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
   }
        a {
   		 font-family: 'Pretendard-Regular';
    	text-decoration:none; 
		margin:10px;
    	color:black;
    	text-align: center;
    	font-size:20px;

    }
        .btn-container {
          background-color:#dcdcdc;
    	padding:60px;
    	display: flex;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
    
    }
     .d1 {
    	background-color:#8CBDED;
    	padding:20px;
    	text-align:center;
		  justify-content: center;
		  align-items: center;
    }
      .d2{
   background-color:black;
   padding:3px;
    } 
         table {
 font-family: 'Pretendard-Regular';
    text-align:center;
    margin: 0 auto; /* 화면 가운데 정렬을 위해 추가된 부분 */
}
    </style>
</head>
<body>
<div>
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
<h1 style=" font-family: 'Pretendard-Regular'; text-align:center"> 상품 판매 </h1></div>
<p style="text-align:right; color: blue;"><a style="text-align:right;color:blue;"href="/item_list">상품관리</a></p>
<p style="text-align:right; color: blue;"><a style="text-align:right;color:blue;"href="/cart">구매상품목록</a></p>
<div class="d1">
			<a href="/item">전체</a>
			<a href="/item/frozen_item" >냉동식품</a>
			<a href="/item/refriger_item"  >냉장식품</a>
			<a href="/item/dairy_item"  >유제품</a>
			<a href="/item/drink_item" >음료/주류</a>
			<a href="/item/snack_item" >스낵</a>
			<a href="/item/ramen_item">라면</a>
</div>
	<table  class="btn-container">
<c:forEach var="item"  items="${ramen_item}" varStatus="status">
<c:if test="${item.category eq '라면'}">
            <c:if test="${status.index % 6 == 0}">
                <tr>
            </c:if>
            <td>
                <p style="font-size: 20px; text-align: center; color: black; padding: 20px; background-color: white; border-radius: 5px; margin: 20px;">
                    <b>${item.name}</b><br>
                    ${item.price}원 </p>
                <form action="/cart/add" method="post">
                <input type="hidden" name="id" value="${item.product_id }"/>
                    <input type="hidden" name="name" value="${item.name}" />
                    <input type="hidden" name="price" value="${item.price}" />
                    수량: <input style="text-align: center;" type="text" name="quantity" size="2" value="1" />
                    <input style="text-align: center;" type="submit" value="선택">
                </form>
            </td>
            <c:if test="${(status.index + 1) % 6 == 0}">
                </tr>
            </c:if>
        </c:if>
    </c:forEach>
</table>
</body>
</html>