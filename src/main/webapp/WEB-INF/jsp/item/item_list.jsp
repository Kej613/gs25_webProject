<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>items</title>
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
    	text-align: center;
    	
    }
    .btn-container {
    	background-color: #dcdcdc;
    	padding:60px;
    	display: flex;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
    
    }
    .d1 {
    	background-color:#dcdcdc;
    	padding:10px;
    }
     .d2{
   background-color:black;
   padding:5px;
    } 
 table {
 font-family: 'Pretendard-Regular';
    text-align:center;
    margin: 0 auto; /* ȭ�� ��� ������ ���� �߰��� �κ� */
}
th {
    background-color: skyblue; /* �ϴû� ����� ���� */
}
td {
    padding: 10px 20px; /* �� ������ �����ϴ� �κ� */
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
    <p style="text-align:left; color:white; font-size:20px;"><b><%= year %>�� <%= month %>�� <%= day %>��</b>
  </p>
   </div>
<div>
<h1 style=" font-family: 'Pretendard-Regular'; text-align:center"> ��ǰ ���� </h1></div>
<hr style="color:gray;"> <br><br> 
<div><br>
<table>
  <thead>
    <tr>
    <th>��ȣ </th>
      <th>��ǰ��</th>
      <th>����</th>
      <th>���</th>
      <th>ī�װ�</th>
      <th>�����</th>
      <th>����</th>
      <th>����</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="item" items="${items}" varStatus="status">
      <tr>
       <td>${status.index + 1}</td>
        <td>${item.name}</td>
        <td>${item.price}��</td>
        <td>${item.stock}</td>
        <td>${item.category}</td>
        <td>${item.wname}</td>
        <td><a style="color:white; background-color:black; "href="/edit/${item.name}">����</a></td>
     <td><a style="color:white; background-color:black; "href="/delete/${item.product_id}">����</a></td>
      </tr>
    </c:forEach>
  </tbody>
</table>
</div>
<div>
<a style="text-align: right;" href="/item">[��ǰ�Ǹ�]</a>
</div>
</body>
</html>