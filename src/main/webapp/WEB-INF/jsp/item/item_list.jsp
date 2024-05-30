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
    margin: 0 auto; /* 화면 가운데 정렬을 위해 추가된 부분 */
}
th {
    background-color: skyblue; /* 하늘색 배경을 설정 */
}
td {
    padding: 10px 20px; /* 열 간격을 조정하는 부분 */
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
<div>
<h1 style=" font-family: 'Pretendard-Regular'; text-align:center"> 상품 관리 </h1></div>
<hr style="color:gray;"> <br><br> 
<div><br>
<table>
  <thead>
    <tr>
    <th>번호 </th>
      <th>상품명</th>
      <th>가격</th>
      <th>재고</th>
      <th>카테고리</th>
      <th>등록자</th>
      <th>수정</th>
      <th>삭제</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="item" items="${items}" varStatus="status">
      <tr>
       <td>${status.index + 1}</td>
        <td>${item.name}</td>
        <td>${item.price}원</td>
        <td>${item.stock}</td>
        <td>${item.category}</td>
        <td>${item.wname}</td>
        <td><a style="color:white; background-color:black; "href="/edit/${item.name}">수정</a></td>
     <td><a style="color:white; background-color:black; "href="/delete/${item.product_id}">삭제</a></td>
      </tr>
    </c:forEach>
  </tbody>
</table>
</div>
<div>
<a style="text-align: right;" href="/item">[상품판매]</a>
</div>
</body>
</html>