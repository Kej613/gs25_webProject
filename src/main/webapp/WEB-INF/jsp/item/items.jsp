<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ǸŻ�ǰ</title>
<style>
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
   }

    .btn-item {
        font-family: 'Pretendard-Regular';
        margin: 30px;
        padding: 30px;
        border: 1px solid #ccc;
        border-radius: 5px;
        text-align: center;
        text-decoration: none;
        color: #333;
        background-color: #f5f5f5;
        font-size: 18px;
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
    margin: 0 auto; /* ȭ�� ��� ������ ���� �߰��� �κ� */
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
    <p style="text-align:left; color:white; font-size:18px;"><b><%= year %>�� <%= month %>�� <%= day %>��</b>
  </p>
   </div>
<div>
<h1 style=" font-family: 'Pretendard-Regular'; text-align:center"> ��ǰ �Ǹ� </h1>
<p style="text-align:right; color: blue;"><a style="text-align:right;color:blue;"href="/item_list">��ǰ����</a></p>
<p style="text-align:right; color: blue;"><a style="text-align:right;color:blue;"href="/cart">���Ż�ǰ���</a></p>
</div>
<div class="d1">
			<a href="/item"><b>��ü</b></a>
			<a href="/item/frozen_item" >�õ���ǰ</a>
			<a href="/item/refriger_item" >�����ǰ</a>
			<a href="/item/dairy_item" >����ǰ</a>
			<a href="/item/drink_item">����/�ַ�</a>
			<a href="/item/snack_item" >����</a>
			<a href="/item/ramen_item">���</a>
</div>
<table class="btn-container">
    <c:forEach var="item" items="${items}" varStatus="status">
        <c:if test="${status.index % 6 == 0}">
            <tr>
        </c:if>
        <td>
            <p style="font-size: 20px; text-align: center; color: black; padding: 20px; background-color: white; border-radius: 5px; margin: 20px;">
                <b>${item.name}</b><br>
                ${item.price}�� </p>
                <form action="/cart/add" method="post">
                	<input type="hidden" name="id" value="${item.product_id }"/>
                    <input type="hidden" name="name" value="${item.name}" />
                    <input type="hidden" name="price" value="${item.price}" />
                    ����: <input style="text-align: center;"type="text" name="quantity" size="2" value="1" /> 
                    <input style="text-align:center;" type="submit" value="����" onclick="clearCart()">
                </form>
        </td>
        <c:if test="${(status.index + 1) % 6 == 0}">
            </tr>
        </c:if>
    </c:forEach>
</table>
<script>
    function clearCart() {
        if (confirm("�ش� ��ǰ�� �����Ͻðڽ��ϱ� ?")) {
            window.location.href = "/clearCart()";
        }
    }
</script>
</body>
</html>