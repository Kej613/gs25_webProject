<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
 <%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
<title>상품입고조회</title>
</head>
<style>
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
form {
 font-family: 'Pretendard-Regular';
    text-align:center;
    margin: 0 auto; /* 화면 가운데 정렬을 위해 추가된 부분 */

}
input {
 font-family: 'Pretendard-Regular';
    text-align:center;
    margin: 0 auto; /* 화면 가운데 정렬을 위해 추가된 부분 */

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
<h1 style=" font-family: 'Pretendard-Regular'; text-align:center"> 상품 입고 조회 </h1>
<hr style="color:gray;"> <br><br> 
<div><br>
<form action="/items"  method="post"  modelAttribute="imd">
    <p>
        <label for="from">from:</label>
        <input type="text" id="from" name="from" />
        
        <label for="to">to:</label>
        <input type="text" id="to" name="to" />
        
        <input type="submit" value="조회" >
    </p>
</form>

<c:if test="${not empty items}">
    <table>
        <tr>
            <th>상품아이디</th>
            <th>상품명</th>
            <th>상품가격</th>
            <th>입고일</th>
        </tr>
        <c:forEach var="itm" items="${items}">
            <tr>
                <td>${itm.product_id}</td>
                <td><a href="<c:url value="/items/${itm.product_id}"/>">${itm.name}</a></td>
                <td>${itm.price}</td>
                <td><tf:formatDateTime value="${itm.inputdate}" pattern="yyyy-MM-dd" /></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>