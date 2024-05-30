<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
<title>�Ǹ�â</title>
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
    <p style="text-align:left; color:white; font-size:20px;"><b><%= year %>�� <%= month %>�� <%= day %>��</b></p>
</div>
<h1 style="font-family: 'Pretendard-Regular'; text-align:center">��ǰ �Ǹ� ���</h1>
<hr style="color:gray;"><br><br>
<table>
    <thead>
        <tr>
  			<th>��ǰ���̵�</th>
            <th>��ǰ��</th>
            <th>����</th>
            <th>����</th>
            <th> ��Ÿ</th>
        </tr>
    </thead>
    <tbody>
        <c:set var="totalAmount" value="0" />
        <c:forEach var="cartItem" items="${cartItems}">
            <tr>
           		<td>${cartItem.id }</td>
                <td>${cartItem.name}</td>
                <td>${cartItem.price}��</td>
                <td>${cartItem.quantity}</td>
                <td><a style="color:white; background-color:black;" href="/cart/delete/${cartItem.id}">����</a></td>
            </tr>
            <c:set var="totalAmount" value="${totalAmount + (cartItem.price * cartItem.quantity)}" />
        </c:forEach>
    </tbody>
</table>
<br>

<p style="text-align:center;"><b> �� ���űݾ�: ${totalAmount} �� </b></p>
<br>

<p style="text-align: center">
    <a style="text-align: right; font-size:20px; color: blue;" href="/item">[��ǰ���]</a>
    <a style="text-align: right; font-size:20px; color: blue;" href="/order" onclick="clearCart()">[�����ϱ�]</a>
</p>

<script>
    function clearCart() {
        if (confirm("��ǰ�� �Ǹ��Ͻðڽ��ϱ�?")) {
            window.location.href = "/clearCart";
        }
    }
</script>
</body>
</html>
