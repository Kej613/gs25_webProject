<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
<title>판매창</title>
<style>
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}

.d2 {
    background-color: black;
    padding: 5px;
}

table {
    font-family: 'Pretendard-Regular';
    text-align: center;
    margin: 0 auto;
}

th {
    background-color: skyblue;
}

td {
    padding: 10px 20px;
}

a {
    font-family: 'Pretendard-Regular';
    text-align: right;
    color: black;
    text-decoration: none;
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
    <p style="text-align:left; color:white; font-size:20px;"><b><%= year %>년 <%= month %>월 <%= day %>일</b></p>
</div>
<h1 style="font-family: 'Pretendard-Regular'; text-align:center">상품 판매 목록</h1>
<hr style="color:gray;"><br><br>
<table>
    <thead>
        <tr>
  			<th>상품아이디</th>
            <th>상품명</th>
            <th>가격</th>
            <th>수량</th>
            <th> 기타</th>
        </tr>
    </thead>
    <tbody>
        <c:set var="totalAmount" value="0" />
        <c:forEach var="cartItem" items="${cartItems}">
            <tr>
           		<td>${cartItem.id }</td>
                <td>${cartItem.name}</td>
                <td>${cartItem.price}원</td>
                <td>${cartItem.quantity}</td>
                <td><a style="color:white; background-color:black;" href="/cart/delete/${cartItem.id}">삭제</a></td>
            </tr>
            <c:set var="totalAmount" value="${totalAmount + (cartItem.price * cartItem.quantity)}" />
        </c:forEach>
    </tbody>
</table>
<br>

<p style="text-align:center;"><b> 총 구매금액: ${totalAmount} 원 </b></p>
<br>

<p style="text-align: center">
    <a style="text-align: right; font-size:20px; color: blue;" href="/item">[상품목록]</a>
    <a style="text-align: right; font-size:20px; color: blue;" href="/order" onclick="clearCart()">[결제하기]</a>
</p>

<script>
    function clearCart() {
        if (confirm("상품을 판매하시겠습니까?")) {
            window.location.href = "/clearCart";
        }
    }
</script>
</body>
</html>
